// Decompiled with JetBrains decompiler
// Type: CAID.WebForm3
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
using System.Web.UI.WebControls;

namespace CAID
{
  public class WebForm3 : Page
  {
    protected HiddenField xGUID;
    protected Panel pnlConsulta;
    protected Chart Chart1;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Page.IsPostBack)
        return;
      DataTable table = DB.ExecuteAdapter(string.Format("CHARTPRUEBA"));
      DataSet dataSet = new DataSet();
      dataSet.Tables.Add(table);
      if (dataSet.Tables[0].Rows.Count > 0)
      {
        this.Chart1.ChartAreas.Add("chtArea");
        this.Chart1.ChartAreas[0].AxisX.Title = "Fecha de Atención";
        this.Chart1.ChartAreas[0].AxisX.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].AxisY.Title = "Porcentaje";
        this.Chart1.ChartAreas[0].AxisY.TitleFont = new Font("Sans Serif", 11f, FontStyle.Bold);
        this.Chart1.ChartAreas[0].BorderDashStyle = ChartDashStyle.Solid;
        this.Chart1.ChartAreas[0].BorderWidth = 2;
        this.Chart1.Legends.Add("B1 Ponlo (Encajados) - De Bolitas de colores");
        this.Chart1.Series.Add("B1 Ponlo (Encajados) - De Bolitas de colores");
        this.Chart1.Series[0].ChartType = SeriesChartType.Line;
        this.Chart1.Series[0].Points.DataBindXY((IEnumerable) dataSet.Tables[0].DefaultView, "CategoryName", (IEnumerable) dataSet.Tables[0].DefaultView, "UnitPrice");
        this.Chart1.Series[0].IsVisibleInLegend = true;
        this.Chart1.Series[0].IsValueShownAsLabel = true;
        this.Chart1.Series[0].ToolTip = "Data Point Y Value: #VALY{G}";
        this.Chart1.Series[0].BorderWidth = 3;
        this.Chart1.Series[0].Color = Color.Red;
        this.Chart1.Legends[0].LegendStyle = LegendStyle.Row;
        this.Chart1.Legends[0].TableStyle = LegendTableStyle.Tall;
        this.Chart1.Legends[0].Docking = Docking.Bottom;
      }
    }
  }
}
