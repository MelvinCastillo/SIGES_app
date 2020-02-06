// Decompiled with JetBrains decompiler
// Type: CAID.HCL00009
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
  public class HCL00009 : Page
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
    protected HtmlSelect cmbPeso;
    protected HtmlSelect cmbTalla;
    protected HtmlSelect cmbPerimetro;
    protected HtmlSelect cmbLenguaje;
    protected HtmlSelect cmbConducta;
    protected CheckBoxList ckCabeza;
    protected HtmlInputText txtCCABEZA;
    protected CheckBoxList ckOjos;
    protected HtmlInputText txtCOJOS;
    protected CheckBoxList ckCuello;
    protected HtmlInputText txtCCUELLO;
    protected CheckBoxList ckTorax;
    protected HtmlInputText txtCTORAX;
    protected CheckBoxList ckCorazon;
    protected HtmlInputText txtCCORAZON;
    protected CheckBoxList ckPulmones;
    protected HtmlInputText txtCPULMONES;
    protected CheckBoxList ckAbdomen;
    protected HtmlInputText txtCABDOMEN;
    protected CheckBoxList ckExtremidadesS;
    protected HtmlInputText txtCEXTRESUPERIORES;
    protected CheckBoxList ckExtremidadesI;
    protected HtmlInputText txtCEXTREINFERIORES;
    protected TextBox txtEVALUACION;
    protected HtmlButton btnSave;
    protected HtmlGenericControl H1;
    protected HtmlSelect cmbDEFORMIDADES;
    protected HtmlSelect cmbDEFORMIDADESEGMENTO;
    protected HtmlSelect cmbTESTADAMS;
    protected HtmlSelect cmbArcosMovimiento;
    protected HtmlInputText txtArcosArticulacion;
    protected TextBox txtFuerzaMuscular;
    protected HtmlSelect cmbAnquilosis;
    protected HtmlInputText txtAnquilosisArticulacion;
    protected HtmlSelect cmbDISMETRIASDER;
    protected HtmlInputText txtDISMETRIASDERMEDICION;
    protected HtmlSelect cmbDISMETRIASIZQ;
    protected HtmlInputText txtDISMETRIASIZQMEDICION;
    protected HtmlSelect cmbDISMETRIASMIEMBROSSUP;
    protected HtmlInputText txtDISMETRIASMIEMBROSSUP_MEDICION;
    protected HtmlSelect cmbPruebaThomas;
    protected HtmlSelect cmbTESTORTOLANI;
    protected TextBox txtAnalisisMarcha;
    protected TextBox txtPruebasEquilibrio;
    protected HtmlButton btn2;
    protected HtmlGenericControl H2;
    protected HtmlSelect cmbTonoMuscular;
    protected HtmlSelect cmbGradacionEspasti;
    protected TextBox txtPatronesDerecha;
    protected TextBox txtPatronesIzquierda;
    protected HtmlSelect cmbBicipital;
    protected HtmlSelect cmbTricipital;
    protected HtmlSelect cmbEstiloradial;
    protected HtmlSelect cmbPatelar;
    protected HtmlSelect cmbAquileo;
    protected HtmlSelect cmbClonus;
    protected HtmlSelect cmbBabinsky;
    protected TextBox txtReflejos;
    protected CheckBoxList ckLenguaje;
    protected TextBox txtCaracLenguaje;
    protected HtmlButton btn3;
    protected HtmlGenericControl H3;
    protected HtmlSelect cmbEscalaMovilidad;
    protected HtmlSelect cmbClasifMotora;
    protected TextBox txtIndependenciaActi;
    protected HtmlSelect cmbHabilidadesManuale;
    protected TextBox txtSocializacion;
    protected TextBox txtActuacionEscuela;
    protected TextBox txtDiagImpresion;
    protected HtmlButton btn4;
    protected HtmlGenericControl H5;
    protected Repeater rpReflejosPrimitivos;
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
      this.txtDISMETRIASDERMEDICION.Value = "0";
      this.txtDISMETRIASIZQMEDICION.Value = "0";
      this.txtDISMETRIASMIEMBROSSUP_MEDICION.Value = "0";
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
      this.cmbPeso.Items.Clear();
      this.cmbPeso.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbTalla.Items.Clear();
      this.cmbTalla.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPerimetro.Items.Clear();
      this.cmbPerimetro.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbLenguaje.Items.Clear();
      this.cmbLenguaje.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbConducta.Items.Clear();
      this.cmbConducta.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vR_EXAMENFISICO ORDER BY ROWGUID").Rows)
      {
        this.cmbPeso.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbTalla.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbPerimetro.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbLenguaje.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbConducta.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      this.ckCabeza.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='CABEZA-EX'").Rows)
        this.ckCabeza.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckOjos.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='OJOS-EX'").Rows)
        this.ckOjos.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckCuello.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='CUELLO-EX'").Rows)
        this.ckCuello.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckTorax.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='TORAX-EX'").Rows)
        this.ckTorax.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckCorazon.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='CORAZON-EX'").Rows)
        this.ckCorazon.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckPulmones.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='PULMONES-EX'").Rows)
        this.ckPulmones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckAbdomen.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='ABDOMEN-EX'").Rows)
        this.ckAbdomen.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckExtremidadesS.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='EXTRESUPERIORES-EX'").Rows)
        this.ckExtremidadesS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckExtremidadesI.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO WHERE TIPO='EXTREINFERIORES-EX'").Rows)
        this.ckExtremidadesI.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckLenguaje.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEXAMENFISICO_LENGUAJE").Rows)
        this.ckLenguaje.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      string str = "Extremidades Superiores " + Environment.NewLine + "a)\tHombro: " + Environment.NewLine + "b)\tCodo: " + Environment.NewLine + "c)\tMuñeca " + Environment.NewLine + "d)\tPulgar " + Environment.NewLine + "e)\tdedos: " + Environment.NewLine + Environment.NewLine + "Extremidades Inferiores " + Environment.NewLine + "f)\tCadera: " + Environment.NewLine + "g)\tRodilla: " + Environment.NewLine + "h)\tOrtejos: " + Environment.NewLine + "i)\tTobillo: ";
      this.txtPatronesDerecha.Text = str;
      this.txtPatronesIzquierda.Text = str;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckCabeza.Items.Count; ++index)
      {
        if (this.ckCabeza.Items[index].Selected)
          str1 = str1 + "," + this.ckCabeza.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckOjos.Items.Count; ++index)
      {
        if (this.ckOjos.Items[index].Selected)
          str2 = str2 + "," + this.ckOjos.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = "";
      for (int index = 0; index < this.ckCuello.Items.Count; ++index)
      {
        if (this.ckCuello.Items[index].Selected)
          str3 = str3 + "," + this.ckCuello.Items[index].Value.Trim();
      }
      if (str3 != "")
        str3 = str3.Remove(0, 1);
      string str4 = "";
      for (int index = 0; index < this.ckTorax.Items.Count; ++index)
      {
        if (this.ckTorax.Items[index].Selected)
          str4 = str4 + "," + this.ckTorax.Items[index].Value.Trim();
      }
      if (str4 != "")
        str4 = str4.Remove(0, 1);
      string str5 = "";
      for (int index = 0; index < this.ckCorazon.Items.Count; ++index)
      {
        if (this.ckCorazon.Items[index].Selected)
          str5 = str5 + "," + this.ckCorazon.Items[index].Value.Trim();
      }
      if (str5 != "")
        str5 = str5.Remove(0, 1);
      string str6 = "";
      for (int index = 0; index < this.ckPulmones.Items.Count; ++index)
      {
        if (this.ckPulmones.Items[index].Selected)
          str6 = str6 + "," + this.ckPulmones.Items[index].Value.Trim();
      }
      if (str6 != "")
        str6 = str6.Remove(0, 1);
      string str7 = "";
      for (int index = 0; index < this.ckAbdomen.Items.Count; ++index)
      {
        if (this.ckAbdomen.Items[index].Selected)
          str7 = str7 + "," + this.ckAbdomen.Items[index].Value.Trim();
      }
      if (str7 != "")
        str7 = str7.Remove(0, 1);
      string str8 = "";
      for (int index = 0; index < this.ckExtremidadesS.Items.Count; ++index)
      {
        if (this.ckExtremidadesS.Items[index].Selected)
          str8 = str8 + "," + this.ckExtremidadesS.Items[index].Value.Trim();
      }
      if (str8 != "")
        str8 = str8.Remove(0, 1);
      string str9 = "";
      for (int index = 0; index < this.ckExtremidadesI.Items.Count; ++index)
      {
        if (this.ckExtremidadesI.Items[index].Selected)
          str9 = str9 + "," + this.ckExtremidadesI.Items[index].Value.Trim();
      }
      if (str9 != "")
        str9 = str9.Remove(0, 1);
      string str10 = "";
      for (int index = 0; index < this.ckLenguaje.Items.Count; ++index)
      {
        if (this.ckLenguaje.Items[index].Selected)
          str10 = str10 + "," + this.ckLenguaje.Items[index].Value.Trim();
      }
      if (str10 != "")
        str10 = str10.Remove(0, 1);
      string str11 = this.cmbObjetivo.Value.ToString();
      string str12 = this.cmbPeso.Value.ToString();
      string str13 = this.cmbTalla.Value.ToString();
      string str14 = this.cmbPerimetro.Value.ToString();
      string str15 = this.cmbLenguaje.Value.ToString();
      string str16 = this.cmbConducta.Value.ToString();
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string empty3 = string.Empty;
      string str17 = this.txtCCABEZA.Value.Trim();
      string str18 = this.txtCOJOS.Value.Trim();
      string str19 = this.txtCCUELLO.Value.Trim();
      string str20 = this.txtCTORAX.Value.Trim();
      string str21 = this.txtCCORAZON.Value.Trim();
      string str22 = this.txtCPULMONES.Value.Trim();
      string str23 = this.txtCABDOMEN.Value.Trim();
      string str24 = this.txtCEXTRESUPERIORES.Value.Trim();
      string str25 = this.txtCEXTREINFERIORES.Value.Trim();
      string str26 = this.cmbDEFORMIDADES.Value.Trim();
      string str27 = this.cmbDEFORMIDADESEGMENTO.Value.Trim();
      string str28 = this.cmbArcosMovimiento.Value.Trim();
      string str29 = this.txtArcosArticulacion.Value.Trim();
      string str30 = this.txtFuerzaMuscular.Text.Trim();
      string str31 = this.cmbAnquilosis.Value.Trim();
      string str32 = this.txtAnquilosisArticulacion.Value.Trim();
      string str33 = this.cmbPruebaThomas.Value.Trim();
      string str34 = this.txtAnalisisMarcha.Text.Trim();
      string str35 = this.txtPruebasEquilibrio.Text.Trim();
      string str36 = this.cmbTonoMuscular.Value.Trim();
      string str37 = this.cmbGradacionEspasti.Value.Trim();
      string str38 = this.txtPatronesDerecha.Text.Trim();
      string str39 = this.txtPatronesIzquierda.Text.Trim();
      string str40 = this.cmbBicipital.Value.Trim();
      string str41 = this.cmbTricipital.Value.Trim();
      string str42 = this.cmbEstiloradial.Value.Trim();
      string str43 = this.cmbPatelar.Value.Trim();
      string str44 = this.cmbAquileo.Value.Trim();
      string str45 = this.cmbClonus.Value.Trim();
      string str46 = this.cmbBabinsky.Value.Trim();
      string str47 = this.txtReflejos.Text.Trim();
      string str48 = this.txtCaracLenguaje.Text.Trim();
      string str49 = this.cmbEscalaMovilidad.Value.Trim();
      string str50 = this.cmbClasifMotora.Value.Trim();
      string str51 = this.txtIndependenciaActi.Text.Trim();
      string str52 = this.cmbHabilidadesManuale.Value.Trim();
      string str53 = this.txtSocializacion.Text.Trim();
      string str54 = this.txtActuacionEscuela.Text.Trim();
      string str55 = this.txtDiagImpresion.Text.Trim();
      string str56 = this.cmbDISMETRIASDER.Value.Trim();
      string str57 = this.cmbDISMETRIASMIEMBROSSUP.Value.Trim();
      Decimal num1 = new Decimal(0);
      Decimal num2 = new Decimal(0);
      Decimal num3 = new Decimal(0);
      Decimal num4 = !(this.txtDISMETRIASDERMEDICION.Value == "") ? Convert.ToDecimal(this.txtDISMETRIASDERMEDICION.Value.Trim()) : new Decimal(0);
      string str58 = this.cmbDISMETRIASIZQ.Value.Trim();
      Decimal num5 = !(this.txtDISMETRIASIZQMEDICION.Value == "") ? Convert.ToDecimal(this.txtDISMETRIASIZQMEDICION.Value.Trim()) : new Decimal(0);
      Decimal num6 = !(this.txtDISMETRIASMIEMBROSSUP_MEDICION.Value == "") ? Convert.ToDecimal(this.txtDISMETRIASMIEMBROSSUP_MEDICION.Value.Trim()) : new Decimal(0);
      string str59 = this.cmbTESTADAMS.Value.Trim();
      string str60 = this.cmbTESTORTOLANI.Value.Trim();
      Decimal num7 = new Decimal(0);
      Decimal num8 = new Decimal(0);
      string str61 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str62 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str63 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00009SI] '{0}','{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}' ,'{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','{43}','{44}','{45}','{46}','{47}','{48}','{49}','{50}','{51}','{52}','{53}','{54}','{55}','{56}','{57}','{58}','{59}','{60}','{61}','{62}','{63}',{64},'{65}',{66},'{67}','{68}',{69},{70},'{71}',{72}", (object) str11, (object) str12, (object) str13, (object) str14, (object) str15, (object) str16, (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) empty1, (object) empty2, (object) empty3, (object) str61, (object) xREFGUID, (object) xTERGUID, (object) str62, (object) str63, (object) str17, (object) str18, (object) str19, (object) str20, (object) str21, (object) str22, (object) str23, (object) str24, (object) str25, (object) str26, (object) str27, (object) str28, (object) str29, (object) str30, (object) str31, (object) str32, (object) str33, (object) str34, (object) str35, (object) str36, (object) str37, (object) str38, (object) str39, (object) str40, (object) str41, (object) str42, (object) str43, (object) str44, (object) str45, (object) str46, (object) str47, (object) str48, (object) str49, (object) str50, (object) str51, (object) str52, (object) str53, (object) str54, (object) str55, (object) str10, (object) str56, (object) num4, (object) str58, (object) num5, (object) str59, (object) str60, (object) num7, (object) num8, (object) str57, (object) num6)))
      {
        ((Site_Master) this.Master)._Notify("Actualizado");
        this.Validar();
      }
    }

    protected void _SaveReflejos(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string empty3 = string.Empty;
      string empty4 = string.Empty;
      string empty5 = string.Empty;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str1 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str2 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      foreach (RepeaterItem repeaterItem in this.rpReflejosPrimitivos.Items)
      {
        Label control1 = (Label) repeaterItem.FindControl("txtReflejo");
        DropDownList control2 = (DropDownList) repeaterItem.FindControl("cmbEdad1");
        DropDownList control3 = (DropDownList) repeaterItem.FindControl("cmbEdad2");
        DropDownList control4 = (DropDownList) repeaterItem.FindControl("cmbEdad3");
        DropDownList control5 = (DropDownList) repeaterItem.FindControl("cmbEdad4");
        DropDownList control6 = (DropDownList) repeaterItem.FindControl("cmbEdad5");
        string str3 = control2.SelectedValue.ToString();
        string str4 = control3.SelectedValue.ToString();
        string str5 = control4.SelectedValue.ToString();
        string str6 = control5.SelectedValue.ToString();
        string str7 = control6.SelectedValue.ToString();
        string str8 = control1.ToolTip.ToString();
        if (!DB.ExecuteNonQuery(string.Format("[HCL00009_RSI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}'", (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) xREFGUID, (object) xTERGUID, (object) str1, (object) str2, (object) str8)))
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
      this.rpReflejosPrimitivos.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00009_RS1  @REFGUID = '{0}', @TERGUID = '{1}', @ROWUSERID = '{2}', @ROWSGXID = '{3}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CurrentUSR_TERID"].ToString(), (object) this.Session["CurrentUSR_ROWGUID"].ToString(), (object) this.Session["CURRENTUSR_SGXID"].ToString()));
      this.rpReflejosPrimitivos.DataBind();
      foreach (RepeaterItem repeaterItem in this.rpReflejosPrimitivos.Items)
      {
        DropDownList control1 = (DropDownList) repeaterItem.FindControl("cmbEdad1");
        DropDownList control2 = (DropDownList) repeaterItem.FindControl("cmbEdad2");
        DropDownList control3 = (DropDownList) repeaterItem.FindControl("cmbEdad3");
        DropDownList control4 = (DropDownList) repeaterItem.FindControl("cmbEdad4");
        DropDownList control5 = (DropDownList) repeaterItem.FindControl("cmbEdad5");
        control1.SelectedValue = control1.ValidationGroup.ToString();
        control2.SelectedValue = control2.ValidationGroup.ToString();
        control3.SelectedValue = control3.ValidationGroup.ToString();
        control4.SelectedValue = control4.ValidationGroup.ToString();
        control5.SelectedValue = control5.ValidationGroup.ToString();
      }
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00009V @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.Session["CurrentUSR_TERID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
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
      string[] strArray1 = dataTable1.Rows[0]["CABEZA"].ToString().Split(chArray);
      string[] strArray2 = dataTable1.Rows[0]["OJOS"].ToString().Split(chArray);
      string[] strArray3 = dataTable1.Rows[0]["CUELLO"].ToString().Split(chArray);
      string[] strArray4 = dataTable1.Rows[0]["TORAX"].ToString().Split(chArray);
      string[] strArray5 = dataTable1.Rows[0]["CORAZON"].ToString().Split(chArray);
      string[] strArray6 = dataTable1.Rows[0]["PULMONES"].ToString().Split(chArray);
      string[] strArray7 = dataTable1.Rows[0]["ABDOMEN"].ToString().Split(chArray);
      string[] strArray8 = dataTable1.Rows[0]["EXTRESUPERIORES"].ToString().Split(chArray);
      string[] strArray9 = dataTable1.Rows[0]["EXTREINFERIORES"].ToString().Split(chArray);
      string[] strArray10 = dataTable1.Rows[0]["LENGUAJE2"].ToString().Split(chArray);
      if (strArray1[0] != "")
      {
        foreach (string str in strArray1)
          this.ckCabeza.Items.FindByValue(str).Selected = true;
      }
      if (strArray2[0] != "")
      {
        foreach (string str in strArray2)
          this.ckOjos.Items.FindByValue(str).Selected = true;
      }
      if (strArray3[0] != "")
      {
        foreach (string str in strArray3)
          this.ckCuello.Items.FindByValue(str).Selected = true;
      }
      if (strArray4[0] != "")
      {
        foreach (string str in strArray4)
          this.ckTorax.Items.FindByValue(str).Selected = true;
      }
      if (strArray5[0] != "")
      {
        foreach (string str in strArray5)
          this.ckCorazon.Items.FindByValue(str).Selected = true;
      }
      if (strArray6[0] != "")
      {
        foreach (string str in strArray6)
          this.ckPulmones.Items.FindByValue(str).Selected = true;
      }
      if (strArray7[0] != "")
      {
        foreach (string str in strArray7)
          this.ckAbdomen.Items.FindByValue(str).Selected = true;
      }
      if (strArray8[0] != "")
      {
        foreach (string str in strArray8)
          this.ckExtremidadesS.Items.FindByValue(str).Selected = true;
      }
      if (strArray9[0] != "")
      {
        foreach (string str in strArray9)
          this.ckExtremidadesI.Items.FindByValue(str).Selected = true;
      }
      if (strArray10[0] != "")
      {
        foreach (string str in strArray10)
          this.ckLenguaje.Items.FindByValue(str).Selected = true;
      }
      this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.cmbPeso.Value = dataTable1.Rows[0]["PESO"].ToString();
      this.cmbTalla.Value = dataTable1.Rows[0]["TALLA"].ToString();
      this.cmbPerimetro.Value = dataTable1.Rows[0]["PERIMETROCEFALICO"].ToString();
      this.cmbLenguaje.Value = dataTable1.Rows[0]["LENGUAJE"].ToString();
      this.cmbConducta.Value = dataTable1.Rows[0]["CONDUCTA"].ToString();
      this.txtCCABEZA.Value = dataTable1.Rows[0]["CCABEZA"].ToString();
      this.txtCOJOS.Value = dataTable1.Rows[0]["COJOS"].ToString();
      this.txtCCUELLO.Value = dataTable1.Rows[0]["CCUELLO"].ToString();
      this.txtCTORAX.Value = dataTable1.Rows[0]["CTORAX"].ToString();
      this.txtCCORAZON.Value = dataTable1.Rows[0]["CCORAZON"].ToString();
      this.txtCPULMONES.Value = dataTable1.Rows[0]["CPULMONES"].ToString();
      this.txtCABDOMEN.Value = dataTable1.Rows[0]["CABDOMEN"].ToString();
      this.txtCEXTRESUPERIORES.Value = dataTable1.Rows[0]["CEXTRESUPERIORES"].ToString();
      this.txtCEXTREINFERIORES.Value = dataTable1.Rows[0]["CEXTRESINFERIORES"].ToString();
      this.cmbDEFORMIDADES.Value = dataTable1.Rows[0]["DEFORMIDADES"].ToString();
      this.cmbDEFORMIDADESEGMENTO.Value = dataTable1.Rows[0]["DEFORMIDADESEGMENTO"].ToString();
      this.cmbArcosMovimiento.Value = dataTable1.Rows[0]["ARCOSMOVIMIENTO"].ToString();
      this.txtArcosArticulacion.Value = dataTable1.Rows[0]["ARCOSARTICULACION"].ToString();
      this.txtFuerzaMuscular.Text = dataTable1.Rows[0]["FUERZAMUSCULAR"].ToString();
      this.cmbAnquilosis.Value = dataTable1.Rows[0]["ANQUILOSIS"].ToString();
      this.txtAnquilosisArticulacion.Value = dataTable1.Rows[0]["ANQUILOSISARTICULACION"].ToString();
      this.cmbPruebaThomas.Value = dataTable1.Rows[0]["PRUEBATHOMAS"].ToString();
      this.txtAnalisisMarcha.Text = dataTable1.Rows[0]["ANALISISMARCHA"].ToString();
      this.txtPruebasEquilibrio.Text = dataTable1.Rows[0]["PRUEBASEQUILIBRIO"].ToString();
      this.cmbTonoMuscular.Value = dataTable1.Rows[0]["TOMOMUSCULAR"].ToString();
      this.cmbGradacionEspasti.Value = dataTable1.Rows[0]["GRADACIONESPASTICIDAD"].ToString();
      this.txtPatronesDerecha.Text = dataTable1.Rows[0]["RIGHPATRONESPOSTURALES"].ToString();
      this.txtPatronesIzquierda.Text = dataTable1.Rows[0]["LEFTPATRONESPOSTURALES"].ToString();
      this.cmbBicipital.Value = dataTable1.Rows[0]["REFLEJOBICIPAL"].ToString();
      this.cmbTricipital.Value = dataTable1.Rows[0]["REFLEJOTRICIPAL"].ToString();
      this.cmbEstiloradial.Value = dataTable1.Rows[0]["REFLEJOESTILORADIAL"].ToString();
      this.cmbPatelar.Value = dataTable1.Rows[0]["REFLEJOPATELAR"].ToString();
      this.cmbAquileo.Value = dataTable1.Rows[0]["REFLEJOAQUILEO"].ToString();
      this.cmbClonus.Value = dataTable1.Rows[0]["CLONUS"].ToString();
      this.cmbBabinsky.Value = dataTable1.Rows[0]["BABINSKY"].ToString();
      this.txtReflejos.Text = dataTable1.Rows[0]["REFLEJOSPRIMITIVOS"].ToString();
      this.txtCaracLenguaje.Text = dataTable1.Rows[0]["CLENGUAJE"].ToString();
      this.cmbEscalaMovilidad.Value = dataTable1.Rows[0]["MOVILIDAD"].ToString();
      this.cmbClasifMotora.Value = dataTable1.Rows[0]["MOTORAGRUESA"].ToString();
      this.txtIndependenciaActi.Text = dataTable1.Rows[0]["INDEPENDENCIA"].ToString();
      this.cmbHabilidadesManuale.Value = dataTable1.Rows[0]["HABILIDADES"].ToString();
      this.txtSocializacion.Text = dataTable1.Rows[0]["SOCIALIZACION"].ToString();
      this.txtActuacionEscuela.Text = dataTable1.Rows[0]["AMBITOESCOLAR"].ToString();
      this.txtDiagImpresion.Text = dataTable1.Rows[0]["DIAGNOSTICOIMPRESION"].ToString();
      this.cmbDISMETRIASDER.Value = dataTable1.Rows[0]["DISMETRIASDER"].ToString();
      this.txtDISMETRIASDERMEDICION.Value = dataTable1.Rows[0]["DISMETRIASDERMEDICION"].ToString();
      this.cmbDISMETRIASIZQ.Value = dataTable1.Rows[0]["DISMETRIASIZQ"].ToString();
      this.txtDISMETRIASIZQMEDICION.Value = dataTable1.Rows[0]["DISMETRIASIZQMEDICION"].ToString();
      this.cmbTESTADAMS.Value = dataTable1.Rows[0]["TESTADAMS"].ToString();
      this.cmbTESTORTOLANI.Value = dataTable1.Rows[0]["TESTORTOLANI"].ToString();
      this.cmbDISMETRIASMIEMBROSSUP.Value = dataTable1.Rows[0]["DISMETRIASMIEMBROSSUP"].ToString();
      this.txtDISMETRIASMIEMBROSSUP_MEDICION.Value = dataTable1.Rows[0]["DISMETRIASMIEMBROSSUP_MEDICION"].ToString();
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
