// Decompiled with JetBrains decompiler
// Type: CAID.FTX10100
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
  public class FTX10100 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected HiddenField xCAJAGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnShow;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnActualizar;
    protected HtmlButton btnBack;
    protected Label txtCajaN;
    protected HtmlInputText txtEF;
    protected RequiredFieldValidator valtxtEF;
    protected HtmlInputText txtTC;
    protected RequiredFieldValidator valtxtTC;
    protected HtmlInputText txtTD;
    protected RequiredFieldValidator valtxtTD;
    protected HtmlInputText txtCK;
    protected RequiredFieldValidator VALtxtCK;
    protected HtmlInputText txtTR;
    protected RequiredFieldValidator VALtxtTR;
    protected HtmlInputText txtDepositos;
    protected RequiredFieldValidator valtxtDepositos;
    protected HtmlInputText txtEgresos;
    protected RequiredFieldValidator valtxtEgresos;
    protected Repeater rpMonedas;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string CAJAGUID
    {
      get
      {
        return this.xCAJAGUID.Value.ToString();
      }
    }

    private double EF
    {
      get
      {
        return Convert.ToDouble(this.txtEF.Value.ToString().Trim().ToUpper());
      }
    }

    private double CK
    {
      get
      {
        return Convert.ToDouble(this.txtCK.Value.ToString().Trim().ToUpper());
      }
    }

    private double TR
    {
      get
      {
        return Convert.ToDouble(this.txtTR.Value.ToString().Trim().ToUpper());
      }
    }

    private double TC
    {
      get
      {
        return Convert.ToDouble(this.txtTC.Value.ToString().Trim().ToUpper());
      }
    }

    private double TD
    {
      get
      {
        return Convert.ToDouble(this.txtTD.Value.ToString().Trim().ToUpper());
      }
    }

    private double DEPOSITOS
    {
      get
      {
        return Convert.ToDouble(this.txtDepositos.Value.ToString().Trim().ToUpper());
      }
    }

    private double EGRESOS
    {
      get
      {
        return Convert.ToDouble(this.txtEgresos.Value.ToString().Trim().ToUpper());
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

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnNew.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
      this.txtEF.Disabled = true;
    }

    private void _Iniciar()
    {
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.rpData.DataSource = (object) null;
        this.rpData.DataBind();
        this._IniciarControles();
      }
      else
      {
        this.xGUID.Value = str;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = this.xBase + "S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        if ((dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null) == null)
          return;
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this._Show((object) null, (EventArgs) null);
    }

    private void _IniciarFormulario()
    {
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this._IniciarControles();
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this._Show((object) null, (EventArgs) null);
    }

    protected void _New(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@USRID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S3";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "Print")
        {
          this.Session.Add("REPORT_URL", (object) "~/reports/FTX10100R1.rpt");
          this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX10100R1] @CAJAGUID = '{0}'", (object) this.xGUID.Value));
          this.Response.Write("<script>");
          this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
          this.Response.Write("</script>");
        }
        if (!(this.xCommand == "Close"))
          return;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@USRID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("FTX10100S2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        {
          this.txtCajaN.Text = row["CAJANUMERO"].ToString();
          HtmlInputText txtEf1 = this.txtEF;
          Decimal num = Convert.ToDecimal(row["EF"].ToString());
          string str1 = num.ToString();
          txtEf1.Value = str1;
          HtmlInputText txtCk = this.txtCK;
          num = Convert.ToDecimal(row["CK"].ToString());
          string str2 = num.ToString();
          txtCk.Value = str2;
          HtmlInputText txtTd = this.txtTD;
          num = Convert.ToDecimal(row["TD"].ToString());
          string str3 = num.ToString();
          txtTd.Value = str3;
          HtmlInputText txtTc = this.txtTC;
          num = Convert.ToDecimal(row["TC"].ToString());
          string str4 = num.ToString();
          txtTc.Value = str4;
          HtmlInputText txtTr = this.txtTR;
          num = Convert.ToDecimal(row["TR"].ToString());
          string str5 = num.ToString();
          txtTr.Value = str5;
          HtmlInputText txtDepositos = this.txtDepositos;
          num = Convert.ToDecimal(row["DEPOSITOS"].ToString());
          string str6 = num.ToString();
          txtDepositos.Value = str6;
          HtmlInputText txtEgresos = this.txtEgresos;
          num = Convert.ToDecimal(row["EGRESOS"].ToString());
          string str7 = num.ToString();
          txtEgresos.Value = str7;
          this.xCAJAGUID.Value = row["ROWGUID"].ToString();
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@CAJAGUID");
          this.xQueryValues.Add((object) this.xCAJAGUID.Value.ToString());
          DataTable dataTable = DB.ExecuteAdapter("FTX10101S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
          this.rpMonedas.DataSource = (object) dataTable;
          this.rpMonedas.DataBind();
          HtmlInputText txtEf2 = this.txtEF;
          num = Convert.ToDecimal(dataTable.Rows[0]["EFECTIVO"].ToString());
          string str8 = num.ToString("#,#.00#;(#,#.00#)");
          txtEf2.Value = str8;
        }
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
      catch
      {
      }
    }

    protected void _SaveClose(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.CAJAGUID);
      this.xQueryParameters.Add((object) "@EF");
      this.xQueryValues.Add((object) this.EF);
      this.xQueryParameters.Add((object) "@CK");
      this.xQueryValues.Add((object) this.CK);
      this.xQueryParameters.Add((object) "@TD");
      this.xQueryValues.Add((object) this.TD);
      this.xQueryParameters.Add((object) "@TC");
      this.xQueryValues.Add((object) this.TC);
      this.xQueryParameters.Add((object) "@TR");
      this.xQueryValues.Add((object) this.TR);
      this.xQueryParameters.Add((object) "@DEPOSITOS");
      this.xQueryValues.Add((object) this.DEPOSITOS);
      this.xQueryParameters.Add((object) "@EGRESOS");
      this.xQueryValues.Add((object) this.EGRESOS);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "FTX10104SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._SaveMonedas();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "P1";
      if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
      {
        this.Session.Add("REPORT_URL", (object) "~/reports/FTX10100R1.rpt");
        this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[FTX10100R1] @CAJAGUID = '{0}'", (object) this.CAJAGUID));
        this.Response.Write("<script>");
        this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
        this._IniciarFormulario();
      }
    }

    protected void _SaveOpen(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.CAJAGUID);
      this.xQueryParameters.Add((object) "@EF");
      this.xQueryValues.Add((object) this.EF);
      this.xQueryParameters.Add((object) "@CK");
      this.xQueryValues.Add((object) this.CK);
      this.xQueryParameters.Add((object) "@TD");
      this.xQueryValues.Add((object) this.TD);
      this.xQueryParameters.Add((object) "@TC");
      this.xQueryValues.Add((object) this.TC);
      this.xQueryParameters.Add((object) "@TR");
      this.xQueryValues.Add((object) this.TR);
      this.xQueryParameters.Add((object) "@DEPOSITOS");
      this.xQueryValues.Add((object) this.DEPOSITOS);
      this.xQueryParameters.Add((object) "@EGRESOS");
      this.xQueryValues.Add((object) this.EGRESOS);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "FTX10104SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._SaveMonedas();
    }

    private void _SaveMonedas()
    {
      string empty = string.Empty;
      foreach (Control control1 in this.rpMonedas.Items)
      {
        TextBox control2 = (TextBox) control1.FindControl("txtMonedaCant");
        string str = control2.ToolTip.ToString();
        int num;
        try
        {
          num = Convert.ToInt32(control2.Text.Trim());
        }
        catch
        {
          num = 0;
        }
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@CANT");
        this.xQueryValues.Add((object) num);
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) str);
        if (!DB.ExecuteNonQuery("FTX10101SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          ;
      }
      DataTable dataTable1 = new DataTable();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CAJAGUID");
      this.xQueryValues.Add((object) this.xCAJAGUID.Value.ToString());
      DataTable dataTable2 = DB.ExecuteAdapter("FTX10101S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpMonedas.DataSource = (object) dataTable2;
      this.rpMonedas.DataBind();
      this.txtEF.Value = Convert.ToDecimal(dataTable2.Rows[0]["EFECTIVO"].ToString()).ToString("#,#.00#;(#,#.00#)");
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this._IniciarControles();
    }
  }
}
