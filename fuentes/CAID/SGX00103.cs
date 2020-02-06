// Decompiled with JetBrains decompiler
// Type: CAID.SGX00103
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
  public class SGX00103 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlData;
    protected DropDownList cmbSupervisor;
    protected RequiredFieldValidator valcmbSupervisor;
    protected HtmlSelect cmbUsuario;
    protected RequiredFieldValidator valcmbUsuario;
    protected HtmlButton btnSaveDetalles;
    protected Repeater rpDetalles;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string SUPRUSRID
    {
      get
      {
        return this.cmbSupervisor.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string USRID
    {
      get
      {
        return this.cmbUsuario.Value.ToString().Trim().ToUpper();
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
      this.cmbSupervisor.Items.Clear();
      this.cmbSupervisor.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbUsuario.Items.Clear();
      this.cmbUsuario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00100S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        this.cmbSupervisor.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.cmbUsuario.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      }
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
        if ((dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null) == null)
          ;
      }
    }

    private void _IniciarControles()
    {
      this.cmbSupervisor.SelectedValue = string.Empty;
      this.cmbUsuario.Value = string.Empty;
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
          if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            ;
          this._CagarDetalles();
          this._BuscarUsuarios();
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
      this.xQueryParameters.Add((object) "@SUPRUSRID");
      this.xQueryValues.Add((object) this.SUPRUSRID);
      this.xQueryParameters.Add((object) "@USRID");
      this.xQueryValues.Add((object) this.USRID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        ;
    }

    protected void _SaveDetalles(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@SUPRUSRID");
      this.xQueryValues.Add((object) this.SUPRUSRID);
      this.xQueryParameters.Add((object) "@USRID");
      this.xQueryValues.Add((object) this.USRID);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._CagarDetalles();
      this._BuscarUsuarios();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this.Response.Redirect(this.xBase + ".aspx?X=DATA");
    }

    private void _CagarDetalles()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@SUPRUSRID");
      this.xQueryValues.Add((object) this.cmbSupervisor.SelectedValue.ToString());
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S2";
      this.rpDetalles.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDetalles.DataBind();
    }

    private void _BuscarUsuarios()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@SUPERVISOR");
      this.xQueryValues.Add((object) this.cmbSupervisor.SelectedValue.ToString());
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbUsuario.Items.Clear();
      this.cmbUsuario.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00103S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbUsuario.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void cmbSupervisor_SelectedIndexChanged(object sender, EventArgs e)
    {
      this._BuscarUsuarios();
      this._CagarDetalles();
    }
  }
}
