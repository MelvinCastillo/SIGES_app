// Decompiled with JetBrains decompiler
// Type: CAID.login
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using System;
using System.Collections;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class login : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HtmlForm loginForm;
    protected HtmlSelect cmbEmpresa;
    protected HtmlInputText txtUsuario;
    protected HtmlInputPassword txtClave;
    protected HtmlButton btnLogin;
    protected HtmlGenericControl lblSrvr;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
      if (this.Page.IsPostBack)
        return;
      this.lblSrvr.InnerText = "Entorno: " + Functions._fnEnviroment;
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

    private void _Iniciar()
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
      string str1 = this.cmbEmpresa.Value.ToString().Trim();
      string str2 = this.txtUsuario.Value.ToString().Trim();
      string str3 = Functions._fnEncryptStr(this.txtClave.Value.ToString().Trim());
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) str1);
      this.xQueryParameters.Add((object) "@USR");
      this.xQueryValues.Add((object) str2);
      this.xQueryParameters.Add((object) "@PWRD");
      this.xQueryValues.Add((object) str3);
      this.xQuery = "SGX00100S3";
      DataTable dataTable1 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable1.Rows.Count != 0)
      {
        DataRow row1 = dataTable1.Rows[0];
        this.Session["CURRENTUSR_ID"] = (object) row1["ROWGUID"].ToString();
        this.Session["CURRENTUSR_NOMBRE"] = (object) row1["NOMBRE"].ToString();
        this.Session["CURRENTUSR_LOGIN"] = (object) row1["USR"].ToString();
        this.Session["CURRENTUSR_PWRD"] = (object) row1["PWRD"].ToString();
        this.Session["CURRENTUSR_SGXID"] = (object) row1["ROWSGXID"].ToString();
        CURRENTUSR.set_ID(row1["ROWGUID"].ToString());
        CURRENTUSR.set_SGXID(row1["ROWSGXID"].ToString());
        this.Session["CurrentUSR_COMPGUID"] = (object) row1["ROWSGXID"].ToString();
        this.Session["CurrentUSR_USRNOMBRE"] = (object) row1["NOMBRE"].ToString();
        this.Session["CurrentUSR_USRLOGIN"] = (object) row1["USR"].ToString();
        this.Session["CurrentUSR_USRPASSWORD"] = (object) row1["PWRD"].ToString();
        this.Session["CurrentUSR_USRNUMERO"] = (object) row1["ROWGUID"].ToString();
        this.Session["CurrentUSR_USRIMGURL"] = (object) row1["ROWGUID"].ToString();
        this.Session["CurrentUSR_ROWGUID"] = (object) row1["ROWGUID"].ToString();
        this.Session["CurrentUSR_USRASOCIADO"] = (object) row1["ROWGUID"].ToString();
        this.Session["CurrentUSR_HTML"] = (object) row1["ROWGUID"].ToString();
        this.Session["CurrentUSR_ROLGUID"] = (object) row1["ROLID"].ToString();
        this.Session["CurrentUSR_ROLNOMBRE"] = (object) row1["ROLID"].ToString();
        this.Session["CurrentUSR_TERID"] = (object) row1["TERID"].ToString();
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) row1["ROLID"].ToString());
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) str1);
        this.xQuery = "SGX00002S2";
        DataTable dataTable2 = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        if (dataTable2.Rows.Count != 0)
        {
          DataRow row2 = dataTable2.Rows[0];
          this.Session["CURRENTUSR_fnLEER"] = (object) Convert.ToBoolean(row2["ROLLEER"].ToString());
          this.Session["CURRENTUSR_fnCREAR"] = (object) Convert.ToBoolean(row2["ROLCREAR"].ToString());
          this.Session["CURRENTUSR_fnMODIFICAR"] = (object) Convert.ToBoolean(row2["ROLMODIFICAR"].ToString());
          this.Session["CURRENTUSR_fnIMRIMIR"] = (object) Convert.ToBoolean(row2["ROLIMPRIMIR"].ToString());
          this.Session["CURRENTUSR_fnELIMINAR"] = (object) Convert.ToBoolean(row2["ROLELIMINAR"].ToString());
          this.Session["CurrentUSR_ROLVER"] = (object) Convert.ToBoolean(row2["ROLLEER"].ToString());
          this.Session["CurrentUSR_ROLCREAR"] = (object) Convert.ToBoolean(row2["ROLCREAR"].ToString());
          this.Session["CurrentUSR_ROLEDITAR"] = (object) Convert.ToBoolean(row2["ROLMODIFICAR"].ToString());
          this.Session["CurrentUSR_ROLELIMINAR"] = (object) Convert.ToBoolean(row2["ROLELIMINAR"].ToString());
          this.Session["CurrentUSR_ROLIMPRIMIR"] = (object) Convert.ToBoolean(row2["ROLIMPRIMIR"].ToString());
          this.Session["CurrentUSR_ROLDASHBOARD"] = (object) row2["ROLDASHBOARD"].ToString();
        }
        FormsAuthentication.RedirectFromLoginPage(this.txtUsuario.Value.ToString(), true);
        this.Response.Redirect("~/index.aspx");
      }
      else
      {
        this._Notify("Usuario y/o Contraseña incorrectos");
        this.txtClave.Focus();
      }
    }

    protected void _ForgetPassword(object sender, EventArgs e)
    {
    }

    internal void _Notify(string msg)
    {
      this.Page.ClientScript.RegisterClientScriptBlock(this.Page.GetType(), "NotifyMsg", "toast({message:'" + msg + "'}); setTimeout(function() {  },900)", true);
    }
  }
}
