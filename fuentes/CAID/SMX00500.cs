// Decompiled with JetBrains decompiler
// Type: CAID.SMX00500
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
  public class SMX00500 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField HiddenField1;
    protected HiddenField PacienteID;
    protected HiddenField MedicoID;
    protected HiddenField TerapistaID;
    protected HiddenField EnfermeraID;
    protected HiddenField OrigenID;
    protected HiddenField txtEnfID;
    protected HiddenField xGUID;
    protected HiddenField xActividadGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnShow;
    protected Repeater rpData;
    protected Panel pnlData;
    protected Repeater rpPaxHeader;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlInputText txtFechaIni;
    protected RequiredFieldValidator RequiredFieldValidator2;
    protected DropDownList cmbOrigenTratamiento;
    protected RequiredFieldValidator RequiredFieldValidator3;
    protected DropDownList cmbTerapista;
    protected RequiredFieldValidator RequiredFieldValidator5;
    protected HtmlSelect cmbHorario;
    protected RequiredFieldValidator cmbHorario1;
    protected HtmlSelect cmbCondicion;
    protected TextBox txtParticipantes;
    protected TextBox txtObservacion;

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
        return this.cmbPaciente.SelectedValue.ToString().ToUpper();
      }
    }

    private string MEDID
    {
      get
      {
        return string.Empty;
      }
    }

    private string TERID
    {
      get
      {
        return this.cmbTerapista.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string ENFID
    {
      get
      {
        return string.Empty;
      }
    }

    private string ORIGENID
    {
      get
      {
        return this.cmbOrigenTratamiento.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string CITAESTATUS
    {
      get
      {
        return this.cmbCondicion.Value.ToString();
      }
    }

    private string DETALLES
    {
      get
      {
        return this.txtParticipantes.Text.Trim().ToString();
      }
    }

    private string FECHAINI
    {
      get
      {
        return this.txtFechaIni.Value.ToString();
      }
    }

    private string HORAORDINAL
    {
      get
      {
        return this.cmbHorario.Value.ToString().ToUpper();
      }
    }

    private string OBSERVACION
    {
      get
      {
        return this.txtObservacion.Text.ToString().ToUpper();
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
      this._New((object) null, (EventArgs) null);
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
      this.cmbOrigenTratamiento.Items.Clear();
      this.cmbOrigenTratamiento.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbOrigenTratamiento.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbHorario.Items.Clear();
      this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
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
        this.cmbPaciente.SelectedValue = dataRow["REFGUID"].ToString();
        this.cmbOrigenTratamiento.SelectedValue = dataRow["ORIGENID"].ToString();
        this.cmbTerapista.SelectedValue = dataRow["TERID"].ToString();
        this.txtFechaIni.Value = Convert.ToDateTime(dataRow["FECHAINI"].ToString()).ToString("MM/dd/yyyy");
        this.txtObservacion.Text = dataRow["OBSERVACION"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.cmbCondicion.Value = "0";
      this.cmbPaciente.SelectedValue = string.Empty;
      this.cmbOrigenTratamiento.SelectedValue = string.Empty;
      this.cmbTerapista.SelectedValue = string.Empty;
      this.txtParticipantes.Text = string.Empty;
      this.txtFechaIni.Value = string.Empty;
      this.cmbHorario.Value = string.Empty;
      this.txtObservacion.Text = string.Empty;
      this.rpPaxHeader.DataSource = (object) null;
      this.rpPaxHeader.DataBind();
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
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESPECIALISTA");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) -1);
      this.xQuery = "SMX00500S1";
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

    protected void cmbPaciente_SelectedIndexChanged(object sender, EventArgs e)
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.REFGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.REFGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        DataTable dataTable = DB.ExecuteAdapter("PAX00000S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        if (dataTable.Rows.Count == 0 || !(dataTable.Rows[0]["TERAPISTAID"].ToString() != string.Empty))
          return;
        this.cmbTerapista.SelectedValue = dataTable.Rows[0]["TERAPISTAID"].ToString();
        this.cmbTerapista_SelectedIndexChanged((object) null, (EventArgs) null);
      }
      catch
      {
      }
      finally
      {
      }
    }

    protected void cmbTerapista_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.cmbHorario.Items.Clear();
      this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("[SMX10050P2] @TERID = '{0}',@FECHA = '{1}'", (object) this.TERID, (object) this.FECHAINI)).Rows)
        this.cmbHorario.Items.Add(new ListItem(row["HoraDescripcion"].ToString(), row["Numero_Ordinal"].ToString()));
    }

    protected void cmbOrigenTratamiento_SelectedIndexChanged(object sender, EventArgs e)
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
      this.xQueryValues.Add((object) this.ORIGENID);
      this.cmbTerapista.Items.Clear();
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@MEDID");
      this.xQueryValues.Add((object) this.MEDID);
      this.xQueryParameters.Add((object) "@TERID");
      this.xQueryValues.Add((object) this.TERID);
      this.xQueryParameters.Add((object) "@ENFID");
      this.xQueryValues.Add((object) this.ENFID);
      this.xQueryParameters.Add((object) "@ORIGENID");
      this.xQueryValues.Add((object) this.ORIGENID);
      this.xQueryParameters.Add((object) "@FECHAINI");
      this.xQueryValues.Add((object) this.FECHAINI);
      this.xQueryParameters.Add((object) "@HORAORDINAL");
      this.xQueryValues.Add((object) this.HORAORDINAL);
      this.xQueryParameters.Add((object) "@OBSERVACION");
      this.xQueryValues.Add((object) this.OBSERVACION);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@CITAESTATUS");
      this.xQueryValues.Add((object) this.CITAESTATUS);
      this.xQueryParameters.Add((object) "@DETALLES");
      this.xQueryValues.Add((object) this.DETALLES);
      this.xQueryParameters.Add((object) "@TIPO");
      this.xQueryValues.Add((object) "C");
      this.xQueryParameters.Add((object) "@TIPOGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQuery = "SMX00500SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarControles();
      ((Site_Master) this.Master)._Notify("Cita registrada en el sistema");
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
        this.cmbPaciente.SelectedValue = dataTable.Rows[0]["PACIENTEGUID"].ToString();
        this.txtRecordNo.Value = string.Empty;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) dataTable.Rows[0]["PACIENTEGUID"].ToString());
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }
  }
}
