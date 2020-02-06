// Decompiled with JetBrains decompiler
// Type: CAID.HCL00018
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
  public class HCL00018 : Page
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
    protected HtmlSelect cmbProxProceso;
    protected RequiredFieldValidator valcmbProxProceso;
    protected CheckBoxList ckPruebas;
    protected HtmlInputText txtOtrosPruebas;
    protected TextBox txtEVALUACION;
    protected RequiredFieldValidator txtEVALUACIONval;
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
      this.cmbProxProceso.Items.Clear();
      this.cmbProxProceso.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vPLAN_PROXIMOPROCESO").Rows)
        this.cmbProxProceso.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.ckPruebas.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vPLAN_PRUEBASCOMPLEMENTARIAS").Rows)
        this.ckPruebas.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      for (int index = 0; index < this.ckPruebas.Items.Count; ++index)
      {
        if (this.ckPruebas.Items[index].Selected)
          str1 = str1 + "," + this.ckPruebas.Items[index].Value.Trim();
      }
      if (str1 != "")
        str1 = str1.Remove(0, 1);
      string str2 = this.cmbObjetivo.Value.ToString();
      string str3 = this.cmbProxProceso.Value.ToString();
      string str4 = this.txtOtrosPruebas.Value.ToString();
      string str5 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str6 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str7 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00018SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}'", (object) str2, (object) str3, (object) str1, (object) str4, (object) str5, (object) xREFGUID, (object) xTERGUID, (object) str6, (object) str7)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00018V @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.Session["CurrentUSR_TERID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
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
      string[] strArray = dataTable1.Rows[0]["PRUEBACOMPLEMENTARIA"].ToString().Split(chArray);
      if (strArray[0] != "")
      {
        foreach (string str in strArray)
          this.ckPruebas.Items.FindByValue(str).Selected = true;
      }
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.cmbProxProceso.Value = dataTable1.Rows[0]["PROXIMAEVALUACION"].ToString();
      this.txtOtrosPruebas.Value = dataTable1.Rows[0]["OTROS"].ToString();
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
