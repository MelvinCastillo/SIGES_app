// Decompiled with JetBrains decompiler
// Type: CAID.HCL00000R1
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00000R1 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected Repeater CE_ING;
    protected Repeater CE_MOTCONS;
    protected Repeater CE_HEN;
    protected Repeater CE_ANTPERI;
    protected Repeater CE_ALI;
    protected Repeater _INM;
    protected Repeater CE_ANTEPERS;
    protected Repeater CE_ANTEFAM;
    protected Repeater CE_DESPSICO;
    protected Repeater CE_NOTASEVD;
    protected Repeater CE_EVAINIED;
    protected Repeater CE_EVAODO;
    protected Repeater CE_EXF;
    protected Repeater CE_FUNVITALES;
    protected Repeater CE_PLANMED;
    protected Repeater CE_TRX;
    protected Repeater CE_LAB;
    protected Repeater CE_EAX;
    protected Repeater CE_DXS;
    protected Repeater CE_MEDANTRO;
    protected Repeater CE_EVO;
    protected Repeater CE_TER;
    protected Repeater CE_EVAINITC;
    protected Repeater CE_PROTOSEGUI;
    protected Repeater CE_DESLENG;
    protected Repeater CE_EVATERCOM;
    protected Repeater CE_EVASEG;
    protected Repeater CE_BALARTIMUSCU;
    protected Repeater CE_ESCASHWHORT;
    protected Repeater CE_HOJADATA;
    protected Repeater CE_INTERTERA;
    protected Repeater CE_INTERTEROCU;
    protected Repeater CE_EVOTEROCU;
    protected Repeater CE_DIG;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string ROWUSERID
    {
      get
      {
        return this.Session["CURRENTUSR_ID"].ToString();
      }
    }

    private string ROWSGXID
    {
      get
      {
        return this.Session["CURRENTUSR_SGXID"].ToString();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      this.Session["CurrentUSR_ROWGUID"].ToString();
      string str1 = this.Session["CurrentPAX_ROWGUID"].ToString();
      string str2 = this.Session["CurrentUSR_TERID"].ToString();
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
      this.CE_ING.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ING'", (object) str1, (object) str2));
      this.CE_ING.DataBind();
      this.CE_MOTCONS.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_MOTCONS'", (object) str1, (object) str2));
      this.CE_MOTCONS.DataBind();
      this.CE_ANTPERI.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ANTPERI'", (object) str1, (object) str2));
      this.CE_ANTPERI.DataBind();
      this.CE_HEN.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_HEN'", (object) str1, (object) str2));
      this.CE_HEN.DataBind();
      this.CE_ALI.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ALI'", (object) str1, (object) str2));
      this.CE_ALI.DataBind();
      this.CE_EXF.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EXF'", (object) str1, (object) str2));
      this.CE_EXF.DataBind();
      this.CE_FUNVITALES.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_FUNVITALES'", (object) str1, (object) str2));
      this.CE_FUNVITALES.DataBind();
      this.CE_DXS.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_DXS'", (object) str1, (object) str2));
      this.CE_DXS.DataBind();
      this.CE_TRX.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_TRX'", (object) str1, (object) str2));
      this.CE_TRX.DataBind();
      this.CE_LAB.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_LAB'", (object) str1, (object) str2));
      this.CE_LAB.DataBind();
      this.CE_EAX.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EAX'", (object) str1, (object) str2));
      this.CE_EAX.DataBind();
      this._INM.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = '_INM'", (object) str1, (object) str2));
      this._INM.DataBind();
      this.CE_EVO.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVO'", (object) str1, (object) str2));
      this.CE_EVO.DataBind();
      this.CE_TER.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_TER'", (object) str1, (object) str2));
      this.CE_TER.DataBind();
      this.CE_DIG.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_DIG'", (object) str1, (object) str2));
      this.CE_DIG.DataBind();
      this.CE_ANTEPERS.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ANTEPERS'", (object) str1, (object) str2));
      this.CE_ANTEPERS.DataBind();
      this.CE_ANTEFAM.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ANTEFAM'", (object) str1, (object) str2));
      this.CE_ANTEFAM.DataBind();
      this.CE_DESPSICO.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_DESPSICO'", (object) str1, (object) str2));
      this.CE_DESPSICO.DataBind();
      this.CE_MEDANTRO.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_MEDANTRO'", (object) str1, (object) str2));
      this.CE_MEDANTRO.DataBind();
      this.CE_PLANMED.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_PLANMED'", (object) str1, (object) str2));
      this.CE_PLANMED.DataBind();
      this.CE_PROTOSEGUI.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_PROTOSEGUI'", (object) str1, (object) str2));
      this.CE_PROTOSEGUI.DataBind();
      this.CE_DESLENG.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_DESLENG'", (object) str1, (object) str2));
      this.CE_DESLENG.DataBind();
      this.CE_EVASEG.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVASEG'", (object) str1, (object) str2));
      this.CE_EVASEG.DataBind();
      this.CE_BALARTIMUSCU.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_BALARTIMUSCU'", (object) str1, (object) str2));
      this.CE_BALARTIMUSCU.DataBind();
      this.CE_INTERTERA.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_INTERTERA'", (object) str1, (object) str2));
      this.CE_INTERTERA.DataBind();
      this.CE_EVOTEROCU.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVOTEROCU'", (object) str1, (object) str2));
      this.CE_EVOTEROCU.DataBind();
      this.CE_ESCASHWHORT.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_ESCASHWHORT'", (object) str1, (object) str2));
      this.CE_ESCASHWHORT.DataBind();
      this.CE_INTERTEROCU.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_INTERTEROCU'", (object) str1, (object) str2));
      this.CE_INTERTEROCU.DataBind();
      this.CE_EVAINIED.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVAINIED'", (object) str1, (object) str2));
      this.CE_EVAINIED.DataBind();
      this.CE_EVAODO.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVAODO'", (object) str1, (object) str2));
      this.CE_EVAODO.DataBind();
      this.CE_EVATERCOM.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVATERCOM'", (object) str1, (object) str2));
      this.CE_EVATERCOM.DataBind();
      this.CE_HOJADATA.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_HOJADATA'", (object) str1, (object) str2));
      this.CE_HOJADATA.DataBind();
      this.CE_EVAINITC.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_EVAINITC'", (object) str1, (object) str2));
      this.CE_EVAINITC.DataBind();
      this.CE_NOTASEVD.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_NOTASEVD'", (object) str1, (object) str2));
      this.CE_NOTASEVD.DataBind();
    }

    protected void _Select(object sender, EventArgs e)
    {
      string str1 = ((LinkButton) sender).CommandName.ToString();
      string str2 = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (str1 == "View")
          this.Response.Write("<script>window.open('" + str2 + "','_blank');</script>");
      }
      catch
      {
      }
      try
      {
        if (str1 == "Print_Resumen")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/HCL00000R10.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00000R10 @GUID = '{0}',\t@ROWSGXID = '{1}',\t@USRID = '{2}'", (object) str2, (object) this.ROWSGXID, (object) this.ROWUSERID));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
      }
      catch
      {
      }
      try
      {
        if (str1 == "PrintBAM")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/HCL00026R1.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00026R1 @ACTO = '{0}',\t@ROWSGXID = '{1}',\t@ROWUSERID = '{2}'", (object) str2, (object) this.ROWSGXID, (object) this.ROWUSERID));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
      }
      catch
      {
      }
      try
      {
        if (str1 == "PrintIT")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/HCL00036R2.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00036R2 @ACTO = '{0}',\t@ROWSGXID = '{1}',\t@ROWUSERID = '{2}'", (object) str2, (object) this.ROWSGXID, (object) this.ROWUSERID));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
      }
      catch
      {
      }
      try
      {
        if (str1 == "PrintHojaData")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/HCL00039R2.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00039R2 @ACTO = '{0}',\t@ROWSGXID = '{1}',\t@ROWUSERID = '{2}'", (object) str2, (object) this.ROWSGXID, (object) this.ROWUSERID));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
      }
      catch
      {
      }
      try
      {
        if (!(str1 == "PrintETO"))
          return;
        this.Session.Add("REPORT_URL", (object) "~/reports/HCL00027R2.rpt");
        this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00027R2 @ACTO = '{0}',\t@ROWSGXID = '{1}',\t@ROWUSERID = '{2}'", (object) str2, (object) this.ROWSGXID, (object) this.ROWUSERID));
        this.Response.Write("<script>");
        this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      catch
      {
      }
    }
  }
}
