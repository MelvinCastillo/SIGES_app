// Decompiled with JetBrains decompiler
// Type: CAID.Free_Master
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class Free_Master : MasterPage
  {
    protected Literal MenuTop;
    protected HtmlAnchor lblEmpresa;
    protected HtmlForm frmWebSite;
    protected HiddenField xMAINPAXGUID;
    protected HiddenField xMAINPAXNAM;
    protected HiddenField xREFGUID;
    protected HiddenField xTOKEN;
    protected ContentPlaceHolder MainContent;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
  }
}
