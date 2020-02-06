// Decompiled with JetBrains decompiler
// Type: CAID.HCL00026
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
  public class HCL00026 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbObjetivo;
    protected RequiredFieldValidator cmbObjetivo1;
    protected Repeater rpArticulaciones;
    protected HtmlButton btnSave;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS4 @REFGUID = '{0}', @ROWSGXID = '{1}', @ESPGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbTipo.Value.ToString())).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (this.cmbObjetivo.Items.Count == 2)
        this.cmbObjetivo.SelectedIndex = 1;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string empty3 = string.Empty;
      string empty4 = string.Empty;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str2 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str3 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      foreach (RepeaterItem repeaterItem in this.rpArticulaciones.Items)
      {
        TextBox control1 = (TextBox) repeaterItem.FindControl("txtIZQ");
        TextBox control2 = (TextBox) repeaterItem.FindControl("txtDER");
        DropDownList control3 = (DropDownList) repeaterItem.FindControl("cmbIZQ");
        DropDownList control4 = (DropDownList) repeaterItem.FindControl("cmbDER");
        string str4 = control1.ValidationGroup.ToString();
        string str5 = control1.ToolTip.ToString();
        int num1;
        try
        {
          num1 = Convert.ToInt32(control2.Text.Trim());
        }
        catch
        {
          num1 = 0;
        }
        int num2;
        try
        {
          num2 = Convert.ToInt32(control1.Text.Trim());
        }
        catch
        {
          num2 = 0;
        }
        string str6 = control4.SelectedValue.ToString();
        string str7 = control3.SelectedValue.ToString();
        if (!DB.ExecuteNonQuery(string.Format("[HCL00026SI] '{0}','{1}','{2}',{3},'{4}',{5},'{6}','{7}','{8}','{9}', '{10}'", (object) str1, (object) str5, (object) str4, (object) num1, (object) str6, (object) num2, (object) str7, (object) xREFGUID, (object) xTERGUID, (object) str2, (object) str3)))
          ;
      }
      ((Site_Master) this.Master)._Notify("Registro Guardado");
      this.Validar();
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.Session["CurrentPAX_ROWGUID"].ToString();
      string str3 = this.Session["CurrentUSR_TERID"].ToString();
      this.cmbTipo.Value.ToString();
      string str4 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str5 = this.Session["CURRENTUSR_SGXID"].ToString();
      this.rpArticulaciones.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00026S1 @OBJGUID = '{0}', @REFGUID = '{1}', @TERGUID = '{2}', @ROWUSERID = '{3}', @ROWSGXID = '{4}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5));
      this.rpArticulaciones.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
      foreach (RepeaterItem repeaterItem in this.rpArticulaciones.Items)
      {
        DropDownList control1 = (DropDownList) repeaterItem.FindControl("cmbIZQ");
        DropDownList control2 = (DropDownList) repeaterItem.FindControl("cmbDER");
        control1.SelectedValue = control1.ValidationGroup.ToString();
        control2.SelectedValue = control2.ValidationGroup.ToString();
      }
    }
  }
}
