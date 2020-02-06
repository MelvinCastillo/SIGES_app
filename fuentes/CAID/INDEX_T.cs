// Decompiled with JetBrains decompiler
// Type: CAID.INDEX_T
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
  public class INDEX_T : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    private DataTable dt;
    private string CITAGUID;
    protected HiddenField data_calendar;
    protected Panel Panel1;
    protected Repeater _DataBinderTurnos;
    protected Repeater rpData;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected LinkButton btnAcerptarAtencion;
    protected Repeater rpAtencionActualizacion;
    protected Panel MSGALERT;
    protected Label lblMSG;
    protected Panel pnlPosponer;
    protected HtmlButton Button1;
    protected TextBox txtPosponerMotivo;
    protected HtmlButton btnSavePosponer;
    protected HtmlButton btnClosePosponer;
    protected Panel pnlAusencia;
    protected HtmlButton btnCloseAusencia;
    protected TextBox txtMotivoAusencia;
    protected HtmlButton btnSaveAusencia;
    protected HtmlButton Button4;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string TERID
    {
      get
      {
        return this.Session["CurrentUSR_TERID"].ToString();
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
      this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
      if (this.Page.IsPostBack)
        return;
      this._Iniciar();
    }

    private void _Iniciar()
    {
      if (!true)
        return;
      this.xQuery = string.Format("SMX00500P9 @TERGUID = '{0}',@MM = {1}, @YY = {2}, @ROWSGXID = '{3}'", (object) this.TERID, (object) DateTime.Now.Month, (object) DateTime.Now.Year, (object) this.ROWSGXID);
      this.dt = DB.ExecuteAdapter(this.xQuery);
      this.rpData.DataSource = (object) this.dt;
      this.rpData.DataBind();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) DateTime.Now.ToString("MM/dd/yyyy"));
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESPECIALISTA");
      this.xQueryValues.Add((object) this.TERID);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) 1);
      this.xQuery = "SMX00500S5";
      this.dt = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this._DataBinderTurnos.DataSource = (object) this.dt;
      this._DataBinderTurnos.DataBind();
      this.xQuery = string.Format("HCL00000S2 @USRID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentUSR_TERID"], (object) this.ROWSGXID);
      this.dt = DB.ExecuteAdapter(this.xQuery);
      this.rpAtencionActualizacion.DataSource = (object) this.dt;
      this.rpAtencionActualizacion.DataBind();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@TERID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000CA1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["PACIENTE"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void _Select(object sender, EventArgs e)
    {
      string str1 = ((LinkButton) sender).CommandName.ToString();
      string str2 = ((LinkButton) sender).CommandArgument.ToString();
      string str3 = ((WebControl) sender).ToolTip.ToString();
      try
      {
        if (str1 == "Confirmar")
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) str2);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          this.xQuery = "SMX00500P1";
          if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          {
            this.Session["CITA_ID"] = (object) str2;
            this.Response.Redirect("HCL00000.aspx?X=" + str3);
          }
        }
        if (!(str1 == "Actualizar"))
          return;
        this.Response.Redirect("HCL00000.aspx?X=" + str3);
      }
      catch
      {
      }
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

    protected void _Refresh(object sender, EventArgs e)
    {
    }

    protected void _Posponer(object sender, EventArgs e)
    {
      this.Session["CITA_ID"] = (object) ((LinkButton) sender).CommandArgument.ToString();
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlPosponer.Visible = true;
    }

    protected void _Ausencia(object sender, EventArgs e)
    {
      this.Session["CITA_ID"] = (object) ((LinkButton) sender).CommandArgument.ToString();
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlAusencia.Visible = true;
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (this.pnlPosponer.Visible)
        this.pnlPosponer.Visible = false;
      if (!this.pnlAusencia.Visible)
        return;
      this.pnlAusencia.Visible = false;
    }

    protected void _SavePosponer(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add(this.Session["CITA_ID"]);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_ID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQueryParameters.Add((object) "@DETTERAPEUTA");
      this.xQueryValues.Add((object) this.txtPosponerMotivo.Text);
      this.xQuery = "SMX00500P3";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CloseModal((object) null, (EventArgs) null);
      this.Response.Redirect("INDEX_T.ASPX");
    }

    protected void _SaveAusencia(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add(this.Session["CITA_ID"]);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_ID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQueryParameters.Add((object) "@DETAUSENCIATERAPEUTA");
      this.xQueryValues.Add((object) this.txtMotivoAusencia.Text);
      this.xQuery = "SMX00500P4";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CloseModal((object) null, (EventArgs) null);
      this.Response.Redirect("INDEX_T.ASPX");
    }

    protected void _Save2(object sender, EventArgs e)
    {
      if (this.cmbPaciente.SelectedValue == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
      this.xQueryParameters.Add((object) "@TERGUID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQuery = "HCL00000SI2";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.Response.Redirect("HCL00000.aspx?X=" + this.cmbPaciente.SelectedValue.ToString());
    }

    protected void rp_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      LinkButton control1 = (LinkButton) e.Item.FindControl("btnConsulta");
      LinkButton control2 = (LinkButton) e.Item.FindControl("btnPosponer");
      LinkButton control3 = (LinkButton) e.Item.FindControl("btnAusencia");
      if (this.dt.Rows[e.Item.ItemIndex]["ESTADOFACTURA"].ToString() == "0")
      {
        control1.Enabled = false;
        control3.Enabled = true;
      }
      else
      {
        if (!(this.dt.Rows[e.Item.ItemIndex]["ATENCIONESTATUS"].ToString() == "0"))
          ;
        control3.Enabled = false;
      }
    }
  }
}
