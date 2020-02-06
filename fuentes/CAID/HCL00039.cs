// Decompiled with JetBrains decompiler
// Type: CAID.HCL00039
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00039 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    private DataTable dtConsultaDatos;
    protected HiddenField xGUID;
    protected HiddenField xActoGuid;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlButton btnPrint;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected Repeater rpIntervencion;
    protected HtmlButton btnSave;
    protected DropDownList cmbObjetivo2;
    protected Repeater rpHistorico;

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

    private string ACTOGUID
    {
      get
      {
        return this.xActoGuid.Value.ToString().ToUpper();
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
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
      this.cmbTipo.Items.Clear();
      this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
      this.cmbObjetivo2.Items.Clear();
      this.cmbObjetivo2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300S5 @REFGUID = '{0}', @ROWSGXID = '{1}', @ESPGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbTipo.Value.ToString())).Rows)
        this.cmbObjetivo2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string empty3 = string.Empty;
      string empty4 = string.Empty;
      string empty5 = string.Empty;
      string empty6 = string.Empty;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str1 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str2 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      foreach (RepeaterItem repeaterItem in this.rpIntervencion.Items)
      {
        int num1 = 0;
        TextBox control1 = (TextBox) repeaterItem.FindControl("txtPorcentaje");
        Label control2 = (Label) repeaterItem.FindControl("txtTareas");
        Label control3 = (Label) repeaterItem.FindControl("txtCriterioAnterior");
        DropDownList control4 = (DropDownList) repeaterItem.FindControl("cmbEnsayo1");
        DropDownList control5 = (DropDownList) repeaterItem.FindControl("cmbEnsayo2");
        DropDownList control6 = (DropDownList) repeaterItem.FindControl("cmbEnsayo3");
        DropDownList control7 = (DropDownList) repeaterItem.FindControl("cmbCriterio");
        string str3 = control2.ToolTip.ToString();
        string str4 = control4.SelectedValue.ToString();
        string str5 = control5.SelectedValue.ToString();
        string str6 = control6.SelectedValue.ToString();
        double num2;
        try
        {
          num2 = Convert.ToDouble(control1.Text.Trim());
        }
        catch
        {
          num2 = 0.0;
        }
        if (str4 != "")
          ++num1;
        if (str5 != "")
          ++num1;
        if (str6 != "")
          ++num1;
        string str7 = control7.SelectedValue.ToString();
        if (num1 != 0 && str7 == "")
        {
          string str8 = control3.ToolTip.ToString();
          str7 = !(str8 == "n.d") ? str8 : "1";
        }
        string str9 = control1.ToolTip.ToString();
        if (!DB.ExecuteNonQuery(string.Format("[HCL00039SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}'", (object) str3, (object) str4, (object) str5, (object) str6, (object) num2, (object) str7, (object) empty6, (object) xREFGUID, (object) xTERGUID, (object) str1, (object) str2, (object) str9, (object) num1)))
          ;
      }
      ((Site_Master) this.Master)._Notify("Registro Guardado");
      this.Validar();
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    protected void _Print(object sender, EventArgs e)
    {
      this.Session.Add("REPORT_URL", (object) "~/reports/HCL00039R2.rpt");
      this.Session.Add("REPORT_DATASOURCE", (object) string.Format("HCL00039R2 @ACTO = '{0}',\t@ROWSGXID = '{1}',\t@ROWUSERID = '{2}'", (object) this.ACTOGUID, (object) this.ROWSGXID, (object) this.ROWUSERID));
      this.Response.Write("<script>");
      this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
      this.Response.Write("</script>");
    }

    protected void _ShowH(object sender, EventArgs e)
    {
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00039H @REFGUID = '{0}', @ROWSGXID = '{1}', @OBJGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbObjetivo2.SelectedValue));
      this.rpHistorico.DataBind();
    }

    private void Validar()
    {
      string str1 = this.Session["CurrentPAX_ROWGUID"].ToString();
      string str2 = this.Session["CurrentUSR_TERID"].ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      this.dtConsultaDatos = DB.ExecuteAdapter(string.Format("HCL00039S1  @REFGUID = '{0}', @TERGUID = '{1}', @ROWUSERID = '{2}', @ROWSGXID = '{3}'", (object) str1, (object) str2, (object) str3, (object) str4));
      this.rpIntervencion.DataSource = (object) this.dtConsultaDatos;
      this.rpIntervencion.DataBind();
      if (this.dtConsultaDatos.Rows.Count != 0)
      {
        this.btnPrint.Disabled = false;
        this.xActoGuid.Value = this.dtConsultaDatos.Rows[0]["ACTGUID"].ToString();
      }
      else
        this.btnPrint.Disabled = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) str1);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@USERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      DataTable dataTable = DB.ExecuteAdapter("PAX00000X1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
      foreach (RepeaterItem repeaterItem in this.rpIntervencion.Items)
      {
        DropDownList control1 = (DropDownList) repeaterItem.FindControl("cmbEnsayo1");
        DropDownList control2 = (DropDownList) repeaterItem.FindControl("cmbEnsayo2");
        DropDownList control3 = (DropDownList) repeaterItem.FindControl("cmbEnsayo3");
        DropDownList control4 = (DropDownList) repeaterItem.FindControl("cmbCriterio");
        control1.SelectedValue = control1.ValidationGroup.ToString();
        control2.SelectedValue = control2.ValidationGroup.ToString();
        control3.SelectedValue = control3.ValidationGroup.ToString();
        control4.SelectedValue = control4.ValidationGroup.ToString();
      }
    }

    protected void rp_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add(this.Session["CurrentPAX_ROWGUID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@TAREAID");
      this.xQueryValues.Add((object) this.dtConsultaDatos.Rows[e.Item.ItemIndex]["TAREAS"].ToString());
      this.xQueryParameters.Add((object) "@TERGUID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQuery = "HCL00039S3";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count < 3 || (!(dataTable.Rows[0]["ENSAYO1"].ToString() == "+") || !(dataTable.Rows[1]["ENSAYO1"].ToString() == "+") || !(dataTable.Rows[2]["ENSAYO1"].ToString() == "+") || (!(dataTable.Rows[0]["CRITERIO"].ToString() == dataTable.Rows[1]["CRITERIO"].ToString()) || !(dataTable.Rows[0]["CRITERIO"].ToString() == dataTable.Rows[2]["CRITERIO"].ToString()))))
        return;
      CheckBox control1 = (CheckBox) e.Item.FindControl("ckTareaDominada");
      TableRow control2 = (TableRow) e.Item.FindControl("txtRow");
      Label control3 = (Label) e.Item.FindControl("txtTareas");
      control1.Checked = true;
      control3.ForeColor = Color.Black;
      control2.BackColor = Color.Pink;
      control2.ForeColor = Color.Black;
    }
  }
}
