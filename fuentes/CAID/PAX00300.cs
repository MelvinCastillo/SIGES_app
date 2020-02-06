// Decompiled with JetBrains decompiler
// Type: CAID.PAX00300
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
  public class PAX00300 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnPrint;
    protected HtmlButton btnExport;
    protected HtmlInputText txtBuscar;
    protected HtmlButton btnShow;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlSelect cmbAdmite;
    protected RequiredFieldValidator valcmbAdmite;
    protected HtmlInputText txtNombre;
    protected RequiredFieldValidator valtxtNombre;

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
        return this.txtNombre.Value.ToString().Trim().ToUpper();
      }
    }

    private string ADMITIDOID
    {
      get
      {
        return this.cmbAdmite.Value.ToString().Trim().ToUpper();
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
      this.Session["TOP"] = (object) "100";
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      string str = this.Request.QueryString["X"];
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.txtBuscar.Value.Trim());
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbAdmite.Items.Clear();
      this.cmbAdmite.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30017S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbAdmite.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.rpData.DataSource = (object) null;
        this.rpData.DataBind();
        this._IniciarControles();
      }
      else if (str == "DATA")
      {
        this._Show((object) null, (EventArgs) null);
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
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.txtNombre.Value = string.Empty;
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
      this.Session.Add("REPORT_URL", (object) "~/reports/PAX00300R1.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[PAX00300R1] @NOMBRE = '{0}', @ROWSGXID = '{1}', @TOP = '{2}', @USRID = '{3}'", (object) this.txtBuscar.Value.ToString().Trim(), (object) this.ROWSGXID, (object) this.Session["TOP"].ToString(), (object) this.ROWUSERID));
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx?X=EXCEL','_blank')");
      this.Response.Write("</script>");
    }

    protected void _Print(object sender, EventArgs e)
    {
      this.Session.Add("REPORT_URL", (object) "~/reports/PAX00300R1.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[PAX00300R1] @NOMBRE = '{0}', @ROWSGXID = '{1}', @TOP = '{2}', @USRID = '{3}'", (object) this.txtBuscar.Value.ToString().Trim(), (object) this.ROWSGXID, (object) this.Session["TOP"].ToString(), (object) this.ROWUSERID));
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=800,height=600')");
      this.Response.Write("</script>");
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.txtBuscar.Value.ToString().Trim());
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@TOP");
      this.xQueryValues.Add((object) this.Session["TOP"].ToString());
      this.xQuery = "PAX00000S4";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
      if (this.rpData.Items.Count == 0)
        return;
      this.Session["TOP"] = (object) (Convert.ToInt32(this.Session["TOP"].ToString()) + 100).ToString();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "Edit" && Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
        {
          this.pnlConsulta.Visible = false;
          this.pnlData.Visible = true;
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
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ADMITIDOID");
      this.xQueryValues.Add((object) this.ADMITIDOID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.Session["TOP"] = (object) "100";
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@TOP");
      this.xQueryValues.Add((object) this.Session["TOP"].ToString());
      this.xQuery = "PAX00000S4";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
      if (this.rpData.Items.Count == 0)
        return;
      this.Session["TOP"] = (object) (Convert.ToInt32(this.Session["TOP"].ToString()) + 100).ToString();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _EditProspecto(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
        return;
      this.Response.Redirect("PAX00300_E.aspx?X=" + this.ROWGUID);
    }
  }
}
