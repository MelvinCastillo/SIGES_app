// Decompiled with JetBrains decompiler
// Type: CAID.HCL00031
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00031 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlButton tbnAdd;
    protected HtmlSelect cmbFuentes;
    protected RequiredFieldValidator valcmbFuentes;
    protected HtmlInputText txtDesConducta;
    protected RequiredFieldValidator ValtxtDesConducta;
    protected HtmlInputText txtEntorno;
    protected RequiredFieldValidator ValtxtEntorno;
    protected HtmlInputText txtFrecuencia;
    protected RequiredFieldValidator valtxtFrecuencia;
    protected HtmlInputText txtIntensidad;
    protected RequiredFieldValidator valtxtIntensidad;
    protected HtmlInputText txtDuracion;
    protected RequiredFieldValidator valtxtDuracion;
    protected HtmlInputText txtAntecedentes;
    protected RequiredFieldValidator valtxtAntecedentes;
    protected Repeater rpHistorico;
    protected Panel MNTAUXILIAR;
    protected HtmlButton btnCloseMSG;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbDetalles;
    protected RequiredFieldValidator cmbDiagnostico1;
    protected TextBox txtEVALUACION;
    protected HtmlButton btnSaveNotas;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      this.Session["CurrentUSR_ROWGUID"].ToString();
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
     /* this.cmbTipo.Items.Clear();
      this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
        */
      this.cmbDetalles.Items.Clear();
      this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("select * from vTF_FUNCION_CONDUCTAS order by valor")).Rows)
        this.cmbDetalles.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Add(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Add("class", "navi");
      this.MNTAUXILIAR.Visible = true;
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string empty = string.Empty;
      string str1 = this.cmbDetalles.Value.ToString();
      string str2 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      string str5 = this.cmbFuentes.Value.ToString();
      string str6 = this.txtDesConducta.Value.ToString();
      string str7 = this.txtEntorno.Value.ToString();
      string str8 = this.txtFrecuencia.Value.ToString();
      string str9 = this.txtIntensidad.Value.ToString();
      string str10 = this.txtDuracion.Value.ToString();
      string str11 = this.txtAntecedentes.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00031SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}', '{7}','{8}','{9}','{10}','{11}','{12}','{13}'", (object) empty, (object) str1, (object) xREFGUID, (object) xTERGUID, (object) str2, (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) str10, (object) str11, (object) str3, (object) str4)))
        this.Validar();
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (!this.MNTAUXILIAR.Visible)
        return;
      this.MNTAUXILIAR.Visible = false;
    }

    private void Validar()
    {
      this.cmbDetalles.Value = string.Empty;
      this.txtEVALUACION.Text = string.Empty;
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00031H @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.Session["CurrentUSR_TERID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      this.rpHistorico.DataSource = (object) dataTable1;
      this.rpHistorico.DataBind();
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
      this.cmbFuentes.Disabled = false;
      this.txtDesConducta.Disabled = false;
      this.txtEntorno.Disabled = false;
      this.txtFrecuencia.Disabled = false;
      this.txtIntensidad.Disabled = false;
      this.txtDuracion.Disabled = false;
      this.txtAntecedentes.Disabled = false;
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbFuentes.Value = dataTable1.Rows[0]["FUENTES"].ToString();
      this.txtDesConducta.Value = dataTable1.Rows[0]["DCONDUCTA"].ToString();
      this.txtEntorno.Value = dataTable1.Rows[0]["ENTORNO"].ToString();
      this.txtFrecuencia.Value = dataTable1.Rows[0]["FRECUENCIA"].ToString();
      this.txtIntensidad.Value = dataTable1.Rows[0]["INTENSIDAD"].ToString();
      this.txtDuracion.Value = dataTable1.Rows[0]["DURACION"].ToString();
      this.txtAntecedentes.Value = dataTable1.Rows[0]["ANTECEDENTES"].ToString();
      this.cmbFuentes.Disabled = true;
      this.txtDesConducta.Disabled = true;
      this.txtEntorno.Disabled = true;
      this.txtFrecuencia.Disabled = true;
      this.txtIntensidad.Disabled = true;
      this.txtDuracion.Disabled = true;
      this.txtAntecedentes.Disabled = true;
    }
  }
}
