// Decompiled with JetBrains decompiler
// Type: CAID.SMX00600
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
  public class SMX00600 : Page
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
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlInputText txtDescripcion;
    protected RequiredFieldValidator valtxtDescripcion;
    protected HtmlInputText txtFechaIni;
    protected HtmlButton btnFindHorario;
    protected RequiredFieldValidator RequiredFieldValidator2;
    protected HtmlSelect cmbHorario;
    protected RequiredFieldValidator cmbHorario1;
    protected TextBox txtObservacion;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected TextBox txtParticipantes;
    protected HtmlButton btnAdd;
    protected Repeater rpDetalles;

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

    private string DESCRIPCION
    {
      get
      {
        return this.txtDescripcion.Value.ToString().ToUpper();
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
      this.cmbHorario.Items.Clear();
      this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      string str1 = this.Request.QueryString["X"];
      if (str1 == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this._Show((object) null, (EventArgs) null);
        this._IniciarControles();
      }
      else
      {
        this.xGUID.Value = str1;
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
        this.txtDescripcion.Value = dataRow["DESCRIPCION"].ToString();
        HtmlInputText txtFechaIni = this.txtFechaIni;
        DateTime dateTime1 = Convert.ToDateTime(dataRow["FECHAINI"].ToString());
        string str2 = dateTime1.ToString("MM/dd/yyyy");
        txtFechaIni.Value = str2;
        this.txtObservacion.Text = dataRow["OBSERVACION"].ToString();
        this.cmbHorario.Items.Clear();
        ListItemCollection items = this.cmbHorario.Items;
        dateTime1 = Convert.ToDateTime(dataRow["HORAINI"]);
        string str3 = dateTime1.ToString("hh:mm tt");
        string str4 = " - ";
        dateTime1 = Convert.ToDateTime(dataRow["HORAFIN"]);
        string str5 = dateTime1.ToString("hh:mm tt");
        ListItem listItem = new ListItem(str3 + str4 + str5, string.Empty);
        items.Add(listItem);
        this.btnSave.Disabled = true;
        this.txtDescripcion.Disabled = true;
        this.txtFechaIni.Disabled = true;
        this.cmbHorario.Disabled = true;
        this.btnFindHorario.Disabled = true;
        this.txtObservacion.Enabled = false;
        dateTime1 = DateTime.Now;
        DateTime dateTime2 = Convert.ToDateTime(dateTime1.ToString("MM/dd/yyyy"));
        dateTime1 = Convert.ToDateTime(dataRow["FECHAINI"].ToString());
        DateTime dateTime3 = Convert.ToDateTime(dateTime1.ToString("MM/dd/yyyy"));
        if (DateTime.Compare(dateTime2, dateTime3) > 0)
          this.btnAdd.Disabled = true;
        this._CagarDetalles();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.txtFechaIni.Value = string.Empty;
      this.cmbHorario.Value = string.Empty;
      this.txtObservacion.Text = string.Empty;
      this.rpDetalles.DataSource = (object) null;
      this.rpDetalles.DataBind();
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
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) -1);
      this.xQuery = "SMX00600S1";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
    }

    protected void _FindHoras(object sender, EventArgs e)
    {
      if (this.txtFechaIni.Value == "")
        return;
      this.cmbHorario.Items.Clear();
      this.cmbHorario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("[SMX10050P5] @Intervalo = '60',@FECHA = '{0}'", (object) this.FECHAINI)).Rows)
        this.cmbHorario.Items.Add(new ListItem(row["HoraDescripcion"].ToString(), row["Numero_Ordinal"].ToString()));
    }

    protected void _SaveDetalles(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@PARTICIPANTES");
      this.xQueryValues.Add((object) this.txtParticipantes.Text);
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

    protected void _DeleteDetalles(object sender, EventArgs e)
    {
      string str = ((LinkButton) sender).CommandArgument.ToString();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) str);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX00600_DSD";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles();
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
        if (this.xCommand == "Delete")
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

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@DESCRIPCION");
      this.xQueryValues.Add((object) this.DESCRIPCION);
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
      this.xQueryParameters.Add((object) "@ACTIVIDADESTATUS");
      this.xQueryValues.Add((object) 0);
      this.xQuery = "SMX00600SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
      ((Site_Master) this.Master)._Notify("Actividad registrada en el sistema");
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
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }

    private void _CagarDetalles()
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.txtParticipantes.Text = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DS3";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
    }
  }
}
