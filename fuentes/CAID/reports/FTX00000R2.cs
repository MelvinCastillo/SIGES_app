// Decompiled with JetBrains decompiler
// Type: CAID.reports.FTX00000R2
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CrystalDecisions.CrystalReports.Engine;
using System.ComponentModel;

namespace CAID.reports
{
  public class FTX00000R2 : ReportClass
  {
    public override string ResourceName
    {
      get
      {
        return "FTX00000R2.rpt";
      }
      set
      {
      }
    }

    public override bool NewGenerator
    {
      get
      {
        return true;
      }
      set
      {
      }
    }

    public override string FullResourceName
    {
      get
      {
        return "CAID.reports.FTX00000R2.rpt";
      }
      set
      {
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section1
    {
      get
      {
        return this.ReportDefinition.Sections[0];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section2
    {
      get
      {
        return this.ReportDefinition.Sections[1];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section GroupHeaderSection2
    {
      get
      {
        return this.ReportDefinition.Sections[2];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section GroupHeaderSection1
    {
      get
      {
        return this.ReportDefinition.Sections[3];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section3
    {
      get
      {
        return this.ReportDefinition.Sections[4];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section GroupFooterSection1
    {
      get
      {
        return this.ReportDefinition.Sections[5];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section GroupFooterSection2
    {
      get
      {
        return this.ReportDefinition.Sections[6];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section Section4
    {
      get
      {
        return this.ReportDefinition.Sections[7];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section Section5
    {
      get
      {
        return this.ReportDefinition.Sections[8];
      }
    }
  }
}
