// Decompiled with JetBrains decompiler
// Type: CAID.HCL00023
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
  public class HCL00023 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected Repeater rpPaxHeader;
    protected HtmlInputText txtRecordNo;
    protected HtmlButton btnFilter2;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected DropDownList cmbTipoOBJ;
    protected DropDownList cmbObjetivo;
    protected RequiredFieldValidator valcmbObjetivo;
    protected Repeater rpActividades;
    protected Repeater rpAsignadas;

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
      this.Session["CurrentUSR_ROWGUID"].ToString();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.cmbPaciente.Items.Clear();
      this.cmbPaciente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00000S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbPaciente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.cmbTipo.Items.Clear();
      this.cmbTipo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("SGX00100S4 @ROWSGXID = '{0}', @TERID = '{1}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"])).Rows)
        this.cmbTipo.Items.Add(new ListItem(row["ESPECIALIDADNOMBRE"].ToString(), row["ESPECIALIDADID"].ToString()));
      if (this.cmbTipo.Items.Count == 2)
        this.cmbTipo.SelectedIndex = 1;
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbTipoOBJ.Items.Clear();
      this.cmbTipoOBJ.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      if (this.cmbObjetivo.SelectedValue == "")
      {
        this.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Debe seleccione un objetivo!');", true);
      }
      else
      {
        string selectedValue = this.cmbPaciente.SelectedValue;
        this.Session["CurrentUSR_TERID"].ToString();
        this.Session["CurrentUSR_ROWGUID"].ToString();
        this.Session["CURRENTUSR_SGXID"].ToString();
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
        this.xQueryParameters.Add((object) "@NOMBRE");
        this.xQueryValues.Add((object) this.cmbObjetivo.Items[this.cmbObjetivo.SelectedIndex].Text);
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add(this.Session["CurrentUSR_ROWGUID"]);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
        this.xQueryParameters.Add((object) "@ESPECILIDADGUID");
        this.xQueryValues.Add((object) this.cmbTipo.Value);
        this.xQueryParameters.Add((object) "@OBJETIVOGUID");
        this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
        this.xQuery = "HCX00300SI2";
        if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
          return;
        string str1 = ((LinkButton) sender).CommandName.ToString();
        string str2 = ((LinkButton) sender).CommandArgument.ToString();
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@OBJETIVOR");
        this.xQueryValues.Add((object) this.cmbObjetivo.SelectedValue);
        this.xQueryParameters.Add((object) "@NOMBRE");
        this.xQueryValues.Add((object) str1);
        this.xQueryParameters.Add((object) "@COMPLETADO");
        this.xQueryValues.Add((object) 0);
        this.xQueryParameters.Add((object) "@ROWGUID");
        this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
        this.xQueryParameters.Add((object) "@ROWUSERID");
        this.xQueryValues.Add(this.Session["CurrentUSR_ROWGUID"]);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
        this.xQueryParameters.Add((object) "@PACIENTEGUID");
        this.xQueryValues.Add((object) this.cmbPaciente.SelectedValue);
        this.xQueryParameters.Add((object) "@ACTIVIDADGUID");
        this.xQueryValues.Add((object) str2);
        this.xQuery = "HCX00300_DSI2";
        if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        {
          ((Site_Master) this.Master)._Notify("Actualizado");
          this._Show((object) null, (EventArgs) null);
        }
      }
    }

    protected void _DeleteActividad(object sender, EventArgs e)
    {
      if (DB.ExecuteNonQuery(string.Format("[HCX00300_DSD] @ROWGUID = '{0}', @ROWUSERID = '{1}', @ROWSGXID = '{2}'", (object) ((LinkButton) sender).CommandArgument.ToString(), this.Session["CURRENTUSR_ID"], this.Session["CURRENTUSR_SGXID"])))
        ((Site_Master) this.Master)._Notify("Actualizado");
      this._Show((object) null, (EventArgs) null);
    }

    protected void _FillObj(object sender, EventArgs e)
    {
      this.cmbObjetivo.Items.Clear();
      this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter(string.Format("HCX00310S4 @ROWSGXID = '{0}', @TERID = '{1}', @TIPO = '{2}'", this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"], (object) this.cmbTipoOBJ.SelectedValue)).Rows)
        this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.rpActividades.DataSource = (object) null;
      this.rpActividades.DataBind();
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.rpActividades.DataSource = (object) DB.ExecuteAdapter(string.Format("HCX00311S3 @ROWSGXID = '{0}', @OBJID = '{1}', @REFGUID = '{2}'", this.Session["CURRENTUSR_SGXID"], (object) this.cmbObjetivo.SelectedValue.ToString(), (object) this.cmbPaciente.SelectedValue));
      this.rpActividades.DataBind();
      this.rpAsignadas.DataSource = (object) DB.ExecuteAdapter(string.Format("HCX00300_DS11 @REFGUID = '{0}', @OBJID = '{1}', @ROWSGXID = '{2}'", (object) this.cmbPaciente.SelectedValue, (object) this.cmbObjetivo.SelectedValue, this.Session["CURRENTUSR_SGXID"]));
      this.rpAsignadas.DataBind();
    }

    protected void cmbPaciente_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.cmbTipoOBJ.Items.Clear();
      this.cmbTipoOBJ.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SELECT * FROM vTIPOOBJETIVO ORDER BY ORDEN").Rows)
        this.cmbTipoOBJ.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", (object) this.cmbPaciente.SelectedValue, this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
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
      this.xQueryValues.Add(this.Session["CURRENTUSR_SGXID"]);
      this.xQuery = "PAX20101P2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (dataTable.Rows.Count != 0)
      {
        this.cmbPaciente.SelectedValue = dataTable.Rows[0]["PACIENTEGUID"].ToString();
        this.txtRecordNo.Value = string.Empty;
        this.cmbPaciente_SelectedIndexChanged((object) null, (EventArgs) null);
      }
      else
        ((Site_Master) this.Master)._Notify("Record No. " + upper.Trim() + " No Registrado");
    }
  }
}
