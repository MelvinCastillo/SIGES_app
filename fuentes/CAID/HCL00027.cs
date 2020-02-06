// Decompiled with JetBrains decompiler
// Type: CAID.HCL00027
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
  public class HCL00027 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected DropDownList cmbObjetivo;
    protected RequiredFieldValidator valcmbObjetivo;
    protected HtmlSelect cmbActividad;
    protected RequiredFieldValidator valcmbActividad;
    protected HtmlSelect cmbAsistencia;
    protected HtmlSelect cmbTipoAyuda;
    protected HtmlSelect cmbProgreso;
    protected TextBox txtEVALUACION;
    protected HtmlButton btnSave;
    protected Repeater rpActividades;
    protected Repeater rpactividadesjuegoesparcimiento;
    protected Repeater rpInterpretaciónEstimulosSensoriales;
    protected Repeater rpDesarrollarPerceptuales;
    protected Repeater rpDesarrollarNeuromusculares;
    protected Repeater rpDesarrollarMotores;
    protected Repeater rpIntegracionCognitiva;
    protected Repeater rpDesarrollarFactoresPsicologicos;
    protected Repeater rpDesarrollarHabilidadesSociales;
    protected Repeater rpManejoSiMismo;

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
      this.cmbTipo.Items.Clear();
      this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vOCUPACIONAL_METODOS WHERE ESTADO=1 ORDER BY ORDEN").Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (this.cmbObjetivo.Items.Count == 2)
        this.cmbObjetivo.SelectedIndex = 1;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.SelectedValue.ToString();
      string str2 = this.cmbActividad.Value.ToString();
      string str3 = this.cmbAsistencia.Value.ToString();
      string str4 = this.cmbTipoAyuda.Value.ToString();
      string str5 = this.cmbProgreso.Value.ToString();
      string str6 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str7 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str8 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00027SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) xREFGUID, (object) xTERGUID, (object) str7, (object) str8)))
      {
        ((Site_Master) this.Master)._Notify("Registro Guardado");
        this.cmbObj_SelectedIndexChanged((object) null, (EventArgs) null);
        this.Validar();
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      this.txtEVALUACION.Text = string.Empty;
      this.cmbActividad.Value = string.Empty;
      this.cmbAsistencia.Value = string.Empty;
      this.cmbTipoAyuda.Value = string.Empty;
      this.cmbProgreso.Value = string.Empty;
      this.rpActividades.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "ACTI-VIDA-DIARIA", this.Session["CURRENTUSR_SGXID"]));
      this.rpActividades.DataBind();
      this.rpactividadesjuegoesparcimiento.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "ACTIVIDADESJUEGOESPARCIMIENTO", this.Session["CURRENTUSR_SGXID"]));
      this.rpactividadesjuegoesparcimiento.DataBind();
      this.rpInterpretaciónEstimulosSensoriales.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "INTERPRETACION-SENSORIALES", this.Session["CURRENTUSR_SGXID"]));
      this.rpInterpretaciónEstimulosSensoriales.DataBind();
      this.rpDesarrollarPerceptuales.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "DESARROLLAR-PERCEPTUALES", this.Session["CURRENTUSR_SGXID"]));
      this.rpDesarrollarPerceptuales.DataBind();
      this.rpDesarrollarNeuromusculares.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "DESARROLLAR-NEUROMUSCULARES", this.Session["CURRENTUSR_SGXID"]));
      this.rpDesarrollarNeuromusculares.DataBind();
      this.rpDesarrollarMotores.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "DESARROLLAR-MOTORES", this.Session["CURRENTUSR_SGXID"]));
      this.rpDesarrollarMotores.DataBind();
      this.rpIntegracionCognitiva.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "INTEGRACION-COGNITIVA", this.Session["CURRENTUSR_SGXID"]));
      this.rpIntegracionCognitiva.DataBind();
      this.rpDesarrollarFactoresPsicologicos.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "DESARROLLAR-FACTORES-PSICOLOGICOS", this.Session["CURRENTUSR_SGXID"]));
      this.rpDesarrollarFactoresPsicologicos.DataBind();
      this.rpDesarrollarHabilidadesSociales.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "DESARROLLAR-HABILIDADES-SOCIALES", this.Session["CURRENTUSR_SGXID"]));
      this.rpDesarrollarHabilidadesSociales.DataBind();
      this.rpManejoSiMismo.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00027H @REFGUID = '{0}',@TIPO = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) "MANEJO-SI-MISMO", this.Session["CURRENTUSR_SGXID"]));
      this.rpManejoSiMismo.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }

    protected void cmbObj_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.cmbActividad.Items.Clear();
      this.cmbActividad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCL00027S2 @REFGUID = '{0}', @TERGUID = '{1}', @METODOID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CurrentUSR_TERID"], (object) this.cmbObjetivo.SelectedValue)).Rows)
        this.cmbActividad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }
  }
}
