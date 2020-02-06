// Decompiled with JetBrains decompiler
// Type: CAID.SitePrint
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class SitePrint : MasterPage
  {
    protected HtmlButton btnGuardar;
    protected HtmlForm frmWebSite;
    protected ContentPlaceHolder MainContent;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Page.IsPostBack)
        return;
      this._Imprimir((object) null, (EventArgs) null);
    }

    protected void _Imprimir(object sender, EventArgs e)
    {
      this.Response.Write("<script>window.print()</script>");
    }
  }
}
