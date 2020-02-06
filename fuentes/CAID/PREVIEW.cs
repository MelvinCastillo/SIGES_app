// Decompiled with JetBrains decompiler
// Type: CAID.PREVIEW
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAID
{
  public class PREVIEW : Page
  {
    private ReportDocument rpt = new ReportDocument();
    protected CrystalReportViewer CrystalReportViewer1;
    protected Panel MSGALERT;
    protected Label lblMSG;

    public string REPORT_URL
    {
      get
      {
        return this.Session["REPORT_URL"].ToString();
      }
    }

    public DataTable REPORT_DATASOURCE
    {
      get
      {
        return DB.ExecuteAdapter(this.Session["REPORT_DATASOURCE"].ToString());
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Page.IsPostBack)
        return;
      if (this.REPORT_DATASOURCE.Rows.Count != 0)
      {
        this.rpt = new ReportDocument();
        this.rpt.Load(this.Server.MapPath(this.REPORT_URL));
        this.rpt.SetDataSource(this.REPORT_DATASOURCE);
        string attachmentName = "SIGES_CAID_REPORT_" + Guid.NewGuid().ToString().Substring(1, 6);
        switch (this.Request.QueryString["X"])
        {
          case "EXCEL":
            this.rpt.ExportToHttpResponse(ExportFormatType.Excel, this.Response, false, attachmentName);
            break;
          case null:
            this.rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, this.Response, false, attachmentName);
            break;
        }
        this.rpt.Close();
        this.rpt.Dispose();
      }
      else
        this.MSGALERT.Visible = true;
    }

    protected override void OnUnload(EventArgs e)
    {
      base.OnUnload(e);
      this.rpt.Dispose();
    }
  }
}
