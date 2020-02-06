// Decompiled with JetBrains decompiler
// Type: CAID.forget
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
  public class forget : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HtmlForm forgetForm;
    protected Panel pnl1;
    protected HtmlSelect cmbEmpresa;
    protected HtmlInputText txtUsuario;
    protected HtmlButton btnLogin;
    protected Panel pnl2;
    protected Label lblMSG;
    protected HtmlButton btn1;
    protected HtmlButton btn2;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string USUARIO
    {
      get
      {
        return this.txtUsuario.Value.ToString().Trim().ToUpper();
      }
    }

    private string ESTATUS
    {
      get
      {
        return "PE";
      }
    }

    private string DETALLE
    {
      get
      {
        return "SOLICITUD DE CONTRASEÑA";
      }
    }

    private string RESPUESTA
    {
      get
      {
        return string.Empty;
      }
    }

    private string ROWGUID
    {
      get
      {
        return Guid.NewGuid().ToString().ToUpper();
      }
    }

    private string ROWUSERID
    {
      get
      {
        return string.Empty;
      }
    }

    private string ROWSGXID
    {
      get
      {
        return this.cmbEmpresa.Value.ToString().ToUpper();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
      if (this.Page.IsPostBack)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.cmbEmpresa.Items.Clear();
      this.cmbEmpresa.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SGX00000S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbEmpresa.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (this.cmbEmpresa.Items.Count == 2)
        this.cmbEmpresa.SelectedIndex = 1;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@USUARIO");
      this.xQueryValues.Add((object) this.USUARIO);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) this.ESTATUS);
      this.xQueryParameters.Add((object) "@DETALLE");
      this.xQueryValues.Add((object) this.DETALLE);
      this.xQueryParameters.Add((object) "@RESPUESTA");
      this.xQueryValues.Add((object) this.RESPUESTA);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "SMX20001SI";
      this.lblMSG.Text = DB.ExecuteScalar(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).ToString();
      this.pnl1.Visible = false;
      this.pnl2.Visible = true;
    }

    protected void _Reset(object sender, EventArgs e)
    {
      this.pnl1.Visible = true;
      this.pnl2.Visible = false;
    }

    protected void _Exit(object sender, EventArgs e)
    {
      this.Response.Redirect("login.aspx");
    }
  }
}
