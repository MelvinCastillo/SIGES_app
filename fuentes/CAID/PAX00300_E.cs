// Decompiled with JetBrains decompiler
// Type: CAID.PAX00300_E
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class PAX00300_E : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string CATEGORIAID = string.Empty;
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnBack;
    protected HtmlInputText txtNombre1;
    protected HtmlInputText txtNombre2;
    protected HtmlInputText txtApodo;
    protected RequiredFieldValidator valtxtNombre1;
    protected HtmlInputText txtApellido1;
    protected HtmlInputText txtApellido2;
    protected RequiredFieldValidator txttxtApellido1;
    protected HtmlSelect cmbSexo;
    protected RequiredFieldValidator valcmbSexo;
    protected HtmlInputText txtNSS;
    protected RequiredFieldValidator valtxtNSS;
    protected HtmlInputText txtFechaNace;
    protected RequiredFieldValidator valtxtFechaNace;
    protected DropDownList cmbPais;
    protected RequiredFieldValidator valcmbPais;
    protected HtmlSelect cmbCiudad;
    protected RequiredFieldValidator valcmbCiudad;
    protected HtmlSelect cmbCondicion;
    protected RequiredFieldValidator valcmbCondicion;
    protected HtmlSelect cmbResideCon;
    protected HtmlInputText txtResideCon;
    protected RequiredFieldValidator valcmbResideCon;
    protected HtmlSelect cmbCuidadoPor;
    protected HtmlInputText txtCuidadoPor;
    protected RequiredFieldValidator valcmbCuidadoPor;
    protected HtmlSelect cmbARS;
    protected RequiredFieldValidator valcmbARS;
    protected HtmlButton btnDirecciones;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
        return Convert.ToDateTime(this.txtFechaNace.Value.ToString()).ToString("MM-dd-yyyy");
      }
    }

    private string PAISID
    {
      get
      {
        return this.cmbPais.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string CIUDADID
    {
      get
      {
        return this.cmbCiudad.Value.ToString().Trim().ToUpper();
      }
    }

    private string SEXOID
    {
      get
      {
        return this.cmbSexo.Value.ToString().Trim().ToUpper();
      }
    }

    private int ESASEGURADO
    {
      get
      {
        return this.cmbARS.Value.ToString().Trim().ToUpper() != string.Empty ? 1 : 0;
      }
    }

    private string ARSID
    {
      get
      {
        return this.cmbARS.Value.ToString().Trim().ToUpper();
      }
    }

    private string NSSID
    {
      get
      {
        return this.txtNSS.Value.ToString().Trim().ToUpper();
      }
    }

    private int COINDICION
    {
      get
      {
        return Convert.ToInt32(this.cmbCondicion.Value.ToString());
      }
    }

    private int RESIDECON
    {
      get
      {
        return Convert.ToInt32(this.cmbResideCon.Value.ToString());
      }
    }

    private string RESIDECON1
    {
      get
      {
        return this.txtResideCon.Value.ToString().Trim().ToUpper();
      }
    }

    private int CUIDADOPOR
    {
      get
      {
        return Convert.ToInt32(this.cmbCuidadoPor.Value.ToString());
      }
    }

    private string CUIDADOPOR1
    {
      get
      {
        return this.txtCuidadoPor.Value.ToString().Trim().ToUpper();
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

    private string ROOTDIRECTORY
    {
      get
      {
        return this.Server.MapPath(".\\records\\") + this.ROWGUID;
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
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this._Inicio();
    }

    private void _Iniciar()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbPais.Items.Clear();
      this.cmbCiudad.Items.Clear();
      this.cmbARS.Items.Clear();
      this.cmbPais.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbCiudad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPais.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
      }
      else if (str == "DATA")
      {
        this._Show((object) null, (EventArgs) null);
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
        this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
        this.txtNombre1.Disabled = true;
        this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
        this.txtNombre2.Disabled = true;
        this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
        this.txtApellido1.Disabled = true;
        this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
        this.txtApellido2.Disabled = true;
        this.txtApodo.Value = dataRow["APODO"].ToString();
        this.cmbSexo.Value = dataRow["SEXOID"].ToString();
        this.cmbSexo.Disabled = true;
        this.txtNSS.Value = dataRow["NSSID"].ToString();
        this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
        this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
        this._FillCiudades();
        this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
        this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
        this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
        this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
        this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
        this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
        this.cmbARS.Value = dataRow["ARSID"].ToString();
      }
    }

    private void _Inicio()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbPais.Items.Clear();
      this.cmbCiudad.Items.Clear();
      this.cmbARS.Items.Clear();
      this.cmbPais.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbCiudad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPais.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xGUID.Value = this.Request.QueryString["X"];
      this.xQueryParameters.Add((object) "@GUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00000S2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
      this.txtNombre1.Value = dataRow["NOMBRE1"].ToString();
      this.txtNombre1.Disabled = false;
      this.txtNombre2.Value = dataRow["NOMBRE2"].ToString();
      this.txtNombre2.Disabled = false;
      this.txtApellido1.Value = dataRow["APELLIDO1"].ToString();
      this.txtApellido1.Disabled = false;
      this.txtApellido2.Value = dataRow["APELLIDO2"].ToString();
      this.txtApellido2.Disabled = false;
      this.txtApodo.Value = dataRow["APODO"].ToString();
      this.cmbSexo.Value = dataRow["SEXOID"].ToString();
      this.cmbSexo.Disabled = false;
      this.txtNSS.Value = dataRow["NSSID"].ToString();
      this.txtFechaNace.Value = Convert.ToDateTime(dataRow["FNACE"].ToString()).ToString("MM/dd/yyyy");
      this.cmbPais.SelectedValue = dataRow["PAISID"].ToString();
      this._FillCiudades();
      this.cmbCiudad.Value = dataRow["CIUDADID"].ToString();
      this.cmbCondicion.Value = dataRow["COINDICION"].ToString();
      this.cmbResideCon.Value = dataRow["RESIDECON"].ToString();
      this.txtResideCon.Value = dataRow["RESIDECON1"].ToString();
      this.cmbCuidadoPor.Value = dataRow["CUIDADOPOR"].ToString();
      this.txtCuidadoPor.Value = dataRow["CUIDADOPOR1"].ToString();
      this.cmbARS.Value = dataRow["ARSID"].ToString();
    }

    private void _IniciarControles()
    {
      this.txtNombre1.Value = string.Empty;
      this.txtNombre1.Disabled = false;
      this.txtNombre2.Value = string.Empty;
      this.txtNombre2.Disabled = false;
      this.txtApellido1.Value = string.Empty;
      this.txtApellido1.Disabled = false;
      this.txtApellido2.Value = string.Empty;
      this.txtApellido2.Disabled = false;
      this.txtApodo.Value = string.Empty;
      this.cmbSexo.Value = string.Empty;
      this.cmbSexo.Disabled = false;
      this.txtNSS.Value = string.Empty;
      this.txtFechaNace.Value = string.Empty;
      this.cmbPais.SelectedValue = (string) CURRENTUSR.DEFAULT_PAIS;
      this._FillCiudades();
      this.cmbCiudad.Value = string.Empty;
      this.cmbCondicion.Value = string.Empty;
      this.cmbResideCon.Value = string.Empty;
      this.txtResideCon.Value = string.Empty;
      this.cmbCuidadoPor.Value = string.Empty;
      this.txtCuidadoPor.Value = string.Empty;
      this.cmbARS.Value = string.Empty;
    }

    private void _IniciarFormulario()
    {
      if (this.Request.QueryString["X"] == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
      this._Show((object) null, (EventArgs) null);
    }

    private void _FillCiudades()
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@PAISID");
        this.xQueryValues.Add((object) this.PAISID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbCiudad.Items.Clear();
        this.cmbCiudad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbCiudad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      catch
      {
      }
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Export(object sender, EventArgs e)
    {
      this.Response.Redirect(this.xBase + "R1.aspx");
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
      this.xQueryValues.Add((object) this.FNACE);
      this.xQueryParameters.Add((object) "@PAISID");
      this.xQueryValues.Add((object) this.PAISID);
      this.xQueryParameters.Add((object) "@CIUDADID");
      this.xQueryValues.Add((object) this.CIUDADID);
      this.xQueryParameters.Add((object) "@SEXOID");
      this.xQueryValues.Add((object) this.SEXOID);
      this.xQueryParameters.Add((object) "@ESASEGURADO");
      this.xQueryValues.Add((object) this.ESASEGURADO);
      this.xQueryParameters.Add((object) "@ARSID");
      this.xQueryValues.Add((object) this.ARSID);
      this.xQueryParameters.Add((object) "@NSSID");
      this.xQueryValues.Add((object) this.NSSID);
      this.xQueryParameters.Add((object) "@COINDICION");
      this.xQueryValues.Add((object) this.COINDICION);
      this.xQueryParameters.Add((object) "@RESIDECON");
      this.xQueryValues.Add((object) this.RESIDECON);
      this.xQueryParameters.Add((object) "@RESIDECON1");
      this.xQueryValues.Add((object) this.RESIDECON1);
      this.xQueryParameters.Add((object) "@CUIDADOPOR");
      this.xQueryValues.Add((object) this.CUIDADOPOR);
      this.xQueryParameters.Add((object) "@CUIDADOPOR1");
      this.xQueryValues.Add((object) this.CUIDADOPOR1);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00300_P";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.Response.Redirect("PAX00300.aspx?X=DATA");
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this.Response.Redirect("PAX00300.aspx?X=DATA");
    }

    protected void cmbPais_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._FillCiudades();
    }

    protected void _OpenModalNF(object sender, EventArgs e)
    {
      ((Site_Master) this.Master)._OpenPAX00001(this.ROWGUID, Guid.NewGuid().ToString().ToUpper());
    }

    protected void _OpenModalDirecciones(object sender, EventArgs e)
    {
      ((Site_Master) this.Master)._OpenSMX00100(this.ROWGUID, Guid.NewGuid().ToString().ToUpper());
    }
  }
}
