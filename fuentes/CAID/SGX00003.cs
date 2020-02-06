// Decompiled with JetBrains decompiler
// Type: CAID.SGX00003
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
  public class SGX00003 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string OPCIONID = string.Empty;
    private string xCommand;
    protected HiddenField xGUID;
    protected DropDownList cmbRol;
    protected RequiredFieldValidator valcmbRol;
    protected DropDownList cmbOpciones;
    protected RequiredFieldValidator valcmbOpciones;
    protected HtmlButton btnAddAll;
    protected Repeater rpOut;
    protected HtmlButton btnRemAll;
    protected Repeater rpIn;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string ROLID
    {
      get
      {
        return this.cmbRol.SelectedValue.ToString().ToUpper();
      }
    }

    private string NODOID
    {
      get
      {
        return this.cmbOpciones.SelectedValue.ToString().ToUpper();
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
      this.cmbRol.Items.Clear();
      this.cmbOpciones.Items.Clear();
      this.cmbRol.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbOpciones.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00002S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbRol.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00001S4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbOpciones.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["NODOID"].ToString()));
    }

    private void _IniciarControles()
    {
      this.cmbRol.SelectedValue = string.Empty;
      this.cmbOpciones.SelectedValue = string.Empty;
    }

    protected void _Add(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()))
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROLID");
      this.xQueryValues.Add((object) this.ROLID);
      this.xQueryParameters.Add((object) "@NODOID");
      this.xQueryValues.Add((object) this.NODOID);
      this.xQueryParameters.Add((object) "@CONDICION");
      this.xQueryValues.Add((object) "NOT IN");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROLID");
        this.xQueryValues.Add((object) this.ROLID);
        this.xQueryParameters.Add((object) "@OPCIONID");
        this.xQueryValues.Add((object) row["ROWGUID"].ToString());
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        if (!DB.ExecuteNonQuery("SGX00003SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          ;
      }
      this._Show((object) null, (EventArgs) null);
    }

    protected void _Remove(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROLID");
      this.xQueryValues.Add((object) this.ROLID);
      this.xQueryParameters.Add((object) "@NODOID");
      this.xQueryValues.Add((object) this.NODOID);
      this.xQueryParameters.Add((object) "@CONDICION");
      this.xQueryValues.Add((object) "IN");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        if (!DB.ExecuteNonQuery("SGX00003SD", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          ;
      }
      this._Show((object) null, (EventArgs) null);
    }

    protected void _Show(object sender, EventArgs e)
    {
      if (this.ROLID == string.Empty || this.NODOID == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROLID");
      this.xQueryValues.Add((object) this.ROLID);
      this.xQueryParameters.Add((object) "@NODOID");
      this.xQueryValues.Add((object) this.NODOID);
      this.xQueryParameters.Add((object) "@CONDICION");
      this.xQueryValues.Add((object) "IN");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpIn.DataSource = (object) DB.ExecuteAdapter("SGX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpIn.DataBind();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROLID");
      this.xQueryValues.Add((object) this.ROLID);
      this.xQueryParameters.Add((object) "@NODOID");
      this.xQueryValues.Add((object) this.NODOID);
      this.xQueryParameters.Add((object) "@CONDICION");
      this.xQueryValues.Add((object) "NOT IN");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpOut.DataSource = (object) DB.ExecuteAdapter("SGX00002S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpOut.DataBind();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      this.OPCIONID = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (this.xCommand == "Add")
        {
          if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()))
            return;
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROLID");
          this.xQueryValues.Add((object) this.ROLID);
          this.xQueryParameters.Add((object) "@OPCIONID");
          this.xQueryValues.Add((object) this.OPCIONID);
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          if (DB.ExecuteNonQuery("SGX00003SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            this._Show((object) null, (EventArgs) null);
        }
        if (this.xCommand == "Remove" && Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString()))
        {
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@ROWGUID");
          this.xQueryValues.Add((object) this.ROWGUID);
          this.xQueryParameters.Add((object) "@ROWUSERID");
          this.xQueryValues.Add((object) this.ROWUSERID);
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          if (DB.ExecuteNonQuery("SGX00003SD", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
            this._Show((object) null, (EventArgs) null);
        }
      }
      catch
      {
      }
    }
  }
}
