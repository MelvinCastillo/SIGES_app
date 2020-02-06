// Decompiled with JetBrains decompiler
// Type: CAID.HCL00006
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
  public class HCL00006 : Page
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
    protected HtmlSelect cmbCirugias;
    protected HtmlInputText txtCCIRUGIAS;
    protected HtmlSelect cmbAlergias;
    protected HtmlInputText txtCALERGIAS;
    protected CheckBoxList ckEnfeCronicas;
    protected HtmlInputText txtOtrosEnfeCronicas;
    protected HtmlSelect cmbMedicamentoActual;
    protected HtmlInputText txtOtrosMedicamentoActual;
    protected TextBox txtAntecedentesNutricion;
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
      this.ckEnfeCronicas.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vAP_ENFECRONICAS ORDER BY ORDEN").Rows)
        this.ckEnfeCronicas.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.txtAntecedentesNutricion.Text = "a)  Recibe Algún Tratamiento :" + Environment.NewLine + "b) Trastornos Gastrointestinales :" + Environment.NewLine + "c) Enfermedad por Reflujo Gastroesofágico :" + Environment.NewLine + "d) Alguna Dificultad para Tragar :" + Environment.NewLine + "e) Existe algún Tipo de Malnutrición en la Familia :";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckEnfeCronicas.Items.Count; ++index)
      {
        if (this.ckEnfeCronicas.Items[index].Selected)
          str1 = str1 + "," + this.ckEnfeCronicas.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = this.cmbObjetivo.Value.ToString();
      string str3 = this.cmbCirugias.Value.ToString();
      string str4 = this.txtCCIRUGIAS.Value.Trim();
      string str5 = this.cmbAlergias.Value.ToString();
      string str6 = this.txtCALERGIAS.Value.Trim();
      string str7 = this.txtOtrosEnfeCronicas.Value.Trim();
      string str8 = this.cmbMedicamentoActual.Value.ToString();
      string str9 = this.txtOtrosMedicamentoActual.Value.Trim();
      string str10 = this.txtAntecedentesNutricion.Text.Trim();
      string str11 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str12 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str13 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00006SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}'", (object) str2, (object) str3, (object) str5, (object) str1, (object) str7, (object) str8, (object) str9, (object) str10, (object) str11, (object) xREFGUID, (object) xTERGUID, (object) str12, (object) str13, (object) str4, (object) str6)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00006V @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS7 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      char[] chArray = new char[2]{ ',', '.' };
      string[] strArray = dataTable1.Rows[0]["ENFECRONICAS"].ToString().Split(chArray);
      if (strArray[0] != "")
      {
        foreach (string str in strArray)
          this.ckEnfeCronicas.Items.FindByValue(str).Selected = true;
      }
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.cmbCirugias.Value = dataTable1.Rows[0]["CIRUGIAS"].ToString();
      this.cmbAlergias.Value = dataTable1.Rows[0]["ALERGIAS"].ToString();
      this.cmbMedicamentoActual.Value = dataTable1.Rows[0]["MEDIUTILIZADOS"].ToString();
      this.txtOtrosEnfeCronicas.Value = dataTable1.Rows[0]["OTROSENFE"].ToString();
      this.txtOtrosMedicamentoActual.Value = dataTable1.Rows[0]["OTROSMEDI"].ToString();
      this.txtCCIRUGIAS.Value = dataTable1.Rows[0]["CCIRUGIAS"].ToString();
      this.txtCALERGIAS.Value = dataTable1.Rows[0]["CALERGIAS"].ToString();
      this.txtAntecedentesNutricion.Text = dataTable1.Rows[0]["ANTECEDENTESNUTRICION"].ToString();
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
