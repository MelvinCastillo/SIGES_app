// Decompiled with JetBrains decompiler
// Type: CAID.HCX00500
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
  public class HCX00500 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected HiddenField xDetallesGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnShow;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected TextBox txtImpresionDiagnostica;
    protected RequiredFieldValidator valtxtImpresionDiagnostica;
    protected TextBox txtInterPrioritarias;
    protected TextBox txtInterPosteriores;
    protected TextBox txtInterUrgencia;
    protected HtmlSelect cmbEspecialidad;
    protected HtmlSelect cmbTipo;
    protected HtmlButton btnSaveDetalles;
    protected Repeater rpDetalles;
    protected DropDownList cmbServicioID;
    protected DropDownList cmbTerapista;
    protected HtmlButton Button1;
    protected Repeater rpDetallesProfesionales;

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

    private string TIPO
    {
      get
      {
        return this.cmbTipo.Value.ToString().Trim().ToUpper();
      }
    }

    private string IMPRESION
    {
      get
      {
        return this.txtImpresionDiagnostica.Text.ToString().Trim();
      }
    }

    private string INTERPRIORITARIAS
    {
      get
      {
        return this.txtInterPrioritarias.Text.ToString().Trim();
      }
    }

    private string INTERPOSTERIORES
    {
      get
      {
        return this.txtInterPosteriores.Text.ToString().Trim();
      }
    }

    private string INTERURGENCIA
    {
      get
      {
        return this.txtInterUrgencia.Text.ToString().Trim();
      }
    }

    private string ESPECILIDADGUID
    {
      get
      {
        return this.cmbEspecialidad.Value.ToString().Trim().ToUpper();
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
      this.cmbServicioID.Items.Clear();
      this.cmbServicioID.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30013S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        this.cmbEspecialidad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbServicioID.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
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
        this.cmbPaciente.Value = dataRow["REFGUID"].ToString();
        this.txtImpresionDiagnostica.Text = dataRow["IMPRESION"].ToString();
        this.txtInterPrioritarias.Text = dataRow["INTERPRIORITARIAS"].ToString();
        this.txtInterPosteriores.Text = dataRow["INTERPOSTERIORES"].ToString();
        this.txtInterUrgencia.Text = dataRow["INTERURGENCIA"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
        this._CagarDetalles();
        this._CagarDetalles2();
      }
    }

    private void _IniciarControles()
    {
      this.txtRecordNo.Value = string.Empty;
      this.cmbPaciente.Value = string.Empty;
      this.cmbEspecialidad.Value = string.Empty;
      this.txtImpresionDiagnostica.Text = string.Empty;
      this.txtInterPrioritarias.Text = string.Empty;
      this.txtInterPosteriores.Text = string.Empty;
      this.txtInterUrgencia.Text = string.Empty;
      this.rpDetalles.DataSource = (object) null;
      this.rpDetalles.DataBind();
    }

    private void _IniciarControles2()
    {
      this.txtRecordNo.Value = string.Empty;
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
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
      this._Show((object) null, (EventArgs) null);
    }

    private void _CagarDetalles()
    {
      this.cmbEspecialidad.Value = string.Empty;
      this.cmbTipo.Value = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@INTERVENCIONGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DS3";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
    }

    private void _CagarDetalles2()
    {
      this.cmbServicioID.SelectedValue = string.Empty;
      this.cmbTerapista.SelectedValue = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@INTERVENCIONGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_D2S3";
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
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@ClaseID");
      this.xQueryValues.Add((object) 0);
      this.xQueryParameters.Add((object) "@ESPECIALIDADID");
      this.xQueryValues.Add((object) this.SERVICIOID);
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
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
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S1";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
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
      this.xDetallesGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "DeleteDet")
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) this.xDetallesGUID.Value);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          this.xQuery = "HCX00500_DSD";
          if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            ;
          this._CagarDetalles();
        }
      }
      catch
      {
      }
      try
      {
        if (!(this.xCommand == "DeleteDetP"))
          return;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) this.xDetallesGUID.Value);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = "HCX00500_D2SD";
        if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          ;
        this._CagarDetalles2();
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
      this.xQueryParameters.Add((object) "@IMPRESION");
      this.xQueryValues.Add((object) this.IMPRESION);
      this.xQueryParameters.Add((object) "@INTERPRIORITARIAS");
      this.xQueryValues.Add((object) this.INTERPRIORITARIAS);
      this.xQueryParameters.Add((object) "@INTERPOSTERIORES");
      this.xQueryValues.Add((object) this.INTERPOSTERIORES);
      this.xQueryParameters.Add((object) "@INTERURGENCIA");
      this.xQueryValues.Add((object) this.INTERURGENCIA);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
    }

    protected void _SaveDetalles(object sender, EventArgs e)
    {
      if (this.cmbEspecialidad.Value == "" || this.cmbTipo.Value == "")
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ESPGUID");
      this.xQueryValues.Add((object) this.ESPECILIDADGUID);
      this.xQueryParameters.Add((object) "@TIPO");
      this.xQueryValues.Add((object) this.TIPO);
      this.xQueryParameters.Add((object) "@INTERVENCIONGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles();
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
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_D2SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles2();
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
  }
}
