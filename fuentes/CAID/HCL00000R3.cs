// Decompiled with JetBrains decompiler
// Type: CAID.HCL00000R3
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
  public class HCL00000R3 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField HiddenField1;
    protected HiddenField xGUID;
    protected Panel pnlR1;
    protected DropDownList cmbEspecialidad;
    protected RequiredFieldValidator valcmbEspecialidad;
    protected HtmlInputText txtFecha1;
    protected HtmlInputText txtFecha2;
    protected HtmlButton btnPrint;
    protected Label txtTotalAtenciones;
    protected Repeater rpReport1;

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

    private string FECHA1
    {
      get
      {
        return this.txtFecha1.Value.ToString();
      }
    }

    private string FECHA2
    {
      get
      {
        return this.txtFecha2.Value.ToString();
      }
    }

    private string ESPGUID
    {
      get
      {
        return this.cmbEspecialidad.SelectedValue.ToString().Trim().ToUpper();
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
      this.cmbEspecialidad.Items.Clear();
      this.cmbEspecialidad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbEspecialidad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }

    private void _IniciarControles()
    {
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _ShowReport(object sender, EventArgs e)
    {
      DataTable dataTable = DB.ExecuteAdapter(string.Format("[HCL00000R3] @FECHA1 = '{0}', @FECHA2 = '{1}',@ROWSGXID = '{2}',@USRID = '{3}',@ESPGUID = '{4}'", (object) this.FECHA1, (object) this.FECHA2, (object) this.ROWSGXID, (object) this.ROWUSERID, (object) this.ESPGUID));
      this.rpReport1.DataSource = (object) dataTable;
      this.rpReport1.DataBind();
      int num = 0;
      foreach (DataRow row in (InternalDataCollectionBase) dataTable.Rows)
        num += Convert.ToInt32(row["contador"]);
      this.txtTotalAtenciones.Text = num.ToString();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Cancel2(object sender, EventArgs e)
    {
      this._IniciarControles();
    }
  }
}
