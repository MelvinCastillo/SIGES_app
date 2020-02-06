// Decompiled with JetBrains decompiler
// Type: CAID.HCL00034
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
  public class HCL00034 : Page
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
    protected DropDownList cmbCitados;
    protected RequiredFieldValidator RequiredFieldValidator2;
    protected TextBox txtDATOS1;
    protected RequiredFieldValidator txtDATOS1val;
    protected TextBox txtDATOS2;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlButton btnSave;
    protected Repeater rpData;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string TERID
    {
      get
      {
        return this.Session["CurrentUSR_TERID"].ToString();
      }
    }

    private string ROWUSERID
    {
      get
      {
        return this.Session["CURRENTUSR_ID"].ToString();
      }
    }

    private string ROWSGXID
    {
      get
      {
        return this.Session["CURRENTUSR_SGXID"].ToString();
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
      this.rpData.DataSource = (object) DB.ExecuteAdapter(string.Format("SMX00500P9 @TERGUID = '{0}',@MM = {1}, @YY = {2}, @ROWSGXID = '{3}'", (object) this.TERID, (object) DateTime.Now.Month, (object) DateTime.Now.Year, (object) this.ROWSGXID));
      this.rpData.DataBind();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) DateTime.Now.ToString("MM/dd/yyyy"));
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESPECIALISTA");
      this.xQueryValues.Add((object) this.TERID);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) 1);
      this.xQuery = "SMX00500S3";
      DataTable dataTable1 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.cmbCitados.Items.Clear();
      this.cmbCitados.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) dataTable1.Rows)
        this.cmbCitados.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable2.Rows.Count != 0)
      {
        this.Session.Add("xHTML_Options", (object) dataTable2.Rows[0]["HTML_Options"].ToString());
        ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      }
    }

    protected void cmbCitados_SelectedIndexChanged(object sender, EventArgs e)
    {
      try
      {
        DataTable dataTable = DB.ExecuteAdapter(string.Format("SELECT DETALLES FROM SMX00500 WHERE ROWGUID = '{0}'", (object) this.cmbCitados.SelectedValue.ToString()));
        if (dataTable.Rows.Count == 0)
          return;
        this.txtDATOS1.Text = dataTable.Rows[0][0].ToString();
        this.txtDATOS1.ReadOnly = true;
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()) || this.txtDATOS1.Text.Trim() == string.Empty)
        return;
      string str1 = this.cmbObjetivo.Value.ToString();
      string str2 = this.txtDATOS1.Text.Trim();
      string str3 = this.txtDATOS2.Text.Trim();
      string empty1 = string.Empty;
      string empty2 = string.Empty;
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str4 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str5 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00034SI] '{0}','{1}','{2}','{3}','{4}','{5}', '{6}','{7}','{8}'", (object) str1, (object) str2, (object) str3, (object) empty1, (object) empty2, (object) xREFGUID, (object) xTERGUID, (object) str4, (object) str5)))
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
      this.txtDATOS1.Text = string.Empty;
      this.txtDATOS2.Text = string.Empty;
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
