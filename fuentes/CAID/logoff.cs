// Decompiled with JetBrains decompiler
// Type: CAID.logoff
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Entity;
using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace CAID
{
  public class logoff : Page
  {
    protected HtmlForm form1;

    protected void Page_Load(object sender, EventArgs e)
    {
      CURRENTUSR.Reset();
      FormsAuthentication.SignOut();
      this.Response.Redirect("login.aspx");
    }
  }
}
