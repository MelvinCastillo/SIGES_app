// Decompiled with JetBrains decompiler
// Type: CAID.HCL00036
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
  public class HCL00036 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected DropDownList cmbObjetivo;
    protected RequiredFieldValidator valcmbObjetivo;
    protected Repeater rpIntervencion;
    protected Repeater rpEvaluacion;
    protected DropDownList cmbObjetivo2;
    protected RequiredFieldValidator valcmbObjetivo2;
    protected Repeater rpHistorico;

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
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300S5 @REFGUID = '{0}', @ROWSGXID = '{1}', @ESPGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbTipo.Value.ToString())).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbObjetivo2.Items.Clear();
      this.cmbObjetivo2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00300S5 @REFGUID = '{0}', @ROWSGXID = '{1}', @ESPGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbTipo.Value.ToString())).Rows)
        this.cmbObjetivo2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = ((LinkButton) sender).CommandArgument.ToString();
      string str2 = ((LinkButton) sender).CommandName.ToString();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00036SI] '{0}','{1}','{2}','{3}','{4}','{5}'", (object) str1, (object) str2, (object) xREFGUID, (object) xTERGUID, (object) str3, (object) str4)))
      {
        ((Site_Master) this.Master)._Notify("Registro Guardado");
        this.Validar();
        this._Show((object) null, (EventArgs) null);
      }
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.rpIntervencion.DataSource = (object) DB.ExecuteAdapter(string.Format("HCX00300_DS9 @REFGUID = '{0}', @OBJGUID = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], (object) this.cmbObjetivo.SelectedValue, this.Session["CURRENTUSR_SGXID"]));
      this.rpIntervencion.DataBind();
      this.rpEvaluacion.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00036V @REFGUID = '{0}', @TERGUID = '{1}', @ROWSGXID = '{2}', @OBJGUID = '{3}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CurrentUSR_TERID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbObjetivo.SelectedValue));
      this.rpEvaluacion.DataBind();
    }

    protected void _ShowH(object sender, EventArgs e)
    {
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00036H @REFGUID = '{0}', @ROWSGXID = '{1}', @OBJGUID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], (object) this.cmbObjetivo2.SelectedValue));
      this.rpHistorico.DataBind();
    }

    protected void _Remove(object sender, EventArgs e)
    {
      string str1 = ((LinkButton) sender).CommandArgument.ToString();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      this.Session["CurrentUSR_ROWGUID"].ToString();
      string str2 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID) || !DB.ExecuteNonQuery(string.Format("[HCL00036SD] '{0}','{1}'", (object) str1, (object) str2)))
        return;
      ((Site_Master) this.Master)._Notify("Registro Removido");
      this.Validar();
      this._Show((object) null, (EventArgs) null);
    }

    private void Validar()
    {
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
