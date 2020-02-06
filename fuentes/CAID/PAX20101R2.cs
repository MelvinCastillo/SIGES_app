// Decompiled with JetBrains decompiler
// Type: CAID.PAX20101R2
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
  public class PAX20101R2 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnShow;
    protected HtmlButton btnShow2;
    protected HtmlButton btnBack;
    protected HtmlInputText txtFecha1;
    protected HtmlInputText txtFecha2;
    protected HtmlButton Button1;
    protected Repeater rpEntradas;
    protected Repeater rpSalidas;
    protected Repeater rpTodas;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string HORAFIN
    {
      get
      {
        return DateTime.Now.ToShortTimeString();
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
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this._Show((object) null, (EventArgs) null);
    }

    protected void _List(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.txtFecha1.Value = DateTime.Now.ToString("MM/dd/yyyy");
      this.txtFecha2.Value = DateTime.Now.ToString("MM/dd/yyyy");
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FECHA");
      this.xQueryValues.Add((object) DateTime.Now.ToString("yyyy-MM-dd"));
      this.xQueryParameters.Add((object) "@ESTADO");
      this.xQueryValues.Add((object) "E");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.txtFecha2.Value);
      this.rpSalidas.DataSource = (object) null;
      this.rpSalidas.DataBind();
      this.rpTodas.DataSource = (object) null;
      this.rpTodas.DataBind();
      this.xQuery = "PAX20101S3";
      this.rpEntradas.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpEntradas.DataBind();
    }

    protected void _Show2(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FECHA");
      this.xQueryValues.Add((object) DateTime.Now.ToString("yyyy-MM-dd"));
      this.xQueryParameters.Add((object) "@ESTADO");
      this.xQueryValues.Add((object) "S");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.txtFecha2.Value);
      this.rpEntradas.DataSource = (object) null;
      this.rpEntradas.DataBind();
      this.rpTodas.DataSource = (object) null;
      this.rpTodas.DataBind();
      this.xQuery = "PAX20101S3";
      this.rpSalidas.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpSalidas.DataBind();
    }

    protected void _Show3(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@FECHA");
      this.xQueryValues.Add((object) this.txtFecha1.Value);
      this.xQueryParameters.Add((object) "@ESTADO");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.txtFecha2.Value);
      this.rpEntradas.DataSource = (object) null;
      this.rpEntradas.DataBind();
      this.rpSalidas.DataSource = (object) null;
      this.rpSalidas.DataBind();
      this.xQuery = "PAX20101S3";
      this.rpTodas.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpTodas.DataBind();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = false;
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
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@CEDULAID");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@DOCUMENTO");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@TIPOVISITA");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@TIPOVISITADET");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@RECORDID");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@PACIENTEDET");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@DETALLES");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@HORAINI");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@HORAFIN");
        this.xQueryValues.Add((object) this.HORAFIN);
        this.xQueryParameters.Add((object) "@CARNET");
        this.xQueryValues.Add((object) string.Empty);
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = "PAX20101SI";
        if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          this._Iniciar();
      }
      catch
      {
      }
    }
  }
}
