// Decompiled with JetBrains decompiler
// Type: CAID.HCL00011
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
  public class HCL00011 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlButton tbnAdd;
    protected Repeater rpHistorico;
    protected Panel MNTAUXILIAR;
    protected HtmlButton btnCloseMSG;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbObjetivo;
    protected RequiredFieldValidator cmbObjetivo1;
    protected HtmlSelect cmbDetalles;
    protected RequiredFieldValidator cmbDiagnostico1;
    protected TextBox txtEVALUACION;
    protected HtmlButton btnSaveNotas;
    protected HtmlGenericControl MainShadow;

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
      this.cmbDetalles.Items.Clear();
      this.cmbDetalles.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SMX30027S1 @NOMBRE = '{0}', @ROWSGXID = '{1}'", (object) "%%", this.Session["CURRENTUSR_SGXID"])).Rows)
        this.cmbDetalles.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Add(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Add("class", "navi");
      this.MNTAUXILIAR.Visible = true;
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.cmbDetalles.Value.ToString();
      string str3 = this.cmbDetalles.Value.ToString();
      string text = this.cmbDetalles.Items[this.cmbDetalles.SelectedIndex].Text;
      string str4 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str5 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str6 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00011SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}'", (object) str1, (object) str2, (object) str3, (object) text, (object) str4, (object) xREFGUID, (object) xTERGUID, (object) str5, (object) str6)))
        this.Validar();
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (!this.MNTAUXILIAR.Visible)
        return;
      this.MNTAUXILIAR.Visible = false;
    }

    private void Validar()
    {
      this.cmbDetalles.Value = string.Empty;
      this.txtEVALUACION.Text = string.Empty;
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00011H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpHistorico.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
