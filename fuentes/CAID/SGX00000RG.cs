// Decompiled with JetBrains decompiler
// Type: CAID.SGX00000RG
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
  public class SGX00000RG : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected DropDownList cmbTipoReporte;
    protected RequiredFieldValidator cmbTipoReporte1;
    protected HtmlInputText txtDesde;
    protected HtmlInputText txtHasta;
    protected DropDownList cmbTipoSalida;
    protected RequiredFieldValidator cmbTipoSalida1;
    protected HtmlButton btnPrint;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string FECHA1
    {
      get
      {
        return this.txtDesde.Value.ToString();
      }
    }

    private string FECHA2
    {
      get
      {
        return this.txtHasta.Value.ToString();
      }
    }

    private string TYPE
    {
      get
      {
        return this.cmbTipoReporte.SelectedValue.ToString();
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
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbTipoReporte.Items.Clear();
      this.cmbTipoReporte.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vSGX00000RG").Rows)
        this.cmbTipoReporte.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbTipoSalida.Items.Clear();
      this.cmbTipoSalida.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbTipoSalida.Items.Add(new ListItem("Pantalla", "1"));
      this.cmbTipoSalida.Items.Add(new ListItem("Gráfico", "2"));
      this.cmbTipoSalida.Items.Add(new ListItem("Excel", "3"));
      this._IniciarControles();
    }

    private void _IniciarControles()
    {
      this.cmbTipoReporte.SelectedValue = string.Empty;
      this.cmbTipoSalida.SelectedValue = string.Empty;
    }

    protected void _Print(object sender, EventArgs e)
    {
      switch (this.cmbTipoSalida.SelectedValue)
      {
        case "1":
          this.Session.Add("REPORT_URL", (object) "~/reports/SGX00000RG.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("SGX00000RG \t@ROWSGXID = '{0}', @USRID = '{1}',@FECHA1='{2}', @FECHA2='{3}', @TYPE= '{4}'", (object) this.ROWSGXID, (object) this.ROWUSERID, (object) this.FECHA1, (object) this.FECHA2, (object) this.TYPE));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank')");
          this.Response.Write("</script>");
          break;
        case "2":
          this.Session.Add("REPORT_URL", (object) "~/reports/SGX00000RG2.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("SGX00000RG \t@ROWSGXID = '{0}', @USRID = '{1}',@FECHA1='{2}', @FECHA2='{3}', @TYPE= '{4}'", (object) this.ROWSGXID, (object) this.ROWUSERID, (object) this.FECHA1, (object) this.FECHA2, (object) this.TYPE));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank')");
          this.Response.Write("</script>");
          break;
        case "3":
          this.Session.Add("REPORT_URL", (object) "~/reports/SGX00000RG.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("SGX00000RG \t@ROWSGXID = '{0}', @USRID = '{1}',@FECHA1='{2}', @FECHA2='{3}', @TYPE= '{4}'", (object) this.ROWSGXID, (object) this.ROWUSERID, (object) this.FECHA1, (object) this.FECHA2, (object) this.TYPE));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx?X=EXCEL','_blank')");
          this.Response.Write("</script>");
          break;
      }
    }
  }
}
