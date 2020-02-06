// Decompiled with JetBrains decompiler
// Type: CAID.HCL00039R3
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00039R3 : Page
  {
    private static Random rand = new Random();
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField HiddenField1;
    protected HiddenField PacienteID;
    protected HiddenField MedicoID;
    protected HiddenField TerapistaID;
    protected HiddenField EnfermeraID;
    protected HiddenField OrigenID;
    protected HiddenField txtEnfID;
    protected HiddenField xGUID;
    protected HiddenField xActividadGUID;
    protected Panel pnlConsulta;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected DropDownList cmbEspecialidad;
    protected RequiredFieldValidator valcmbEspecialidad;
    protected DropDownList cmbObjetivo;
    protected RequiredFieldValidator valcmbObjetivo;
    protected DropDownList cmbTareas;
    protected RequiredFieldValidator valcmbTareas;
    protected HtmlButton btnShow;
    protected HtmlButton btnCancel;
    protected Chart Chart1;

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

    private string REFGUID
    {
      get
      {
        return this.cmbPaciente.SelectedValue.ToString().ToUpper();
      }
    }

    private string OBJGUID
    {
      get
      {
        return this.cmbObjetivo.SelectedValue.ToString().ToUpper();
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
      this.btnShow.Visible = Convert.ToBoolean(this.Session["CURRENTUSR_fnIMRIMIR"].ToString());
      this._Iniciar();
    }

    private void _Iniciar()
    {
      this.pnlConsulta.Visible = true;
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
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.cmbEspecialidad.Items.Clear();
      this.cmbEspecialidad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SMX30013S1 @ROWSGXID = '{0}', @NOMBRE = '{1}'", this.Session["CURRENTUSR_SGXID"], (object) '%')).Rows)
        this.cmbEspecialidad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.Chart1.Attributes.Add("style", "width: 100%;");
    }

    private void _IniciarControles()
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.txtRecordNo.Value = string.Empty;
      this.cmbObjetivo.SelectedValue = string.Empty;
    }

    private void _IniciarFormulario()
    {
    }

    protected void _New(object sender, EventArgs e)
    {
    }

    protected void _Clean(object sender, EventArgs e)
    {
      this.cmbPaciente.SelectedValue = string.Empty;
      this.txtRecordNo.Value = string.Empty;
      this.cmbObjetivo.SelectedValue = string.Empty;
      this.cmbEspecialidad.SelectedValue = string.Empty;
      this.Chart1.DataSource = (object) null;
      this.Chart1.DataBind();
    }

    protected void _Show(object sender, EventArgs e)
    {
      if (this.cmbTareas.SelectedValue == "TODAS")
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@OBJID");
        this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.REFGUID);
        DataTable dataTable = DB.ExecuteAdapter("HCX00300_DS13", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        if (dataTable.Rows.Count == 0)
          return;
        this.Chart1.ChartAreas.Add("chtArea");
        this.Chart1.ChartAreas[0].AxisX.Title = "Fecha de Atención";
        this.Chart1.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
        this.Chart1.ChartAreas[0].AxisX.Interval = 2.0;
        this.Chart1.ChartAreas[0].AxisY.Title = "Porcentaje";
        this.Chart1.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
        this.Chart1.ChartAreas[0].BorderWidth = 2;
        int index1 = 0;
        for (int index2 = 0; index2 < dataTable.Rows.Count; ++index2)
        {
          DataRow row = dataTable.Rows[index2];
          this.xQueryParameters.Clear();
          this.xQueryValues.Clear();
          this.xQueryParameters.Add((object) "@OBJID");
          this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
          this.xQueryParameters.Add((object) "@REFGUID");
          this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
          this.xQueryParameters.Add((object) "@TAREASGUID");
          this.xQueryValues.Add((object) row["TAREAS"].ToString());
          this.xQueryParameters.Add((object) "@ROWSGXID");
          this.xQueryValues.Add((object) this.ROWSGXID);
          DataTable table = DB.ExecuteAdapter(string.Format("HCL00039R3"), this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
          DataSet dataSet = new DataSet();
          dataSet.Tables.Add(table);
          if (dataSet.Tables[0].Rows.Count > 0)
          {
            this.Chart1.Legends.Add(row["TAREASNOMBRE"].ToString());
            this.Chart1.Series.Add(row["TAREASNOMBRE"].ToString());
            this.Chart1.Series[index1].ChartType = SeriesChartType.Line;
            this.Chart1.Series[index1].Points.DataBindXY((IEnumerable) dataSet.Tables[0].DefaultView, "FECHA", (IEnumerable) dataSet.Tables[0].DefaultView, "VALOR");
            this.Chart1.Series[index1].IsVisibleInLegend = true;
            this.Chart1.Series[index1].IsValueShownAsLabel = true;
            this.Chart1.Series[index1].ToolTip = "Data Point Y Value: #VALY{G}";
            Color color = Color.FromArgb(HCL00039R3.rand.Next(256), HCL00039R3.rand.Next(256), HCL00039R3.rand.Next(256));
            this.Chart1.Series[index1].BorderWidth = 3;
            this.Chart1.Series[index1].MarkerSize = 9;
            this.Chart1.Series[index1].MarkerStyle = MarkerStyle.Circle;
            this.Chart1.Series[index1].MarkerColor = color;
            this.Chart1.Series[index1].Color = color;
            this.Chart1.Legends[0].LegendStyle = LegendStyle.Row;
            this.Chart1.Legends[0].TableStyle = LegendTableStyle.Tall;
            this.Chart1.Legends[0].Docking = Docking.Bottom;
            ++index1;
          }
        }
      }
      else
      {
        this.Chart1.DataSource = (object) null;
        this.Chart1.DataBind();
        this.Chart1.ChartAreas.Add("chtArea");
        this.Chart1.ChartAreas[0].AxisX.Title = "Fecha de Atención";
        this.Chart1.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
        this.Chart1.ChartAreas[0].AxisX.Interval = 2.0;
        this.Chart1.ChartAreas[0].AxisY.Title = "Porcentaje";
        this.Chart1.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
        this.Chart1.ChartAreas[0].BorderWidth = 2;
        int index = 0;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@OBJID");
        this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
        this.xQueryParameters.Add((object) "@TAREASGUID");
        this.xQueryValues.Add((object) this.cmbTareas.SelectedValue);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        DataTable table = DB.ExecuteAdapter(string.Format("HCL00039R3"), this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataSet dataSet = new DataSet();
        dataSet.Tables.Add(table);
        if (dataSet.Tables[0].Rows.Count > 0)
        {
          this.Chart1.Legends.Add(this.cmbTareas.Items[this.cmbTareas.SelectedIndex].Text);
          this.Chart1.Series.Add(this.cmbTareas.Items[this.cmbTareas.SelectedIndex].Text);
          this.Chart1.Series[index].ChartType = SeriesChartType.Line;
          this.Chart1.Series[index].Points.DataBindXY((IEnumerable) dataSet.Tables[0].DefaultView, "FECHA", (IEnumerable) dataSet.Tables[0].DefaultView, "VALOR");
          this.Chart1.Series[index].IsVisibleInLegend = true;
          this.Chart1.Series[index].IsValueShownAsLabel = true;
          this.Chart1.Series[index].ToolTip = "Data Point Y Value: #VALY{G}";
          Color color = Color.FromArgb(HCL00039R3.rand.Next(256), HCL00039R3.rand.Next(256), HCL00039R3.rand.Next(256));
          this.Chart1.Series[index].BorderWidth = 3;
          this.Chart1.Series[index].MarkerSize = 9;
          this.Chart1.Series[index].MarkerStyle = MarkerStyle.Circle;
          this.Chart1.Series[index].MarkerColor = color;
          this.Chart1.Series[index].Color = color;
          this.Chart1.Legends[0].LegendStyle = LegendStyle.Row;
          this.Chart1.Legends[0].TableStyle = LegendTableStyle.Tall;
          this.Chart1.Legends[0].Docking = Docking.Bottom;
          int num = index + 1;
        }
      }
    }

    protected void _Search2(object sender, EventArgs e)
    {
      string upper = this.txtRecordNo.Value.ToString().ToUpper();
      if (upper.Trim() == string.Empty)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@CEDULAID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = "PAX20101P2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbPaciente.SelectedValue = dataTable.Rows[0]["PACIENTEGUID"].ToString();
        this.txtRecordNo.Value = string.Empty;
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }

    protected void cmbEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
    {
      if (this.cmbPaciente.SelectedValue == "")
      {
        this.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Debe Seleccionar un Paciente');", true);
        this.cmbEspecialidad.SelectedValue = string.Empty;
      }
      else
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQueryParameters.Add((object) "@ESPGUID");
        this.xQueryValues.Add((object) this.cmbEspecialidad.SelectedValue);
        this.cmbObjetivo.Items.Clear();
        this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("HCX00300S6", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbObjetivo.Items.Add(new ListItem(row["OBJETIVONOMBRE"].ToString(), row["OBJETIVOGUID"].ToString()));
      }
    }

    protected void cmbObjetivo_SelectedIndexChanged(object sender, EventArgs e)
    {
      if (this.cmbObjetivo.SelectedValue == "")
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@OBJID");
      this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.cmbTareas.Items.Clear();
      this.cmbTareas.Items.Add(new ListItem("-- TODAS --", "TODAS"));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("HCX00300_DS13", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbTareas.Items.Add(new ListItem(row["TAREASNOMBRE"].ToString(), row["TAREAS"].ToString()));
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Cancel2(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _Back2(object sender, EventArgs e)
    {
      this.pnlConsulta.Visible = false;
    }
  }
}
