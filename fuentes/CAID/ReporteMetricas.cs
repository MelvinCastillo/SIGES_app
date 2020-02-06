// Decompiled with JetBrains decompiler
// Type: CAID.ReporteMetricas
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class ReporteMetricas : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField HiddenField1;
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected HtmlAnchor A1;
    protected HtmlAnchor A2;
    protected HtmlAnchor A3;
    protected HtmlAnchor A4;
    protected Panel pnlR1;
    protected HtmlInputText txtFecha1;
    protected HtmlInputText txtFecha2;
    protected HtmlButton btnPrint;
    protected Repeater rpReport1;
    protected Panel pnlR2;
    protected Panel pnlR3;
    protected Panel pnlR4;
    protected Panel pnlR5;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
      this.pnlConsulta.Visible = true;
    }

    private void _IniciarControles()
    {
    }

    protected void Report1(object sender, EventArgs e)
    {
      this.pnlR1.Visible = true;
      this.pnlR2.Visible = false;
      this.pnlR3.Visible = false;
      this.pnlR4.Visible = false;
      this.pnlR5.Visible = false;
    }

    protected void Report2(object sender, EventArgs e)
    {
      this.pnlR1.Visible = false;
      this.pnlR2.Visible = true;
      this.pnlR3.Visible = false;
      this.pnlR4.Visible = false;
      this.pnlR5.Visible = false;
    }

    protected void Report3(object sender, EventArgs e)
    {
      this.pnlR1.Visible = false;
      this.pnlR2.Visible = false;
      this.pnlR3.Visible = true;
      this.pnlR4.Visible = false;
      this.pnlR5.Visible = false;
    }

    protected void Report4(object sender, EventArgs e)
    {
      this.pnlR1.Visible = false;
      this.pnlR2.Visible = false;
      this.pnlR3.Visible = false;
      this.pnlR4.Visible = true;
      this.pnlR5.Visible = false;
    }

    protected void Report5(object sender, EventArgs e)
    {
      this.pnlR1.Visible = false;
      this.pnlR2.Visible = false;
      this.pnlR3.Visible = false;
      this.pnlR4.Visible = false;
      this.pnlR5.Visible = true;
    }

    protected void _New(object sender, EventArgs e)
    {
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _ShowReport1(object sender, EventArgs e)
    {
      this.rpReport1.DataSource = (object) DB.ExecuteAdapter(string.Format("[SMX00500RM] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@USRID = '{3}',@TYPE = '{4}'", (object) this.FECHA1, (object) this.FECHA2, (object) this.ROWSGXID, (object) this.ROWUSERID, (object) "Report1"));
      this.rpReport1.DataBind();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Cancel2(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back2(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = false;
    }
  }
}
