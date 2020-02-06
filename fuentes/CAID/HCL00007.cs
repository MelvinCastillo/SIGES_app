// Decompiled with JetBrains decompiler
// Type: CAID.HCL00007
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
  public class HCL00007 : Page
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
    protected HtmlSelect cmbPadre;
    protected RequiredFieldValidator valcmbPadre;
    protected HtmlSelect cmbMadre;
    protected RequiredFieldValidator valcmbMadre;
    protected HtmlSelect cmbHermano;
    protected RequiredFieldValidator valcmbHermano;
    protected HtmlSelect cmbAbuelos;
    protected RequiredFieldValidator valcmbAbuelos;
    protected HtmlSelect cmbDiscapacidadFamilia;
    protected RequiredFieldValidator valcmbDiscapacidadFamilia;
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
      this.txtEVALUACION.Text = "a) Padre:" + Environment.NewLine + "b) Madre:" + Environment.NewLine + "c) Hermano(s):" + Environment.NewLine + "d) Abuelos:" + Environment.NewLine + "n) Discapacidad en la familia:";
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.cmbPadre.Value.ToString();
      string str3 = this.cmbMadre.Value.ToString();
      string str4 = this.cmbHermano.Value.ToString();
      string str5 = this.cmbAbuelos.Value.ToString();
      string str6 = this.cmbDiscapacidadFamilia.Value.ToString();
      string str7 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str8 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str9 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00007SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) str6, (object) str7, (object) xREFGUID, (object) xTERGUID, (object) str8, (object) str9)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00007V @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count == 0)
        return;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300_DS7 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbObjetivo.Value = dataTable1.Rows[0]["OBJGUID"].ToString();
      this.cmbPadre.Value = Convert.ToBoolean(dataTable1.Rows[0]["PADRE"].ToString()) ? "1" : "0";
      this.cmbMadre.Value = Convert.ToBoolean(dataTable1.Rows[0]["MADRE"].ToString()) ? "1" : "0";
      this.cmbHermano.Value = Convert.ToBoolean(dataTable1.Rows[0]["HERMANOS"].ToString()) ? "1" : "0";
      this.cmbAbuelos.Value = Convert.ToBoolean(dataTable1.Rows[0]["ABUELOS"].ToString()) ? "1" : "0";
      this.cmbDiscapacidadFamilia.Value = Convert.ToBoolean(dataTable1.Rows[0]["DISCAPACIDADFAMILIA"].ToString()) ? "1" : "0";
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
