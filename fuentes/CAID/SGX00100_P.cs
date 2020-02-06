// Decompiled with JetBrains decompiler
// Type: CAID.SGX00100_P
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
  public class SGX00100_P : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xQuery;
    protected HiddenField xGUID;
    protected HtmlInputPassword txtClave1;
    protected RequiredFieldValidator valtxtClave1;
    protected HtmlInputPassword txtClave2;
    protected RequiredFieldValidator valtxtClave2;
    protected HtmlInputPassword txtClave3;
    protected RequiredFieldValidator valtxtClave3;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string PWRD
    {
      get
      {
        return this.Session["CURRENTUSR_PWRD"].ToString();
      }
    }

    private string PWRD1
    {
      get
      {
        return this.txtClave1.Value.ToString();
      }
    }

    private string PWRD2
    {
      get
      {
        return this.txtClave2.Value.ToString();
      }
    }

    private string PWRD3
    {
      get
      {
        return this.txtClave3.Value.ToString();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.Session["CURRENTUSR_ID"].ToString();
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
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.txtClave1.Value = string.Empty;
      this.txtClave2.Value = string.Empty;
      this.txtClave3.Value = string.Empty;
    }

    private void _IniciarControles()
    {
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.txtClave1.Value = string.Empty;
      this.txtClave2.Value = string.Empty;
      this.txtClave3.Value = string.Empty;
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (Functions._fnDecryptStr(this.PWRD) != this.PWRD1 || this.PWRD2 != this.PWRD3)
        return;
      if (Functions._fnStrongPassword(this.PWRD2, 6, 0, 0, 0, 0))
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@PWRD");
        this.xQueryValues.Add((object) this.PWRD);
        this.xQueryParameters.Add((object) "@PWRD2");
        this.xQueryValues.Add((object) Functions._fnEncryptStr(this.PWRD2));
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = "SGX00100P1";
        if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          return;
        ((Site_Master) this.Master)._OpenAlert("Contraseña actualizada correctamente");
      }
      else
        ((Site_Master) this.Master)._OpenAlert(Functions.Msg);
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }
  }
}
