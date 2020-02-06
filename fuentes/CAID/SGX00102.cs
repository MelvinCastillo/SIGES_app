// Decompiled with JetBrains decompiler
// Type: CAID.SGX00102
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class SGX00102 : Page
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
    protected HtmlInputText txtNombre;
    protected DropDownList cmbOrigen;
    protected RequiredFieldValidator valcmbOrigen;
    protected HtmlSelect cmbNodoId;
    protected RequiredFieldValidator valcmbNodoId;
    protected HtmlSelect cmbFormularios;
    protected HtmlInputText txtOrden;
    protected RequiredFieldValidator valtxtOrden;
    protected HtmlSelect cmbActivo;
    protected RequiredFieldValidator valcmbActivo;

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
        return this.Session["CURRENTUSR_ID"].ToString();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.txtNombre.Value.ToString().Trim().ToUpper();
      }
    }

    private string OPCIONURL
    {
      get
      {
        return this.cmbOrigen.SelectedValue.Equals("Si") ? "#" : this.cmbFormularios.Value.ToString().Trim().ToUpper();
      }
    }

    private int OPCIONORDEN
    {
      get
      {
        return (int) Convert.ToInt16(this.txtOrden.Value.ToString().Trim());
      }
    }

    private string NODOID
    {
      get
      {
        return this.cmbOrigen.SelectedValue.Equals("Si") ? this.ROWGUID : this.cmbNodoId.Value.ToString().Trim().ToUpper();
      }
    }

    private string OPCIONACTIVA
    {
      get
      {
        return this.cmbActivo.Value.ToString().Trim().ToUpper();
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
        return this.Server.MapPath(".");
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
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.cmbNodoId.Items.Clear();
      this.cmbNodoId.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00102S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbNodoId.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["NODOID"].ToString()));
      this.cmbFormularios.Items.Clear();
      this.cmbFormularios.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (FileInfo file in new DirectoryInfo(this.ROOTDIRECTORY).GetFiles("*.aspx"))
        this.cmbFormularios.Items.Add(new ListItem(file.Name.ToUpper(), file.Name.ToUpper()));
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
        this.txtNombre.Value = dataRow["NOMBRE"].ToString();
        this.cmbFormularios.Value = dataRow["OPCIONURL"].ToString();
        this.txtOrden.Value = dataRow["OPCIONORDEN"].ToString();
        this.cmbNodoId.Value = dataRow["NODOID"].ToString();
        this.cmbOrigen.SelectedValue = dataRow["NODOID"].ToString() == dataRow["ROWGUID"].ToString() ? "Si" : "No";
        this.cmbActivo.Value = dataRow["OPCIONACTIVA"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.txtNombre.Value = string.Empty;
      this.cmbFormularios.Value = string.Empty;
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
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
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
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@OPCIONURL");
      this.xQueryValues.Add((object) this.OPCIONURL);
      this.xQueryParameters.Add((object) "@OPCIONORDEN");
      this.xQueryValues.Add((object) this.OPCIONORDEN);
      this.xQueryParameters.Add((object) "@NODOID");
      this.xQueryValues.Add((object) this.NODOID);
      this.xQueryParameters.Add((object) "@OPCIONACTIVA");
      this.xQueryValues.Add((object) this.OPCIONACTIVA);
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

    protected void cmbOrigen_SelectedIndexChanged(object sender, EventArgs e)
    {
      try
      {
        this.cmbNodoId.Disabled = this.cmbOrigen.SelectedIndex != 2;
        this.cmbFormularios.Disabled = this.cmbOrigen.SelectedIndex != 2;
        if (this.cmbOrigen.SelectedIndex == 2)
          return;
        this.cmbNodoId.Value = string.Empty;
        this.cmbFormularios.Value = string.Empty;
      }
      catch
      {
      }
    }
  }
}
