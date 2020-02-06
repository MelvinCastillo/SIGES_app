// Decompiled with JetBrains decompiler
// Type: CAID.PAX20101R1
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
  public class PAX20101R1 : Page
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
    protected HtmlButton btnShow;
    protected HtmlButton btnCancel;
    protected HtmlSelect cmbTipo;
    protected HtmlInputText txtFecha1;
    protected HtmlInputText txtFecha2;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnBack;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlInputText txtFechaIni;
    protected RequiredFieldValidator RequiredFieldValidator2;
    protected HtmlSelect cmbOrigenTratamiento;
    protected RequiredFieldValidator RequiredFieldValidator3;
    protected HtmlSelect cmbTerapista;
    protected RequiredFieldValidator RequiredFieldValidator5;
    protected HtmlSelect cmbMedico;
    protected HtmlSelect cmbEnfermera;
    protected HtmlSelect cmbHorario;
    protected RequiredFieldValidator cmbHorario1;
    protected HtmlInputText txtObservacion;

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
        return this.cmbPaciente.Value.ToString().ToUpper();
      }
    }

    private string MEDID
    {
      get
      {
        return this.cmbMedico.Value.ToString().ToUpper();
      }
    }

    private string TERID
    {
      get
      {
        return this.cmbTerapista.Value.ToString().Trim().ToUpper();
      }
    }

    private string ENFID
    {
      get
      {
        return this.cmbEnfermera.Value.ToString().Trim().ToUpper();
      }
    }

    private string ORIGENID
    {
      get
      {
        return this.cmbOrigenTratamiento.Value.ToString().Trim().ToUpper();
      }
    }

    private string FECHAINI
    {
      get
      {
        return this.txtFechaIni.Value.ToString();
      }
    }

    private string OBSERVACION
    {
      get
      {
        return this.txtObservacion.Value.ToString().ToUpper();
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

    private string FECHA1
    {
      get
      {
        return this.txtFecha1.Value.ToString();
      }
    }

    private string FECHA2
    {
      get
      {
        return this.txtFecha2.Value.ToString();
      }
    }

    private string TIPO
    {
      get
      {
        return this.cmbTipo.Value.ToString().ToUpper();
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
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
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
        this.xQuery = "SMX00500S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
        if (dataRow == null)
          return;
        this.cmbPaciente.Value = dataRow["REFGUID"].ToString();
        this.cmbOrigenTratamiento.Value = dataRow["ORIGENID"].ToString();
        this.cmbMedico.Value = dataRow["MEDID"].ToString();
        this.cmbTerapista.Value = dataRow["TERID"].ToString();
        this.cmbEnfermera.Value = dataRow["ENFID"].ToString();
        this.txtFechaIni.Value = Convert.ToDateTime(dataRow["FECHAINI"].ToString()).ToString("MM/dd/yyyy");
        this.txtObservacion.Value = dataRow["OBSERVACION"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.cmbPaciente.Value = string.Empty;
      this.cmbMedico.Value = string.Empty;
      this.cmbOrigenTratamiento.Value = string.Empty;
      this.cmbEnfermera.Value = string.Empty;
      this.cmbTerapista.Value = string.Empty;
      this.txtFechaIni.Value = string.Empty;
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

    protected void _Clean(object sender, EventArgs e)
    {
      this.cmbTipo.Value = string.Empty;
      this.txtFecha2.Value = string.Empty;
      this.txtFecha1.Value = string.Empty;
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@TIPO");
      this.xQueryValues.Add((object) this.TIPO);
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) this.FECHA1);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.FECHA2);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX20101R1";
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
      this.xQueryParameters.Add((object) "@OBSERVACION");
      this.xQueryValues.Add((object) this.OBSERVACION);
      this.xQueryParameters.Add((object) "@ASISTIOULTCITA");
      this.xQueryValues.Add((object) 0);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX00520SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
    }

    protected void _Save2(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@OBJID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.xActividadGUID.Value);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        ;
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
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
  }
}
