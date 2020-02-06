// Decompiled with JetBrains decompiler
// Type: CAID.reports.CachedSGX00000RG2
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
  public class CachedSGX00000RG2 : Component, ICachedReport
  {
    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
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
      SGX00000RG2 sgX00000Rg2 = new SGX00000RG2();
      sgX00000Rg2.Site = this.Site;
      return (ReportDocument) sgX00000Rg2;
    }

    public virtual string GetCustomizedCacheKey(RequestContext request)
    {
      return (string) null;
    }
  }
}
