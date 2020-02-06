// Decompiled with JetBrains decompiler
// Type: CAID.HCL00037
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
  public class HCL00037 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtPERSONASSESION;
    protected TextBox txtRELACIONCONPACIENTE;
    protected HtmlSelect cmbEVALUACIONESPREVIAS;
    protected HtmlInputText txtFECHAEVAPREVIA;
    protected HtmlInputText txtINSTITUCIONEVALUADORA;
    protected TextBox txtResultado;
    protected TextBox txtPERSONASVIVIENDA;
    protected TextBox txtAntecFam;
    protected HtmlSelect cmbNivelLenguaje;
    protected HtmlSelect cmbCaracPeculiares;
    protected TextBox txtOtro;
    protected HtmlSelect cmbAudicion;
    protected HtmlSelect cmbVision;
    protected HtmlSelect cmbMovilidad;
    protected HtmlSelect cmbMotrocidadGruesa;
    protected TextBox txtMotrocidadFina;
    protected HtmlSelect cmbConvulsiones;
    protected TextBox txtOtrasCondiciones;
    protected CheckBoxList ckHabilidadesIntectuales;
    protected CheckBoxList ckDesarrollo;
    protected CheckBoxList ckConducta;
    protected CheckBoxList ckSocial;
    protected CheckBoxList ckEmocional;
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
      this.ckHabilidadesIntectuales.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "HABILIDADES-INTELECTUALES")).Rows)
        this.ckHabilidadesIntectuales.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckDesarrollo.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "DESARROLLO")).Rows)
        this.ckDesarrollo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckConducta.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "CONDUCTA")).Rows)
        this.ckConducta.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckSocial.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "SOCIAL")).Rows)
        this.ckSocial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckEmocional.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "EMOCIONAL")).Rows)
        this.ckEmocional.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckHabilidadesIntectuales.Items.Count; ++index)
      {
        if (this.ckHabilidadesIntectuales.Items[index].Selected)
          str1 = str1 + "," + this.ckHabilidadesIntectuales.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckDesarrollo.Items.Count; ++index)
      {
        if (this.ckDesarrollo.Items[index].Selected)
          str2 = str2 + "," + this.ckDesarrollo.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = "";
      for (int index = 0; index < this.ckConducta.Items.Count; ++index)
      {
        if (this.ckConducta.Items[index].Selected)
          str3 = str3 + "," + this.ckConducta.Items[index].Value.Trim();
      }
      if (str3 != "")
        str3 = str3.Remove(0, 1);
      string str4 = "";
      for (int index = 0; index < this.ckSocial.Items.Count; ++index)
      {
        if (this.ckSocial.Items[index].Selected)
          str4 = str4 + "," + this.ckSocial.Items[index].Value.Trim();
      }
      if (str4 != "")
        str4 = str4.Remove(0, 1);
      string str5 = "";
      for (int index = 0; index < this.ckEmocional.Items.Count; ++index)
      {
        if (this.ckEmocional.Items[index].Selected)
          str5 = str5 + "," + this.ckEmocional.Items[index].Value.Trim();
      }
      if (str5 != "")
        str5 = str5.Remove(0, 1);
      string str6 = this.txtAntecFam.Text.Trim();
      string str7 = this.cmbNivelLenguaje.Value.Trim();
      string str8 = this.cmbCaracPeculiares.Value.Trim();
      string str9 = this.txtOtro.Text.Trim();
      string str10 = this.cmbAudicion.Value.Trim();
      string str11 = this.cmbVision.Value.Trim();
      string str12 = this.cmbMotrocidadGruesa.Value.Trim();
      string str13 = this.cmbMovilidad.Value.Trim();
      string str14 = this.txtMotrocidadFina.Text.Trim();
      string str15 = this.cmbConvulsiones.Value.Trim();
      string str16 = this.txtOtrasCondiciones.Text.Trim();
      string str17 = this.txtPERSONASSESION.Text.Trim();
      string str18 = this.txtRELACIONCONPACIENTE.Text.Trim();
      string str19 = this.cmbEVALUACIONESPREVIAS.Value.Trim();
      string str20 = this.txtFECHAEVAPREVIA.Value.ToString();
      string str21 = this.txtResultado.Text.Trim();
      string str22 = this.txtPERSONASVIVIENDA.Text.Trim();
      string str23 = this.txtINSTITUCIONEVALUADORA.Value.Trim();
      string str24 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str25 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str26 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00037SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}'", (object) str6, (object) str7, (object) str8, (object) str9, (object) str10, (object) str11, (object) str12, (object) str13, (object) str14, (object) str15, (object) str16, (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str24, (object) xREFGUID, (object) xTERGUID, (object) str25, (object) str26, (object) str17, (object) str18, (object) str19, (object) str20, (object) str21, (object) str22, (object) str23)))
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
      this.txtAntecFam.Text = string.Empty;
      this.cmbNivelLenguaje.Value = string.Empty;
      this.cmbCaracPeculiares.Value = string.Empty;
      this.txtOtro.Text = string.Empty;
      this.cmbAudicion.Value = string.Empty;
      this.cmbVision.Value = string.Empty;
      this.cmbMotrocidadGruesa.Value = string.Empty;
      this.cmbMovilidad.Value = string.Empty;
      this.txtMotrocidadFina.Text = string.Empty;
      this.cmbConvulsiones.Value = string.Empty;
      this.txtOtrasCondiciones.Text = string.Empty;
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00037H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      if (dataTable1.Rows.Count != 0)
      {
        char[] chArray = new char[3]{ ' ', ',', '\t' };
        string[] strArray1 = dataTable1.Rows[0]["INTELECTUALES"].ToString().Split(chArray);
        string[] strArray2 = dataTable1.Rows[0]["DESARROLLO"].ToString().Split(chArray);
        string[] strArray3 = dataTable1.Rows[0]["CONDUCTA"].ToString().Split(chArray);
        string[] strArray4 = dataTable1.Rows[0]["SOCIAL"].ToString().Split(chArray);
        string[] strArray5 = dataTable1.Rows[0]["EMOCIONAL"].ToString().Split(chArray);
        if (strArray1[0] != "")
        {
          foreach (string str in strArray1)
            this.ckHabilidadesIntectuales.Items.FindByValue(str).Selected = true;
        }
        if (strArray2[0] != "")
        {
          foreach (string str in strArray2)
            this.ckDesarrollo.Items.FindByValue(str).Selected = true;
        }
        if (strArray3[0] != "")
        {
          foreach (string str in strArray3)
            this.ckConducta.Items.FindByValue(str).Selected = true;
        }
        if (strArray4[0] != "")
        {
          foreach (string str in strArray4)
            this.ckSocial.Items.FindByValue(str).Selected = true;
        }
        if (strArray5[0] != "")
        {
          foreach (string str in strArray5)
            this.ckEmocional.Items.FindByValue(str).Selected = true;
        }
        this.txtAntecFam.Text = dataTable1.Rows[0]["ANTECEDENTESFAM"].ToString();
        this.cmbNivelLenguaje.Value = dataTable1.Rows[0]["NIVELLENGUAJE"].ToString();
        this.cmbCaracPeculiares.Value = dataTable1.Rows[0]["CARACPECULIARES"].ToString();
        this.txtOtro.Text = dataTable1.Rows[0]["OTRO"].ToString();
        this.cmbAudicion.Value = dataTable1.Rows[0]["AUDICION"].ToString();
        this.cmbVision.Value = dataTable1.Rows[0]["VISION"].ToString();
        this.cmbMotrocidadGruesa.Value = dataTable1.Rows[0]["MOTRICIDADGRUESA"].ToString();
        this.cmbMovilidad.Value = dataTable1.Rows[0]["MOVILIDAD"].ToString();
        this.txtMotrocidadFina.Text = dataTable1.Rows[0]["MOTRICIDADFINA"].ToString();
        this.cmbConvulsiones.Value = dataTable1.Rows[0]["CONVULSIONES"].ToString();
        this.txtOtrasCondiciones.Text = dataTable1.Rows[0]["OTRASCONDICIONES"].ToString();
        this.txtPERSONASSESION.Text = dataTable1.Rows[0]["PERSONASSESION"].ToString();
        this.txtRELACIONCONPACIENTE.Text = dataTable1.Rows[0]["RELACIONCONPACIENTE"].ToString();
        this.cmbEVALUACIONESPREVIAS.Value = dataTable1.Rows[0]["EVALUACIONESPREVIAS"].ToString();
        this.txtFECHAEVAPREVIA.Value = dataTable1.Rows[0]["FECHAEVAPREVIA"].ToString();
        this.txtResultado.Text = dataTable1.Rows[0]["RESULTADOS"].ToString();
        this.txtPERSONASVIVIENDA.Text = dataTable1.Rows[0]["PERSONASVIVIENDA"].ToString();
        this.txtINSTITUCIONEVALUADORA.Value = dataTable1.Rows[0]["INSTITUCIONEVALUADORA"].ToString();
        this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      }
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
