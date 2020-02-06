// Decompiled with JetBrains decompiler
// Type: CAID.HCL00041
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
  public class HCL00041 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl H3;
    protected HtmlGenericControl H1;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtEntrevista;
    protected HtmlButton btnSave;
    protected HtmlGenericControl H2;
    protected HtmlSelect cmbAP1;
    protected HtmlSelect cmbAP2;
    protected HtmlSelect cmbAP3;
    protected HtmlSelect cmbAP4;
    protected TextBox txtAObservaciones;
    protected HtmlSelect cmbBP1;
    protected HtmlSelect cmbBP2;
    protected HtmlSelect cmbBP3;
    protected TextBox txtBObservaciones;
    protected HtmlSelect cmbCP1;
    protected HtmlSelect cmbCP2;
    protected HtmlSelect cmbCP3;
    protected HtmlSelect cmbCP4;
    protected HtmlSelect cmbCP5;
    protected TextBox txtCObservaciones;
    protected HtmlSelect cmbDP1;
    protected HtmlSelect cmbDP2;
    protected TextBox txtDObservaciones;
    protected HtmlSelect cmbEP1;
    protected TextBox txtEObservaciones;
    protected HtmlSelect cmbFP1;
    protected HtmlSelect cmbFP2;
    protected HtmlSelect cmbFP3;
    protected TextBox txtFObservaciones;
    protected HtmlSelect cmbGP1;
    protected TextBox txtGObservaciones;
    protected HtmlSelect cmbHP1;
    protected TextBox txtHObservaciones;
    protected HtmlSelect cmbIP1;
    protected TextBox txtIObservaciones;
    protected HtmlSelect cmbJP1;
    protected HtmlSelect cmbJP2;
    protected HtmlSelect cmbJP3;
    protected TextBox txtJObservaciones;
    protected HtmlSelect cmbKP1;
    protected HtmlSelect cmbKP2;
    protected HtmlSelect cmbKP3;
    protected TextBox txtKObservaciones;
    protected HtmlButton Button1;
    protected HtmlGenericControl H4;
    protected TextBox txtCONDUCTA;
    protected TextBox txtCONDUCTA_OBJPAC;
    protected TextBox txtCONDUCTA_OBJFAM;
    protected TextBox txtHABBASICA;
    protected TextBox txtHABBASICA_OBJPAC;
    protected TextBox txtHABBASICA_OBJFAM;
    protected TextBox txtHABVERBALES;
    protected TextBox txtHABVERBALES_OBJPAC;
    protected TextBox txtHABVERBALES_OBJFAM;
    protected TextBox txtOTROS;
    protected TextBox txtOTROS_OBJPAC;
    protected TextBox txtOTROS_OBJFAM;
    protected HtmlButton Button2;

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
      this.txtEntrevista.Text = "¿Cuéntenos como es un día con su hijo? ¿Quiénes están presentes la mayor parte del tiempo? ¿Quien les ayuda?" + Environment.NewLine + Environment.NewLine + "¿A quién obedece más su hijo?" + Environment.NewLine + Environment.NewLine + "¿Qué momento del día es el más difícil para ustedes con él?" + Environment.NewLine + Environment.NewLine + "¿Qué lo calma o como han logrado que en esos momentos se tranquilice?" + Environment.NewLine + Environment.NewLine + "¿Ha recibido algún tipo de intervención antes de venir al centro? ¿Desde cuándo y en qué lugar?" + Environment.NewLine + Environment.NewLine + "Fuera de casa y en la escuela, ¿Cómo es su comportamiento?" + Environment.NewLine + Environment.NewLine + "¿Recibe alguna ayuda cuando sale con él?" + Environment.NewLine + Environment.NewLine + "¿Siente que hay personas en su entorno con quienes puede contar para ayudarle con su hijo?" + Environment.NewLine + Environment.NewLine + "¿Que cosas le gustan a su hijo? " + Environment.NewLine + Environment.NewLine + "¿Cómo se comunica con usted? " + Environment.NewLine + Environment.NewLine + "¿Puede su hijo seguir instrucciones? " + Environment.NewLine + Environment.NewLine + "¿Realiza alguna actividad de la vida diaria de manera independiente?" + Environment.NewLine + Environment.NewLine + "¿Le gusta jugar con algo específico? ¿Cómo juega?" + Environment.NewLine + Environment.NewLine + "¿Realiza usted alguna actividad diaria con él?" + Environment.NewLine + Environment.NewLine + "¿A nivel social como lo describiría? " + Environment.NewLine + Environment.NewLine + "¿Qué hace en eventos sociales como cumpleaños?" + Environment.NewLine + Environment.NewLine + "¿Realiza actividades fuera de la escuela? " + Environment.NewLine + Environment.NewLine + "¿Participa con ustedes de alguna comunidad? O pertenecen a algún club social? ¿Qué participación tiene el niño ahí?" + Environment.NewLine + Environment.NewLine + "¿Cuál diría que ha sido el momento más difícil que ha tenido con él o ella? Descríbalo" + Environment.NewLine + Environment.NewLine + "Alguna otra información general:" + Environment.NewLine + Environment.NewLine + "Asiste a alguna escuela, ¿A cuál?" + Environment.NewLine + Environment.NewLine + "¿Tiene alguna maestra acompañante?";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.txtEntrevista.Text.Trim();
      string str2 = this.cmbAP1.Value.Trim();
      string str3 = this.cmbAP2.Value.Trim();
      string str4 = this.cmbAP3.Value.Trim();
      string str5 = this.cmbAP4.Value.Trim();
      string str6 = this.txtAObservaciones.Text.Trim();
      string str7 = this.cmbBP1.Value.Trim();
      string str8 = this.cmbBP2.Value.Trim();
      string str9 = this.cmbBP3.Value.Trim();
      string str10 = this.txtBObservaciones.Text.Trim();
      string str11 = this.cmbCP1.Value.Trim();
      string str12 = this.cmbCP2.Value.Trim();
      string str13 = this.cmbCP3.Value.Trim();
      string str14 = this.cmbCP4.Value.Trim();
      string str15 = this.cmbCP5.Value.Trim();
      string str16 = this.txtCObservaciones.Text.Trim();
      string str17 = this.cmbDP1.Value.Trim();
      string str18 = this.cmbDP2.Value.Trim();
      string str19 = this.txtDObservaciones.Text.Trim();
      string str20 = this.cmbEP1.Value.Trim();
      string str21 = this.txtEObservaciones.Text.Trim();
      string str22 = this.cmbFP1.Value.Trim();
      string str23 = this.cmbFP2.Value.Trim();
      string str24 = this.cmbFP3.Value.Trim();
      string str25 = this.txtFObservaciones.Text.Trim();
      string str26 = this.cmbGP1.Value.Trim();
      string str27 = this.txtGObservaciones.Text.Trim();
      string str28 = this.cmbHP1.Value.Trim();
      string str29 = this.txtHObservaciones.Text.Trim();
      string str30 = this.cmbIP1.Value.Trim();
      string str31 = this.txtIObservaciones.Text.Trim();
      string str32 = this.cmbJP1.Value.Trim();
      string str33 = this.cmbJP2.Value.Trim();
      string str34 = this.cmbJP3.Value.Trim();
      string str35 = this.txtJObservaciones.Text.Trim();
      string str36 = this.cmbKP1.Value.Trim();
      string str37 = this.cmbKP2.Value.Trim();
      string str38 = this.cmbKP3.Value.Trim();
      string str39 = this.txtKObservaciones.Text.Trim();
      string str40 = this.txtCONDUCTA.Text.Trim();
      string str41 = this.txtCONDUCTA_OBJPAC.Text.Trim();
      string str42 = this.txtCONDUCTA_OBJFAM.Text.Trim();
      string str43 = this.txtHABBASICA.Text.Trim();
      string str44 = this.txtHABBASICA_OBJPAC.Text.Trim();
      string str45 = this.txtHABBASICA_OBJFAM.Text.Trim();
      string str46 = this.txtHABVERBALES.Text.Trim();
      string str47 = this.txtHABVERBALES_OBJPAC.Text.Trim();
      string str48 = this.txtHABVERBALES_OBJFAM.Text.Trim();
      string str49 = this.txtOTROS.Text.Trim();
      string str50 = this.txtOTROS_OBJPAC.Text.Trim();
      string str51 = this.txtOTROS_OBJFAM.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string str52 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str53 = this.Session["CURRENTUSR_SGXID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00041SI] '{0}','{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', '{11}', '{12}', '{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}' ,'{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}','{34}','{35}','{36}','{37}','{38}','{39}','{40}','{41}','{42}','{43}','{44}','{45}','{46}','{47}','{48}','{49}','{50}','{51}','{52}','{53}','{54}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) str10, (object) str11, (object) str12, (object) str13, (object) str14, (object) str15, (object) str16, (object) str17, (object) str18, (object) str19, (object) str20, (object) str21, (object) str22, (object) str23, (object) str24, (object) str25, (object) str26, (object) str27, (object) str28, (object) str29, (object) str30, (object) str31, (object) str32, (object) str33, (object) str34, (object) str35, (object) str36, (object) str37, (object) str38, (object) str39, (object) str40, (object) str41, (object) str42, (object) str43, (object) str44, (object) str45, (object) str46, (object) str47, (object) str48, (object) str49, (object) str50, (object) str51, (object) xREFGUID, (object) xTERGUID, (object) str52, (object) str53)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00041H @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.txtEntrevista.Text = dataTable1.Rows[0]["ENTREVISTA"].ToString();
      this.cmbAP1.Value = dataTable1.Rows[0]["AP1"].ToString();
      this.cmbAP2.Value = dataTable1.Rows[0]["AP2"].ToString();
      this.cmbAP3.Value = dataTable1.Rows[0]["AP3"].ToString();
      this.cmbAP4.Value = dataTable1.Rows[0]["AP4"].ToString();
      this.txtAObservaciones.Text = dataTable1.Rows[0]["AOBSERVACIONES"].ToString();
      this.cmbBP1.Value = dataTable1.Rows[0]["BP1"].ToString();
      this.cmbBP2.Value = dataTable1.Rows[0]["BP2"].ToString();
      this.cmbBP3.Value = dataTable1.Rows[0]["BP3"].ToString();
      this.txtBObservaciones.Text = dataTable1.Rows[0]["BOBSERVACIONES"].ToString();
      this.cmbCP1.Value = dataTable1.Rows[0]["CP1"].ToString();
      this.cmbCP2.Value = dataTable1.Rows[0]["CP2"].ToString();
      this.cmbCP3.Value = dataTable1.Rows[0]["CP3"].ToString();
      this.cmbCP4.Value = dataTable1.Rows[0]["CP4"].ToString();
      this.cmbCP5.Value = dataTable1.Rows[0]["CP5"].ToString();
      this.txtCObservaciones.Text = dataTable1.Rows[0]["COBSERVACIONES"].ToString();
      this.cmbDP1.Value = dataTable1.Rows[0]["DP1"].ToString();
      this.cmbDP2.Value = dataTable1.Rows[0]["DP2"].ToString();
      this.txtDObservaciones.Text = dataTable1.Rows[0]["DOBSERVACIONES"].ToString();
      this.cmbEP1.Value = dataTable1.Rows[0]["EP1"].ToString();
      this.txtEObservaciones.Text = dataTable1.Rows[0]["EOBSERVACIONES"].ToString();
      this.cmbFP1.Value = dataTable1.Rows[0]["FP1"].ToString();
      this.cmbFP2.Value = dataTable1.Rows[0]["FP2"].ToString();
      this.cmbFP3.Value = dataTable1.Rows[0]["FP3"].ToString();
      this.txtFObservaciones.Text = dataTable1.Rows[0]["FOBSERVACIONES"].ToString();
      this.cmbGP1.Value = dataTable1.Rows[0]["GP1"].ToString();
      this.txtGObservaciones.Text = dataTable1.Rows[0]["GOBSERVACIONES"].ToString();
      this.cmbHP1.Value = dataTable1.Rows[0]["HP1"].ToString();
      this.txtHObservaciones.Text = dataTable1.Rows[0]["HOBSERVACIONES"].ToString();
      this.cmbIP1.Value = dataTable1.Rows[0]["IP1"].ToString();
      this.txtIObservaciones.Text = dataTable1.Rows[0]["IOBSERVACIONES"].ToString();
      this.cmbJP1.Value = dataTable1.Rows[0]["JP1"].ToString();
      this.cmbJP2.Value = dataTable1.Rows[0]["JP2"].ToString();
      this.cmbJP3.Value = dataTable1.Rows[0]["JP3"].ToString();
      this.txtJObservaciones.Text = dataTable1.Rows[0]["JOBSERVACIONES"].ToString();
      this.cmbKP1.Value = dataTable1.Rows[0]["KP1"].ToString();
      this.cmbKP2.Value = dataTable1.Rows[0]["KP2"].ToString();
      this.cmbKP3.Value = dataTable1.Rows[0]["KP3"].ToString();
      this.txtKObservaciones.Text = dataTable1.Rows[0]["KOBSERVACIONES"].ToString();
      this.txtCONDUCTA.Text = dataTable1.Rows[0]["CONDUCTA"].ToString();
      this.txtCONDUCTA_OBJPAC.Text = dataTable1.Rows[0]["CONDUCTA_OBJPAC"].ToString();
      this.txtCONDUCTA_OBJFAM.Text = dataTable1.Rows[0]["CONDUCTA_OBJFAM"].ToString();
      this.txtHABBASICA.Text = dataTable1.Rows[0]["HABBASICA"].ToString();
      this.txtHABBASICA_OBJPAC.Text = dataTable1.Rows[0]["HABBASICA_OBJPAC"].ToString();
      this.txtHABBASICA_OBJFAM.Text = dataTable1.Rows[0]["HABBASICA_OBJFAM"].ToString();
      this.txtHABVERBALES.Text = dataTable1.Rows[0]["HABVERBALES"].ToString();
      this.txtHABVERBALES_OBJPAC.Text = dataTable1.Rows[0]["HABVERBALES_OBJPAC"].ToString();
      this.txtHABVERBALES_OBJFAM.Text = dataTable1.Rows[0]["HABVERBALES_OBJFAM"].ToString();
      this.txtOTROS.Text = dataTable1.Rows[0]["OTROS"].ToString();
      this.txtOTROS_OBJPAC.Text = dataTable1.Rows[0]["OTROS_OBJPAC"].ToString();
      this.txtOTROS_OBJFAM.Text = dataTable1.Rows[0]["OTROS_OBJFAM"].ToString();
      this.cmbTipo.Disabled = true;
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CURRENTUSR_ID"]));
      if (dataTable2.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
    }
  }
}
