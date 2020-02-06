// Decompiled with JetBrains decompiler
// Type: CAID.PAX00500
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAID
{
  public class PAX00500 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected Repeater rpDataPacientes;
    protected Panel pnlData;
    protected Repeater rpPaxHeader;
    protected Repeater rpPaxPlan;
    protected Repeater rpPaxAct;
    protected Repeater rpPaxHC;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX00000S1";
      this.rpDataPacientes.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpDataPacientes.DataBind();
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (!(this.xCommand == "Edit"))
          return;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.xGUID.Value);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
        this.rpPaxPlan.DataSource = (object) DB.ExecuteAdapter("HCX00300_DS5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxPlan.DataBind();
        this.rpPaxAct.DataSource = (object) DB.ExecuteAdapter("HCX00300_DS6", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxAct.DataBind();
        this.rpPaxHC.DataSource = (object) DB.ExecuteAdapter("PAX00000S6", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHC.DataBind();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
        this.Session.Add("xMAINPAXGUID", (object) this.xGUID.Value);
        this.Session.Add("xMAINPAXNAM", (object) this.xGUID.Value);
        ((Site_Master) this.Master).FijarPaciente();
      }
      catch
      {
      }
    }
  }
}
