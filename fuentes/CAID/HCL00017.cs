// Decompiled with JetBrains decompiler
// Type: CAID.HCL00017
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
  public class HCL00017 : Page
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
    protected HtmlInputText txtIMC;
    protected HtmlInputText txtTalla1;
    protected HtmlInputText txtTalla2;
    protected HtmlInputText txtPeso1;
    protected HtmlInputText txtPeso2;
    protected HtmlInputText txtFC;
    protected HtmlInputText txtTA1;
    protected HtmlInputText txtTA2;
    protected HtmlInputText txtFR;
    protected HtmlInputText txtTem;
    protected HtmlButton btnSave;
    protected Repeater rpHistorico;

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
      Decimal num1 = new Decimal(0);
      Decimal num2 = new Decimal(0);
      Decimal num3;
      try
      {
        num3 = Convert.ToDecimal(this.txtTA1.Value);
      }
      catch
      {
        num3 = new Decimal(0);
      }
      Decimal num4 = new Decimal(0);
      Decimal num5;
      try
      {
        num5 = Convert.ToDecimal(this.txtTA2.Value);
      }
      catch
      {
        num5 = new Decimal(0);
      }
      Decimal num6 = new Decimal(0);
      Decimal num7;
      try
      {
        num7 = Convert.ToDecimal(this.txtFC.Value);
      }
      catch
      {
        num7 = new Decimal(0);
      }
      Decimal num8 = new Decimal(0);
      Decimal num9;
      try
      {
        num9 = Convert.ToDecimal(this.txtFR.Value);
      }
      catch
      {
        num9 = new Decimal(0);
      }
      Decimal num10 = new Decimal(0);
      Decimal num11;
      try
      {
        num11 = Convert.ToDecimal(this.txtTem.Value);
      }
      catch
      {
        num11 = new Decimal(0);
      }
      Decimal num12 = new Decimal(0);
      Decimal num13;
      try
      {
        num13 = Convert.ToDecimal(this.txtPeso1.Value);
      }
      catch
      {
        num13 = new Decimal(0);
      }
      Decimal num14 = new Decimal(0);
      Decimal num15;
      try
      {
        num15 = Convert.ToDecimal(this.txtPeso2.Value);
      }
      catch
      {
        num15 = new Decimal(0);
      }
      Decimal num16 = new Decimal(0);
      Decimal num17;
      try
      {
        num17 = Convert.ToDecimal(this.txtTalla1.Value);
      }
      catch
      {
        num17 = new Decimal(0);
      }
      Decimal num18 = new Decimal(0);
      Decimal num19;
      try
      {
        num19 = Convert.ToDecimal(this.txtTalla2.Value);
      }
      catch
      {
        num19 = new Decimal(0);
      }
      string empty = string.Empty;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str2 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str3 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00017SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}'", (object) str1, (object) num1, (object) num3, (object) num5, (object) num7, (object) num9, (object) num11, (object) num13, (object) num15, (object) num17, (object) num19, (object) empty, (object) xREFGUID, (object) xTERGUID, (object) str2, (object) str3)))
      {
        ((Site_Master) this.Master)._Notify("Registro Guardado");
        this.Validar();
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      this.txtFC.Value = string.Empty;
      this.txtFR.Value = string.Empty;
      this.txtIMC.Value = string.Empty;
      this.txtPeso1.Value = string.Empty;
      this.txtPeso2.Value = string.Empty;
      this.txtTA1.Value = string.Empty;
      this.txtTA2.Value = string.Empty;
      this.txtTalla1.Value = string.Empty;
      this.txtTalla2.Value = string.Empty;
      this.txtTem.Value = string.Empty;
      this.rpHistorico.DataSource = (object) null;
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00017H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      if (dataTable1.Rows.Count != 0)
      {
        this.rpHistorico.DataSource = (object) dataTable1;
        this.txtIMC.Value = dataTable1.Rows[0]["IMC"].ToString();
      }
      this.rpHistorico.DataBind();
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
