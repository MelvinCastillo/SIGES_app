// Decompiled with JetBrains decompiler
// Type: CAID.reports.SGX00000RG2
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CrystalDecisions.CrystalReports.Engine;
using System.ComponentModel;

namespace CAID.reports
{
  public class SGX00000RG2 : ReportClass
  {
    public override string ResourceName
    {
      get
      {
        return "SGX00000RG2.rpt";
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
        return "CAID.reports.SGX00000RG2.rpt";
      }
      set
      {
      }
    }

    [Browsable(false)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
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
    public Section Section3
    {
      get
      {
        return this.ReportDefinition.Sections[2];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section4
    {
      get
      {
        return this.ReportDefinition.Sections[3];
      }
    }

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    [Browsable(false)]
    public Section Section5
    {
      get
      {
        return this.ReportDefinition.Sections[4];
      }
    }
  }
}
