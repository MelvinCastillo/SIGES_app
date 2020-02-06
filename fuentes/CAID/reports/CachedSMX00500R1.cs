// Decompiled with JetBrains decompiler
// Type: CAID.reports.CachedSMX00500R1
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using System;
using System.ComponentModel;
using System.Drawing;

namespace CAID.reports
{
  [ToolboxBitmap(typeof (ExportOptions), "report.bmp")]
  public class CachedSMX00500R1 : Component, ICachedReport
  {
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public virtual bool IsCacheable
    {
      get
      {
        return true;
      }
      set
      {
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public virtual bool ShareDBLogonInfo
    {
      get
      {
        return false;
      }
      set
      {
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public virtual TimeSpan CacheTimeOut
    {
      get
      {
        return CachedReportConstants.DEFAULT_TIMEOUT;
      }
      set
      {
      }
    }

    public virtual ReportDocument CreateReport()
    {
      SMX00500R1 smX00500R1 = new SMX00500R1();
      smX00500R1.Site = this.Site;
      return (ReportDocument) smX00500R1;
    }

    public virtual string GetCustomizedCacheKey(RequestContext request)
    {
      return (string) null;
    }
  }
}
