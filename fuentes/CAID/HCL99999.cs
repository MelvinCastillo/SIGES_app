// Decompiled with JetBrains decompiler
// Type: CAID.HCL99999
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
  public class HCL99999 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlSelect cmbPersonaSesion;
    protected HtmlInputText txtDetalles;
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
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      string str2 = this.txtEVALUACION.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      string str5 = this.cmbPersonaSesion.Value.Trim();
      string str6 = this.txtDetalles.Value.Trim();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL99999SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}'", (object) str1, (object) str2, (object) xREFGUID, (object) xTERGUID, (object) str3, (object) str4, (object) str5, (object) str6)))
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add(this.Session["CITA_ID"]);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
        this.xQuery = "SMX00500P2";
        if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        {
          this.Session["CITA_ID"] = (object) string.Empty;
          this.Response.Redirect("INDEX_T.ASPX");
        }
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      if (DB.ExecuteAdapter(string.Format("HCL99999V @TERGUID = '{0}', @ROWSGXID = '{1}', @REFGUID = '{2}'", this.Session["CurrentUSR_TERID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentPAX_ROWGUID"])).Rows.Count == 0)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add(this.Session["CITA_ID"]);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add(this.Session["CurrentUSR_TERID"]);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQuery = "SMX00500P2";
      if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
      {
        this.Session["CITA_ID"] = (object) string.Empty;
        this.Response.Redirect("INDEX_T.ASPX");
      }
    }
  }
}
