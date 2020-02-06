// Decompiled with JetBrains decompiler
// Type: CAID.HCL00008
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
  public class HCL00008 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlButton btnSave;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbObjetivo;
    protected RequiredFieldValidator cmbObjetivo1;
    protected HtmlSelect cmbDP1;
    protected HtmlSelect cmbEDADDP1;
    protected HtmlSelect cmbDP2;
    protected HtmlSelect cmbEDADDP2;
    protected HtmlSelect cmbDP3;
    protected HtmlSelect cmbEDADDP3;
    protected HtmlSelect cmbDP4;
    protected HtmlSelect cmbEDADDP4;
    protected HtmlSelect cmbDP5;
    protected HtmlSelect cmbEDADDP5;
    protected HtmlSelect cmbDP6;
    protected HtmlSelect cmbEDADDP6;
    protected HtmlSelect cmbDP7;
    protected HtmlSelect cmbEDADDP7;
    protected HtmlSelect cmbDP8;
    protected HtmlSelect cmbEDADDP8;
    protected HtmlSelect cmbDP9;
    protected HtmlSelect cmbEDADDP9;
    protected HtmlSelect cmbDP10;
    protected HtmlSelect cmbEDADDP10;
    protected HtmlSelect cmbDP11;
    protected HtmlSelect cmbEDADDP11;
    protected HtmlSelect cmbDP12;
    protected HtmlSelect cmbEDADDP12;
    protected HtmlSelect cmbDP13;
    protected HtmlSelect cmbEDADDP13;
    protected HtmlSelect cmbDP14;
    protected HtmlSelect cmbEDADDP14;
    protected TextBox txtEVALUACION;

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
      this.cmbDP1.Items.Clear();
      this.cmbDP1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP2.Items.Clear();
      this.cmbDP2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP3.Items.Clear();
      this.cmbDP3.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP4.Items.Clear();
      this.cmbDP4.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP5.Items.Clear();
      this.cmbDP5.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP6.Items.Clear();
      this.cmbDP6.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP7.Items.Clear();
      this.cmbDP7.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP8.Items.Clear();
      this.cmbDP8.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP9.Items.Clear();
      this.cmbDP9.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP10.Items.Clear();
      this.cmbDP10.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP11.Items.Clear();
      this.cmbDP11.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP12.Items.Clear();
      this.cmbDP12.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP13.Items.Clear();
      this.cmbDP13.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDP14.Items.Clear();
      this.cmbDP14.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vR_DESARROLLOPSICOMOTOR ORDER BY ROWGUID").Rows)
      {
        this.cmbDP1.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP3.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP4.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP5.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP6.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP7.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP8.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP9.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP10.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP11.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP12.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP13.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbDP14.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
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
      this.txtEVALUACION.Text = "a)\tSostén cefálico:" + Environment.NewLine + "b)\tSonrisa social:" + Environment.NewLine + "c)\tGiro sobre su eje:" + Environment.NewLine + "d)\tSedestación:" + Environment.NewLine + "e)\tGateo:" + Environment.NewLine + "f)\tBipedestación:" + Environment.NewLine + "g)\tMarcha independiente:" + Environment.NewLine + "h)\tBisílabos:" + Environment.NewLine + "i)\tFrases de 2 palabras:" + Environment.NewLine + "j)\tFrases de 3 palabras:" + Environment.NewLine + "k)\tControl de esfínteres:" + Environment.NewLine + "l)\tAmbulación asistida:" + Environment.NewLine + "m)\tAmbulación libre:" + Environment.NewLine + "n)\tCorrer, trepar, subir escaleras:";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.cmbDP1.Value.ToString();
      string str3 = this.cmbDP2.Value.ToString();
      string str4 = this.cmbDP3.Value.ToString();
      string str5 = this.cmbDP4.Value.ToString();
      string str6 = this.cmbDP5.Value.ToString();
      string str7 = this.cmbDP6.Value.ToString();
      string str8 = this.cmbDP7.Value.ToString();
      string str9 = this.cmbDP8.Value.ToString();
      string str10 = this.cmbDP9.Value.ToString();
      string str11 = this.cmbDP10.Value.ToString();
      string str12 = this.cmbDP11.Value.ToString();
      string str13 = this.cmbDP12.Value.ToString();
      string str14 = this.cmbDP13.Value.ToString();
      string str15 = this.cmbDP14.Value.ToString();
      string str16 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str17 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str18 = this.Session["CURRENTUSR_SGXID"].ToString();
      string str19 = this.cmbEDADDP1.Value.ToString();
      string str20 = this.cmbEDADDP2.Value.ToString();
      string str21 = this.cmbEDADDP3.Value.ToString();
      string str22 = this.cmbEDADDP4.Value.ToString();
      string str23 = this.cmbEDADDP5.Value.ToString();
      string str24 = this.cmbEDADDP6.Value.ToString();
      string str25 = this.cmbEDADDP7.Value.ToString();
      string str26 = this.cmbEDADDP8.Value.ToString();
      string str27 = this.cmbEDADDP9.Value.ToString();
      string str28 = this.cmbEDADDP10.Value.ToString();
      string str29 = this.cmbEDADDP11.Value.ToString();
      string str30 = this.cmbEDADDP12.Value.ToString();
      string str31 = this.cmbEDADDP13.Value.ToString();
      string str32 = this.cmbEDADDP14.Value.ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00008SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}', '{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}','{25}','{26}','{27}','{28}','{29}','{30}','{31}','{32}','{33}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) str8, (object) str9, (object) str10, (object) str11, (object) str12, (object) str13, (object) str14, (object) str15, (object) str16, (object) xREFGUID, (object) xTERGUID, (object) str17, (object) str18, (object) str19, (object) str20, (object) str21, (object) str22, (object) str23, (object) str24, (object) str25, (object) str26, (object) str27, (object) str28, (object) str29, (object) str30, (object) str31, (object) str32)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00008V @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS7 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.txtEVALUACION.Text = dataTable1.Rows[0]["DATOS"].ToString();
      this.cmbDP1.Value = dataTable1.Rows[0]["DP1"].ToString();
      this.cmbDP2.Value = dataTable1.Rows[0]["DP2"].ToString();
      this.cmbDP3.Value = dataTable1.Rows[0]["DP3"].ToString();
      this.cmbDP4.Value = dataTable1.Rows[0]["DP4"].ToString();
      this.cmbDP5.Value = dataTable1.Rows[0]["DP5"].ToString();
      this.cmbDP6.Value = dataTable1.Rows[0]["DP6"].ToString();
      this.cmbDP7.Value = dataTable1.Rows[0]["DP7"].ToString();
      this.cmbDP8.Value = dataTable1.Rows[0]["DP8"].ToString();
      this.cmbDP9.Value = dataTable1.Rows[0]["DP9"].ToString();
      this.cmbDP10.Value = dataTable1.Rows[0]["DP10"].ToString();
      this.cmbDP11.Value = dataTable1.Rows[0]["DP11"].ToString();
      this.cmbDP12.Value = dataTable1.Rows[0]["DP12"].ToString();
      this.cmbDP13.Value = dataTable1.Rows[0]["DP13"].ToString();
      this.cmbDP14.Value = dataTable1.Rows[0]["DP14"].ToString();
      this.cmbEDADDP1.Value = dataTable1.Rows[0]["EDADDP1"].ToString();
      this.cmbEDADDP2.Value = dataTable1.Rows[0]["EDADDP2"].ToString();
      this.cmbEDADDP3.Value = dataTable1.Rows[0]["EDADDP3"].ToString();
      this.cmbEDADDP4.Value = dataTable1.Rows[0]["EDADDP4"].ToString();
      this.cmbEDADDP5.Value = dataTable1.Rows[0]["EDADDP5"].ToString();
      this.cmbEDADDP6.Value = dataTable1.Rows[0]["EDADDP6"].ToString();
      this.cmbEDADDP7.Value = dataTable1.Rows[0]["EDADDP7"].ToString();
      this.cmbEDADDP8.Value = dataTable1.Rows[0]["EDADDP8"].ToString();
      this.cmbEDADDP9.Value = dataTable1.Rows[0]["EDADDP9"].ToString();
      this.cmbEDADDP10.Value = dataTable1.Rows[0]["EDADDP10"].ToString();
      this.cmbEDADDP11.Value = dataTable1.Rows[0]["EDADDP11"].ToString();
      this.cmbEDADDP12.Value = dataTable1.Rows[0]["EDADDP12"].ToString();
      this.cmbEDADDP13.Value = dataTable1.Rows[0]["EDADDP13"].ToString();
      this.cmbEDADDP14.Value = dataTable1.Rows[0]["EDADDP14"].ToString();
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
