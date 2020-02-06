// Decompiled with JetBrains decompiler
// Type: CAID.HCX00300
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
  public class HCX00300 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected HiddenField xActividadGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnShow;
    protected HtmlInputText txtRecord;
    protected HtmlButton Button4;
    protected DropDownList cmbPaciente2;
    protected LinkButton btnAcerptarAtencion;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected HtmlSelect cmbEspecialidad;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlInputText txtNombre;
    protected RequiredFieldValidator valtxtNombre;
    protected HtmlInputText txtDetalles;
    protected HtmlButton btnSaveDetalles;
    protected RequiredFieldValidator valtxtDetalles;
    protected Repeater rpDetalles;
    protected Panel pnlActividad;
    protected HtmlButton Button1;
    protected HtmlButton Button2;
    protected HtmlButton Button3;
    protected HtmlSelect cmbActividad;
    protected RequiredFieldValidator valcmbActividad;
    protected HtmlInputText txtCompletado;
    protected RequiredFieldValidator valtxtCompletado;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string REFGUID
    {
      get
      {
        return this.cmbPaciente.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.txtNombre.Value.ToString().Trim().ToUpper();
      }
    }

    private string ESPECILIDADGUID
    {
      get
      {
        return this.cmbEspecialidad.Value.ToString().Trim().ToUpper();
      }
    }

    private string DETALLES
    {
      get
      {
        return this.txtDetalles.Value.ToString().Trim();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.xGUID.Value.ToString().ToUpper();
      }
    }

    private string ROWUSERID
    {
      get
      {
        return this.Session["CURRENTUSR_ID"].ToString();
      }
    }

    private string ROWSGXID
    {
      get
      {
        return this.Session["CURRENTUSR_SGXID"].ToString();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnNew.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.pnlActividad.Visible = false;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbEspecialidad.Items.Clear();
      this.cmbEspecialidad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbEspecialidad.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbEspecialidad.Items.Count == 2)
        this.cmbEspecialidad.SelectedIndex = 1;
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.pnlActividad.Visible = false;
        this.rpData.DataSource = (object) null;
        this.rpData.DataBind();
        this._IniciarControles();
      }
      else
      {
        this.xGUID.Value = str;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = this.xBase + "S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
        if (dataRow == null)
          return;
        this.txtNombre.Value = dataRow["NOMBRE"].ToString();
        this.cmbPaciente.Value = dataRow["REFGUID"].ToString();
        this.cmbEspecialidad.Value = dataRow["ESPECILIDADGUID"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
        this.pnlActividad.Visible = false;
        this._CagarDetalles();
      }
    }

    private void _IniciarControles()
    {
      this.txtRecordNo.Value = string.Empty;
      this.txtNombre.Value = string.Empty;
      this.cmbPaciente.Value = string.Empty;
      this.cmbEspecialidad.Value = string.Empty;
    }

    private void _IniciarControles2()
    {
      this.txtRecordNo.Value = string.Empty;
      this.txtNombre.Value = string.Empty;
      this.txtDetalles.Value = string.Empty;
      this.rpDetalles.DataSource = (object) null;
      this.rpDetalles.DataBind();
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
    }

    private void _IniciarFormulario()
    {
      if (this.Request.QueryString["X"] == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.pnlActividad.Visible = false;
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
      this._Show((object) null, (EventArgs) null);
    }

    private void _CagarDetalles()
    {
      this.txtDetalles.Value = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@OBJID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DS3";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
      this.pnlActividad.Visible = false;
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S4";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
      this._CagarDetalles();
    }

    protected void _VerDetallesPlan(object sender, EventArgs e)
    {
      if (this.cmbPaciente2.SelectedValue == "")
        return;
      string str = this.cmbPaciente2.SelectedValue.ToString();
      this.Session.Add("REPORT_URL", (object) "~/reports/HCX00300R1.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[HCX00300R1] @ROWSGXID = '{0}',@REFGUID = '{1}',@ROWUSERID = '{2}',@TERID = '{3}'", (object) this.ROWSGXID, (object) str, (object) this.ROWUSERID, this.Session["CurrentUSR_TERID"]));
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
      this.Response.Write("</script>");
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "Edit")
        {
          if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
            return;
          this.Response.Redirect(this.xBase + ".aspx?X=" + this.ROWGUID);
        }
        if (this.xCommand == "Delete" && Convert.ToBoolean(this.Session["CURRENTUSR_fnELIMINAR"].ToString()))
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) this.ROWGUID);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          this.xQuery = this.xBase + "SD";
          if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            this._Show((object) null, (EventArgs) null);
        }
      }
      catch
      {
      }
    }

    protected void _Select2(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xActividadGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "DeleteDet")
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) this.xActividadGUID.Value);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          this.xQuery = "HCX00300_DSD";
          if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            ;
          this._CagarDetalles();
        }
        if (!(this.xCommand == "UpdateDet"))
          return;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.xActividadGUID.Value);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbActividad.Items.Clear();
        this.cmbActividad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("HCX00300_DS2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        {
          this.cmbActividad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
          this.txtCompletado.Value = row["COMPLETADO"].ToString();
        }
        this.cmbActividad.Value = this.xActividadGUID.Value;
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = false;
        this.pnlActividad.Visible = true;
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@ESPECILIDADGUID");
      this.xQueryValues.Add((object) this.ESPECILIDADGUID);
      this.xQueryParameters.Add((object) "@OBJETIVOGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarControles2();
    }

    protected void _Save2(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@OBJID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.DETALLES);
      this.xQueryParameters.Add((object) "@COMPLETADO");
      this.xQueryValues.Add((object) this.txtCompletado.Value.ToString());
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.xActividadGUID.Value);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        ;
      this._CagarDetalles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
      this.pnlActividad.Visible = false;
    }

    protected void _SaveDetalles(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@OBJID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.DETALLES);
      this.xQueryParameters.Add((object) "@COMPLETADO");
      this.xQueryValues.Add((object) 0);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQuery = this.xBase + "_DSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Cancel2(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _Back2(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
      this.pnlActividad.Visible = false;
    }

    protected void _Search2(object sender, EventArgs e)
    {
      string upper = this.txtRecordNo.Value.ToString().ToUpper();
      if (upper.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX20101P2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbPaciente.Value = dataTable.Rows[0]["PACIENTEGUID"].ToString();
        this.txtRecordNo.Value = string.Empty;
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }

    protected void _Search3(object sender, EventArgs e)
    {
      string upper = this.txtRecord.Value.ToString().ToUpper();
      if (upper.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@RECORDID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00000S10";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.txtRecord.Value = string.Empty;
        foreach (DataRow row in (InternalDataCollectionBase) dataTable.Rows)
          this.cmbPaciente2.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
        if (this.cmbPaciente2.Items.Count != 2)
          return;
        this.cmbPaciente2.SelectedIndex = 1;
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }
  }
}
