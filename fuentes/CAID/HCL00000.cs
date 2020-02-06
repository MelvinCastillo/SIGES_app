// Decompiled with JetBrains decompiler
// Type: CAID.HCL00000
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
  public class HCL00000 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Repeater rpPaxHeader;
    protected Literal HTML_Tiles;
    protected Panel pnlTipoConsulta;
    protected HtmlSelect cmbTipoConsulta;
    protected HtmlButton btnSaveNCF;
    protected HtmlGenericControl MainShadow;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private int TIPOCONSULTA
    {
      get
      {
        return Convert.ToInt32(this.cmbTipoConsulta.Value.ToString());
      }
    }

    private string TERID
    {
      get
      {
        return this.Session["CurrentUSR_TERID"].ToString();
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
      if (this.Page.IsPostBack)
        return;
      this.cmbTipoConsulta.Items.Clear();
      this.cmbTipoConsulta.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vTIPOS_CONSULTA WHERE ROWGUID<>99 ORDER BY ROWGUID").Rows)
        this.cmbTipoConsulta.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      string str = this.Request.QueryString["X"];
      if (str == null)
        return;
      this.xGUID.Value = str;
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.xGUID.Value);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.xGUID.Value);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQueryParameters.Add((object) "@USERID");
        this.xQueryValues.Add((object) this.ROWUSERID);
        DataTable dataTable = DB.ExecuteAdapter("PAX00000X1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        if (dataTable.Rows.Count != 0)
        {
          this.Session.Add("CurrentPAX_ROWGUID", (object) this.xGUID.Value);
          this.HTML_Tiles.Text = dataTable.Rows[0]["HTML_Tiles"].ToString();
          this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
          ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
        }
        this.Session.Add("xMAINPAXGUID", (object) this.xGUID.Value);
        this.Session.Add("xMAINPAXNAM", (object) this.xGUID.Value);
        ((Site_Master) this.Master).FijarPaciente();
        this.Validar();
      }
      catch
      {
      }
    }

    private void Validar()
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.xGUID.Value);
      this.xQueryParameters.Add((object) "@TERGUID");
      this.xQueryValues.Add((object) this.TERID);
      DataTable dataTable = DB.ExecuteAdapter("HCL00001P1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        if (dataTable.Rows[0]["TIPO"].ToString() == "0")
        {
          this.MainShadow.Attributes.Add("class", "navi");
          this.pnlTipoConsulta.Visible = true;
        }
        else
        {
          this.MainShadow.Attributes.Remove("class");
          if (this.pnlTipoConsulta.Visible)
            this.pnlTipoConsulta.Visible = false;
        }
      }
      else
      {
        this.MainShadow.Attributes.Remove("class");
        if (this.pnlTipoConsulta.Visible)
          this.pnlTipoConsulta.Visible = false;
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!DB.ExecuteNonQuery(string.Format("[HCL00001P2] '{0}','{1}',{2}", (object) this.xGUID.Value, (object) this.TERID, (object) this.TIPOCONSULTA)))
        return;
      this.Validar();
    }
  }
}
