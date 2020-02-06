// Decompiled with JetBrains decompiler
// Type: CAID.SMX00300
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
  public class SMX00300 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnShow;
    protected Repeater rpData;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlButton btnBack;
    protected HtmlInputText txtIdLocal;
    protected RequiredFieldValidator valtxtIdLocal;
    protected HtmlInputText txtNombre1;
    protected HtmlInputText txtNombre2;
    protected HtmlInputText txtApodo;
    protected RequiredFieldValidator valtxtNombre1;
    protected HtmlInputText txtApellido1;
    protected HtmlInputText txtApellido2;
    protected RequiredFieldValidator txttxtApellido1;
    protected HtmlInputText txtCedula;
    protected HtmlInputText txtNSS;
    protected HtmlInputText txtPasaporte;
    protected RequiredFieldValidator valtxtCedula;
    protected HtmlInputText txtFechaNace;
    protected RequiredFieldValidator valtxtFechaNace;
    protected HtmlSelect cmbClaseId;
    protected RequiredFieldValidator valcmbClaseId;
    protected HtmlSelect cmbEspMed;
    protected RequiredFieldValidator valcmbEspMed;
    protected HtmlSelect cmbTanda;
    protected RequiredFieldValidator cmbTanda1;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string PROFESIONALID
    {
      get
      {
        return this.txtIdLocal.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRE1
    {
      get
      {
        return this.txtNombre1.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRE2
    {
      get
      {
        return this.txtNombre2.Value.ToString().Trim().ToUpper();
      }
    }

    private string APELLIDO1
    {
      get
      {
        return this.txtApellido1.Value.ToString().Trim().ToUpper();
      }
    }

    private string APELLIDO2
    {
      get
      {
        return this.txtApellido2.Value.ToString().Trim().ToUpper();
      }
    }

    private string APODO
    {
      get
      {
        return this.txtApodo.Value.ToString().Trim().ToUpper();
      }
    }

    private string FNACE
    {
      get
      {
        return this.txtFechaNace.Value.ToString();
      }
    }

    private string ESPECIALIDADID
    {
      get
      {
        return this.cmbEspMed.Value.ToString().Trim().ToUpper();
      }
    }

    private string NSSID
    {
      get
      {
        return this.txtNSS.Value.ToString().Trim().ToUpper();
      }
    }

    private string CEDULAID
    {
      get
      {
        return this.txtCedula.Value.ToString().Trim().ToUpper();
      }
    }

    private string PASAPORTEID
    {
      get
      {
        return this.txtPasaporte.Value.ToString().Trim().ToUpper();
      }
    }

    private int CLASEID
    {
      get
      {
        return Convert.ToInt32(this.cmbClaseId.Value.ToString());
      }
    }

    private int TANDA
    {
      get
      {
        return Convert.ToInt32(this.cmbTanda.Value.ToString());
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.xGUID.Value.ToString().ToUpper();
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
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
        this.Response.Redirect("login.aspx");
      ((Site_Master) this.Master)._ValidaAccesoPagina(this.xBase + ".aspx");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.btnNew.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbEspMed.Items.Clear();
      this.cmbEspMed.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30013S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbEspMed.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.rpData.DataSource = (object) null;
        this.rpData.DataBind();
        this._IniciarControles();
      }
      else
      {
        this.xGUID.Value = str;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = this.xBase + "S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
        if (dataRow == null)
          return;
        this.txtIdLocal.Value = dataRow["PROFESIONALID"].ToString();
        this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
        this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
        this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
        this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
        this.txtApodo.Value = dataRow["APODO"].ToString();
        this.cmbClaseId.Value = dataRow["CLASEID"].ToString();
        this.cmbClaseId.Disabled = true;
        this.txtNSS.Value = dataRow["NSSID"].ToString();
        this.txtCedula.Value = dataRow["CEDULAID"].ToString();
        this.txtPasaporte.Value = dataRow["PASAPORTEID"].ToString();
        this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
        this.cmbEspMed.Value = dataRow["ESPECIALIDADID"].ToString();
        this.cmbTanda.Value = dataRow["TANDA"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.txtIdLocal.Value = string.Empty;
      this.txtIdLocal.Disabled = false;
      this.txtNombre1.Value = string.Empty;
      this.txtNombre1.Disabled = false;
      this.txtNombre2.Value = string.Empty;
      this.txtNombre2.Disabled = false;
      this.txtApellido1.Value = string.Empty;
      this.txtApellido1.Disabled = false;
      this.txtApellido2.Value = string.Empty;
      this.txtApellido2.Disabled = false;
      this.txtApodo.Value = string.Empty;
      this.cmbClaseId.Value = string.Empty;
      this.cmbClaseId.Disabled = false;
      this.txtNSS.Value = string.Empty;
      this.txtCedula.Value = string.Empty;
      this.txtPasaporte.Value = string.Empty;
      this.cmbTanda.Value = string.Empty;
      this.txtFechaNace.Value = string.Empty;
      this.cmbEspMed.Value = string.Empty;
    }

    private void _IniciarFormulario()
    {
      if (this.Request.QueryString["X"] == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
      this._Show((object) null, (EventArgs) null);
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S1";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "Edit")
        {
          if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
            return;
          this.Response.Redirect(this.xBase + ".aspx?X=" + this.ROWGUID);
        }
        if (this.xCommand == "Delete" && Convert.ToBoolean(this.Session["CURRENTUSR_fnELIMINAR"].ToString()))
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) this.ROWGUID);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          this.xQuery = this.xBase + "SD";
          if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            this._Show((object) null, (EventArgs) null);
        }
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      string[] strArray = this.FNACE.Split('/');
      DateTime dateTime = new DateTime(Convert.ToInt32(strArray[2]), Convert.ToInt32(strArray[0]), Convert.ToInt32(strArray[1]));
      this.xQueryParameters.Add((object) "@PROFESIONALID");
      this.xQueryValues.Add((object) this.PROFESIONALID);
      this.xQueryParameters.Add((object) "@NOMBRE1");
      this.xQueryValues.Add((object) this.NOMBRE1);
      this.xQueryParameters.Add((object) "@NOMBRE2");
      this.xQueryValues.Add((object) this.NOMBRE2);
      this.xQueryParameters.Add((object) "@APELLIDO1");
      this.xQueryValues.Add((object) this.APELLIDO1);
      this.xQueryParameters.Add((object) "@APELLIDO2");
      this.xQueryValues.Add((object) this.APELLIDO2);
      this.xQueryParameters.Add((object) "@APODO");
      this.xQueryValues.Add((object) this.APODO);
      this.xQueryParameters.Add((object) "@FNACE");
      this.xQueryValues.Add((object) dateTime.ToString("MM/dd/yyyy"));
      this.xQueryParameters.Add((object) "@ESPECIALIDADID");
      this.xQueryValues.Add((object) this.ESPECIALIDADID);
      this.xQueryParameters.Add((object) "@CLASEID");
      this.xQueryValues.Add((object) this.CLASEID);
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.CEDULAID);
      this.xQueryParameters.Add((object) "@NSSID");
      this.xQueryValues.Add((object) this.NSSID);
      this.xQueryParameters.Add((object) "@PASAPORTEID");
      this.xQueryValues.Add((object) this.PASAPORTEID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@TANDA");
      this.xQueryValues.Add((object) this.TANDA);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
      this._Show((object) null, (EventArgs) null);
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }
  }
}
