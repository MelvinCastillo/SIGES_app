// Decompiled with JetBrains decompiler
// Type: CAID.FTX00000
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
  public class FTX00000 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected HiddenField xPACIENTEGUID;
    protected HiddenField xVISITAGUID;
    protected HiddenField xREFGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnRefresh;
    protected HtmlInputText txtFecha1;
    protected HtmlButton btnShow;
    protected HtmlButton btnNew;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlButton Button3;
    protected HtmlInputText txtNumero;
    protected RequiredFieldValidator valtxtNombre;
    protected HtmlSelect cmbCaja;
    protected RequiredFieldValidator cmbCaja1;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected DropDownList cmbPlanARS;
    protected RequiredFieldValidator valcmbPlanARS;
    protected HtmlSelect cmbDetalles;
    protected RequiredFieldValidator valtxtDetalles;
    protected HtmlButton btnSaveDetalles;
    protected HtmlButton btnNCF;
    protected HtmlButton btnCobrar;
    protected Repeater rpSumario;
    protected Repeater rpDetalles;
    protected Panel pnlRegistroPago;
    protected HtmlButton Button1;
    protected HtmlInputText txtmontorestante;
    protected HtmlSelect cmbFPAGOID;
    protected RequiredFieldValidator valcmbFPAGOID;
    protected HtmlInputText txtFPAGODETALLES;
    protected HtmlInputText txtFPAGOPACIENTE;
    protected RequiredFieldValidator valtxtFPAGOPACIENTE;
    protected HtmlButton btnSavePago;
    protected HtmlButton btnClosePago;
    protected Panel pnlRegistroNCF;
    protected HtmlSelect cmbTipoNCF;
    protected HtmlInputText txtRNC;
    protected HtmlInputText txtAutorizacion;
    protected HtmlInputText txtPoliza;
    protected HtmlButton btnSaveNCF;
    protected Panel pnlCitasPac;
    protected HtmlButton Button2;
    protected Repeater rpCitasPac;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string FPAGOID
    {
      get
      {
        return this.cmbFPAGOID.Value.ToString().Trim().ToUpper();
      }
    }

    private string FPAGODETALLES
    {
      get
      {
        return this.txtFPAGODETALLES.Value.ToString().ToUpper();
      }
    }

    private double FPAGOPACIENTE
    {
      get
      {
        return Convert.ToDouble(this.txtFPAGOPACIENTE.Value);
      }
    }

    private double montorestante
    {
      get
      {
        return Convert.ToDouble(this.txtmontorestante.Value);
      }
    }

    private string NUMERO
    {
      get
      {
        return this.txtNumero.Value.ToString().Trim().ToUpper();
      }
    }

    private string REFGUID
    {
      get
      {
        return this.cmbPaciente.Value.ToString().Trim().ToUpper();
      }
    }

    private string REFVISITAGUID
    {
      get
      {
        return this.xVISITAGUID.Value.ToString().Trim().ToUpper();
      }
    }

    private string REFCAJAGUID
    {
      get
      {
        return this.cmbCaja.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.cmbPaciente.Items[this.cmbPaciente.SelectedIndex].Text.ToUpper().Trim();
      }
    }

    private string NCF
    {
      get
      {
        return this.cmbTipoNCF.Value.Trim();
      }
    }

    private string ARSID
    {
      get
      {
        return this.cmbPlanARS.SelectedValue.ToString();
      }
    }

    private string PLANID
    {
      get
      {
        return this.cmbPlanARS.SelectedValue.ToString();
      }
    }

    private string NUMAUTORIZACION
    {
      get
      {
        return this.txtAutorizacion.Value.ToString();
      }
    }

    private string NUMPOLIZA
    {
      get
      {
        return this.txtPoliza.Value.ToString();
      }
    }

    private string NUMDOCUMENTO
    {
      get
      {
        return this.txtRNC.Value.ToString();
      }
    }

    private string DETALLES
    {
      get
      {
        return this.cmbDetalles.Value.ToString().Trim();
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

    private string FACTURAID
    {
      get
      {
        return this.xGUID.Value.ToString().ToUpper();
      }
    }

    private string TARIFAID
    {
      get
      {
        return this.cmbDetalles.Value.ToString().Trim().ToUpper();
      }
    }

    private string TARIFANOMBRE
    {
      get
      {
        return this.cmbDetalles.Items[this.cmbDetalles.SelectedIndex].Text.ToUpper().Trim();
      }
    }

    private Decimal TARIFACANT
    {
      get
      {
        return new Decimal(1);
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      this.cmbPlanARS.AutoPostBack = true;
      this.cmbPlanARS.SelectedIndexChanged += new EventHandler(this.cmbPlanARS_SelectedIndexChanged);
      if (this.Page.IsPostBack)
        return;
      this.Session["TOP"] = (object) "300";
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnNew.Visible = false;
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@USRID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbCaja.Items.Clear();
      this.cmbCaja.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("FTX10100S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbCaja.Items.Add(new ListItem(row["CAJANUMERO"].ToString(), row["ROWGUID"].ToString()));
      this.cmbTipoNCF.Items.Clear();
      this.cmbTipoNCF.Items.Add(new ListItem("-- NO APLICA --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM [FTX10102] WHERE ROWSGXID = '{0}' AND NCFGRUPO = 'FA' ORDER BY NCFNOMBRE", this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbTipoNCF.Items.Add(new ListItem(row["NCFNOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbFPAGOID.Items.Clear();
      this.cmbFPAGOID.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("FTX30002S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbFPAGOID.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this._Iniciar();
    }

    private void _Iniciar()
    {
      if (this.cmbCaja.Items.Count == 2)
        this.cmbCaja.SelectedIndex = 1;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.rpData.DataSource = (object) null;
      this.rpData.DataBind();
      this._IniciarControles();
    }

    private void _IniciarControles()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@TABLA");
      this.xQueryValues.Add((object) this.xBase);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.txtNumero.Value = string.Format("{0}{1}", (object) "FT", (object) DB.ExecuteScalar("SMX10001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).ToString());
      this.txtFecha1.Value = DateTime.Now.ToString("MM/dd/yyyy");
      this._Show((object) null, (EventArgs) null);
    }

    private void _IniciarFormulario()
    {
      this.xVISITAGUID.Value = string.Empty;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this._IniciarControles();
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.rpDetalles.DataSource = (object) null;
      this.rpDetalles.DataBind();
      this.rpSumario.DataSource = (object) null;
      this.rpSumario.DataBind();
      this.cmbPlanARS.SelectedValue = string.Empty;
      this.cmbPaciente.Value = string.Empty;
      this.cmbFPAGOID.Value = string.Empty;
      this.cmbCaja.Value = string.Empty;
      this.cmbTipoNCF.Value = string.Empty;
      this.txtAutorizacion.Value = string.Empty;
      this.txtPoliza.Value = string.Empty;
      this.txtRNC.Value = string.Empty;
      this._Show((object) null, (EventArgs) null);
    }

    private void _CagarDetalles()
    {
      this.cmbDetalles.Value = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "_DS3";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
      this.xQuery = this.xBase + "S3";
      this.rpSumario.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpSumario.DataBind();
      this.cmbPlanARS.Enabled = this.rpDetalles.Items.Count == 0;
    }

    private void _CagarDetallesResumen()
    {
      this.cmbDetalles.Value = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S3";
      this.rpSumario.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpSumario.DataBind();
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
      this.xQueryParameters.Add((object) "@FECHA");
      this.xQueryValues.Add((object) this.txtFecha1.Value);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@TOP");
      this.xQueryValues.Add((object) this.Session["TOP"].ToString());
      this.xQuery = "PAX20101S5";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
      if (this.rpData.Items.Count != 0)
        this.Session["TOP"] = (object) (Convert.ToInt32(this.Session["TOP"].ToString()) + 100).ToString();
      this._CagarDetalles();
      foreach (RepeaterItem repeaterItem in this.rpData.Items)
      {
        LinkButton control = (LinkButton) repeaterItem.FindControl("btnEntregaInforme");
        if (((LinkButton) repeaterItem.FindControl("btnViewInvo")).Text != string.Empty)
          control.Visible = false;
      }
    }

    protected void _Refresh(object sender, EventArgs e)
    {
      this._Iniciar();
    }

    protected void _Select(object sender, EventArgs e)
    {
      string str1 = ((LinkButton) sender).Text.ToString();
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xPACIENTEGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      if (this.xVISITAGUID.Value == string.Empty)
        this.xVISITAGUID.Value = ((WebControl) sender).ToolTip.ToString();
      this.xREFGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      string empty = string.Empty;
      try
      {
        if (str1 == "Imprimir")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/FTX00000R1.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX00000R1] @VISITAGUID = '{0}', @ROWSGXID = '{1}'", (object) this.xVISITAGUID.Value, (object) this.ROWSGXID));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
        else
        {
          if (this.xCommand == "EntInforme")
          {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@VISITAGUID");
            this.xQueryValues.Add((object) this.xVISITAGUID.Value);
            this.xQueryParameters.Add((object) "@USRCAJERO");
            this.xQueryValues.Add((object) this.ROWUSERID);
            if (DB.ExecuteNonQuery("FTX00000P2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
              this._Show((object) null, (EventArgs) null);
          }
          if (this.xCommand == "Edit")
          {
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) this.xVISITAGUID.Value);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            DB.ExecuteAdapter("FTX00000S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
              return;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) this.xPACIENTEGUID.Value);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbPaciente.Items.Clear();
            this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
            {
              this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
              empty = row["ARSID"].ToString();
            }
            this.cmbPaciente.Value = this.xPACIENTEGUID.Value.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) empty);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbPlanARS.Items.Clear();
            this.cmbPlanARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00201S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
              this.cmbPlanARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            if (this.cmbPlanARS.Items.Count == 2)
              this.cmbPlanARS.SelectedIndex = 1;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@PLANID");
            this.xQueryValues.Add((object) this.cmbPlanARS.SelectedValue.ToString());
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbDetalles.Items.Clear();
            this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00202S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
              this.cmbDetalles.Items.Add(new ListItem(row["TARIFANOMBRE"].ToString() + " (" + row["TARIFAID"].ToString() + ")", row["ROWGUID"].ToString()));
            this.pnlConsulta.Visible = false;
            this.pnlData.Visible = true;
          }
          if (this.xCommand == "Invoice")
          {
            this.btnCobrar.Disabled = false;
            if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
              return;
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) this.xPACIENTEGUID.Value);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            DataTable dataTable = DB.ExecuteAdapter("FTX00000S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
            if (dataTable.Rows.Count == 0)
              return;
            this.txtNumero.Value = dataTable.Rows[0]["NUMERO"].ToString();
            this.xGUID.Value = dataTable.Rows[0]["ROWGUID"].ToString();
            this.xPACIENTEGUID.Value = dataTable.Rows[0]["REFGUID"].ToString();
            this._CagarDetalles();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) this.xPACIENTEGUID.Value);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbPaciente.Items.Clear();
            this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
            {
              this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
              empty = row["ARSID"].ToString();
            }
            this.cmbPaciente.Value = this.xPACIENTEGUID.Value.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@GUID");
            this.xQueryValues.Add((object) empty);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbPlanARS.Items.Clear();
            this.cmbPlanARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00201S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
              this.cmbPlanARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
            if (this.cmbPlanARS.Items.Count == 2)
              this.cmbPlanARS.SelectedIndex = 1;
            this.cmbPlanARS.SelectedValue = dataTable.Rows[0]["PLANID"].ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@PLANID");
            this.xQueryValues.Add((object) this.cmbPlanARS.SelectedValue.ToString());
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.cmbDetalles.Items.Clear();
            this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
            foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00202S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
              this.cmbDetalles.Items.Add(new ListItem(row["TARIFANOMBRE"].ToString(), row["ROWGUID"].ToString()));
            this.pnlConsulta.Visible = false;
            this.pnlData.Visible = true;
          }
          if (this.xCommand == "DeleteDet")
          {
            string str2 = ((LinkButton) sender).CommandArgument.ToString();
            this.xQueryParameters.Clear();
            this.xQueryValues.Clear();
            this.xQueryParameters.Add((object) "@ROWGUID");
            this.xQueryValues.Add((object) str2);
            this.xQueryParameters.Add((object) "@ROWUSERID");
            this.xQueryValues.Add((object) this.ROWUSERID);
            this.xQueryParameters.Add((object) "@ROWSGXID");
            this.xQueryValues.Add((object) this.ROWSGXID);
            this.xQuery = "FTX00000_DSD";
            if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
              ;
          }
          this._CagarDetalles();
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
      }
      catch
      {
      }
      finally
      {
        DataTable dataTable = DB.ExecuteAdapter(string.Format("FTX00000S2 @GUID = '{0}', @ROWSGXID = '{1}'", (object) this.ROWGUID, (object) this.ROWSGXID));
        if (dataTable.Rows.Count != 0)
        {
          this.btnSave.Disabled = dataTable.Rows[0]["ESTADO"].ToString() != "A";
          this.btnSaveDetalles.Disabled = dataTable.Rows[0]["ESTADO"].ToString() != "A";
          this.btnCobrar.Disabled = dataTable.Rows[0]["ESTADO"].ToString() != "A";
          this.btnNCF.Disabled = dataTable.Rows[0]["ESTADO"].ToString() != "A";
          this.cmbDetalles.Disabled = dataTable.Rows[0]["ESTADO"].ToString() != "A";
          foreach (Control control in this.rpDetalles.Items)
            ((WebControl) control.FindControl("btnAdd")).Enabled = dataTable.Rows[0]["ESTADO"].ToString() == "A";
        }
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@TABLA");
      this.xQueryValues.Add((object) this.xBase);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.txtNumero.Value = string.Format("{0}{1}", (object) "FT", (object) DB.ExecuteScalar("SMX10001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).ToString());
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NUMERO");
      this.xQueryValues.Add((object) this.NUMERO);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@REFVISITAGUID");
      this.xQueryValues.Add((object) this.REFVISITAGUID);
      this.xQueryParameters.Add((object) "@REFCAJAGUID");
      this.xQueryValues.Add((object) this.REFCAJAGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@NCF");
      this.xQueryValues.Add((object) this.NCF);
      this.xQueryParameters.Add((object) "@ARSID");
      this.xQueryValues.Add((object) this.ARSID);
      this.xQueryParameters.Add((object) "@PLANID");
      this.xQueryValues.Add((object) this.PLANID);
      this.xQueryParameters.Add((object) "@NUMAUTORIZACION");
      this.xQueryValues.Add((object) this.NUMAUTORIZACION);
      this.xQueryParameters.Add((object) "@NUMPOLIZA");
      this.xQueryValues.Add((object) this.NUMPOLIZA);
      this.xQueryParameters.Add((object) "@NUMDOCUMENTO");
      this.xQueryValues.Add((object) this.NUMDOCUMENTO);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        this.btnCobrar.Disabled = false;
      this._CagarDetalles();
      this._CagarDetallesResumen();
    }

    protected void _SaveDetalles(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@TARIFAID");
      this.xQueryValues.Add((object) this.TARIFAID);
      this.xQueryParameters.Add((object) "@TARIFANOMBRE");
      this.xQueryValues.Add((object) this.TARIFANOMBRE);
      this.xQueryParameters.Add((object) "@TARIFACANT");
      this.xQueryValues.Add((object) this.TARIFACANT);
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

    protected void _SavePago(object sender, EventArgs e)
    {
      if (this.FPAGOID.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S6";
      double num1 = Convert.ToDouble(DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows[0]["FV_SEGURO"].ToString());
      double num2 = num1 + this.FPAGOPACIENTE;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      string upper = Guid.NewGuid().ToString().ToUpper();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@FPAGOID");
      this.xQueryValues.Add((object) this.FPAGOID);
      this.xQueryParameters.Add((object) "@FPAGODETALLES");
      this.xQueryValues.Add((object) this.FPAGODETALLES);
      this.xQueryParameters.Add((object) "@FPAGONETO");
      this.xQueryValues.Add((object) num2);
      this.xQueryParameters.Add((object) "@FPAGOSEGURO");
      this.xQueryValues.Add((object) num1);
      this.xQueryParameters.Add((object) "@FPAGOPACIENTE");
      this.xQueryValues.Add((object) this.FPAGOPACIENTE);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "FTX00000_PSI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S6";
      this.txtmontorestante.Value = Convert.ToDecimal(DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows[0]["FV_PACIENTE"].ToString()).ToString("#,#.00#;(#,#.00#)");
      this._CagarDetalles();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S6";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      Decimal num3 = new Decimal(0);
      Decimal num4 = Convert.ToDecimal(dataTable.Rows[0]["FV_PACIENTE"].ToString());
      this.txtmontorestante.Value = num4.ToString("#,#.00#;(#,#.00#)");
      if (!(num4 <= new Decimal(0)))
        return;
      this._CerrarFactura();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _Print(object sender, EventArgs e)
    {
      this.Session.Add("REPORT_URL", (object) "~/reports/FTX00000R1.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX00000R1] @VISITAGUID = '{0}', @ROWSGXID = '{1}'", (object) this.xVISITAGUID.Value, (object) this.ROWSGXID));
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
      this.Response.Write("</script>");
    }

    protected void _NCF(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlRegistroNCF.Visible = true;
    }

    protected void _CitasPac(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX00500S7";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count > 0)
      {
        this.rpCitasPac.DataSource = (object) dataTable;
        this.rpCitasPac.DataBind();
        this.MainShadow.Attributes.Add("class", "navi");
        this.pnlCitasPac.Visible = true;
      }
      else
        this.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El paciente no tiene citas cargadas para hoy');", true);
    }

    protected void _Cobrar(object sender, EventArgs e)
    {
      this.cmbFPAGOID.Value = string.Empty;
      this.txtFPAGODETALLES.Value = string.Empty;
      this.txtFPAGOPACIENTE.Value = "0.00";
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FACTURAID");
      this.xQueryValues.Add((object) this.FACTURAID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S6";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      Decimal num = new Decimal(0);
      this.txtmontorestante.Value = Convert.ToDecimal(dataTable.Rows[0]["FV_PACIENTE"].ToString()).ToString("#,#.00#;(#,#.00#)");
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlRegistroPago.Visible = true;
    }

    private void _CerrarFactura()
    {
      if (!DB.ExecuteNonQuery(string.Format("FTX00000P1 @ROWGUID = '{0}', @ROWUSERID = '{1}', @ROWSGXID = '{2}'", (object) this.ROWGUID, (object) this.ROWUSERID, (object) this.ROWSGXID)))
        return;
      this.btnSave.Disabled = true;
      this.btnSaveDetalles.Disabled = true;
      this.btnCobrar.Disabled = true;
      this.btnNCF.Disabled = true;
      this.cmbDetalles.Disabled = true;
      foreach (Control control in this.rpDetalles.Items)
        ((WebControl) control.FindControl("btnAdd")).Enabled = false;
      this._CloseModal((object) null, (EventArgs) null);
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (this.pnlRegistroPago.Visible)
        this.pnlRegistroPago.Visible = false;
      if (this.pnlRegistroNCF.Visible)
        this.pnlRegistroNCF.Visible = false;
      if (!this.pnlCitasPac.Visible)
        return;
      this.pnlCitasPac.Visible = false;
    }

    protected void cmbPlanARS_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@PLANID");
      this.xQueryValues.Add((object) this.cmbPlanARS.SelectedValue.ToString());
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbDetalles.Items.Clear();
      this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00202S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDetalles.Items.Add(new ListItem(row["TARIFANOMBRE"].ToString() + " (" + row["TARIFAID"].ToString() + ")", row["ROWGUID"].ToString()));
    }
  }
}
