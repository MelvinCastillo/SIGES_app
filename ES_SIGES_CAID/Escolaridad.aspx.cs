using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAID.Data;
using System.Data;


namespace CAID_V2.forms
{
    public partial class Escolaridad : System.Web.UI.Page
    {
        private ArrayList xQueryParameters = new ArrayList();
        private ArrayList xQueryValues = new ArrayList();
        String CURRENTUSR_SGXID;
        String CurrentUSR_ROWGUID;
        string IDPaciente;
        String VarValida;
        string Recordid;
        string usuario;
        string localidad;
        private string xQuery;
        string direccion = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BUSCO  los distritos*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "SELECT CODIGO,DESCRIPCION,RUTA FROM VDistritoEscolares order by descripcion";
                DataTable dtDistrito = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                if (dtDistrito.Rows.Count != 0)
                {
                    this.dpdistritoescolar.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
                    foreach (DataRow row in dtDistrito.Rows)
                        this.dpdistritoescolar.Items.Add(new ListItem(row["DESCRIPCION"].ToString(), row["CODIGO"].ToString()));
                    BuscaRutaGoogle(dtDistrito.Rows[0]["codigo"].ToString());
                }

                //BUSCO  el recordid y el nombre del paciente*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "SELECT RECORDID,FULLNAME FROM PAX00000 where ROWGUID ='" + Request.QueryString["idpaciente"].ToString() + "'";
                DataTable dataTable2 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                if (dataTable2.Rows.Count != 0)
                {
                    DataRow row2 = dataTable2.Rows[0];
                    txtpaciente.Value = row2["FULLNAME"].ToString();
                    Recordid = row2["RECORDID"].ToString();
                }
                //BUSCO EL REGISTRO PARA MOSTRAR*/
                this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "PR_PAXESCOLARIDAD'" + Recordid.ToString() + "','" + Request.QueryString["localidad"].ToString() + "'";
                dataTable2 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                if (dataTable2.Rows.Count != 0)
                {
                    DataRow row2 = dataTable2.Rows[0];
                    txtCentro.Value = row2["CENTROEDUCATIVO"].ToString();
                    txtdireccion.Value = row2["DIRECCION"].ToString();
                    txtdirector.Value = row2["Director"].ToString();
                    txtmaestro.Value = row2["Maestro"].ToString();
                    dpcategoria.SelectedValue = row2["CATEGORIA"].ToString();
                    dpgrado.SelectedValue = row2["GRADO"].ToString();
                    dptipocategoria.SelectedValue = row2["TIPOCATEGORIA"].ToString();
                    txtelefono.Value = row2["telefono"].ToString();
                    dpEstatus.SelectedValue = row2["estatus"].ToString();
                    dpdistritoescolar.SelectedValue = row2["distritoescolar"].ToString();
                    txtresponsabledistrito.Value = row2["responsabledistrito"].ToString();
                }
                localidad = Request.QueryString["localidad"].ToString();
                usuario = Request.QueryString["usuario"].ToString();
            }
        }
        protected void _Save(object sender, EventArgs e)
        {
            //if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
            //  return;

            //BUSCO  el recordid y el nombre del paciente*/
            Int32 IntRecordid = 0;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQuery = "SELECT RECORDID,FULLNAME FROM PAX00000 where ROWGUID ='" + Request.QueryString["idpaciente"].ToString() + "'";
            DataTable dataTable2 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
            if (dataTable2.Rows.Count != 0)
            {
                DataRow row2 = dataTable2.Rows[0];
                IntRecordid = Convert.ToInt32(row2["RECORDID"].ToString());
            }

            string strcentro = txtCentro.Value.ToString();
            string strgrado = dpgrado.SelectedValue.ToString(); ;
            string strcategoria = dpcategoria.SelectedValue.ToString();
            string strtipocategoria = dptipocategoria.SelectedValue.ToString();
            string strestatus = dpEstatus.SelectedValue.ToString();
            string strdirector = txtdirector.Value.ToString();
            string strmaestro = txtmaestro.Value.ToString();
            string strtelefono = txtelefono.Value.ToString();
            string strdireccion = txtdireccion.Value.ToString();
            localidad = Request.QueryString["localidad"].ToString();
            usuario = Request.QueryString["usuario"].ToString();
            string strdistritoescolar = dpdistritoescolar.SelectedValue.ToString();
            string strreponsabledistrito = txtresponsabledistrito.Value;

            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object)"@RECORDID");
            this.xQueryValues.Add((object)IntRecordid);
            this.xQueryParameters.Add((object)"@CENTROEDUCATIVO");
            this.xQueryValues.Add((object)strcentro);
            this.xQueryParameters.Add((object)"@GRADO");
            this.xQueryValues.Add((object)strgrado);

            this.xQueryParameters.Add((object)"@CATEGORIA");
            this.xQueryValues.Add((object)strcategoria);
            this.xQueryParameters.Add((object)"@TIPOCATEGORIA");
            this.xQueryValues.Add((object)strtipocategoria);
            this.xQueryParameters.Add((object)"@ESTATUS");
            this.xQueryValues.Add((object)strestatus);
            this.xQueryParameters.Add((object)"@Director");
            this.xQueryValues.Add((object)strdirector);
            this.xQueryParameters.Add((object)"@Maestro");
            this.xQueryValues.Add((object)strmaestro);
            this.xQueryParameters.Add((object)"@USUARIO");
            this.xQueryValues.Add((object)usuario);
            this.xQueryParameters.Add((object)"@ROWSGXID");
            this.xQueryValues.Add((object)localidad);
            this.xQueryParameters.Add((object)"@DIRECCION");
            this.xQueryValues.Add((object)strdireccion);
            this.xQueryParameters.Add((object)"@TELEFONO");
            this.xQueryValues.Add((object)strtelefono);
            this.xQueryParameters.Add((object)"@distritoescolar");
            this.xQueryValues.Add((object)strdistritoescolar);
            this.xQueryParameters.Add((object)"@responsabledistrito");
            this.xQueryValues.Add((object)strreponsabledistrito);


            this.xQuery = "Pr_PAXESCOLARIDAD_UPDATE";
            //Site_Master sm = new Site_Master();
            if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            {
                //((Site_Master) this.Master)._Notify("Registro Guardado");
                    Notify("Registro Guardado", "success");

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "back", "Back();", true);
                 
                //sm.Notify("Cita registrada en el sistema", "success");
                //((Site_Master)this.Master).Notify("Cita registrada en el sistema", "success");
                //VarValida = "Registro Guardado";
            }
            else
                //sm.Notify("No se pudo almacenar la informacion", "error");
                Notify("No se pudo almacenar la informacion", "error");

            // if (DB.ExecuteNonQuery(string.Format("[Pr_PAXESCOLARIDAD_UPDATE] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}'", (object)strrecordid, (object)strcentro, (object)strgrado, (object)strcategoria, (object)strtipocategoria, (object)strestatus, (object)strdirector, (object)strmaestro, (object)usuario.ToString(), (object)localidad.ToString(), (object)strdireccion, (object)strtelefono)))
            //{
            //    VarValida = "Registro Guardado";
            ////((Site_Master) this.Master)._Notify("Registro Guardado");
            ////  this.Validar();
            //}
        }

        public void Notify(string msg, string tipo)
        {
            //msg = "Guardado Exitosamente";
            //this.Page.ClientScript.RegisterClientScriptBlock(this.Page.GetType(), "NotifyMsg", "toast({message:'" + msg + "'}); setTimeout(function() {  },900)", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + "','" + tipo + "');", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "notify('" + msg + ",'success');", true);
        }
        public string   BuscaRutaGoogle(string codigo)

        {
             
            this.xQueryParameters.Clear();
                this.xQueryValues.Clear();
                this.xQuery = "SELECT CODIGO,DESCRIPCION,RUTA FROM VDistritoEscolares where codigo="+ codigo;
                DataTable dtDistrito = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.Text);
                if (dtDistrito.Rows.Count != 0)
                {
                    direccion = dtDistrito.Rows[0]["ruta"].ToString();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "DireccionGoogle('" + direccion + "'" + "');", true);
                    ScriptManager.RegisterStartupScript(Page, GetType(), "disp_confirm", "<script>DireccionGoogle('" + direccion + "')</script>", false);
                    lblubicaciondistrito.Text = direccion;              
                 }
                else
                    direccion = "";
                return direccion;
           
        }

        protected void dpdistritoescolar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dpdistritoescolar.SelectedValue != "")
            {
                BuscaRutaGoogle(dpdistritoescolar.SelectedValue);
                lblubicaciondistrito.Text = "Ubicacion Distrito: " + direccion.ToString();// Text.ToString();
            }
            else
            {
                BuscaRutaGoogle("-1");
                lblubicaciondistrito.Text = "Ubicacion Distrito: NO ESPECIFICADO";
            }
        }
    }
}