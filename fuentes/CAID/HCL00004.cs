// Decompiled with JetBrains decompiler
// Type: CAID.HCL00004
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
  public class HCL00004 : Page
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
    protected HtmlSelect cmbLactancia;
    protected RequiredFieldValidator valcmbLactancia;
    protected HtmlSelect cmbEdadAblactacion;
    protected RequiredFieldValidator valcmbEdadAblactacion;
    protected HtmlSelect cmbDietaActual;
    protected RequiredFieldValidator valcmbDietaActual;
    protected HtmlSelect cmbSelectividadAlimento;
    protected RequiredFieldValidator valcmbSelectividadAlimento;
    protected HtmlSelect cmbDisfagia;
    protected RequiredFieldValidator valcmbDisfagia;
    protected HtmlSelect cmbUsoBiberon;
    protected RequiredFieldValidator valcmbUsoBiberon;
    protected TextBox txtHabitosAlimentos;
    protected TextBox txtEVALUACION;
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
      this.txtHabitosAlimentos.Text = "- Comida Rápida:" + Environment.NewLine + "- Frecuencia de Consumo de sus alimentos:" + Environment.NewLine + "- Aversiones Alimenticias:" + Environment.NewLine + "- Alimentos Preferidos:" + Environment.NewLine + "- Vegetales:" + Environment.NewLine + "- Cereales:" + Environment.NewLine + "- Tabúes Alimenticios:" + Environment.NewLine + "- Intolerancia Alimenticia:" + Environment.NewLine + "- Alergia Alimentaria:" + Environment.NewLine + "- Actividad Físico:" + Environment.NewLine + "- Juego Deportivo Favorito:" + Environment.NewLine + "- Apetito:" + Environment.NewLine + "- Recibe Algún Suplemento nutricional:" + Environment.NewLine + "- Leche que toma:" + Environment.NewLine + "- Cambio de Conducta Relacionada con Ingesta de Algún Alimento:" + Environment.NewLine + "- Personas que se Encarga de la Atención del Niño:" + Environment.NewLine + "- Persona Prepara los alimentos:" + Environment.NewLine + "- Vía de alimentación:" + Environment.NewLine + "- Conocimientos Nutricionales de la Madre:";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.cmbLactancia.Value.ToString();
      string str3 = this.cmbEdadAblactacion.Value.ToString();
      string str4 = this.cmbDietaActual.Value.ToString();
      string str5 = this.cmbSelectividadAlimento.Value.ToString();
      string str6 = this.cmbDisfagia.Value.ToString();
      string str7 = this.cmbUsoBiberon.Value.ToString();
      string str8 = this.txtHabitosAlimentos.Text.Trim();
      string str9 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str10 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str11 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00004SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) xREFGUID, (object) xTERGUID, (object) str10, (object) str11)))
      {
        ((Site_Master) this.Master)._Notify("Actualizado");
        this.Validar();
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00004V @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS7 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.cmbLactancia.Value = Convert.ToBoolean(dataTable1.Rows[0]["LACTANCIAMATERNA"].ToString()) ? "1" : "0";
      this.cmbEdadAblactacion.Value = dataTable1.Rows[0]["EDADABLACTACION"].ToString();
      this.cmbDietaActual.Value = dataTable1.Rows[0]["DIETAACTUAL"].ToString();
      this.cmbSelectividadAlimento.Value = Convert.ToBoolean(dataTable1.Rows[0]["SELECTIVAALIMENTOS"].ToString()) ? "1" : "0";
      this.cmbDisfagia.Value = Convert.ToBoolean(dataTable1.Rows[0]["DISFAGIA"].ToString()) ? "1" : "0";
      this.cmbUsoBiberon.Value = Convert.ToBoolean(dataTable1.Rows[0]["USABIBERON"].ToString()) ? "1" : "0";
      this.txtHabitosAlimentos.Text = dataTable1.Rows[0]["HABITOSALIMENTICIOS"].ToString();
      this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      this.cmbObjetivo.Disabled = true;
      this.cmbTipo.Disabled = true;
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
    }
  }
}
