﻿// Decompiled with JetBrains decompiler
// Type: CAID.reports.HCL00000R10
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CrystalDecisions.CrystalReports.Engine;
using System.ComponentModel;

namespace CAID.reports
{
  public class HCL00000R10 : ReportClass
  {
    public override string ResourceName
    {
      get
      {
        return "HCL00000R10.rpt";
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
        return "CAID.reports.HCL00000R10.rpt";
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

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section GroupHeaderSection1
    {
      get
      {
        return this.ReportDefinition.Sections[2];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section GroupHeaderSection3
    {
      get
      {
        return this.ReportDefinition.Sections[3];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section GroupHeaderSection2
    {
      get
      {
        return this.ReportDefinition.Sections[4];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section Section3
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
    public Section GroupFooterSection3
    {
      get
      {
        return this.ReportDefinition.Sections[7];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section GroupFooterSection1
    {
      get
      {
        return this.ReportDefinition.Sections[8];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section4
    {
      get
      {
        return this.ReportDefinition.Sections[9];
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public Section Section5
    {
      get
      {
        return this.ReportDefinition.Sections[10];
      }
    }
  }
}
