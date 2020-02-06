// Decompiled with JetBrains decompiler
// Type: CAID.HCL00014
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Collections;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00014 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string ARCHIVO = string.Empty;
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
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected TextBox txtNotas;
    protected RequiredFieldValidator valtxttxtNotas;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator valcmbTipo;
    protected HtmlInputFile File1;

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
        return this.cmbPaciente.Value.ToString().Trim().ToUpper();
      }
    }

    private string TIPO
    {
      get
      {
        return this.cmbTipo.Value.ToString().Trim().ToUpper();
      }
    }

    private string NOTAS
    {
      get
      {
        return this.txtNotas.Text.ToString().Trim().ToUpper();
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

    private string ROOTDIRECTORY
    {
      get
      {
        return this.Server.MapPath(".\\records\\") + this.REFGUID + "\\multimedia\\";
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
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
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
        this.cmbPaciente.Value = dataRow["REFGUID"].ToString();
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
      }
    }

    private void _IniciarControles()
    {
      this.cmbPaciente.Value = string.Empty;
      this.txtNotas.Text = string.Empty;
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
        if (this.xCommand == "Delete")
        {
          if (!Convert.ToBoolean(this.Session["CURRENTUSR_fnELIMINAR"].ToString()))
            return;
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
        if (this.xCommand == "View")
        {
          string str = ((LinkButton) sender).CommandArgument.ToString();
          try
          {
            this.Response.Write("<script>window.open('" + str + "','_blank');</script>");
          }
          catch
          {
          }
        }
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (this.REFGUID == string.Empty)
      {
        this.Response.Write("Error: Debe seleccionar un Paciente");
      }
      else
      {
        bool flag = false;
        if (this.File1.PostedFile != null && this.File1.PostedFile.ContentLength > 0)
        {
          string extension = Path.GetExtension(Path.GetFileName(this.File1.PostedFile.FileName));
          try
          {
            if (!Directory.Exists(this.ROOTDIRECTORY))
              Directory.CreateDirectory(this.ROOTDIRECTORY);
          }
          catch
          {
          }
          string upper = Guid.NewGuid().ToString().ToUpper();
          string filename = string.Format("{0}{1}", (object) (this.ROOTDIRECTORY + upper), (object) extension);
          try
          {
            flag = true;
            this.File1.PostedFile.SaveAs(filename);
            this.Response.Write("El archivo fue cargado satisfactoriamente");
          }
          catch (Exception ex)
          {
            flag = false;
            this.Response.Write("Error: " + ex.Message);
          }
          finally
          {
            if (flag)
            {
              this.xQueryParameters.Clear();
              this.xQueryValues.Clear();
              this.ARCHIVO = string.Format("{0}{1}", (object) upper, (object) extension);
              this.xQueryParameters.Add((object) "@REFGUID");
              this.xQueryValues.Add((object) this.REFGUID);
              this.xQueryParameters.Add((object) "@TIPO");
              this.xQueryValues.Add((object) this.TIPO);
              this.xQueryParameters.Add((object) "@ARCHIVO");
              this.xQueryValues.Add((object) this.ARCHIVO);
              this.xQueryParameters.Add((object) "@NOTAS");
              this.xQueryValues.Add((object) this.NOTAS);
              this.xQueryParameters.Add((object) "@ROWGUID");
              this.xQueryValues.Add((object) this.ROWGUID);
              this.xQueryParameters.Add((object) "@ROWUSERID");
              this.xQueryValues.Add((object) this.ROWUSERID);
              this.xQueryParameters.Add((object) "@ROWSGXID");
              this.xQueryValues.Add((object) this.ROWSGXID);
              this.xQuery = this.xBase + "SI";
              if (DB.ExecuteNonQuery(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
              {
                ((Site_Master) this.Master)._Notify("Guardado Correctamente");
                this._IniciarFormulario();
              }
            }
          }
        }
        else
          this.Response.Write("Debe seleccionar una imagen para cargar.");
      }
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Back(object sender, EventArgs e)
    {
      this._IniciarFormulario();
    }

    protected void _Print(object sender, EventArgs e)
    {
      this.Response.Write("<script>window.print()</script>");
    }
  }
}
