// Decompiled with JetBrains decompiler
// Type: CAID.HCL00044
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
  public class HCL00044 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlButton btnSave;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected CheckBoxList ckPreocupaciones;
    protected HtmlInputText txtImpresionDiagnostica;
    protected HtmlSelect cmbCriterios;
    protected CheckBoxList ckPlan;
    protected TextBox txtEVALUACION;
    protected DropDownList cmbServicioID;
    protected DropDownList cmbTerapista;
    protected HtmlButton btnDetalles;
    protected Repeater rpDetallesProfesionales;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.xGUID.Value.ToString().ToUpper();
      }
    }

    private string TERID
    {
      get
      {
        return this.cmbTerapista.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string SERVICIOID
    {
      get
      {
        return this.cmbServicioID.SelectedValue.ToString().Trim().ToUpper();
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
      this.ckPreocupaciones.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vEVALUACION_MULTIDISCIPLINARIA WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "PREOCUPACIONES")).Rows)
        this.ckPreocupaciones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckPlan.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vEVALUACION_MULTIDISCIPLINARIA WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "PLAN")).Rows)
        this.ckPlan.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckPreocupaciones.Items.Count; ++index)
      {
        if (this.ckPreocupaciones.Items[index].Selected)
          str1 = str1 + "," + this.ckPreocupaciones.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckPlan.Items.Count; ++index)
      {
        if (this.ckPlan.Items[index].Selected)
          str2 = str2 + "," + this.ckPlan.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = this.txtImpresionDiagnostica.Value.Trim();
      string str4 = this.cmbCriterios.Value.Trim();
      string str5 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str6 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str7 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00044SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}'", (object) str1, (object) str3, (object) str4, (object) str2, (object) str5, (object) xREFGUID, (object) xTERGUID, (object) str6, (object) str7, (object) this.ROWGUID)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00044V @REFGUID = '{0}', @ROWSGXID = '{1}', @TERGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable1.Rows.Count != 0)
      {
        this.xGUID.Value = dataTable1.Rows[0]["ROWGUID"].ToString();
        char[] chArray = new char[3]{ ' ', ',', '\t' };
        string[] strArray1 = dataTable1.Rows[0]["PREOCUPACIONES"].ToString().Split(chArray);
        string[] strArray2 = dataTable1.Rows[0]["PLANPACIENTE"].ToString().Split(chArray);
        if (strArray1[0] != "")
        {
          foreach (string str in strArray1)
            this.ckPreocupaciones.Items.FindByValue(str).Selected = true;
        }
        if (strArray2[0] != "")
        {
          foreach (string str in strArray2)
            this.ckPlan.Items.FindByValue(str).Selected = true;
        }
        this.txtImpresionDiagnostica.Value = dataTable1.Rows[0]["IMPRESIONDIAGNOSTICA"].ToString();
        this.cmbCriterios.Value = dataTable1.Rows[0]["CRITERIOS"].ToString();
        this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
        this.cmbServicioID.Enabled = true;
        this.cmbTerapista.Enabled = true;
        this.btnDetalles.Disabled = false;
        this._CagarDetalles();
      }
      else
      {
        this.cmbServicioID.Enabled = false;
        this.cmbTerapista.Enabled = false;
        this.btnDetalles.Disabled = true;
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      }
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.cmbServicioID.Items.Clear();
      this.cmbServicioID.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30013S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbServicioID.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CURRENTUSR_ID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }

    private void _CagarDetalles()
    {
      this.cmbServicioID.SelectedValue = string.Empty;
      this.cmbTerapista.SelectedValue = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@INTERVENCIONGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQuery = this.xBase + "_DS3";
      this.rpDetallesProfesionales.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetallesProfesionales.DataBind();
    }

    protected void cmbServicioID_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQueryParameters.Add((object) "@ClaseID");
      this.xQueryValues.Add((object) 0);
      this.xQueryParameters.Add((object) "@ESPECIALIDADID");
      this.xQueryValues.Add((object) this.SERVICIOID);
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void _SaveDetalles2(object sender, EventArgs e)
    {
      if (this.cmbServicioID.SelectedValue == "" || this.cmbTerapista.SelectedValue == "")
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@PROFESINALID");
      this.xQueryValues.Add((object) this.TERID);
      this.xQueryParameters.Add((object) "@INTERVENCIONGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add(this.Session["CurrentUSR_ROWGUID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add(this.Session["CurrentPAX_ROWGUID"]);
      this.xQueryParameters.Add((object) "@TERGUID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQuery = "HCL00044_DSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles();
    }

    protected void _RemoveProfesional(object sender, EventArgs e)
    {
      string str = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) str);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add(this.Session["CurrentUSR_ROWGUID"]);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
        this.xQuery = "HCL00044_DSD";
        if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          ;
        this._CagarDetalles();
      }
      catch
      {
      }
    }
  }
}
