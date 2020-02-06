// Decompiled with JetBrains decompiler
// Type: CAID.FTX00000R2
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class FTX00000R2 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField HiddenField1;
    protected HiddenField PacienteID;
    protected HiddenField MedicoID;
    protected HiddenField TerapistaID;
    protected HiddenField EnfermeraID;
    protected HiddenField OrigenID;
    protected HiddenField txtEnfID;
    protected HiddenField xGUID;
    protected HiddenField xActividadGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnExport;
    protected HtmlButton btnShow;
    protected HtmlButton btnCancel;
    protected HtmlSelect cmbFiltroPaciente;
    protected HtmlSelect cmbTipo;
    protected HtmlInputText txtFecha1;
    protected HtmlInputText txtFecha2;
    protected Repeater rpData;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.xGUID.Value.ToString().ToUpper();
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

    private string FECHA1
    {
      get
      {
        return this.txtFecha1.Value.ToString();
      }
    }

    private string FECHA2
    {
      get
      {
        return this.txtFecha2.Value.ToString();
      }
    }

    private string RECORD
    {
      get
      {
        return this.cmbFiltroPaciente.Value.ToString().ToUpper();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlConsulta.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbFiltroPaciente.Items.Clear();
      this.cmbFiltroPaciente.Items.Add(new ListItem("-- TODOS --", "-1"));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbFiltroPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["RECORDID"].ToString()));
    }

    private void _IniciarControles()
    {
      this.cmbFiltroPaciente.Value = string.Empty;
      this.txtFecha1.Value = string.Empty;
      this.txtFecha2.Value = string.Empty;
    }

    private void _IniciarFormulario()
    {
    }

    protected void _New(object sender, EventArgs e)
    {
    }

    protected void _Clean(object sender, EventArgs e)
    {
      this.cmbFiltroPaciente.Value = string.Empty;
      this.txtFecha2.Value = string.Empty;
      this.txtFecha1.Value = string.Empty;
    }

    protected void _Export(object sender, EventArgs e)
    {
      this.rpData.DataSource = (object) DB.ExecuteAdapter(string.Format("[FTX00000R3] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@RECORD = '{3}',@USRID = '{4}'", (object) this.FECHA1, (object) this.FECHA2, (object) this.ROWSGXID, (object) this.RECORD, (object) this.ROWSGXID));
      this.rpData.DataBind();
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) this.FECHA1);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.FECHA2);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@RECORD");
      this.xQueryValues.Add((object) this.RECORD);
      this.xQueryParameters.Add((object) "@USRID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      if (Convert.ToInt32(this.cmbTipo.Value) == 1)
      {
        this.Session.Add("REPORT_URL", (object) "~/reports/FTX00000R2.rpt");
        this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX00000R2] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@RECORD = '{3}',@USRID = '{4}'", (object) this.FECHA1, (object) this.FECHA2, (object) this.ROWSGXID, (object) this.RECORD, (object) this.ROWSGXID));
        this.Response.Write("<script>");
        this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      else
      {
        this.Session.Add("REPORT_URL", (object) "~/reports/FTX00000R3.rpt");
        this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX00000R2] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@RECORD = '{3}',@USRID = '{4}'", (object) this.FECHA1, (object) this.FECHA2, (object) this.ROWSGXID, (object) this.RECORD, (object) this.ROWSGXID));
        this.Response.Write("<script>");
        this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Cancel2(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _Back2(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = false;
    }
  }
}
