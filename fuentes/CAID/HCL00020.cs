// Decompiled with JetBrains decompiler
// Type: CAID.HCL00020
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
  public class HCL00020 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl H1;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtObjetivosTrabajados;
    protected TextBox txtObservaciones;
    protected TextBox txtRecomendaciones;
    protected HtmlSelect cmbFormaComunicacion;
    protected HtmlSelect cmbPecs;
    protected HtmlSelect cmbPersonaSesion;
    protected TextBox txtParticipantes;
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
      string str1 = "";
      string str2 = this.txtObjetivosTrabajados.Text.Trim();
      string str3 = this.txtObservaciones.Text.Trim();
      string str4 = this.txtRecomendaciones.Text.Trim();
      string str5 = this.txtParticipantes.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str6 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str7 = this.Session["CURRENTUSR_SGXID"].ToString();
      string str8 = this.cmbPersonaSesion.Value.Trim();
      string str9 = this.cmbFormaComunicacion.Value.Trim();
      string str10 = this.cmbPecs.Value.Trim();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00020SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}'", (object) str1, (object) str3, (object) str4, (object) str5, (object) xREFGUID, (object) xTERGUID, (object) str6, (object) str7, (object) str2, (object) str8, (object) str9, (object) str10)))
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
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("HCL00020H @ROWSGXID = '{0}' , @REFGUID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"]));
      if (dataTable1.Rows.Count != 0)
      {
        if (dataTable1.Rows[0]["FORMACOMUNICACION"].ToString() != "")
          this.cmbFormaComunicacion.Value = dataTable1.Rows[0]["FORMACOMUNICACION"].ToString();
        if (dataTable1.Rows[0]["PECS"].ToString() != "")
          this.cmbPecs.Value = dataTable1.Rows[0]["PECS"].ToString();
      }
      this.Session["CurrentUSR_ROWGUID"].ToString();
      string str1 = this.Session["CurrentPAX_ROWGUID"].ToString();
      string str2 = this.Session["CurrentUSR_TERID"].ToString();
      this.txtObservaciones.Text = string.Empty;
      this.txtRecomendaciones.Text = string.Empty;
      this.txtParticipantes.Text = string.Empty;
      this.txtObjetivosTrabajados.Text = string.Empty;
      this.cmbPersonaSesion.Value = string.Empty;
      this.CE_PROTOSEGUI.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00000R1 @REFGUID = '{0}', @TERGUID\t='{1}', @NODO = 'CE_PROTOSEGUI'", (object) str1, (object) str2));
      this.CE_PROTOSEGUI.DataBind();
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CURRENTUSR_ID"]));
      if (dataTable2.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
