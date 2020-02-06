// Decompiled with JetBrains decompiler
// Type: CAID.PAX00101
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
  public class PAX00101 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private DataTable dtQuiz = new DataTable();
    protected HiddenField xGUID;
    protected Repeater rpPaxHeader;
    protected HtmlButton btnSave;
    protected DropDownList cmbPaciente;
    protected HtmlSelect txtP1;
    protected HtmlSelect txtP2;
    protected HtmlSelect txtP3;
    protected HtmlSelect txtP4;
    protected HtmlSelect txtP5;
    protected HtmlSelect txtP6;
    protected HtmlSelect txtP7;
    protected HtmlSelect txtP8;
    protected HtmlSelect txtP9;
    protected HtmlSelect txtP10;
    protected Repeater rpData;
    protected Panel pnlClaseSocial;
    protected HtmlInputText txtTotal;
    protected HtmlSelect txtCategoria;
    protected HtmlButton btnSaveNCF;
    protected HtmlGenericControl MainShadow;

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
        return this.cmbPaciente.SelectedValue.ToString().ToUpper();
      }
    }

    private string P1
    {
      get
      {
        return this.txtP1.Value.ToString().ToUpper();
      }
    }

    private string P2
    {
      get
      {
        return this.txtP2.Value.ToString().ToUpper();
      }
    }

    private string P3
    {
      get
      {
        return this.txtP3.Value.ToString().ToUpper();
      }
    }

    private string P4
    {
      get
      {
        return this.txtP4.Value.ToString().ToUpper();
      }
    }

    private string P5
    {
      get
      {
        return this.txtP5.Value.ToString().ToUpper();
      }
    }

    private string P6
    {
      get
      {
        return this.txtP6.Value.ToString().ToUpper();
      }
    }

    private string P7
    {
      get
      {
        return this.txtP7.Value.ToString().ToUpper();
      }
    }

    private string P8
    {
      get
      {
        return this.txtP8.Value.ToString().ToUpper();
      }
    }

    private string P9
    {
      get
      {
        return this.txtP9.Value.ToString().ToUpper();
      }
    }

    private string P10
    {
      get
      {
        return this.txtP10.Value.ToString().ToUpper();
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
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.txtP1.Items.Clear();
      this.txtP2.Items.Clear();
      this.txtP3.Items.Clear();
      this.txtP4.Items.Clear();
      this.txtP5.Items.Clear();
      this.txtP6.Items.Clear();
      this.txtP7.Items.Clear();
      this.txtP8.Items.Clear();
      this.txtP9.Items.Clear();
      this.txtP10.Items.Clear();
      this.txtP1.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP2.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP3.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP4.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP5.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP6.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP7.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP8.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP9.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.txtP10.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '1'").Rows)
        this.txtP1.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '2'").Rows)
        this.txtP2.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '3'").Rows)
        this.txtP3.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '4'").Rows)
        this.txtP4.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '5'").Rows)
        this.txtP5.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '6'").Rows)
        this.txtP6.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '7'").Rows)
        this.txtP7.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '8'").Rows)
        this.txtP8.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '9'").Rows)
        this.txtP9.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00101_RS1 @PR = '10'").Rows)
        this.txtP10.Items.Add(new ListItem(row["RE"].ToString(), row["ROWGUID"].ToString()));
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      string upper = Guid.NewGuid().ToString().ToUpper();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@P1");
      this.xQueryValues.Add((object) this.P1);
      this.xQueryParameters.Add((object) "@P2");
      this.xQueryValues.Add((object) this.P2);
      this.xQueryParameters.Add((object) "@P3");
      this.xQueryValues.Add((object) this.P3);
      this.xQueryParameters.Add((object) "@P4");
      this.xQueryValues.Add((object) this.P4);
      this.xQueryParameters.Add((object) "@P5");
      this.xQueryValues.Add((object) this.P5);
      this.xQueryParameters.Add((object) "@P6");
      this.xQueryValues.Add((object) this.P6);
      this.xQueryParameters.Add((object) "@P7");
      this.xQueryValues.Add((object) this.P7);
      this.xQueryParameters.Add((object) "@P8");
      this.xQueryValues.Add((object) this.P8);
      this.xQueryParameters.Add((object) "@P9");
      this.xQueryValues.Add((object) this.P9);
      this.xQueryParameters.Add((object) "@P10");
      this.xQueryValues.Add((object) this.P10);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      if (!DB.ExecuteNonQuery("PAX00101SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      DataTable dataTable1 = DB.ExecuteAdapter(string.Format("SELECT * FROM vPAX00101 WHERE ROWGUID = '{0}'", (object) upper));
      if (dataTable1.Rows.Count == 0)
        return;
      this.txtTotal.Value = dataTable1.Rows[0]["TOTAL"].ToString();
      this.txtCategoria.Items.Clear();
      this.txtCategoria.Items.Add(new ListItem(dataTable1.Rows[0]["CATEGORIA"].ToString(), dataTable1.Rows[0]["CATEGORIA_CALCULADA"].ToString()));
      DataTable dataTable2 = DB.ExecuteAdapter(string.Format("SELECT * FROM vPAX00101 WHERE REFGUID = '{0}' ORDER BY ROWCDTE", (object) this.REFGUID));
      this.rpData.DataSource = (object) null;
      if (dataTable2.Rows.Count != 0)
        this.rpData.DataSource = (object) dataTable2;
      this.rpData.DataBind();
      this.MainShadow.Attributes.Add("class", "navi");
      this.pnlClaseSocial.Visible = true;
    }

    protected void cmbPaciente_SelectedIndexChanged(object sender, EventArgs e)
    {
      try
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.REFGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
        DataTable dataTable = DB.ExecuteAdapter(string.Format("SELECT * FROM vPAX00101 WHERE REFGUID = '{0}' ORDER BY ROWCDTE", (object) this.REFGUID));
        this.rpData.DataSource = (object) null;
        if (dataTable.Rows.Count != 0)
          this.rpData.DataSource = (object) dataTable;
        this.rpData.DataBind();
      }
      catch
      {
      }
      finally
      {
      }
    }

    protected void _CloseModal(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CATEGORIAID");
      this.xQueryValues.Add((object) this.txtCategoria.Value);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      if (!DB.ExecuteNonQuery("PAX00100_MP2", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.MainShadow.Attributes.Remove("class");
      if (this.pnlClaseSocial.Visible)
        this.pnlClaseSocial.Visible = false;
      this.txtP1.Value = string.Empty;
      this.txtP2.Value = string.Empty;
      this.txtP3.Value = string.Empty;
      this.txtP4.Value = string.Empty;
      this.txtP5.Value = string.Empty;
      this.txtP6.Value = string.Empty;
      this.txtP7.Value = string.Empty;
      this.txtP8.Value = string.Empty;
      this.txtP9.Value = string.Empty;
      this.txtP10.Value = string.Empty;
      this.cmbPaciente.SelectedValue = string.Empty;
      this.rpPaxHeader.DataSource = (object) null;
      this.rpPaxHeader.DataBind();
      this.rpData.DataSource = (object) null;
      this.rpData.DataBind();
    }
  }
}
