// Decompiled with JetBrains decompiler
// Type: CAID.HCL00022
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
  public class HCL00022 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl lblEvaluacion;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected TextBox txtDATOS1;
    protected RequiredFieldValidator txtDATOS1val;
    protected TextBox txtDATOS2;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected TextBox txtDATOS3;
    protected RequiredFieldValidator RequiredFieldValidator2;
    protected TextBox txtDATOS4;
    protected RequiredFieldValidator RequiredFieldValidator4;
    protected HtmlButton btnSave;
    protected Repeater rpHistorico;

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
      this.cmbTipo.Items.Clear();
      this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
      this.Validar();
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      string str1 = "";
      string str2 = this.txtDATOS1.Text.Trim();
      string str3 = this.txtDATOS2.Text.Trim();
      string str4 = this.txtDATOS3.Text.Trim();
      string str5 = this.txtDATOS4.Text.Trim();
      string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
      string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
      string xESPGUID = this.cmbTipo.Value.ToString();
      string str6 = this.Session["CurrentUSR_ROWGUID"].ToString();
      string str7 = this.Session["CURRENTUSR_SGXID"].ToString();
      if (!((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
        return;
      if (DB.ExecuteNonQuery(string.Format("[HCL00022SI] '{0}','{1}','{2}','{3}','{4}','{5}', '{6}','{7}','{8}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) xREFGUID, (object) xTERGUID, (object) str6, (object) str7)))
      {
        ((Site_Master) this.Master)._Notify("Registro Guardado");
        this.Validar();
      }
    }

    protected void _Select(object sender, EventArgs e)
    {
    }

    private void Validar()
    {
      this.txtDATOS1.Text = string.Empty;
      this.txtDATOS2.Text = string.Empty;
      this.txtDATOS3.Text = string.Empty;
      this.txtDATOS4.Text = string.Empty;
      this.txtDATOS1.Text = "•\tParticipantes en la entrevista:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tPersona/s a cargo del cuidado del paciente:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\t¿Quién maneja la disciplina del paciente?:" + Environment.NewLine;
      this.txtDATOS2.Text = "•\tRelación del paciente con el padre/padrastro:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tRelación con la madre/madrastra:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tRelación entre los padres:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tRelaciones fraternales:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tSituaciones que generan malestar en la pareja:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tSituaciones que generan malestar en la familia:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\t¿Hace qué tiempo le informaron del diagnóstico?" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\t¿Cómo ha impactado y manejado la familia la condición del paciente?  Reacción de los padres/ tutores desde el diagnóstico hasta la fecha:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tReacción de los demás familiares desde el diagnóstico hasta la fecha:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tImplicación de la comunidad con la condición del paciente:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tCambios, acomodaciones y adaptaciones en el ámbito físico y laboral debido a la condición del paciente. Posible problemáticas que ha generado:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tSituaciones especiales dentro del ámbito escolar: Integración, aceptación de su grupo de pares:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tConducta e interacción de el/la niño/a con su grupo de pares y adultos:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tExpectativas actuales de los familiares acerca de la condición:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tObjetivos de la intervención desde el punto de vista de la familia (papá/mamá/ abuelos, cuidadores etc.)" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\t¿Qué es para ustedes calidad de vida familiar?:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tListado de canciones favoritas de padre/madre o tutor(a). (Por ejemplo: canciones que le recuerden su infancia, un momento feliz en sus vidas,  cuando se conocieron o se casaron, etc.):" + Environment.NewLine;
      this.txtDATOS3.Text = "•\tProblemas identificados con sus respectivas evidencias:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tObjetivos de intervención según el terapeuta:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tTareas:" + Environment.NewLine;
      this.txtDATOS4.Text = "•\tConducta  del/los participantes  durante la sesión. Breve descripción de la apariencia física:" + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "•\tComentarios generales del terapeuta:" + Environment.NewLine;
      this.rpHistorico.DataSource = (object) DB.ExecuteAdapter(string.Format("HCL00022H @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpHistorico.DataBind();
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }
  }
}
