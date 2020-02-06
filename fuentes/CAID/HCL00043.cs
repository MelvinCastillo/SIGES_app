// Decompiled with JetBrains decompiler
// Type: CAID.HCL00043
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
  public class HCL00043 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected CheckBoxList ckHabilidadesIntectuales;
    protected CheckBoxList ckDesarrollo;
    protected CheckBoxList ckConducta;
    protected CheckBoxList ckSocial;
    protected CheckBoxList ckEmocional;
    protected CheckBoxList ckPrueba;
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
      this.ckPrueba.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SELECT * FROM vPRUEBAS_EVALUACION_DIAGNOSTICO WHERE TIPO = '{0}' ORDER BY ORDEN", (object) "ENSESION")).Rows)
        this.ckPrueba.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
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
      string str6 = "";
      for (int index = 0; index < this.ckPrueba.Items.Count; ++index)
      {
        if (this.ckPrueba.Items[index].Selected)
          str6 = str6 + "," + this.ckPrueba.Items[index].Value.Trim();
      }
      if (str6 != "")
        str6 = str6.Remove(0, 1);
      string str7 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str8 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str9 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00043SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) xREFGUID, (object) xTERGUID, (object) str8, (object) str9)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00043V @REFGUID = '{0}', @ROWSGXID = '{1}', @TERGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable1.Rows.Count != 0)
      {
        char[] chArray = new char[3]{ ' ', ',', '\t' };
        string[] strArray1 = dataTable1.Rows[0]["INTELECTUALES"].ToString().Split(chArray);
        string[] strArray2 = dataTable1.Rows[0]["DESARROLLO"].ToString().Split(chArray);
        string[] strArray3 = dataTable1.Rows[0]["CONDUCTA"].ToString().Split(chArray);
        string[] strArray4 = dataTable1.Rows[0]["SOCIAL"].ToString().Split(chArray);
        string[] strArray5 = dataTable1.Rows[0]["EMOCIONAL"].ToString().Split(chArray);
        string[] strArray6 = dataTable1.Rows[0]["PRUEBA"].ToString().Split(chArray);
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
        if (strArray6[0] != "")
        {
          foreach (string str in strArray6)
            this.ckPrueba.Items.FindByValue(str).Selected = true;
        }
        this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      }
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CURRENTUSR_ID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
