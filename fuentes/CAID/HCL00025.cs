// Decompiled with JetBrains decompiler
// Type: CAID.HCL00025
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00025 : Page
  {
    protected HiddenField _GUID;
    protected Repeater rpPaxHeader;
    protected HtmlSelect cmbTipo;
    protected RequiredFieldValidator cmbTipo1;
    protected HtmlInputText txtFecha;
    protected RequiredFieldValidator txtFecha1;
    protected HtmlInputText txtNombre;
    protected RequiredFieldValidator txtNombre1;
    protected HtmlTextArea txtResumen;
    protected HtmlInputFile File1;
    protected HtmlButton btnNew;
    protected HtmlButton btnSave;
    protected HtmlGenericControl preview;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (!this.IsPostBack)
      {
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
        this._New((object) null, (EventArgs) null);
      }
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }

    protected void _New(object sender, EventArgs e)
    {
      this.txtFecha.Value = string.Empty;
      this.txtNombre.Value = string.Empty;
      this.txtResumen.Value = string.Empty;
      this._GUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.preview.Attributes["src"] = string.Empty;
      this.txtFecha.Disabled = false;
      this.txtNombre.Disabled = false;
      this.txtResumen.Disabled = false;
      this.btnSave.Disabled = false;
      this.txtFecha.Value = DateTime.Now.ToString("MM/dd/yyyy");
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      if (this.Session["CurrentPAX_ROWGUID"].ToString().Trim() == string.Empty)
      {
        ((Site_Master) this.Master)._OpenAlert("Debe seleccionar un Paciente");
      }
      else
      {
        bool flag = false;
        string str1 = this.Session["CurrentPAX_ROWGUID"].ToString().Trim();
        string str2 = "MULTIMEDIA";
        string str3 = this.txtFecha.Value;
        string str4 = this.txtNombre.Value.ToString();
        string str5 = this.txtResumen.Value.ToString();
        string str6 = this._GUID.Value.ToString();
        string xREFGUID = this.Session["CurrentPAX_ROWGUID"].ToString();
        string xTERGUID = this.Session["CurrentUSR_TERID"].ToString();
        string xESPGUID = this.cmbTipo.Value.ToString();
        string str7 = this.Session["CurrentUSR_ROWGUID"].ToString();
        string str8 = "Archivos_Digitales";
        string path = this.Server.MapPath(".\\records\\") + str1 + "\\" + str8 + "\\";
        try
        {
          if (!Directory.Exists(path))
            Directory.CreateDirectory(path);
        }
        catch
        {
        }
        if (this.File1.PostedFile != null && this.File1.PostedFile.ContentLength > 0)
        {
          string extension = Path.GetExtension(Path.GetFileName(this.File1.PostedFile.FileName));
          string filename = string.Format("{0}{1}", (object) (path + this._GUID.Value.ToString()), (object) extension);
          try
          {
            flag = true;
            this.File1.PostedFile.SaveAs(filename);
            ((Site_Master) this.Master)._Notify("El archivo fue cargado al expediente digital del paciente");
          }
          catch (Exception ex)
          {
            flag = false;
            ((Site_Master) this.Master)._OpenAlert("Error: " + ex.Message);
          }
          finally
          {
            if (flag)
            {
              if (((Site_Master) this.Master).Crear_ActoMédico(xREFGUID, xTERGUID, xESPGUID))
              {
                if (DB.ExecuteNonQuery(string.Format("[HCL00025SI] '{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}'", (object) str1, (object) str2, (object) str3, (object) str4, (object) str5, (object) (str6 + extension), (object) xREFGUID, (object) xTERGUID, (object) str7)))
                {
                  this.preview.Attributes["src"] = "records/" + str1 + "/" + str8 + "/" + this._GUID.Value.ToString() + extension;
                  this.txtFecha.Disabled = true;
                  this.txtNombre.Disabled = true;
                  this.txtResumen.Disabled = true;
                  this.btnSave.Disabled = true;
                }
              }
            }
            else
              this.preview.Attributes["src"] = string.Empty;
          }
        }
        else
          ((Site_Master) this.Master)._Notify("Debe seleccionar un archivo para cargar");
      }
    }
  }
}
