// Decompiled with JetBrains decompiler
// Type: CAID.HCL00019
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
  public class HCL00019 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlButton btnIMC;
    protected HtmlButton btnEST;
    protected HtmlButton btnPESO;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbObjetivo;
    protected RequiredFieldValidator cmbObjetivo1;
    protected HtmlInputText txtIMC;
    protected Literal litIMC;
    protected HtmlSelect cmbTalla;
    protected RequiredFieldValidator valcmbTalla;
    protected HtmlInputText txtMedidaTalla;
    protected HtmlSelect cmbPeso;
    protected RequiredFieldValidator valcmbPeso;
    protected HtmlInputText txtMedidaPeso;
    protected HtmlInputText txtLT;
    protected HtmlInputText txtPerimetroCefalico;
    protected HtmlInputText txtPliegueTricipal;
    protected HtmlInputText txtCircunferenciaBrazo;
    protected HtmlInputText txtCintura;
    protected TextBox txtEVALUACION;
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
      Decimal num1 = new Decimal(0);
      Decimal num2 = new Decimal(0);
      Decimal num3 = new Decimal(0);
      Decimal num4 = new Decimal(0);
      Decimal num5 = new Decimal(0);
      Decimal num6 = new Decimal(0);
      int selectedIndex = this.cmbTalla.SelectedIndex;
      if (selectedIndex.Equals(1))
      {
        num4 = Convert.ToDecimal(this.txtMedidaTalla.Value);
        num5 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(0.0328084);
        num6 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(0.01);
      }
      selectedIndex = this.cmbTalla.SelectedIndex;
      if (selectedIndex.Equals(2))
      {
        num4 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(30.48);
        num5 = Convert.ToDecimal(this.txtMedidaTalla.Value);
        num6 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(0.3048);
      }
      selectedIndex = this.cmbTalla.SelectedIndex;
      if (selectedIndex.Equals(3))
      {
        num4 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(100);
        num5 = Convert.ToDecimal(this.txtMedidaTalla.Value) * Convert.ToDecimal(3.28084);
        num6 = Convert.ToDecimal(this.txtMedidaTalla.Value);
      }
      selectedIndex = this.cmbPeso.SelectedIndex;
      if (selectedIndex.Equals(1))
      {
        num1 = Convert.ToDecimal(this.txtMedidaPeso.Value);
        num2 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(16);
        num3 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(0.453592);
      }
      selectedIndex = this.cmbPeso.SelectedIndex;
      if (selectedIndex.Equals(2))
      {
        num1 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(1.0 / 16.0);
        num2 = Convert.ToDecimal(this.txtMedidaPeso.Value);
        num3 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(0.0283495);
      }
      selectedIndex = this.cmbPeso.SelectedIndex;
      if (selectedIndex.Equals(3))
      {
        num1 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(2.20462);
        num2 = Convert.ToDecimal(this.txtMedidaPeso.Value) * Convert.ToDecimal(35.274);
        num3 = Convert.ToDecimal(this.txtMedidaPeso.Value);
      }
      string str1 = this.cmbObjetivo.Value.ToString();
      Decimal num7 = new Decimal(0);
      Decimal num8 = new Decimal(0);
      Decimal num9;
      try
      {
        num9 = Convert.ToDecimal(this.txtLT.Value);
      }
      catch
      {
        num9 = new Decimal(0);
      }
      Decimal num10 = new Decimal(0);
      Decimal num11;
      try
      {
        num11 = Convert.ToDecimal(this.txtPerimetroCefalico.Value);
      }
      catch
      {
        num11 = new Decimal(0);
      }
      Decimal num12 = new Decimal(0);
      Decimal num13;
      try
      {
        num13 = Convert.ToDecimal(this.txtPliegueTricipal.Value);
      }
      catch
      {
        num13 = new Decimal(0);
      }
      Decimal num14 = new Decimal(0);
      Decimal num15;
      try
      {
        num15 = Convert.ToDecimal(this.txtCircunferenciaBrazo.Value);
      }
      catch
      {
        num15 = new Decimal(0);
      }
      Decimal num16 = new Decimal(0);
      Decimal num17;
      try
      {
        num17 = Convert.ToDecimal(this.txtCintura.Value);
      }
      catch
      {
        num17 = new Decimal(0);
      }
      string str2 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00019SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}'", (object) str1, (object) num7, (object) num1, (object) num2, (object) num3, (object) num4, (object) num5, (object) num6, (object) num9, (object) num11, (object) num13, (object) num15, (object) num17, (object) str2, (object) xREFGUID, (object) xTERGUID, (object) str3, (object) str4)))
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
      this.litIMC.Text = string.Empty;
      this.txtIMC.Value = string.Empty;
      this.txtMedidaTalla.Value = string.Empty;
      this.txtMedidaTalla.Value = string.Empty;
      this.cmbPeso.SelectedIndex = 3;
      this.cmbTalla.SelectedIndex = 1;
      this.txtLT.Value = string.Empty;
      this.txtPerimetroCefalico.Value = string.Empty;
      this.txtPliegueTricipal.Value = string.Empty;
      this.txtCircunferenciaBrazo.Value = string.Empty;
      this.txtCintura.Value = string.Empty;
      this.rpHistorico.DataSource = (object) null;
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00019H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      if (dataTable1.Rows.Count != 0)
      {
        this.litIMC.Text = dataTable1.Rows[0]["MODAL_IMC"].ToString();
        this.rpHistorico.DataSource = (object) dataTable1;
        this.txtIMC.Value = dataTable1.Rows[0]["IMC"].ToString();
        this.txtMedidaTalla.Value = dataTable1.Rows[0]["TALLA1"].ToString();
        this.txtMedidaPeso.Value = dataTable1.Rows[0]["PESO3"].ToString();
        this.txtLT.Value = dataTable1.Rows[0]["LT"].ToString();
        this.txtPerimetroCefalico.Value = dataTable1.Rows[0]["PERIMETROCEFALICO"].ToString();
        this.txtPliegueTricipal.Value = dataTable1.Rows[0]["PLIEGUETRICIPAL"].ToString();
        this.txtCircunferenciaBrazo.Value = dataTable1.Rows[0]["CIRCUNFERENCIABRAZO"].ToString();
        this.txtCintura.Value = dataTable1.Rows[0]["CINTURA"].ToString();
      }
      this.rpHistorico.DataBind();
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }

    protected void _ViewIMC(object sender, EventArgs e)
    {
      DataTable dataTable = DB.ExecuteAdapter(string.Format("[PAX00000S2] @GUID = '{0}', @ROWSGXID = '{1}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CURRENTUSR_SGXID"].ToString()));
      if (dataTable.Rows.Count == 0)
        return;
      if (dataTable.Rows[0]["SEXOID"].Equals((object) "M"))
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-imc-ninos.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      else
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-imc-ninas.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
    }

    protected void _ViewEST(object sender, EventArgs e)
    {
      DataTable dataTable = DB.ExecuteAdapter(string.Format("[PAX00000S2] @GUID = '{0}', @ROWSGXID = '{1}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CURRENTUSR_SGXID"].ToString()));
      if (dataTable.Rows.Count == 0)
        return;
      if (dataTable.Rows[0]["SEXOID"].Equals((object) "M"))
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-estatura-ninos.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      else
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-estatura-ninas.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
    }

    protected void _ViewPESO(object sender, EventArgs e)
    {
      DataTable dataTable = DB.ExecuteAdapter(string.Format("[PAX00000S2] @GUID = '{0}', @ROWSGXID = '{1}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CURRENTUSR_SGXID"].ToString()));
      if (dataTable.Rows.Count == 0)
        return;
      if (dataTable.Rows[0]["SEXOID"].Equals((object) "M"))
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-peso-ninos.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      else
      {
        this.Response.Write("<script>");
        this.Response.Write("window.open('fichas/HCL00019-peso-ninas.gif','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
    }
  }
}
