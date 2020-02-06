// Decompiled with JetBrains decompiler
// Type: CAID.Site_Master
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class Site_Master : MasterPage
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected Literal MenuTop;
    protected HtmlAnchor lblEmpresa;
    protected HtmlAnchor lblUsuario;
    protected Repeater MenuLeft;
    protected Literal _MenuActoMedico;
    protected HtmlForm frmWebSite;
    protected HiddenField xMAINPAXGUID;
    protected HiddenField xMAINPAXNAM;
    protected HiddenField xREFGUID;
    protected HiddenField xTOKEN;
    protected ContentPlaceHolder MainContent;
    protected Panel SMX00100;
    protected HtmlInputText txtDirDireccion;
    protected DropDownList cmbDirPais;
    protected DropDownList cmbDirProvincia;
    protected DropDownList cmbDirMunicipio;
    protected HtmlSelect cmbDirSector;
    protected HtmlSelect cmbDirZona;
    protected HtmlInputText txtDirTel1;
    protected HtmlSelect cmbPropietarioTel1;
    protected HtmlInputText txtDirTel2;
    protected HtmlSelect cmbPropietarioTel2;
    protected HtmlInputText txtDirTel3;
    protected HtmlSelect cmbPropietarioTel3;
    protected HtmlInputText txtDirTel4;
    protected HtmlSelect cmbPropietarioTel4;
    protected HtmlButton btnSaveDireccion;
    protected HtmlButton btnCancel;
    protected Panel PAX00001;
    protected HtmlSelect cmbNFParentesco;
    protected HtmlInputText txtNFCedula;
    protected HtmlInputText txtNFPasaporte;
    protected HtmlInputText txtNFNombre1;
    protected HtmlInputText txtNFNombre2;
    protected HtmlInputText txtNFApellido1;
    protected HtmlInputText txtNFApellido2;
    protected HtmlInputText txtNFFechaNace;
    protected HtmlSelect cmbNFEscolaridad;
    protected HtmlSelect cmbNFEstadoCivil;
    protected HtmlSelect cmbNFTrabaja;
    protected HtmlSelect cmbNFRangoSalarial;
    protected Repeater rpNucleoFamiliar;
    protected HtmlButton Button3;
    protected HtmlButton Button4;
    protected Panel MSGALERT;
    protected HtmlButton Button5;
    protected HtmlGenericControl lblMsgAlert;
    protected HtmlGenericControl MainShadow;

    public string REPORT_URL
    {
      get
      {
        return this.Session["REPORT_URL"].ToString();
      }
    }

    public DataTable REPORT_DATASOURCE
    {
      get
      {
        return DB.ExecuteAdapter(this.Session["REPORT_DATASOURCE"].ToString());
      }
    }

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private DataTable xOpcionesTop
    {
      get
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQueryParameters.Add((object) "@MNUTYPE");
        this.xQueryValues.Add((object) "TOP");
        this.xQueryParameters.Add((object) "@USERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        return DB.ExecuteAdapter("SGX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      }
    }

    private DataTable xOpcionesFav
    {
      get
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQueryParameters.Add((object) "@MNUTYPE");
        this.xQueryValues.Add((object) "FAV");
        this.xQueryParameters.Add((object) "@USERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        return DB.ExecuteAdapter("SGX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      }
    }

    private string REFGUID_DIR
    {
      get
      {
        return this.xREFGUID.Value.ToString().ToUpper();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.xTOKEN.Value;
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

    private string DIRECCION
    {
      get
      {
        return this.txtDirDireccion.Value.ToString().ToUpper();
      }
    }

    private string PAISID
    {
      get
      {
        return this.cmbDirPais.SelectedValue.ToString().ToUpper();
      }
    }

    private string MUNICIPIOID
    {
      get
      {
        return this.cmbDirMunicipio.SelectedValue.ToString().ToUpper();
      }
    }

    private string PROVINCIAID
    {
      get
      {
        return this.cmbDirProvincia.SelectedValue.ToString().ToUpper();
      }
    }

    private string SECTORID
    {
      get
      {
        return this.cmbDirSector.Value.ToString().ToUpper();
      }
    }

    private string ZONAID
    {
      get
      {
        return this.cmbDirZona.Value.ToString().ToUpper();
      }
    }

    private string TEL1
    {
      get
      {
        return this.txtDirTel1.Value.ToString().ToUpper();
      }
    }

    private string PROPIETARIOTEL1
    {
      get
      {
        return this.cmbPropietarioTel1.Value.ToString().ToUpper();
      }
    }

    private string TEL2
    {
      get
      {
        return this.txtDirTel2.Value.ToString().ToUpper();
      }
    }

    private string PROPIETARIOTEL2
    {
      get
      {
        return this.cmbPropietarioTel2.Value.ToString().ToUpper();
      }
    }

    private string TEL3
    {
      get
      {
        return this.txtDirTel3.Value.ToString().ToUpper();
      }
    }

    private string PROPIETARIOTEL3
    {
      get
      {
        return this.cmbPropietarioTel3.Value.ToString().ToUpper();
      }
    }

    private string TEL4
    {
      get
      {
        return this.txtDirTel4.Value.ToString().ToUpper();
      }
    }

    private string PROPIETARIOTEL4
    {
      get
      {
        return this.cmbPropietarioTel4.Value.ToString().ToUpper();
      }
    }

    private string FILIACIONID
    {
      get
      {
        return this.cmbNFParentesco.Value.ToString().ToUpper();
      }
    }

    private string NSSID
    {
      get
      {
        return string.Empty;
      }
    }

    private string CEDULAID
    {
      get
      {
        return this.txtNFCedula.Value.ToString().ToUpper();
      }
    }

    private string PASAPORTEID
    {
      get
      {
        return this.txtNFPasaporte.Value.ToString().ToUpper();
      }
    }

    private string NOMBRE1
    {
      get
      {
        return this.txtNFNombre1.Value.ToString().ToUpper();
      }
    }

    private string NOMBRE2
    {
      get
      {
        return this.txtNFNombre2.Value.ToString().ToUpper();
      }
    }

    private string APELLIDO1
    {
      get
      {
        return this.txtNFApellido1.Value.ToString().ToUpper();
      }
    }

    private string APELLIDO2
    {
      get
      {
        return this.txtNFApellido2.Value.ToString().ToUpper();
      }
    }

    private string FULLNAME
    {
      get
      {
        return this.NOMBRE1 + " " + this.NOMBRE2 + " " + this.APELLIDO1 + this.APELLIDO2;
      }
    }

    private string FNACE
    {
      get
      {
        return this.txtNFFechaNace.Value.ToString().ToUpper();
      }
    }

    private string ESTCIVILID
    {
      get
      {
        return this.cmbNFEstadoCivil.Value.ToString().ToUpper();
      }
    }

    private string ESCOLARIDADID
    {
      get
      {
        return this.cmbNFEstadoCivil.Value.ToString().ToUpper();
      }
    }

    private string ESCALAID
    {
      get
      {
        return this.cmbNFRangoSalarial.Value.ToString().ToUpper();
      }
    }

    private bool ESEMPLEADO
    {
      get
      {
        return this.cmbNFTrabaja.Value.ToString().ToUpper() == "SI";
      }
    }

    public void PRINTTOPRINTER()
    {
      if (this.REPORT_DATASOURCE.Rows.Count == 0)
        return;
      ReportDocument reportDocument = new ReportDocument();
      reportDocument.Load(this.Server.MapPath(this.REPORT_URL));
      reportDocument.SetDataSource(this.REPORT_DATASOURCE);
      reportDocument.PrintToPrinter(0, true, 0, 0);
      reportDocument.Dispose();
      reportDocument.Dispose();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
      {
        this.Session.Abandon();
        this.Response.Redirect("LOGIN.aspx");
      }
      if (this.Page.IsPostBack)
        return;
      this.lblUsuario.InnerText = this.Session["CURRENTUSR_LOGIN"].ToString();
      this.lblEmpresa.InnerText = this.Session["CURRENTUSR_SGXID"].ToString();
      this._Iniciar();
      if (!(Functions._fnDecryptStr(this.Session["CurrentUSR_USRPASSWORD"].ToString().Trim()) == "@1234"))
        ;
    }

    protected void _SaveSMX00100(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID_DIR);
      this.xQueryParameters.Add((object) "@DIRECCION");
      this.xQueryValues.Add((object) this.DIRECCION);
      this.xQueryParameters.Add((object) "@PAISID");
      this.xQueryValues.Add((object) this.PAISID);
      this.xQueryParameters.Add((object) "@PROVINCIAID");
      this.xQueryValues.Add((object) this.PROVINCIAID);
      this.xQueryParameters.Add((object) "@MUNICIPIOID");
      this.xQueryValues.Add((object) this.MUNICIPIOID);
      this.xQueryParameters.Add((object) "@SECTORID");
      this.xQueryValues.Add((object) this.SECTORID);
      this.xQueryParameters.Add((object) "@ZONAID");
      this.xQueryValues.Add((object) this.ZONAID);
      this.xQueryParameters.Add((object) "@TEL1");
      this.xQueryValues.Add((object) this.TEL1);
      this.xQueryParameters.Add((object) "@PROPIETARIOTEL1");
      this.xQueryValues.Add((object) this.PROPIETARIOTEL1);
      this.xQueryParameters.Add((object) "@TEL2");
      this.xQueryValues.Add((object) this.TEL2);
      this.xQueryParameters.Add((object) "@PROPIETARIOTEL2");
      this.xQueryValues.Add((object) this.PROPIETARIOTEL2);
      this.xQueryParameters.Add((object) "@TEL3");
      this.xQueryValues.Add((object) this.TEL3);
      this.xQueryParameters.Add((object) "@PROPIETARIOTEL3");
      this.xQueryValues.Add((object) this.PROPIETARIOTEL3);
      this.xQueryParameters.Add((object) "@TEL4");
      this.xQueryValues.Add((object) this.TEL4);
      this.xQueryParameters.Add((object) "@PROPIETARIOTEL4");
      this.xQueryValues.Add((object) this.PROPIETARIOTEL4);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX00100SI";
      DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this._CloseModal((object) null, (EventArgs) null);
    }

    protected void _SavePAX00001(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID_DIR);
      this.xQueryParameters.Add((object) "@FILIACIONID");
      this.xQueryValues.Add((object) this.FILIACIONID);
      this.xQueryParameters.Add((object) "@NSSID");
      this.xQueryValues.Add((object) this.NSSID);
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.CEDULAID);
      this.xQueryParameters.Add((object) "@PASAPORTEID");
      this.xQueryValues.Add((object) this.PASAPORTEID);
      this.xQueryParameters.Add((object) "@NOMBRE1");
      this.xQueryValues.Add((object) this.NOMBRE1);
      this.xQueryParameters.Add((object) "@NOMBRE2");
      this.xQueryValues.Add((object) this.NOMBRE2);
      this.xQueryParameters.Add((object) "@APELLIDO1");
      this.xQueryValues.Add((object) this.APELLIDO1);
      this.xQueryParameters.Add((object) "@APELLIDO2");
      this.xQueryValues.Add((object) this.APELLIDO2);
      this.xQueryParameters.Add((object) "@FULLNAME");
      this.xQueryValues.Add((object) this.FULLNAME);
      this.xQueryParameters.Add((object) "@FNACE");
      this.xQueryValues.Add((object) this.FNACE);
      this.xQueryParameters.Add((object) "@ESTCIVILID");
      this.xQueryValues.Add((object) this.ESTCIVILID);
      this.xQueryParameters.Add((object) "@ESCOLARIDADID");
      this.xQueryValues.Add((object) this.ESCOLARIDADID);
      this.xQueryParameters.Add((object) "@ESCALAID");
      this.xQueryValues.Add((object) this.ESCALAID);
      this.xQueryParameters.Add((object) "@ESEMPLEADO");
      this.xQueryValues.Add((object) this.ESEMPLEADO);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00001SI";
      DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this._CloseModal((object) null, (EventArgs) null);
    }

    private void _Iniciar()
    {
      this.MenuLeft.DataSource = (object) this.xOpcionesFav;
      this.MenuLeft.DataBind();
      this.MenuTop.Text = this.xOpcionesTop.Rows[0][0].ToString();
    }

    public void _OpenSMX00100(string REFGUID, string TOKEN)
    {
      this.txtDirDireccion.Value = string.Empty;
      this.cmbDirPais.SelectedValue = string.Empty;
      this.cmbDirMunicipio.SelectedValue = string.Empty;
      this.cmbDirSector.Value = string.Empty;
      this.cmbDirZona.Value = string.Empty;
      this.txtDirTel1.Value = string.Empty;
      this.txtDirTel2.Value = string.Empty;
      this.txtDirTel3.Value = string.Empty;
      this.txtDirTel4.Value = string.Empty;
      this.xREFGUID.Value = REFGUID;
      this.xTOKEN.Value = TOKEN;
      this.MainShadow.Attributes.Add("class", "navi");
      this.SMX00100.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbPropietarioTel1.Items.Clear();
      this.cmbPropietarioTel2.Items.Clear();
      this.cmbPropietarioTel3.Items.Clear();
      this.cmbPropietarioTel4.Items.Clear();
      this.cmbPropietarioTel1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPropietarioTel2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPropietarioTel3.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPropietarioTel4.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        this.cmbPropietarioTel1.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbPropietarioTel2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbPropietarioTel3.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbPropietarioTel4.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbDirPais.Items.Clear();
      this.cmbDirProvincia.Items.Clear();
      this.cmbDirMunicipio.Items.Clear();
      this.cmbDirSector.Items.Clear();
      this.cmbDirZona.Items.Clear();
      this.cmbDirPais.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDirProvincia.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDirMunicipio.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDirSector.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbDirZona.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00001S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDirPais.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00002S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDirProvincia.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDirMunicipio.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00004S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDirSector.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00005S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbDirZona.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbDirPais.SelectedValue = (string) CURRENTUSR.DEFAULT_PAIS;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      DataTable dataTable = DB.ExecuteAdapter("SMX00100S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        int index = dataTable.Rows.Count - 1;
        this.txtDirDireccion.Value = dataTable.Rows[index]["DIRECCION"].ToString();
        this.cmbDirPais.SelectedValue = dataTable.Rows[index]["PAISID"].ToString();
        this.cmbDirMunicipio.SelectedValue = dataTable.Rows[index]["MUNICIPIOID"].ToString();
        this.cmbDirSector.Value = dataTable.Rows[index]["SECTORID"].ToString();
        this.cmbDirZona.Value = dataTable.Rows[index]["ZONAID"].ToString();
        this.txtDirTel1.Value = dataTable.Rows[index]["TEL1"].ToString();
        this.txtDirTel2.Value = dataTable.Rows[index]["TEL2"].ToString();
        this.txtDirTel3.Value = dataTable.Rows[index]["TEL3"].ToString();
        this.txtDirTel4.Value = dataTable.Rows[index]["TEL4"].ToString();
        this.cmbPropietarioTel1.Value = dataTable.Rows[index]["PROPIETARIOTEL1"].ToString();
        this.cmbPropietarioTel2.Value = dataTable.Rows[index]["PROPIETARIOTEL2"].ToString();
        this.cmbPropietarioTel3.Value = dataTable.Rows[index]["PROPIETARIOTEL3"].ToString();
        this.cmbPropietarioTel4.Value = dataTable.Rows[index]["PROPIETARIOTEL4"].ToString();
      }
      else
      {
        this._FillProvinciasyZonas();
        this._FillMunicipios();
        this._FillSectores();
      }
    }

    public void _OpenPAX00001(string REFGUID, string TOKEN)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbNFParentesco.Items.Clear();
      this.cmbNFEscolaridad.Items.Clear();
      this.cmbNFEstadoCivil.Items.Clear();
      this.cmbNFRangoSalarial.Items.Clear();
      this.cmbNFParentesco.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbNFEscolaridad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbNFEstadoCivil.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbNFRangoSalarial.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFParentesco.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30015S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFEscolaridad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30007S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFEstadoCivil.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30008S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFRangoSalarial.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.cmbNFParentesco.Value = string.Empty;
      this.txtNFCedula.Value = string.Empty;
      this.txtNFPasaporte.Value = string.Empty;
      this.txtNFNombre1.Value = string.Empty;
      this.txtNFNombre2.Value = string.Empty;
      this.txtNFApellido1.Value = string.Empty;
      this.txtNFApellido2.Value = string.Empty;
      this.txtNFFechaNace.Value = string.Empty;
      this.cmbNFEscolaridad.Value = string.Empty;
      this.cmbNFEstadoCivil.Value = string.Empty;
      this.cmbNFTrabaja.Value = string.Empty;
      this.xREFGUID.Value = REFGUID;
      this.xTOKEN.Value = TOKEN;
      this.MainShadow.Attributes.Add("class", "navi");
      this.PAX00001.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpNucleoFamiliar.DataBind();
    }

    protected void _RemoveNuleoFam(object sender, EventArgs e)
    {
      string str = ((LinkButton) sender).CommandArgument.ToString();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) str);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00001SD";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.rpNucleoFamiliar.DataSource = (object) null;
      this.rpNucleoFamiliar.DataBind();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.xREFGUID.Value);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpNucleoFamiliar.DataBind();
    }

    public void _OpenAlert(string MSG)
    {
      this.MainShadow.Attributes.Add("class", "navi");
      this.MSGALERT.Visible = true;
      this.lblMsgAlert.InnerText = MSG;
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (this.SMX00100.Visible)
        this.SMX00100.Visible = false;
      if (this.PAX00001.Visible)
        this.PAX00001.Visible = false;
      if (!this.MSGALERT.Visible)
        return;
      this.MSGALERT.Visible = false;
    }

    public void _ValidaAccesoPagina(string PAG)
    {
    }

    protected void cmbDirPais_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._FillProvinciasyZonas();
    }

    protected void cmbDirMunicipio_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._FillSectores();
    }

    protected void cmbDirProvincia_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._FillMunicipios();
    }

    private void _FillProvinciasyZonas()
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFID");
        this.xQueryValues.Add((object) this.PAISID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbDirProvincia.Items.Clear();
        this.cmbDirProvincia.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00002S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbDirProvincia.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@PAISID");
        this.xQueryValues.Add((object) this.PAISID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbDirZona.Items.Clear();
        this.cmbDirZona.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00005S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbDirZona.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      catch
      {
      }
    }

    private void _FillMunicipios()
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFID");
        this.xQueryValues.Add((object) this.PROVINCIAID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbDirMunicipio.Items.Clear();
        this.cmbDirMunicipio.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00003S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbDirMunicipio.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      catch
      {
      }
    }

    private void _FillSectores()
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFID");
        this.xQueryValues.Add((object) this.MUNICIPIOID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.cmbDirSector.Items.Clear();
        this.cmbDirSector.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00004S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbDirSector.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
      catch
      {
      }
    }

    internal void FijarPaciente()
    {
      this.xMAINPAXGUID.Value = this.Session["xMAINPAXGUID"].ToString();
      this.xMAINPAXNAM.Value = this.Session["xMAINPAXNAM"].ToString();
      this._Iniciar();
    }

    internal void Mostrar_Opciones_ActoMedico()
    {
      string str = this.Session["xHTML_Options"].ToString();
      try
      {
        this._MenuActoMedico.Text = str;
      }
      catch
      {
        this._MenuActoMedico.Text = string.Empty;
      }
    }

    public bool Crear_ActoMédico(string xREFGUID, string xTERGUID, string xESPGUID)
    {
      return DB.ExecuteNonQuery(string.Format("[HCL00000SI] '{0}','{1}','{2}','{3}','{4}','{5}'", (object) xREFGUID, (object) xTERGUID, (object) xESPGUID, (object) DB._fnGUID(), (object) this.ROWUSERID, (object) this.ROWSGXID));
    }

    internal void _Notify(string msg)
    {
      this.Page.ClientScript.RegisterClientScriptBlock(this.Page.GetType(), "NotifyMsg", "toast({message:'" + msg + "'}); setTimeout(function() {  },900)", true);
    }
  }
}
