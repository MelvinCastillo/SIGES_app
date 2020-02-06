// Decompiled with JetBrains decompiler
// Type: CAID.PAX20101
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
  public class PAX20101 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HiddenField xGUID;
    protected HtmlButton btnSave;
    protected DropDownList cmbTipo;
    protected HtmlInputText txtHoraIni;
    protected Panel pnlInteraccion;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected HtmlSelect cmbDocumento;
    protected HtmlInputText txtCedula;
    protected HtmlButton btnFilter;
    protected HtmlInputText txtNombre;
    protected RequiredFieldValidator valtxtNombre;
    protected HtmlSelect cmbMotivo;
    protected RequiredFieldValidator valcmbMotivo;
    protected Panel pnlVisita;
    protected HtmlInputText txtCarnet;
    protected RequiredFieldValidator txtCarnet1;
    protected TextBox txtDetalles;
    protected Repeater rpServicios;
    protected Repeater rpDetalles;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.txtNombre.Value.ToString().ToUpper();
      }
    }

    private string RECORDID2
    {
      get
      {
        return this.txtRecordNo.Value.ToString().ToUpper();
      }
    }

    private string CEDULAID
    {
      get
      {
        return this.txtCedula.Value.ToString().ToUpper();
      }
    }

    private string DOCUMENTO
    {
      get
      {
        return this.cmbDocumento.Value.ToString().ToUpper();
      }
    }

    private string TIPOVISITA
    {
      get
      {
        return this.cmbMotivo.Value.ToString().ToUpper();
      }
    }

    private string TIPOVISITADET
    {
      get
      {
        return this.cmbMotivo.Value.ToString().ToUpper();
      }
    }

    private string TIPOCONTACTODET
    {
      get
      {
        return this.txtDetalles.Text.ToString().ToUpper();
      }
    }

    private string RECORDID
    {
      get
      {
        return this.cmbPaciente.Value.ToString().ToUpper();
      }
    }

    private string PACIENTEDET
    {
      get
      {
        return this.cmbPaciente.Value.ToString().ToUpper();
      }
    }

    private string DETALLES
    {
      get
      {
        return this.txtDetalles.Text.ToUpper();
      }
    }

    private string HORAINI
    {
      get
      {
        return this.txtHoraIni.Value.ToString().ToUpper();
      }
    }

    private string HORAFIN
    {
      get
      {
        return DateTime.Now.ToShortTimeString();
      }
    }

    private string CARNET
    {
      get
      {
        return this.txtCarnet.Value.ToString().ToUpper();
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

    public string xCommand { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter("SMX30016S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlVisita.Visible = false;
      this.pnlInteraccion.Visible = false;
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.txtNombre.Disabled = true;
      this.txtCedula.Disabled = true;
      this.cmbDocumento.Disabled = true;
      this.txtDetalles.Enabled = true;
      this.cmbMotivo.Disabled = true;
      this.cmbPaciente.Disabled = true;
      this.btnFilter.Disabled = true;
      this.btnFilter2.Disabled = true;
      this.txtCarnet.Disabled = true;
      this.txtRecordNo.Disabled = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbMotivo.Items.Clear();
      this.cmbMotivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- NO APLICA --", "-1"));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["RECORDID"].ToString()));
    }

    private void _IniciarControles()
    {
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.txtNombre.Value = string.Empty;
      this.txtCedula.Value = string.Empty;
      this.cmbDocumento.Value = string.Empty;
      this.cmbPaciente.Value = "-1";
      this.txtDetalles.Text = string.Empty;
      this.cmbMotivo.Value = string.Empty;
      this.txtCarnet.Value = string.Empty;
      this.txtRecordNo.Value = string.Empty;
      this.txtNombre.Disabled = false;
      this.txtCedula.Disabled = false;
      this.cmbDocumento.Disabled = false;
      this.cmbPaciente.Disabled = false;
      this.txtDetalles.Enabled = true;
      this.cmbMotivo.Disabled = false;
      this.btnFilter.Disabled = false;
      this.btnFilter2.Disabled = false;
      this.txtCarnet.Disabled = false;
      this.txtRecordNo.Disabled = false;
      this.rpServicios.DataSource = (object) null;
      this.rpServicios.DataBind();
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.CEDULAID);
      this.xQueryParameters.Add((object) "@DOCUMENTO");
      this.xQueryValues.Add((object) this.DOCUMENTO);
      this.xQueryParameters.Add((object) "@TIPOVISITA");
      this.xQueryValues.Add((object) this.TIPOVISITA);
      this.xQueryParameters.Add((object) "@TIPOVISITADET");
      this.xQueryValues.Add((object) this.TIPOVISITADET);
      this.xQueryParameters.Add((object) "@RECORDID");
      this.xQueryValues.Add((object) this.RECORDID);
      this.xQueryParameters.Add((object) "@PACIENTEDET");
      this.xQueryValues.Add((object) this.PACIENTEDET);
      this.xQueryParameters.Add((object) "@DETALLES");
      this.xQueryValues.Add((object) this.DETALLES);
      this.xQueryParameters.Add((object) "@HORAINI");
      this.xQueryValues.Add((object) this.HORAINI);
      this.xQueryParameters.Add((object) "@HORAFIN");
      this.xQueryValues.Add((object) this.HORAFIN);
      this.xQueryParameters.Add((object) "@CARNET");
      this.xQueryValues.Add((object) this.CARNET);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
      {
        foreach (Control control1 in this.rpServicios.Items)
        {
          CheckBox control2 = (CheckBox) control1.FindControl("CheckBoxServicios");
          if (control2.Checked)
            DB.ExecuteNonQuery(string.Format("INSERT INTO [PAX20101_D]([NOMBRE],[TARIFAID],[VISITAID],[PROCESADO],[ROWGUID],[ROWCDTE],[ROWMDTE],[ROWUSERID],[ROWSGXID])VALUES('{0}','{1}','{2}',0,NEWID(),GETDATE(),GETDATE(),'{3}','{4}')", (object) control2.ValidationGroup.ToString().Trim(), (object) control2.ToolTip.ToString().Trim(), (object) this.ROWGUID, (object) this.ROWUSERID, (object) this.ROWSGXID));
        }
        this._IniciarControles();
        this._Iniciar();
      }
      this.cmbTipo.SelectedIndex = -1;
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (!(this.xCommand == "Exit"))
          return;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@NOMBRE");
        this.xQueryValues.Add((object) this.NOMBRE);
        this.xQueryParameters.Add((object) "@CEDULAID");
        this.xQueryValues.Add((object) this.CEDULAID);
        this.xQueryParameters.Add((object) "@DOCUMENTO");
        this.xQueryValues.Add((object) this.DOCUMENTO);
        this.xQueryParameters.Add((object) "@TIPOVISITA");
        this.xQueryValues.Add((object) this.TIPOVISITA);
        this.xQueryParameters.Add((object) "@TIPOVISITADET");
        this.xQueryValues.Add((object) this.TIPOVISITADET);
        this.xQueryParameters.Add((object) "@RECORDID");
        this.xQueryValues.Add((object) this.RECORDID);
        this.xQueryParameters.Add((object) "@PACIENTEDET");
        this.xQueryValues.Add((object) this.PACIENTEDET);
        this.xQueryParameters.Add((object) "@DETALLES");
        this.xQueryValues.Add((object) this.DETALLES);
        this.xQueryParameters.Add((object) "@HORAINI");
        this.xQueryValues.Add((object) this.HORAINI);
        this.xQueryParameters.Add((object) "@HORAFIN");
        this.xQueryValues.Add((object) this.HORAFIN);
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = this.xBase + "SI";
        if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        {
          this._IniciarControles();
          this._Iniciar();
        }
      }
      catch
      {
      }
    }

    protected void _Search(object sender, EventArgs e)
    {
      if (this.CEDULAID.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.CEDULAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "P1";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbDocumento.Value = dataTable.Rows[0]["DOCUMENTO"].ToString();
        this.txtNombre.Value = dataTable.Rows[0]["NOMBRE"].ToString();
        this.cmbMotivo.Value = dataTable.Rows[0]["TIPOVISITA"].ToString();
        this.cmbPaciente.Value = dataTable.Rows[0]["RECORDID"].ToString();
        this.txtDetalles.Text = string.Empty;
      }
      else
      {
        this.txtNombre.Value = string.Empty;
        this.cmbMotivo.Value = string.Empty;
        this.cmbPaciente.Value = "-1";
        this.txtDetalles.Text = string.Empty;
      }
    }

    protected void _Search2(object sender, EventArgs e)
    {
      if (this.RECORDID2.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.RECORDID2);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "P2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbDocumento.Value = dataTable.Rows[0]["DOCUMENTO"].ToString();
        this.txtCedula.Value = dataTable.Rows[0]["CEDULAID"].ToString();
        this.txtNombre.Value = dataTable.Rows[0]["NOMBRE"].ToString();
        this.cmbMotivo.Value = dataTable.Rows[0]["TIPOVISITA"].ToString();
        this.cmbPaciente.Value = dataTable.Rows[0]["RECORDID"].ToString();
        this.txtDetalles.Text = string.Empty;
      }
      else
      {
        this.txtNombre.Value = string.Empty;
        this.cmbMotivo.Value = string.Empty;
        this.cmbPaciente.Value = "-1";
        this.txtDetalles.Text = string.Empty;
      }
    }

    protected void cmbTipo_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlVisita.Visible = this.cmbTipo.SelectedIndex == 1;
      this.pnlInteraccion.Visible = this.cmbTipo.SelectedIndex == 2;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbMotivo.Items.Clear();
      this.cmbMotivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30018S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        if (row["CONDICION"].ToString() == (this.cmbTipo.SelectedIndex == 0 ? "" : (this.cmbTipo.SelectedIndex == 1 ? "V" : "C")))
          this.cmbMotivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      if (this.cmbTipo.SelectedIndex == 2)
      {
        this.rpServicios.DataSource = (object) DB.ExecuteAdapter("SELECT * FROM vSERVICIOS_CONSULTA ORDER BY NOMBRE");
        this.rpServicios.DataBind();
      }
      else
      {
        this.rpServicios.DataSource = (object) null;
        this.rpServicios.DataBind();
      }
    }
  }
}
