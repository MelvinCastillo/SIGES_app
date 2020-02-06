// Decompiled with JetBrains decompiler
// Type: CAID.SMX10050
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
  public class SMX10050 : Page
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
    protected HtmlSelect cmbHora;
    protected RequiredFieldValidator cmbHora1;
    protected HtmlSelect cmbIntervalo;
    protected RequiredFieldValidator cmbIntervalo1;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string HORAID
    {
      get
      {
        return this.cmbHora.Value.ToString();
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
      this.btnNew.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString());
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this.btnSave.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnCREAR"].ToString()) || Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.btnBack.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnMODIFICAR"].ToString());
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this._Show((object) null, (EventArgs) null);
    }

    private void _IniciarControles()
    {
      this._Show((object) null, (EventArgs) null);
      this.cmbHora.Value = string.Empty;
      this.cmbIntervalo.Value = string.Empty;
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.cmbHora.Items.Clear();
      this.cmbHora.Items.Add(new ListItem("-- SELECCIONE --", ""));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX10050S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbHora.Items.Add(new ListItem(row["HORA"].ToString(), row["HORAVALUE"].ToString()));
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQuery = this.xBase + "P1";
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
      string[] strArray = this.HORAID.Split(':');
      int int32_1 = Convert.ToInt32(strArray[0]);
      int int32_2 = Convert.ToInt32(strArray[1]);
      int int32_3 = Convert.ToInt32(strArray[2]);
      int int32_4 = Convert.ToInt32(this.cmbIntervalo.Value.ToString());
      DateTime dateTime1 = new DateTime(1900, 1, 1, int32_1, int32_2, int32_3);
      DateTime dateTime2 = new DateTime(1900, 1, 1, int32_1, int32_2, int32_3);
      DateTime dateTime3 = dateTime2.AddMinutes((double) int32_4);
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@HORAINI");
      this.xQueryValues.Add((object) dateTime2.ToString("hh:mm"));
      this.xQueryParameters.Add((object) "@HORAFIN");
      this.xQueryValues.Add((object) dateTime3.ToString("hh:mm"));
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarControles();
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarControles();
    }
  }
}
