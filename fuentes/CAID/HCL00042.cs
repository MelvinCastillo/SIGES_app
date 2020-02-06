// Decompiled with JetBrains decompiler
// Type: CAID.HCL00042
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
  public class HCL00042 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl H1;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtParticipantes;
    protected RequiredFieldValidator valtxtParticipantes;
    protected TextBox txtTemasTrbajados;
    protected RequiredFieldValidator valtxtTemasTrbajados;
    protected TextBox txtTarea;
    protected RequiredFieldValidator valtxtTarea;
    protected HtmlButton btnSave;
    protected Repeater CE_PROTOSEGUI;

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
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.txtParticipantes.Text.Trim();
      string str2 = this.txtTemasTrbajados.Text.Trim();
      string str3 = this.txtTarea.Text.Trim();
      string str4 = "";
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str5 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str6 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00042SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) xREFGUID, (object) xTERGUID, (object) str5, (object) str6)))
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
      this.Session["CurrentUSR_ROWGUID"].ToString();
      string str = this.Session["CurrentPAX_ROWGUID"].ToString();
      this.Session["CurrentUSR_TERID"].ToString();
      this.txtParticipantes.Text = string.Empty;
      this.txtTemasTrbajados.Text = string.Empty;
      this.txtTarea.Text = string.Empty;
      this.CE_PROTOSEGUI.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00042H @REFGUID = '{0}', @ROWSGXID\t='{1}'", (object) str, this.Session["CURRENTUSR_SGXID"]));
      this.CE_PROTOSEGUI.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CURRENTUSR_ID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
