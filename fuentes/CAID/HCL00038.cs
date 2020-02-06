// Decompiled with JetBrains decompiler
// Type: CAID.HCL00038
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
  public class HCL00038 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected CheckBoxList ckAnteMed;
    protected TextBox txtOtros;
    protected TextBox txtAnteOdo;
    protected TextBox txtPrimerAno;
    protected CheckBoxList ckHastoriaDietaAli;
    protected TextBox txtHistDieta;
    protected TextBox txtHigBucal;
    protected TextBox txtHabitos;
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
      this.ckAnteMed.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vANTE_MED_ODO ORDER BY ORDEN").Rows)
        this.ckAnteMed.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckHastoriaDietaAli.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vHIST_DIETA_ODO ORDER BY ORDEN").Rows)
        this.ckHastoriaDietaAli.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      string str1 = "• Comportamiento: " + Environment.NewLine + "• Traumatismo: " + Environment.NewLine + "• Erupción Anómala: ";
      string str2 = "• Embarazo:" + Environment.NewLine + "• Nacimiento: " + Environment.NewLine + "• Lactancia: " + Environment.NewLine + "• Salida 1er. Diente: " + Environment.NewLine + "• Uso Bobo: (     )  Tiempo (     )  Sin nada (     ) " + Environment.NewLine + "• Biberón: (     )  Tiempo (     )  Al acostarse (     ) Suplemento de la leche: " + Environment.NewLine + "• Lenguaje:                           • Marcha Independiente: ";
      string str3 = "• Azúcares (sólidos+líquido): " + Environment.NewLine + "Observaciones: " + Environment.NewLine + "• Dificultad para deglutir líquidos: " + Environment.NewLine + "• Dificultad para deglutir sólidos: ";
      string str4 = "• Frecuencia cepillado: (     ) " + Environment.NewLine + "• Pasta dental: " + Environment.NewLine + "• Suplemento fluorado:               • Seda dental: " + Environment.NewLine + "• Momentos de azúcar al día: ";
      string str5 = "• Onicofagia: " + Environment.NewLine + "• Respiración bucal: " + Environment.NewLine + "• Succión: " + Environment.NewLine + "• Deglución atípica: " + Environment.NewLine + "• Bruxismo: " + Environment.NewLine + "• Interposición lingual: " + Environment.NewLine + "• Autolesiones: ";
      this.txtAnteOdo.Text = str1;
      this.txtPrimerAno.Text = str2;
      this.txtHistDieta.Text = str3;
      this.txtHigBucal.Text = str4;
      this.txtHabitos.Text = str5;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckAnteMed.Items.Count; ++index)
      {
        if (this.ckAnteMed.Items[index].Selected)
          str1 = str1 + "," + this.ckAnteMed.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = "";
      for (int index = 0; index < this.ckHastoriaDietaAli.Items.Count; ++index)
      {
        if (this.ckHastoriaDietaAli.Items[index].Selected)
          str2 = str2 + "," + this.ckHastoriaDietaAli.Items[index].Value.Trim();
      }
      if (str2 != "")
        str2 = str2.Remove(0, 1);
      string str3 = this.txtOtros.Text.Trim();
      string str4 = this.txtAnteOdo.Text.Trim();
      string str5 = this.txtPrimerAno.Text.Trim();
      string str6 = this.txtHistDieta.Text.Trim();
      string str7 = this.txtHigBucal.Text.Trim();
      string str8 = this.txtHabitos.Text.Trim();
      string str9 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str10 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str11 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00038SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}'", (object) str1, (object) str3, (object) str4, (object) str5, (object) str2, (object) str6, (object) str7, (object) str8, (object) str9, (object) xREFGUID, (object) xTERGUID, (object) str10, (object) str11)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00038H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      if (dataTable1.Rows.Count != 0)
      {
        char[] chArray = new char[3]{ ' ', ',', '\t' };
        string[] strArray1 = dataTable1.Rows[0]["ANTEMED"].ToString().Split(chArray);
        string[] strArray2 = dataTable1.Rows[0]["HISTDIETA_ALIMENTACION"].ToString().Split(chArray);
        if (strArray1[0] != "")
        {
          foreach (string str in strArray1)
            this.ckAnteMed.Items.FindByValue(str).Selected = true;
        }
        if (strArray2[0] != "")
        {
          foreach (string str in strArray2)
            this.ckHastoriaDietaAli.Items.FindByValue(str).Selected = true;
        }
        this.txtOtros.Text = dataTable1.Rows[0]["ANTEMEDOTROS"].ToString();
        this.txtAnteOdo.Text = dataTable1.Rows[0]["ANTEODO"].ToString();
        this.txtPrimerAno.Text = dataTable1.Rows[0]["PRIMERANO"].ToString();
        this.txtHistDieta.Text = dataTable1.Rows[0]["HISTDIETA"].ToString();
        this.txtHigBucal.Text = dataTable1.Rows[0]["HIGBUCAL"].ToString();
        this.txtHabitos.Text = dataTable1.Rows[0]["HABITOS"].ToString();
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
