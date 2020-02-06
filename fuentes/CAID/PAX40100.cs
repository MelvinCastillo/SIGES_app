// Decompiled with JetBrains decompiler
// Type: CAID.PAX40100
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
  public class PAX40100 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlGenericControl lblEvaluacion;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected HtmlSelect cmbARS;
    protected RequiredFieldValidator valcmbARS;
    protected HtmlInputText txtTelResidencia;
    protected RequiredFieldValidator valtxtTelResidencia;
    protected HtmlInputText txtDireccion;
    protected RequiredFieldValidator valtxtDireccion;
    protected HtmlInputText txtNombrePadre;
    protected HtmlInputText txtCedulaPadre;
    protected HtmlInputText txtTelPadre;
    protected HtmlInputText txtEmailPadre;
    protected HtmlInputText txtNombreMadre;
    protected HtmlInputText txtCedulaMadre;
    protected HtmlInputText txtTelMadre;
    protected HtmlInputText txtEmailMadre;
    protected HtmlInputText txtNombreTutor;
    protected HtmlInputText txtCedulaTutor;
    protected HtmlInputText txtTelTutor;
    protected HtmlInputText txtNoResideConNino;
    protected HtmlSelect cmbNFParentesco1;
    protected HtmlInputText txtTel4;
    protected HtmlInputText txtACOMPANANTEPACIENTE;
    protected HtmlSelect cmbNFParentesco2;
    protected HtmlSelect cmbEscolarizado;
    protected HtmlSelect cmbTipoEscolaridad;
    protected HtmlInputText txtNombreInstitucion;
    protected HtmlSelect cmbSectorInstitucion;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string REFGUID
    {
      get
      {
        return this.cmbPaciente.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string SEGUROMEDICO
    {
      get
      {
        return this.cmbARS.Value.ToString().Trim().ToUpper();
      }
    }

    private string TELEFONORESIDENCIA
    {
      get
      {
        return this.txtTelResidencia.Value.ToString().Trim().ToUpper();
      }
    }

    private string DIRECCION
    {
      get
      {
        return this.txtDireccion.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBREPADRE
    {
      get
      {
        return this.txtNombrePadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string CEDULA1
    {
      get
      {
        return this.txtCedulaPadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string TEL1
    {
      get
      {
        return this.txtTelPadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string EMAIL1
    {
      get
      {
        return this.txtEmailPadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBREMADRE
    {
      get
      {
        return this.txtNombreMadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string CEDULA2
    {
      get
      {
        return this.txtCedulaMadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string TEL2
    {
      get
      {
        return this.txtTelMadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string EMAIL2
    {
      get
      {
        return this.txtEmailMadre.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRETUTOR
    {
      get
      {
        return this.txtNombreTutor.Value.ToString().Trim().ToUpper();
      }
    }

    private string CEDULA3
    {
      get
      {
        return this.txtCedulaTutor.Value.ToString().Trim().ToUpper();
      }
    }

    private string TEL3
    {
      get
      {
        return this.txtTelTutor.Value.ToString().Trim().ToUpper();
      }
    }

    private string NORESIDECONPACIENTE
    {
      get
      {
        return this.txtNoResideConNino.Value.ToString().Trim().ToUpper();
      }
    }

    private string PARENTESCO1
    {
      get
      {
        return this.cmbNFParentesco1.Value.ToString().Trim().ToUpper();
      }
    }

    private string TEL4
    {
      get
      {
        return this.txtTel4.Value.ToString().Trim().ToUpper();
      }
    }

    private string ACOMPANANTEPACIENTE
    {
      get
      {
        return this.txtACOMPANANTEPACIENTE.Value.ToString().Trim().ToUpper();
      }
    }

    private string PARENTESCO2
    {
      get
      {
        return this.cmbNFParentesco2.Value.ToString().Trim().ToUpper();
      }
    }

    private int ESCOLARIZADO
    {
      get
      {
        return this.cmbEscolarizado.Value.ToString().Trim().ToUpper() != string.Empty ? 1 : 0;
      }
    }

    private string TIPOESCOLARIDAD
    {
      get
      {
        return this.cmbTipoEscolaridad.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOMBREINSTITUCION
    {
      get
      {
        return this.txtNombreInstitucion.Value.ToString().Trim().ToUpper();
      }
    }

    private string SECTORINSTITUCION
    {
      get
      {
        return this.cmbSectorInstitucion.Value.ToString().Trim().ToUpper();
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
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
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
      this.cmbARS.Items.Clear();
      this.cmbARS.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbSectorInstitucion.Items.Clear();
      this.cmbSectorInstitucion.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbNFParentesco1.Items.Clear();
      this.cmbNFParentesco1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbNFParentesco2.Items.Clear();
      this.cmbNFParentesco2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbARS.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00004S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbSectorInstitucion.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFParentesco1.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30003S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNFParentesco2.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }

    private void _IniciarControles()
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.cmbARS.Value = string.Empty;
      this.txtTelResidencia.Value = string.Empty;
      this.txtDireccion.Value = string.Empty;
      this.txtNombrePadre.Value = string.Empty;
      this.txtCedulaPadre.Value = string.Empty;
      this.txtTelPadre.Value = string.Empty;
      this.txtEmailPadre.Value = string.Empty;
      this.txtNombreMadre.Value = string.Empty;
      this.txtCedulaMadre.Value = string.Empty;
      this.txtTelMadre.Value = string.Empty;
      this.txtEmailMadre.Value = string.Empty;
      this.txtNombreTutor.Value = string.Empty;
      this.txtCedulaTutor.Value = string.Empty;
      this.txtTelTutor.Value = string.Empty;
      this.txtNoResideConNino.Value = string.Empty;
      this.cmbNFParentesco1.Value = string.Empty;
      this.txtTel4.Value = string.Empty;
      this.txtACOMPANANTEPACIENTE.Value = string.Empty;
      this.cmbNFParentesco2.Value = string.Empty;
      this.cmbEscolarizado.Value = string.Empty;
      this.cmbTipoEscolaridad.Value = string.Empty;
      this.txtNombreInstitucion.Value = string.Empty;
      this.cmbSectorInstitucion.Value = string.Empty;
    }

    private void _IniciarFormulario()
    {
      this._IniciarControles();
    }

    protected void _New(object sender, EventArgs e)
    {
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
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
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@SEGUROMEDICO");
      this.xQueryValues.Add((object) this.SEGUROMEDICO);
      this.xQueryParameters.Add((object) "@TELEFONORESIDENCIA");
      this.xQueryValues.Add((object) this.TELEFONORESIDENCIA);
      this.xQueryParameters.Add((object) "@DIRECCION");
      this.xQueryValues.Add((object) this.DIRECCION);
      this.xQueryParameters.Add((object) "@NOMBREPADRE");
      this.xQueryValues.Add((object) this.NOMBREPADRE);
      this.xQueryParameters.Add((object) "@CEDULA1");
      this.xQueryValues.Add((object) this.CEDULA1);
      this.xQueryParameters.Add((object) "@TEL1");
      this.xQueryValues.Add((object) this.TEL1);
      this.xQueryParameters.Add((object) "@EMAIL1");
      this.xQueryValues.Add((object) this.EMAIL1);
      this.xQueryParameters.Add((object) "@NOMBREMADRE");
      this.xQueryValues.Add((object) this.NOMBREMADRE);
      this.xQueryParameters.Add((object) "@CEDULA2");
      this.xQueryValues.Add((object) this.CEDULA2);
      this.xQueryParameters.Add((object) "@TEL2");
      this.xQueryValues.Add((object) this.TEL2);
      this.xQueryParameters.Add((object) "@EMAIL2");
      this.xQueryValues.Add((object) this.EMAIL2);
      this.xQueryParameters.Add((object) "@NOMBRETUTOR");
      this.xQueryValues.Add((object) this.NOMBRETUTOR);
      this.xQueryParameters.Add((object) "@CEDULA3");
      this.xQueryValues.Add((object) this.CEDULA3);
      this.xQueryParameters.Add((object) "@TEL3");
      this.xQueryValues.Add((object) this.TEL3);
      this.xQueryParameters.Add((object) "@NORESIDECONPACIENTE");
      this.xQueryValues.Add((object) this.NORESIDECONPACIENTE);
      this.xQueryParameters.Add((object) "@PARENTESCO1");
      this.xQueryValues.Add((object) this.PARENTESCO1);
      this.xQueryParameters.Add((object) "@TEL4");
      this.xQueryValues.Add((object) this.TEL4);
      this.xQueryParameters.Add((object) "@ACOMPANANTEPACIENTE");
      this.xQueryValues.Add((object) this.ACOMPANANTEPACIENTE);
      this.xQueryParameters.Add((object) "@PARENTESCO2");
      this.xQueryValues.Add((object) this.PARENTESCO2);
      this.xQueryParameters.Add((object) "@ESCOLARIZADO");
      this.xQueryValues.Add((object) this.ESCOLARIZADO);
      this.xQueryParameters.Add((object) "@TIPOESCOLARIDAD");
      this.xQueryValues.Add((object) this.TIPOESCOLARIDAD);
      this.xQueryParameters.Add((object) "@NOMBREINSTITUCION");
      this.xQueryValues.Add((object) this.NOMBREINSTITUCION);
      this.xQueryParameters.Add((object) "@SECTORINSTITUCION");
      this.xQueryValues.Add((object) this.SECTORINSTITUCION);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void cmbPaciente_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
  }
}
