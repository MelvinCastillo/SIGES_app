// Decompiled with JetBrains decompiler
// Type: CAID.PAX20100R3
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using System;
using System.Web.UI;

namespace CAID
{
  public class PAX20100R3 : Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Page.IsPostBack)
        return;
      this.Session.Add("REPORT_URL", (object) "~/reports/PAX20100R3.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) "[PAX20100R3] 'CAID-SD', '', '01-01-2000', '12-31-2015', 'CAID-SD-SA'");
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx','_blank')");
      this.Response.Write("</script>");
    }
  }
}
