// Decompiled with JetBrains decompiler
// Type: CAID.reports.CachedHCX00300R1
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
  public class CachedHCX00300R1 : Component, ICachedReport
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

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
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

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
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
      HCX00300R1 hcX00300R1 = new HCX00300R1();
      hcX00300R1.Site = this.Site;
      return (ReportDocument) hcX00300R1;
    }

    public virtual string GetCustomizedCacheKey(RequestContext request)
    {
      return (string) null;
    }
  }
}
