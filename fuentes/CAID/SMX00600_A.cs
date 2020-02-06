// Decompiled with JetBrains decompiler
// Type: CAID.SMX00600_A
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
  public class SMX00600_A : Page
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
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnAddParticipante;
    protected HtmlButton btnBack;
    protected HtmlInputText txtDescripcion;
    protected RequiredFieldValidator valtxtDescripcion;
    protected TextBox txtComentarios;
    protected Repeater rpDetalles;
    protected Panel pnlAddParticipante;
    protected HtmlButton Button1;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected TextBox txtParticipantes;
    protected TextBox txtObservacionParticipante;
    protected HtmlButton btnSaveParticipante;
    protected HtmlButton btnClosePago;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this._Show((object) null, (EventArgs) null);
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
        this.xQuery = "SMX00600S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
        if (dataRow == null)
          return;
        this.txtDescripcion.Value = dataRow["DESCRIPCION"].ToString();
        this.txtComentarios.Text = dataRow["COMENTARIOS"].ToString();
        this.btnSave.Disabled = false;
        this.txtDescripcion.Disabled = true;
        this._CagarDetalles();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
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
      this.xQueryValues.Add((object) DateTime.Now.ToString("MM/dd/yyyy"));
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) 0);
      this.xQuery = "SMX00600S3";
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
        if (!(this.xCommand == "Delete"))
          ;
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string text = this.txtComentarios.Text;
      int num = 1;
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string str1 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str2 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!DB.ExecuteNonQuery(string.Format("[SMX00600SU] '{0}','{1}','{2}','{3}','{4}'", (object) text, (object) num, (object) str1, (object) str2, (object) this.ROWGUID)))
        return;
      foreach (RepeaterItem repeaterItem in this.rpDetalles.Items)
      {
        Label control1 = (Label) repeaterItem.FindControl("txtDetPac");
        DropDownList control2 = (DropDownList) repeaterItem.FindControl("cmbAsistencia");
        TextBox control3 = (TextBox) repeaterItem.FindControl("txtObservacion");
        string str3 = control2.SelectedValue.ToString();
        string str4 = control3.Text.ToString();
        string str5 = control1.ToolTip.ToString();
        if (!DB.ExecuteNonQuery(string.Format("[SMX00600_DSA] '{0}','{1}','{2}','{3}','{4}'", (object) str3, (object) str1, (object) str2, (object) str5, (object) str4)))
          ;
      }
      this._CagarDetalles();
      ((Site_Master) this.Master)._Notify("Asistencia Actualizada");
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

    private void _CagarDetalles()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX00600_DS3";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
      this._Validar();
    }

    private void _Validar()
    {
      foreach (Control control1 in this.rpDetalles.Items)
      {
        DropDownList control2 = (DropDownList) control1.FindControl("cmbAsistencia");
        control2.SelectedValue = control2.ValidationGroup.ToString();
      }
    }

    protected void _SaveParticipante(object sender, EventArgs e)
    {
      if (this.cmbPaciente.SelectedValue == "")
        return;
      this._Save((object) null, (EventArgs) null);
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
      this.xQueryParameters.Add((object) "@PARTICIPANTES");
      this.xQueryValues.Add((object) this.txtParticipantes.Text);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@OBSERVACION");
      this.xQueryValues.Add((object) this.txtObservacionParticipante.Text);
      this.xQueryParameters.Add((object) "@ASISTENCIA");
      this.xQueryValues.Add((object) "S");
      this.xQuery = "SMX00600_DSI2";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CloseModal((object) null, (EventArgs) null);
      this._CagarDetalles();
    }

    protected void _Search2(object sender, EventArgs e)
    {
      string upper = this.txtRecordNo.Value.ToString().ToUpper();
      if (upper.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@RECORDID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@TERID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQuery = "PAX00000CA2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbPaciente.SelectedValue = dataTable.Rows[0]["ROWGUID"].ToString();
        this.txtRecordNo.Value = string.Empty;
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Disponible");
    }

    protected void _AddParticipante(object sender, EventArgs e)
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.txtParticipantes.Text = string.Empty;
      this.txtObservacionParticipante.Text = string.Empty;
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlAddParticipante.Visible = true;
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (!this.pnlAddParticipante.Visible)
        return;
      this.pnlAddParticipante.Visible = false;
    }
  }
}
