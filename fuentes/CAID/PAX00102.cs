// Decompiled with JetBrains decompiler
// Type: CAID.PAX00102
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
  public class PAX00102 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private DataTable dtQuiz = new DataTable();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected Repeater rpPaxHeader;
    protected Panel pnlEntrevista;
    protected DropDownList cmbPaciente;
    protected HtmlSelect txt1;
    protected HtmlInputText txt2;
    protected HtmlSelect txt3;
    protected HtmlInputText txt4;
    protected HtmlSelect txt5;
    protected HtmlInputText txt6;
    protected HtmlSelect txt7;
    protected HtmlInputText txt8;
    protected HtmlSelect txt9;
    protected HtmlSelect txt10;
    protected HtmlSelect txt11;
    protected HtmlSelect txt12;
    protected HtmlInputText txt13;
    protected HtmlInputText txt14;
    protected HtmlInputText txt15;
    protected HtmlSelect txt16;
    protected HtmlInputText txt17;
    protected HtmlInputText txt18;
    protected HtmlInputText txt19;
    protected HtmlInputText txt20;
    protected HtmlSelect txt21;
    protected HtmlSelect txt22;
    protected HtmlInputText txt23;
    protected HtmlInputText txt24;
    protected HtmlInputText txt25;
    protected HtmlInputText txt26;
    protected HtmlInputText txt27;
    protected HtmlInputText txt28;
    protected HtmlSelect txt29;
    protected HtmlInputText txt30;
    protected HtmlSelect txt31;
    protected HtmlInputText txt32;
    protected HtmlSelect txt33;
    protected HtmlInputText txt34;
    protected HtmlSelect txt35;
    protected HtmlSelect txt36;
    protected HtmlInputText txt37;
    protected HtmlInputText txt38;
    protected HtmlSelect txt39;
    protected HtmlInputText txt40;
    protected HtmlSelect txt41;
    protected HtmlSelect txt42;
    protected HtmlInputText txt43;
    protected HtmlSelect txt44;
    protected HtmlSelect txt45;
    protected HtmlInputText txt46;
    protected HtmlSelect txt47;
    protected HtmlInputText txt48;
    protected HtmlSelect txt49;
    protected HtmlInputText txt50;
    protected HtmlSelect txt51;
    protected HtmlInputText txt52;
    protected HtmlSelect txt53;
    protected HtmlInputText txt54;
    protected HtmlInputText txt55;
    protected HtmlInputText txt56;
    protected HtmlInputText txt57;
    protected HtmlInputText txt58;
    protected HtmlInputText txt59;
    protected HtmlInputText txt60;
    protected RegularExpressionValidator RegularExpressionValidator1;
    protected HtmlInputText txt61;
    protected RegularExpressionValidator RegularExpressionValidator2;
    protected HtmlInputText txt62;
    protected RegularExpressionValidator RegularExpressionValidator3;
    protected HtmlInputText txt63;
    protected RegularExpressionValidator RegularExpressionValidator4;
    protected HtmlInputText txt64;
    protected RegularExpressionValidator RegularExpressionValidator5;
    protected HtmlInputText txt65;
    protected RegularExpressionValidator RegularExpressionValidator6;
    protected HtmlInputText txt66;
    protected RegularExpressionValidator RegularExpressionValidator7;
    protected HtmlInputText txt67;
    protected RegularExpressionValidator RegularExpressionValidator8;
    protected HtmlInputText txt68;
    protected RegularExpressionValidator RegularExpressionValidator9;
    protected HtmlInputText txt69;
    protected RegularExpressionValidator RegularExpressionValidator10;
    protected TextBox txtComentarios;
    protected HtmlButton btnSave;
    protected HtmlButton btnShow;
    protected Repeater rpData;

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
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.txt5.Items.Clear();
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.txt5.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["NOMBRE"].ToString()));
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
      DataTable dataTable = DB.ExecuteAdapter(string.Format("SELECT * FROM vPAX00102 WHERE ROWSGXID = '{0}' ORDER BY ROWCDTE", (object) this.ROWSGXID));
      this.rpData.DataSource = (object) null;
      if (dataTable.Rows.Count != 0)
        this.rpData.DataSource = (object) dataTable;
      this.rpData.DataBind();
    }

    protected void _Save(object sender, EventArgs e)
    {
      Decimal num1 = new Decimal(0);
      Decimal num2 = new Decimal(0);
      Decimal num3 = new Decimal(0);
      Decimal num4 = new Decimal(0);
      Decimal num5 = new Decimal(0);
      Decimal num6 = new Decimal(0);
      Decimal num7 = new Decimal(0);
      Decimal num8 = new Decimal(0);
      Decimal num9 = new Decimal(0);
      Decimal num10 = new Decimal(0);
      Decimal num11 = new Decimal(0);
      Decimal num12 = new Decimal(0);
      Decimal num13;
      try
      {
        num13 = Convert.ToDecimal(this.txt60.Value.Trim());
      }
      catch
      {
        num13 = new Decimal(0);
      }
      Decimal num14;
      try
      {
        num14 = Convert.ToDecimal(this.txt62.Value.Trim());
      }
      catch
      {
        num14 = new Decimal(0);
      }
      Decimal num15;
      try
      {
        num15 = Convert.ToDecimal(this.txt64.Value.Trim());
      }
      catch
      {
        num15 = new Decimal(0);
      }
      Decimal num16;
      try
      {
        num16 = Convert.ToDecimal(this.txt66.Value.Trim());
      }
      catch
      {
        num16 = new Decimal(0);
      }
      Decimal num17;
      try
      {
        num17 = Convert.ToDecimal(this.txt68.Value.Trim());
      }
      catch
      {
        num17 = new Decimal(0);
      }
      try
      {
        num8 = Convert.ToDecimal(this.txt61.Value.Trim());
      }
      catch
      {
        num13 = new Decimal(0);
      }
      Decimal num18;
      try
      {
        num18 = Convert.ToDecimal(this.txt63.Value.Trim());
      }
      catch
      {
        num18 = new Decimal(0);
      }
      Decimal num19;
      try
      {
        num19 = Convert.ToDecimal(this.txt65.Value.Trim());
      }
      catch
      {
        num19 = new Decimal(0);
      }
      Decimal num20;
      try
      {
        num20 = Convert.ToDecimal(this.txt67.Value.Trim());
      }
      catch
      {
        num20 = new Decimal(0);
      }
      Decimal num21;
      try
      {
        num21 = Convert.ToDecimal(this.txt69.Value.Trim());
      }
      catch
      {
        num21 = new Decimal(0);
      }
      Decimal num22 = num13 + num14 + num15 + num16 + num17;
      Decimal num23 = num8 + num18 + num19 + num20 + num21;
      string str = "<h3>1. Datos Personales y/o Generales</h3></br><strong>¿El niño (a) reside con?</strong>  " + this.txt1.Value.Trim() + " " + this.txt2.Value.Trim() + "</br><strong>¿Quién cuida del niño?</strong>  " + this.txt3.Value.Trim() + " " + this.txt4.Value.Trim() + "</br><strong>¿Es Asegurado?</strong>  " + this.txt5.Value.Trim() + "</br><strong>Número de Afiliado</strong>  " + this.txt6.Value.Trim() + "</br><strong>Asiste el niño (a) a la escuela?</strong>  " + this.txt7.Value.Trim() + "</br><strong>Nomnbre del Centro</strong>  " + this.txt8.Value.Trim() + "</br><strong>¿A qué edad ingreso a la escuela?</strong>  " + this.txt9.Value.Trim() + "</br><strong>Grado escolar</strong>  " + this.txt10.Value.Trim() + "</br><strong>¿Qué tipo de centro escolar es?</strong>  " + this.txt11.Value.Trim() + "</br><strong>Características del centro</strong>  " + this.txt12.Value.Trim() + " " + this.txt13.Value.Trim() + "</br><strong>Diagnóstico Previo</strong>  " + this.txt14.Value.Trim() + "</br><strong>Centro profesional que realizó diagnóstico</strong>  " + this.txt15.Value.Trim() + "</br><strong>¿Recibe o ha recibido intervención terapéutica?</strong>  " + this.txt16.Value.Trim() + " " + this.txt17.Value.Trim() + "</br><strong>¿Cuáles Terapias recibe o ha recibido?</strong>  " + this.txt18.Value.Trim() + "</br><strong>Tiempo recibiendo terapias</strong>  " + this.txt19.Value.Trim() + "</br><strong>¿Dónde?</strong>  " + this.txt20.Value.Trim() + "</br><h3>2. Interacción Familiar y/o Social del Niño (a)</h3></br><strong>2.1 - Participa el niño (a) en actividades con la familia?</strong>  " + this.txt21.Value.Trim() + "</br><strong>2.2 - ¿Con que frecuencia?</strong>  " + this.txt22.Value.Trim() + "</br><strong>2.3 - ¿Cómo es un día en la vida del/de la niño(a)?</strong>  " + this.txt23.Value.Trim() + "</br><strong>2.4 - ¿Cómo es el ambiente en casa?</strong>  </br>" + this.txt24.Value.Trim() + "</br><strong>2.5 - ¿Cómo describiría la dinámica entre los padres?</strong>  " + this.txt25.Value.Trim() + "</br><strong>2.6 - ¿Cómo es la relación del niño/a con el cuidador/a principal?</strong>  " + this.txt26.Value.Trim() + "</br><strong>2.7 - ¿Cómo logra que el niño/a haga lo que usted quiere?</strong>  " + this.txt27.Value.Trim() + "</br><strong>2.8 - ¿Con quién duerme el niño/a?</strong>  " + this.txt28.Value.Trim() + "</br><strong>2.9 - En el último año ¿Ha habido cambios significativos en la vida del niño, tales cómo?</strong>  " + this.txt29.Value.Trim() + " " + this.txt30.Value.Trim() + "</br><h3>3. Interacción en la Escuela</h3></br><strong>3.1 - ¿Cómo se dio el proceso de ingreso a la escuela o centro educativo?</strong>  " + this.txt31.Value.Trim() + " " + this.txt32.Value.Trim() + "</br><strong>3.2 - ¿Cómo calificaría la experiencia escolar del niño/a?</strong>  " + this.txt33.Value.Trim() + " " + this.txt34.Value.Trim() + "</br><strong>3.3 - ¿Cómo se relaciona con otros niños/as?</strong>  " + this.txt35.Value.Trim() + "</br><strong>3.4 - ¿Cómo percibe el apoyo que le dan a su hijo/a la escuela y los maestros?</strong>  " + this.txt36.Value.Trim() + " " + this.txt37.Value.Trim() + "</br><strong>3.5 - ¿Qué le cuentan los maestros sobre su desempeño en la escuela?</strong>  " + this.txt38.Value.Trim() + "</br><h3>4. Interacción en la Comunidad</h3></br><strong>4.1 - ¿Participa el niño/a de actividades en su comunidad?</strong>  " + this.txt39.Value.Trim() + " " + this.txt40.Value.Trim() + "</br><strong>4.2 - ¿De qué forma sus vecinos o amigos interactúan con el niño/a? </strong> " + this.txt41.Value.Trim() + "</br><strong>4.3 - ¿Se ha sentido el niño/a o la familia excluído/a de actividades en la comunidad?</strong>  " + this.txt42.Value.Trim() + " " + this.txt43.Value.Trim() + "</br><h3>5. Datos Generales de la Vivienda</h3></br><strong>5.1 - Material predominante del piso</strong>  " + this.txt44.Value.Trim() + "</br><strong>5.2 - Material predominante de las paredes</strong>  " + this.txt45.Value.Trim() + " " + this.txt46.Value.Trim() + "</br><strong>5.3 - Material predominante del techo</strong>  " + this.txt47.Value.Trim() + " " + this.txt48.Value.Trim() + "</br><strong>5.4 - Fuente principal abastecimiento de agua </strong> " + this.txt49.Value.Trim() + " " + this.txt50.Value.Trim() + "</br><strong>5.5 - ¿Tiene servicio de electricidad?</strong>  " + this.txt51.Value.Trim() + " " + this.txt51.Value.Trim() + "</br><strong>5.6 - Tipo de servicio sanitario</strong>  " + this.txt53.Value.Trim() + " " + this.txt54.Value.Trim() + "</br><strong>5.7 - Composición de la vivienda</strong>  </br><strong>- Número de Habitaciones</strong>  " + this.txt55.Value.Trim() + "</br><strong>- Número de Dormitorios</strong>  " + this.txt56.Value.Trim() + "</br><strong>- Electrodomésticos Disponibles</strong>  " + this.txt57.Value.Trim() + "</br><strong>5.8 - Descripción del entorno de la vivienda</strong>  " + this.txt58.Value.Trim() + "</br><strong>5.9 - ¿Dispone de accesibilidad dentro de su recorrido habitual?</strong> " + this.txt59.Value.Trim() + "</br><h3>6. Relación de Ingresos y Gastos</h3></br><strong>Ingresos:</strong>  </br><strong>Sueldo</strong>                 " + num13.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Libre Ejercicio</strong>        " + num14.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Remesas</strong>                " + num15.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Pensión</strong>                " + num16.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Otros Ingresos</strong>        " + num17.ToString("#,#.00#;(#,#.00#)") + "</br><strong>TOTAL</strong>                  " + num22.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Gastos:</strong>   </br><strong>Alquiler o Hipoteca</strong>    " + num8.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Servivios</strong>              " + num18.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Gastos Escolares</strong>       " + num19.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Préstamos</strong>              " + num20.ToString("#,#.00#;(#,#.00#)") + "</br><strong>Otros Gastos</strong>           " + num21.ToString("#,#.00#;(#,#.00#)") + "</br><strong>TOTAL</strong>                  " + num23.ToString("#,#.00#;(#,#.00#)") + "</br><h3>Comentarios</h3></br>" + this.txtComentarios.Text.Trim();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      string upper = Guid.NewGuid().ToString().ToUpper();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ENTREVISTA");
      this.xQueryValues.Add((object) str);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) upper);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      if (!DB.ExecuteNonQuery("PAX00102SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.Response.Redirect("PAX00102.aspx");
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
      }
      catch
      {
      }
      finally
      {
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
      this.xCommand = ((LinkButton) sender).CommandName.ToString();
      this.xGUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (!(this.xCommand == "Print"))
          return;
        this.Session.Add("REPORT_URL", (object) "~/reports/PAX00102R1.rpt");
        this.Session.Add("REPORT_DATASOURCE", (object) string.Format("[PAX00102R1] @GUID = '{0}', @ROWSGXID = '{1}', @USRID = '{2}'", (object) this.xGUID.Value, (object) this.ROWSGXID, (object) this.ROWUSERID));
        this.Response.Write("<script>");
        this.Response.Write("window.open('PREVIEW.aspx','_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=500,width=800,height=600')");
        this.Response.Write("</script>");
      }
      catch
      {
      }
    }

    protected void _Show(object sender, EventArgs e)
    {
      this._Iniciar();
    }
  }
}
