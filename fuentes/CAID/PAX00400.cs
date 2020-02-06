// Decompiled with JetBrains decompiler
// Type: CAID.PAX00400
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
  public class PAX00400 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HiddenField xGUID;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlInputText txtHoraIni;
    protected HtmlInputText txtCedula;
    protected HtmlInputText txtPasaporte;
    protected HtmlInputText txtNombre;
    protected RequiredFieldValidator valtxtNombre;
    protected HtmlSelect cmbContacto;
    protected RequiredFieldValidator valcmbContacto;
    protected HtmlInputText txtContacto;
    protected RequiredFieldValidator txttxtContacto;
    protected TextBox txtDetalles;
    protected RequiredFieldValidator valtxtDetalles;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.txtNombre.Value.ToString().ToUpper();
      }
    }

    private string CEDULAID
    {
      get
      {
        return this.txtCedula.Value.ToString().ToUpper();
      }
    }

    private string PASAPORTEID
    {
      get
      {
        return this.txtPasaporte.Value.ToString().ToUpper();
      }
    }

    private string TIPOCONTACTO
    {
      get
      {
        return this.cmbContacto.Value.ToString().ToUpper();
      }
    }

    private string TIPOCONTACTODET
    {
      get
      {
        return this.txtContacto.Value.ToString().ToUpper();
      }
    }

    private string DETALLES
    {
      get
      {
        return this.txtDetalles.Text.ToUpper();
      }
    }

    private string HORAINI
    {
      get
      {
        return this.txtHoraIni.Value.ToString().ToUpper();
      }
    }

    private string HORAFIN
    {
      get
      {
        return DateTime.Now.ToShortTimeString();
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
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.txtNombre.Disabled = true;
      this.txtCedula.Disabled = true;
      this.txtPasaporte.Disabled = true;
      this.txtContacto.Disabled = true;
      this.txtDetalles.Enabled = true;
      this.cmbContacto.Disabled = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbContacto.Items.Clear();
      this.cmbContacto.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30004S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbContacto.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }

    private void _IniciarControles()
    {
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.txtNombre.Value = string.Empty;
      this.txtCedula.Value = string.Empty;
      this.txtPasaporte.Value = string.Empty;
      this.txtContacto.Value = string.Empty;
      this.txtDetalles.Text = string.Empty;
      this.cmbContacto.Value = string.Empty;
      this.txtNombre.Disabled = false;
      this.txtCedula.Disabled = false;
      this.txtPasaporte.Disabled = false;
      this.txtContacto.Disabled = false;
      this.txtDetalles.Enabled = true;
      this.cmbContacto.Disabled = false;
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) this.CEDULAID);
      this.xQueryParameters.Add((object) "@PASAPORTEID");
      this.xQueryValues.Add((object) this.PASAPORTEID);
      this.xQueryParameters.Add((object) "@TIPOCONTACTO");
      this.xQueryValues.Add((object) this.TIPOCONTACTO);
      this.xQueryParameters.Add((object) "@TIPOCONTACTODET");
      this.xQueryValues.Add((object) this.TIPOCONTACTODET);
      this.xQueryParameters.Add((object) "@DETALLES");
      this.xQueryValues.Add((object) this.DETALLES);
      this.xQueryParameters.Add((object) "@HORAINI");
      this.xQueryValues.Add((object) this.HORAINI);
      this.xQueryParameters.Add((object) "@HORAFIN");
      this.xQueryValues.Add((object) this.HORAFIN);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarControles();
      this._Iniciar();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }
  }
}
