// Decompiled with JetBrains decompiler
// Type: CAID.Global
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using System;
using System.Web;

namespace CAID
{
  public class Global : HttpApplication
  {
    protected void Application_Start(object sender, EventArgs e)
    {
    }

    protected void Session_Start(object sender, EventArgs e)
    {
      this.Session.Add("dtQuiz", (object) "");
      this.Session.Add("xMAINPAXGUID", (object) "");
      this.Session.Add("xMAINPAXNAM", (object) "");
      this.Session.Add("xHTML_Options", (object) "");
      this.Session.Add("REPORT_URL", (object) "");
      this.Session.Add("REPORT_DATASOURCE", (object) "");
      this.Session.Add("CITA_ID", (object) string.Empty);
      this.Session.Add("CURRENTUSR_ID", (object) string.Empty);
      this.Session.Add("CURRENTUSR_NOMBRE", (object) string.Empty);
      this.Session.Add("CURRENTUSR_LOGIN", (object) string.Empty);
      this.Session.Add("CURRENTUSR_PWRD", (object) string.Empty);
      this.Session.Add("CURRENTUSR_SGXID", (object) string.Empty);
      this.Session.Add("CurrentUSR_TERID", (object) string.Empty);
      this.Session.Add("CURRENTUSR_fnLEER", (object) false);
      this.Session.Add("CURRENTUSR_fnCREAR", (object) false);
      this.Session.Add("CURRENTUSR_fnMODIFICAR", (object) false);
      this.Session.Add("CURRENTUSR_fnIMRIMIR", (object) false);
      this.Session.Add("CURRENTUSR_fnELIMINAR", (object) false);
      this.Session.Add("CurrentUSR_COMPGUID", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRNOMBRE", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRLOGIN", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRPASSWORD", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRNUMERO", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRIMGURL", (object) string.Empty);
      this.Session.Add("CurrentUSR_ROWGUID", (object) string.Empty);
      this.Session.Add("CurrentUSR_HTML", (object) string.Empty);
      this.Session.Add("CurrentUSR_ROLNOMBRE", (object) string.Empty);
      this.Session.Add("CurrentUSR_ROLVER", (object) true);
      this.Session.Add("CurrentUSR_ROLCREAR", (object) true);
      this.Session.Add("CurrentUSR_ROLEDITAR", (object) true);
      this.Session.Add("CurrentUSR_ROLELIMINAR", (object) true);
      this.Session.Add("CurrentUSR_ROLIMPRIMIR", (object) true);
      this.Session.Add("CurrentUSR_ROLGUID", (object) string.Empty);
      this.Session.Add("CurrentUSR_USRASOCIADO", (object) string.Empty);
      this.Session.Add("CurrentUSR_ROLDASHBOARD", (object) string.Empty);
      this.Session.Add("CurrentPAX_ROWGUID", (object) string.Empty);
      this.Session.Add("ORIGEN_ATENCION", (object) "CE");
      this.Session.Add("TOP", (object) "100");
    }

    protected void Application_BeginRequest(object sender, EventArgs e)
    {
    }

    protected void Application_AuthenticateRequest(object sender, EventArgs e)
    {
    }

    protected void Application_Error(object sender, EventArgs e)
    {
    }

    protected void Session_End(object sender, EventArgs e)
    {
    }

    protected void Application_End(object sender, EventArgs e)
    {
    }
  }
}
