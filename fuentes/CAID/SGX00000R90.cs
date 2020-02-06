// Decompiled with JetBrains decompiler
// Type: CAID.SGX00000R90
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
  public class SGX00000R90 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Repeater rpData;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
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
        return "FREE";
      }
    }

    private string ROWSGXID
    {
      get
      {
        return "CAID-SD";
      }
    }

    private string FECHA1
    {
      get
      {
        return DateTime.Now.ToString("MM/dd/yyyy");
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.Response.AppendHeader("Refresh", "120");
      if (this.Page.IsPostBack)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this._Show((object) null, (EventArgs) null);
    }

    private void _IniciarControles()
    {
      this._Show((object) null, (EventArgs) null);
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@FECHA1");
      this.xQueryValues.Add((object) this.FECHA1);
      this.xQueryParameters.Add((object) "@FECHA2");
      this.xQueryValues.Add((object) this.FECHA1);
      this.xQueryParameters.Add((object) "@ESPECIALISTA");
      this.xQueryValues.Add((object) string.Empty);
      this.xQueryParameters.Add((object) "@ESTATUS");
      this.xQueryValues.Add((object) -1);
      this.xQuery = "SMX00500S1";
      this.rpData.DataSource = (object) DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpData.DataBind();
    }
  }
}
