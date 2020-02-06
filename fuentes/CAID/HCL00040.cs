// Decompiled with JetBrains decompiler
// Type: CAID.HCL00040
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
  public class HCL00040 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtPersona;
    protected TextBox txtEVALUACION;
    protected CheckBoxList ckInteresesMusicales;
    protected TextBox txtCInteresesMusicales;
    protected CheckBoxList ckCognitivoSensorial;
    protected TextBox txtCCognitivoSensorial;
    protected CheckBoxList ckComunicaciónSocial;
    protected TextBox txtCComunicaciónSocial;
    protected CheckBoxList ckFisico;
    protected TextBox txtCFisico;
    protected CheckBoxList ckEmocional;
    protected TextBox txtCEmocional;
    protected TextBox txtFuerzas;
    protected TextBox txtNecesidades;
    protected CheckBoxList ckPlan;
    protected TextBox txtFrecuencia;
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
      this.ckInteresesMusicales.Items.Clear();
      this.ckCognitivoSensorial.Items.Clear();
      this.ckComunicaciónSocial.Items.Clear();
      this.ckFisico.Items.Clear();
      this.ckEmocional.Items.Clear();
      this.ckPlan.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='INTERESES-MUSICALES' ORDER BY ORDEN").Rows)
        this.ckInteresesMusicales.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='COGNITIVO-SENSORIAL' ORDER BY ORDEN").Rows)
        this.ckCognitivoSensorial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='COMUNICACION-SOCIAL' ORDER BY ORDEN").Rows)
        this.ckComunicaciónSocial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='FISICO' ORDER BY ORDEN").Rows)
        this.ckFisico.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='EMOCIONAL' ORDER BY ORDEN").Rows)
        this.ckEmocional.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vEVA_TER_COMPLEMENTARIAS WHERE TIPO='PLAN' ORDER BY ORDEN").Rows)
        this.ckPlan.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckInteresesMusicales.Items.Count; ++index)
      {
        if (this.ckInteresesMusicales.Items[index].Selected)
          str1 = str1 + "," + this.ckInteresesMusicales.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckCognitivoSensorial.Items.Count; ++index)
      {
        if (this.ckCognitivoSensorial.Items[index].Selected)
          str2 = str2 + "," + this.ckCognitivoSensorial.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = "";
      for (int index = 0; index < this.ckComunicaciónSocial.Items.Count; ++index)
      {
        if (this.ckComunicaciónSocial.Items[index].Selected)
          str3 = str3 + "," + this.ckComunicaciónSocial.Items[index].Value.Trim();
      }
      if (str3 != "")
        str3 = str3.Remove(0, 1);
      string str4 = "";
      for (int index = 0; index < this.ckFisico.Items.Count; ++index)
      {
        if (this.ckFisico.Items[index].Selected)
          str4 = str4 + "," + this.ckFisico.Items[index].Value.Trim();
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
      string str6 = "";
      for (int index = 0; index < this.ckPlan.Items.Count; ++index)
      {
        if (this.ckPlan.Items[index].Selected)
          str6 = str6 + "," + this.ckPlan.Items[index].Value.Trim();
      }
      if (str6 != "")
        str6 = str6.Remove(0, 1);
      string str7 = this.txtPersona.Text.Trim();
      string str8 = this.txtCInteresesMusicales.Text.Trim();
      string str9 = this.txtCCognitivoSensorial.Text.Trim();
      string str10 = this.txtCComunicaciónSocial.Text.Trim();
      string str11 = this.txtCFisico.Text.Trim();
      string str12 = this.txtCEmocional.Text.Trim();
      string str13 = this.txtFuerzas.Text.Trim();
      string str14 = this.txtNecesidades.Text.Trim();
      string str15 = this.txtFrecuencia.Text.Trim();
      string str16 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str17 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str18 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00040SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}'", (object) str7, (object) str1, (object) str8, (object) str2, (object) str9, (object) str3, (object) str10, (object) str4, (object) str11, (object) str5, (object) str12, (object) str13, (object) str14, (object) str6, (object) str15, (object) str16, (object) xREFGUID, (object) xTERGUID, (object) str17, (object) str18)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00040H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      if (dataTable1.Rows.Count != 0)
      {
        char[] chArray = new char[3]{ ' ', ',', '\t' };
        string[] strArray1 = dataTable1.Rows[0]["INTERESESMUSICALES"].ToString().Split(chArray);
        string[] strArray2 = dataTable1.Rows[0]["COGNITIVOSENSORIAL"].ToString().Split(chArray);
        string[] strArray3 = dataTable1.Rows[0]["COMUNICACIONSOCIAL"].ToString().Split(chArray);
        string[] strArray4 = dataTable1.Rows[0]["FISICO"].ToString().Split(chArray);
        string[] strArray5 = dataTable1.Rows[0]["EMOCIONAL"].ToString().Split(chArray);
        string[] strArray6 = dataTable1.Rows[0]["PLANCIRCULAR"].ToString().Split(chArray);
        if (strArray1[0] != "")
        {
          foreach (string str in strArray1)
            this.ckInteresesMusicales.Items.FindByValue(str).Selected = true;
        }
        if (strArray2[0] != "")
        {
          foreach (string str in strArray2)
            this.ckCognitivoSensorial.Items.FindByValue(str).Selected = true;
        }
        if (strArray3[0] != "")
        {
          foreach (string str in strArray3)
            this.ckComunicaciónSocial.Items.FindByValue(str).Selected = true;
        }
        if (strArray4[0] != "")
        {
          foreach (string str in strArray4)
            this.ckFisico.Items.FindByValue(str).Selected = true;
        }
        if (strArray5[0] != "")
        {
          foreach (string str in strArray5)
            this.ckEmocional.Items.FindByValue(str).Selected = true;
        }
        if (strArray6[0] != "")
        {
          foreach (string str in strArray6)
            this.ckPlan.Items.FindByValue(str).Selected = true;
        }
        this.txtPersona.Text = dataTable1.Rows[0]["PERSONAENTREVISTA"].ToString();
        this.txtCInteresesMusicales.Text = dataTable1.Rows[0]["CINTERESESMUSICALES"].ToString();
        this.txtCCognitivoSensorial.Text = dataTable1.Rows[0]["CCOGNITIVOSENSORIAL"].ToString();
        this.txtCComunicaciónSocial.Text = dataTable1.Rows[0]["CCOMUNICACIONSOCIAL"].ToString();
        this.txtCFisico.Text = dataTable1.Rows[0]["CFISICO"].ToString();
        this.txtCEmocional.Text = dataTable1.Rows[0]["CEMOCIONAL"].ToString();
        this.txtFuerzas.Text = dataTable1.Rows[0]["FUERZA"].ToString();
        this.txtNecesidades.Text = dataTable1.Rows[0]["NECESIDADES"].ToString();
        this.txtFrecuencia.Text = dataTable1.Rows[0]["FRECUENCIA"].ToString();
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
