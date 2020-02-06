// Decompiled with JetBrains decompiler
// Type: CAID.HCL00033
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
  public class HCL00033 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtDATOS1;
    protected RequiredFieldValidator txtDATOS1val;
    protected HtmlSelect cmbPersonaResponsable;
    protected HtmlInputText txtOtro;
    protected RequiredFieldValidator valcmbPersonaResponsable;
    protected HtmlSelect cmbProgreso;
    protected RequiredFieldValidator valcmbProgreso;
    protected HtmlSelect cmbRevisión;
    protected RequiredFieldValidator valcmbRevisión;
    protected HtmlButton btnSave;
    protected HtmlGenericControl H1;
    protected Repeater rpHistorico;

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
      this.cmbProgreso.Items.Clear();
      this.cmbProgreso.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vMetodoProgresoAtencionTemprana ORDER BY ORDEN").Rows)
        this.cmbProgreso.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()) || this.txtDATOS1.Text.Trim() == string.Empty)
        return;
      string str1 = "";
      string str2 = this.txtDATOS1.Text.Trim();
      string str3 = this.cmbPersonaResponsable.Value;
      string str4 = this.txtOtro.Value;
      string str5 = this.cmbProgreso.Value;
      string str6 = this.cmbRevisión.Value;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str7 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str8 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00033SI] '{0}','{1}','{2}','{3}','{4}','{5}', '{6}', '{7}', '{8}', '{9}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) xREFGUID, (object) xTERGUID, (object) str7, (object) str8)))
      {
        ((Site_Master) this.Master)._Notify("Registro Guardado");
        this.Validar();
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      this.txtDATOS1.Text = string.Empty;
      this.cmbPersonaResponsable.Value = string.Empty;
      this.txtOtro.Value = string.Empty;
      this.cmbProgreso.Value = string.Empty;
      this.cmbRevisión.Value = string.Empty;
      this.txtDATOS1.Text = "•\tConducta Número (s)" + Environment.NewLine + Environment.NewLine + "•\tResultado (s) esperados Objetivo (s)" + Environment.NewLine + Environment.NewLine + "•\tIntervención (s) y Frecuencia de Intervención" + Environment.NewLine;
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00033H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpHistorico.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
