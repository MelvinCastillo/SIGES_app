// Decompiled with JetBrains decompiler
// Type: CAID.HCL00003
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
  public class HCL00003 : Page
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
    protected HtmlInputText txtHijoNo;
    protected HtmlInputText txtEmbarazos;
    protected HtmlInputText txtPartos;
    protected HtmlInputText txtCesareas;
    protected HtmlInputText txtAbortos;
    protected HtmlInputText txtObitos;
    protected CheckBoxList ckComplicaciones;
    protected TextBox txtCommentCompli;
    protected CheckBoxList ckMedicamentos;
    protected TextBox txtComentariosMedicamentos;
    protected HtmlSelect cmbTipoPartos;
    protected HtmlSelect cmbCesarea;
    protected HtmlInputText txtEdadNace;
    protected HtmlInputText txtPesoNace;
    protected HtmlSelect cmbLlantoNace;
    protected TextBox txtComentariosCesarea;
    protected CheckBoxList ckCompliNeonatales;
    protected HtmlInputText txtOtrosCompliNeonatales;
    protected CheckBoxList ckIntervenciones;
    protected HtmlInputText txtOtrosIntervenciones;
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
      this.ckComplicaciones.Items.Clear();
      this.ckMedicamentos.Items.Clear();
      this.ckCompliNeonatales.Items.Clear();
      this.ckIntervenciones.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vANTECEDENTESPERINATALES WHERE TIPO='COMPLICACIONES-EMBARAZO-AP' ORDER BY ROWGUID").Rows)
        this.ckComplicaciones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vANTECEDENTESPERINATALES WHERE TIPO='MEDI-EN-EMBARAZO-AP' ORDER BY ROWGUID").Rows)
        this.ckMedicamentos.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vANTECEDENTESPERINATALES WHERE TIPO='COMPLI-NEONATALES-AP' ORDER BY ROWGUID").Rows)
        this.ckCompliNeonatales.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vANTECEDENTESPERINATALES WHERE TIPO='INTERVENCIONES-AP' ORDER BY ROWGUID").Rows)
        this.ckIntervenciones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.txtPesoNace.Value = "0.00";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckComplicaciones.Items.Count; ++index)
      {
        if (this.ckComplicaciones.Items[index].Selected)
          str1 = str1 + "," + this.ckComplicaciones.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckMedicamentos.Items.Count; ++index)
      {
        if (this.ckMedicamentos.Items[index].Selected)
          str2 = str2 + "," + this.ckMedicamentos.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = "";
      for (int index = 0; index < this.ckCompliNeonatales.Items.Count; ++index)
      {
        if (this.ckCompliNeonatales.Items[index].Selected)
          str3 = str3 + "," + this.ckCompliNeonatales.Items[index].Value.Trim();
      }
      if (str3 != "")
        str3 = str3.Remove(0, 1);
      string str4 = "";
      for (int index = 0; index < this.ckIntervenciones.Items.Count; ++index)
      {
        if (this.ckIntervenciones.Items[index].Selected)
          str4 = str4 + "," + this.ckIntervenciones.Items[index].Value.Trim();
      }
      if (str4 != "")
        str4 = str4.Remove(0, 1);
      string str5 = this.cmbObjetivo.Value.ToString();
      string str6 = this.txtHijoNo.Value.ToString();
      string str7 = this.txtEmbarazos.Value.ToString();
      string str8 = this.txtPartos.Value.ToString();
      string str9 = this.txtCesareas.Value.ToString();
      string str10 = this.txtAbortos.Value.ToString();
      string str11 = this.txtObitos.Value.ToString();
      string str12 = this.txtCommentCompli.Text.Trim();
      string str13 = this.txtComentariosMedicamentos.Text.Trim();
      string str14 = this.cmbTipoPartos.Value.ToString();
      string str15 = this.cmbCesarea.Value.ToString();
      string str16 = this.txtEdadNace.Value.ToString();
      string str17 = this.cmbLlantoNace.Value.ToString();
      Decimal num = Convert.ToDecimal(this.txtPesoNace.Value);
      string str18 = this.txtComentariosCesarea.Text.Trim();
      string str19 = this.txtOtrosCompliNeonatales.Value.Trim();
      string str20 = this.txtOtrosIntervenciones.Value.Trim();
      string str21 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str22 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str23 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00003SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}'", (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) str10, (object) str1, (object) str12, (object) str2, (object) str13, (object) str14, (object) str15, (object) str16, (object) str17, (object) str18, (object) str3, (object) str19, (object) str4, (object) str20, (object) str21, (object) xREFGUID, (object) xTERGUID, (object) str22, (object) str23, (object) num, (object) str11)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00003V @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS7 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      char[] chArray = new char[5]
      {
        ' ',
        ',',
        '.',
        ':',
        '\t'
      };
      string[] strArray1 = dataTable1.Rows[0]["COMPLIEMBARAZO"].ToString().Split(chArray);
      string[] strArray2 = dataTable1.Rows[0]["MEDIEMBARAZO"].ToString().Split(chArray);
      string[] strArray3 = dataTable1.Rows[0]["COMPLINEONATALES"].ToString().Split(chArray);
      string[] strArray4 = dataTable1.Rows[0]["INTERVENCIONES"].ToString().Split(chArray);
      if (strArray1[0] != "")
      {
        foreach (string str in strArray1)
          this.ckComplicaciones.Items.FindByValue(str).Selected = true;
      }
      if (strArray2[0] != "")
      {
        foreach (string str in strArray2)
          this.ckMedicamentos.Items.FindByValue(str).Selected = true;
      }
      if (strArray3[0] != "")
      {
        foreach (string str in strArray3)
          this.ckCompliNeonatales.Items.FindByValue(str).Selected = true;
      }
      if (strArray4[0] != "")
      {
        foreach (string str in strArray4)
          this.ckIntervenciones.Items.FindByValue(str).Selected = true;
      }
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.txtHijoNo.Value = dataTable1.Rows[0]["HIJONUMERO"].ToString();
      this.txtEmbarazos.Value = dataTable1.Rows[0]["EMBARAZOS"].ToString();
      this.txtPartos.Value = dataTable1.Rows[0]["PARTOS"].ToString();
      this.txtCesareas.Value = dataTable1.Rows[0]["CESAREAS"].ToString();
      this.txtAbortos.Value = dataTable1.Rows[0]["ABORTOS"].ToString();
      this.txtObitos.Value = dataTable1.Rows[0]["OBITOS"].ToString();
      this.txtCommentCompli.Text = dataTable1.Rows[0]["COMMENTCOMPLICACION"].ToString();
      this.txtComentariosMedicamentos.Text = dataTable1.Rows[0]["COMMENTMEDICAMENTO"].ToString();
      this.cmbTipoPartos.Value = dataTable1.Rows[0]["TIPOPARTO"].ToString();
      this.cmbCesarea.Value = dataTable1.Rows[0]["CAUSACESAREA"].ToString();
      this.txtEdadNace.Value = dataTable1.Rows[0]["EDADGESTIONAL"].ToString();
      this.cmbLlantoNace.Value = dataTable1.Rows[0]["LLANTONACE"].ToString();
      this.txtPesoNace.Value = dataTable1.Rows[0]["PESONACE"].ToString();
      this.txtComentariosCesarea.Text = dataTable1.Rows[0]["COMMENTCESAREA"].ToString();
      this.txtOtrosCompliNeonatales.Value = dataTable1.Rows[0]["OTRONEONATALES"].ToString();
      this.txtOtrosIntervenciones.Value = dataTable1.Rows[0]["OTROSINTERVENCIONES"].ToString();
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
