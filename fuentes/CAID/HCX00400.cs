// Decompiled with JetBrains decompiler
// Type: CAID.HCX00400
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
  public class HCX00400 : Page
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
    protected Repeater rpPaxHeader;
    protected DropDownList cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected HtmlSelect cmbObjetivo;
    protected RequiredFieldValidator RequiredFieldValidator7;
    protected TextBox txtEvolucion;
    protected RequiredFieldValidator RequiredFieldValidator1;
    protected HtmlSelect cmbDiagnostico;
    protected TextBox txtDiagnostico;
    protected RequiredFieldValidator valcmbDiagnostico;
    protected HtmlSelect cmbLaboratorios;
    protected HtmlButton btnSaveDetalles;
    protected TextBox txtLaboratorios;
    protected RequiredFieldValidator RequiredFieldValidator3;
    protected HtmlSelect cmbImagenes;
    protected HtmlButton Button1;
    protected TextBox txtImagenes;
    protected RequiredFieldValidator RequiredFieldValidator4;
    protected HtmlSelect cmbReceta;
    protected HtmlButton Button2;
    protected TextBox txtReceta;
    protected RequiredFieldValidator RequiredFieldValidator5;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string OBJETIVOGUID
    {
      get
      {
        return this.cmbObjetivo.Value.ToString().Trim().ToUpper();
      }
    }

    private string REFGUID
    {
      get
      {
        return this.cmbPaciente.SelectedValue.ToString().Trim().ToUpper();
      }
    }

    private string NOMBRE
    {
      get
      {
        return this.cmbPaciente.Items[this.cmbPaciente.SelectedIndex].Text.ToUpper().Trim();
      }
    }

    private string EVOLUCION
    {
      get
      {
        return this.txtEvolucion.Text.ToString().Trim().ToUpper();
      }
    }

    private string DIAGNOSTICO1
    {
      get
      {
        return this.cmbDiagnostico.Value.ToString().Trim().ToUpper();
      }
    }

    private string DIAGNOSTICO2
    {
      get
      {
        return this.txtDiagnostico.Text.ToString().Trim().ToUpper();
      }
    }

    private string LABORATORIOS
    {
      get
      {
        return this.txtLaboratorios.Text.ToString().Trim().ToUpper();
      }
    }

    private string IMAGENES
    {
      get
      {
        return this.txtImagenes.Text.ToString().Trim().ToUpper();
      }
    }

    private string RECETA
    {
      get
      {
        return this.txtReceta.Text.ToString().Trim().ToUpper();
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
      string str = this.Request.QueryString["X"];
      if (str == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
        this.rpData.DataSource = (object) null;
        this.rpData.DataBind();
        this._IniciarControles();
      }
      else
      {
        this.xGUID.Value = str;
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@GUID");
        this.xQueryValues.Add((object) this.ROWGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.xQuery = this.xBase + "S2";
        DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
        if (dataRow == null)
          return;
        this.cmbPaciente.SelectedValue = dataRow["REFGUID"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
    }

    private void _IniciarFormulario()
    {
      if (this.Request.QueryString["X"] == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
        this.pnlConsulta.Visible = true;
        this.pnlData.Visible = false;
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
      this._Show((object) null, (EventArgs) null);
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
      this.pnlConsulta.Visible = false;
      this.pnlData.Visible = true;
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Show(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S1";
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
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@OBJETIVOGUID");
      this.xQueryValues.Add((object) this.OBJETIVOGUID);
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) this.NOMBRE);
      this.xQueryParameters.Add((object) "@EVOLUCION");
      this.xQueryValues.Add((object) this.EVOLUCION);
      this.xQueryParameters.Add((object) "@DIAGNOSTICO1");
      this.xQueryValues.Add((object) this.DIAGNOSTICO1);
      this.xQueryParameters.Add((object) "@DIAGNOSTICO2");
      this.xQueryValues.Add((object) this.DIAGNOSTICO2);
      this.xQueryParameters.Add((object) "@LABORATORIOS ");
      this.xQueryValues.Add((object) this.LABORATORIOS);
      this.xQueryParameters.Add((object) "@IMAGENES");
      this.xQueryValues.Add((object) this.IMAGENES);
      this.xQueryParameters.Add((object) "@RECETA");
      this.xQueryValues.Add((object) this.RECETA);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "SI";
      if (!DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._IniciarFormulario();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
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
        this.cmbObjetivo.Items.Clear();
        this.cmbObjetivo.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
        foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("HCX00300_DS4", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
          this.cmbObjetivo.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
        this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter("PAX00000S5", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpPaxHeader.DataBind();
      }
      catch
      {
      }
      finally
      {
        if (this.cmbObjetivo.Items.Count == 1)
        {
          this.cmbObjetivo.Items.Clear();
          this.cmbObjetivo.Items.Add(new ListItem("-- NINGUNO --", string.Empty));
        }
      }
    }
  }
}
