// Decompiled with JetBrains decompiler
// Type: CAID.HCL00021
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
  public class HCL00021 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl H1;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected CheckBoxList ckExpresiones;
    protected HtmlInputText txtVocales;
    protected HtmlInputText txtCVocales;
    protected HtmlInputText txtSilabas;
    protected HtmlInputText txtCSilabas;
    protected HtmlInputText txtPalabras;
    protected HtmlInputText txtCPalabras;
    protected HtmlInputText txtFrases;
    protected HtmlInputText txtCFrases;
    protected HtmlInputText txtOraciones;
    protected HtmlInputText txtCOraciones;
    protected TextBox txtVoz;
    protected HtmlSelect cmbSeReconoce;
    protected HtmlSelect cmbSigueInstrucciones;
    protected HtmlSelect cmbFuncionesAuditivas;
    protected HtmlSelect cmbRespiracion;
    protected TextBox txtEVALUACION;
    protected HtmlButton btnSave;
    protected HtmlGenericControl H2;
    protected CheckBoxList ckLabios;
    protected HtmlInputText txtCLabios;
    protected CheckBoxList ckFuncionLabial;
    protected HtmlSelect cmbMandibula;
    protected HtmlInputText txtCMandibula;
    protected CheckBoxList ckDientes2;
    protected HtmlSelect cmbDientes;
    protected HtmlInputText txtOtros;
    protected HtmlSelect cmbPaladar;
    protected HtmlInputText txtCPaladar;
    protected HtmlSelect cmbVeloPaladar;
    protected HtmlInputText txtCVeloPaladar;
    protected CheckBoxList ckLengua;
    protected HtmlInputText txtCLengua;
    protected HtmlSelect cmbUvula;
    protected HtmlInputText txtCUvula;
    protected HtmlButton Button1;

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
      this.ckExpresiones.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vR_FORMASEXPRESIONES").Rows)
        this.ckExpresiones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckLabios.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vAnatomiaLabial").Rows)
        this.ckLabios.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckFuncionLabial.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vFuncionLabial ORDER BY ORDEN").Rows)
        this.ckFuncionLabial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckDientes2.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vDientes ORDER BY ORDEN").Rows)
        this.ckDientes2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckLengua.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vLengua ORDER BY ORDEN").Rows)
        this.ckLengua.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckExpresiones.Items.Count; ++index)
      {
        if (this.ckExpresiones.Items[index].Selected)
          str1 = str1 + "," + this.ckExpresiones.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckLabios.Items.Count; ++index)
      {
        if (this.ckLabios.Items[index].Selected)
          str2 = str2 + "," + this.ckLabios.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = "";
      for (int index = 0; index < this.ckFuncionLabial.Items.Count; ++index)
      {
        if (this.ckFuncionLabial.Items[index].Selected)
          str3 = str3 + "," + this.ckFuncionLabial.Items[index].Value.Trim();
      }
      if (str3 != "")
        str3 = str3.Remove(0, 1);
      string str4 = "";
      for (int index = 0; index < this.ckDientes2.Items.Count; ++index)
      {
        if (this.ckDientes2.Items[index].Selected)
          str4 = str4 + "," + this.ckDientes2.Items[index].Value.Trim();
      }
      if (str4 != "")
        str4 = str4.Remove(0, 1);
      string str5 = "";
      for (int index = 0; index < this.ckLengua.Items.Count; ++index)
      {
        if (this.ckLengua.Items[index].Selected)
          str5 = str5 + "," + this.ckLengua.Items[index].Value.Trim();
      }
      if (str5 != "")
        str5 = str5.Remove(0, 1);
      Decimal num1 = new Decimal(0);
      Decimal num2;
      try
      {
        num2 = Convert.ToDecimal(this.txtVocales.Value);
      }
      catch
      {
        num2 = new Decimal(0);
      }
      Decimal num3 = new Decimal(0);
      Decimal num4;
      try
      {
        num4 = Convert.ToDecimal(this.txtSilabas.Value);
      }
      catch
      {
        num4 = new Decimal(0);
      }
      Decimal num5 = new Decimal(0);
      Decimal num6;
      try
      {
        num6 = Convert.ToDecimal(this.txtPalabras.Value);
      }
      catch
      {
        num6 = new Decimal(0);
      }
      Decimal num7 = new Decimal(0);
      Decimal num8;
      try
      {
        num8 = Convert.ToDecimal(this.txtFrases.Value);
      }
      catch
      {
        num8 = new Decimal(0);
      }
      Decimal num9 = new Decimal(0);
      Decimal num10;
      try
      {
        num10 = Convert.ToDecimal(this.txtOraciones.Value);
      }
      catch
      {
        num10 = new Decimal(0);
      }
      string str6 = "";
      string str7 = this.txtEVALUACION.Text.Trim();
      string str8 = this.txtCVocales.Value.Trim();
      string str9 = this.txtCSilabas.Value.Trim();
      string str10 = this.txtCPalabras.Value.Trim();
      string str11 = this.txtCFrases.Value.Trim();
      string str12 = this.txtCOraciones.Value.Trim();
      string str13 = this.txtVoz.Text.Trim();
      string str14 = this.cmbSeReconoce.Value.Trim();
      string str15 = this.cmbSigueInstrucciones.Value.Trim();
      string str16 = this.cmbFuncionesAuditivas.Value.Trim();
      string str17 = this.cmbRespiracion.Value.Trim();
      string str18 = this.cmbMandibula.Value.Trim();
      string str19 = this.cmbDientes.Value.Trim();
      string str20 = this.txtOtros.Value.Trim();
      string str21 = this.cmbPaladar.Value.Trim();
      string str22 = this.cmbVeloPaladar.Value.Trim();
      string str23 = this.cmbUvula.Value.Trim();
      string str24 = this.txtCLabios.Value.Trim();
      string str25 = this.txtCMandibula.Value.Trim();
      string str26 = this.txtCPaladar.Value.Trim();
      string str27 = this.txtCVeloPaladar.Value.Trim();
      string str28 = this.txtCLengua.Value.Trim();
      string str29 = this.txtCUvula.Value.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str30 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str31 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00021SI] '{0}','{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}' ,'{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}'", (object) str6, (object) str1, (object) num2, (object) str8, (object) num4, (object) str9, (object) num6, (object) str10, (object) num8, (object) str11, (object) num10, (object) str12, (object) str13, (object) str14, (object) str15, (object) str16, (object) str17, (object) str2, (object) str18, (object) str19, (object) str20, (object) str21, (object) str22, (object) str5, (object) str23, (object) str24, (object) str25, (object) str26, (object) str27, (object) str28, (object) str29, (object) str7, (object) xREFGUID, (object) xTERGUID, (object) str30, (object) str31, (object) str3, (object) str4)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00021H @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      char[] chArray = new char[5]
      {
        ' ',
        ',',
        '.',
        ':',
        '\t'
      };
      string[] strArray1 = dataTable1.Rows[0]["COMOSEEXPRESA"].ToString().Split(chArray);
      string[] strArray2 = dataTable1.Rows[0]["LABIOS"].ToString().Split(chArray);
      string[] strArray3 = dataTable1.Rows[0]["FUNCIONLABIAL"].ToString().Split(chArray);
      string[] strArray4 = dataTable1.Rows[0]["DIENTES2"].ToString().Split(chArray);
      string[] strArray5 = dataTable1.Rows[0]["LENGUA"].ToString().Split(chArray);
      if (strArray1[0] != "")
      {
        foreach (string str in strArray1)
          this.ckExpresiones.Items.FindByValue(str).Selected = true;
      }
      if (strArray2[0] != "")
      {
        foreach (string str in strArray2)
          this.ckLabios.Items.FindByValue(str).Selected = true;
      }
      if (strArray3[0] != "")
      {
        foreach (string str in strArray3)
          this.ckFuncionLabial.Items.FindByValue(str).Selected = true;
      }
      if (strArray4[0] != "")
      {
        foreach (string str in strArray4)
          this.ckDientes2.Items.FindByValue(str).Selected = true;
      }
      if (strArray5[0] != "")
      {
        foreach (string str in strArray5)
          this.ckLengua.Items.FindByValue(str).Selected = true;
      }
      this.txtVocales.Value = dataTable1.Rows[0]["VOCALES"].ToString();
      this.txtSilabas.Value = dataTable1.Rows[0]["SILABAS"].ToString();
      this.txtPalabras.Value = dataTable1.Rows[0]["PALABRAS"].ToString();
      this.txtFrases.Value = dataTable1.Rows[0]["FRASES"].ToString();
      this.txtOraciones.Value = dataTable1.Rows[0]["ORACIONES"].ToString();
      this.txtCVocales.Value = dataTable1.Rows[0]["CVOCALES"].ToString();
      this.txtCSilabas.Value = dataTable1.Rows[0]["CSILABAS"].ToString();
      this.txtCPalabras.Value = dataTable1.Rows[0]["CPALABRAS"].ToString();
      this.txtCFrases.Value = dataTable1.Rows[0]["CFRASES"].ToString();
      this.txtCOraciones.Value = dataTable1.Rows[0]["CORACIONES"].ToString();
      this.txtVoz.Text = dataTable1.Rows[0]["VOZ"].ToString();
      this.cmbSeReconoce.Value = dataTable1.Rows[0]["SERECONOCE"].ToString();
      this.cmbSigueInstrucciones.Value = dataTable1.Rows[0]["SIGUEINSTRUCCIONES"].ToString();
      this.cmbFuncionesAuditivas.Value = dataTable1.Rows[0]["FUNCIONESAUDITIVAS"].ToString();
      this.cmbRespiracion.Value = dataTable1.Rows[0]["RESPIRACION"].ToString();
      this.cmbMandibula.Value = dataTable1.Rows[0]["MANDIBULA"].ToString();
      this.cmbDientes.Value = dataTable1.Rows[0]["DIENTES"].ToString();
      this.txtOtros.Value = dataTable1.Rows[0]["OTROS"].ToString();
      this.cmbPaladar.Value = dataTable1.Rows[0]["PALADAR"].ToString();
      this.cmbVeloPaladar.Value = dataTable1.Rows[0]["VELOPALADAR"].ToString();
      this.cmbUvula.Value = dataTable1.Rows[0]["UVULA"].ToString();
      this.txtCLabios.Value = dataTable1.Rows[0]["CLABIOS"].ToString();
      this.txtCMandibula.Value = dataTable1.Rows[0]["CMANDIBULA"].ToString();
      this.txtCPaladar.Value = dataTable1.Rows[0]["CPALADAR"].ToString();
      this.txtCVeloPaladar.Value = dataTable1.Rows[0]["CVELOPALADAR"].ToString();
      this.txtCLengua.Value = dataTable1.Rows[0]["CLENGUA"].ToString();
      this.txtCUvula.Value = dataTable1.Rows[0]["CUVULA"].ToString();
      this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      this.cmbTipo.Disabled = true;
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_ROWGUID"]));
      if (dataTable2.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
    }
  }
}
