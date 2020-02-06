// Decompiled with JetBrains decompiler
// Type: CAID.PAX00000_A
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
  public class PAX00000_A : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlButton tbnAdd;
    protected Repeater rpHistorico;
    protected Panel MNTAUXILIAR;
    protected HtmlButton btnCloseMSG;
    protected TextBox txtAlertas;
    protected HtmlButton btnSaveNotas;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      this.Session["CurrentUSR_ROWGUID"].ToString();
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
      this.Validar();
    }

    protected void _Add(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Add("class", "navi");
      this.MNTAUXILIAR.Visible = true;
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = this.txtAlertas.Text.Trim();
      string str2 = this.Session["CurrentPAX_ROWGUID"].ToString();
      this.Session["CurrentUSR_TERID"].ToString();
      string str3 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str4 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!DB.ExecuteNonQuery(string.Format("[PAX00000_ASI] '{0}','{1}','{2}','{3}'", (object) str1, (object) str2, (object) str3, (object) str4)))
        return;
      this.Validar();
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.MainShadow.Attributes.Remove("class");
      if (!this.MNTAUXILIAR.Visible)
        return;
      this.MNTAUXILIAR.Visible = false;
    }

    private void Validar()
    {
      this.txtAlertas.Text = string.Empty;
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000_AH @REFGUID = '{0}',@ROWUSERID = '{1}', @ROWSGXID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CurrentUSR_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpHistorico.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_ROWGUID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
