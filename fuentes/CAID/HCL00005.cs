// Decompiled with JetBrains decompiler
// Type: CAID.HCL00005
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CAID
{
  public class HCL00005 : Page
  {
    protected HiddenField _GUID;
    protected Repeater rpPaxHeader;
    protected HtmlGenericControl divConsulta;
    protected HtmlSelect cmbEstado;
    protected HtmlButton btnEstado;
    protected RequiredFieldValidator valcmbEstado;
    protected Repeater _DataBinder;
    protected HtmlGenericControl divEdicion;
    protected HtmlSelect txtEdad;
    protected RequiredFieldValidator txtEdad1;
    protected HtmlSelect txtVacuna;
    protected RequiredFieldValidator txtVacuna1;
    protected HtmlInputText txtLote;
    protected RequiredFieldValidator txtLote1;
    protected HtmlInputText txtFecha;
    protected RequiredFieldValidator txtFecha1;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
      this.Session["CurrentUSR_ROWGUID"].ToString();
      this.rpPaxHeader.DataSource = (object) DB.ExecuteAdapter(string.Format("PAX00000S5 @REFGUID = '{0}', @ROWSGXID = '{1}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"]));
      this.rpPaxHeader.DataBind();
      this.Validar();
    }

    private void Validar()
    {
      string empty = string.Empty;
      string sql = string.Format("[HCL00005S1] @GUID = '{0}', @ROWUSERID = '{1}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CurrentUSR_TERID"].ToString());
      this._DataBinder.DataSource = (object) DB.ExecuteAdapter(sql);
      this._DataBinder.DataBind();
      this.cmbEstado.Value = DB.ExecuteAdapter(sql).Rows[0]["ESTADO"].ToString();
      this.divConsulta.Visible = true;
      this.divEdicion.Visible = false;
      DataTable dataTable = DB.ExecuteAdapter(string.Format("PAX00000X1 @REFGUID = '{0}', @ROWSGXID = '{1}', @USERID = '{2}'", this.Session["CurrentPAX_ROWGUID"], this.Session["CURRENTUSR_SGXID"], this.Session["CurrentUSR_TERID"]));
      if (dataTable.Rows.Count == 0)
        return;
      this.Session.Add("xHTML_Options", (object) dataTable.Rows[0]["HTML_Options"].ToString());
      ((Site_Master) this.Master).Mostrar_Opciones_ActoMedico();
    }

    protected void _Select(object sender, EventArgs e)
    {
      string str = ((LinkButton) sender).CommandName.ToString();
      this._GUID.Value = ((LinkButton) sender).CommandArgument.ToString();
      try
      {
        if (str == "Apply" && Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        {
          DataTable dataTable = DB.ExecuteAdapter(string.Format("[HCL00005S1] @GUID = '{0}', @ROWUSERID = '{1}'", (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CurrentUSR_ROWGUID"].ToString()));
          if (dataTable.Rows.Count == 0)
            return;
          dataTable.DefaultView.RowFilter = string.Format("ROWGUID = '{0}'", (object) this._GUID.Value);
          DataTable table = dataTable.DefaultView.ToTable();
          this.txtEdad.Items.Clear();
          this.txtVacuna.Items.Clear();
          this.txtLote.Value = string.Empty;
          this.txtFecha.Value = string.Empty;
          this.txtEdad.Items.Add(new ListItem(table.Rows[0]["EDADNOMBRE"].ToString(), table.Rows[0]["EDADGUID"].ToString()));
          this.txtVacuna.Items.Add(new ListItem(table.Rows[0]["VACUNANOMBRE"].ToString(), table.Rows[0]["VACUNAGUID"].ToString()));
          this.txtLote.Value = table.Rows[0]["LOTE"].ToString().Trim();
          this.txtFecha.Value = table.Rows[0]["FECHA"].ToString().Trim() == string.Empty ? DateTime.Now.ToString("dd-MM-yyyy") : table.Rows[0]["FECHA"].ToString().Trim();
          this.btnSave.Disabled = table.Rows[0]["LOTE"].ToString().Trim() != string.Empty;
          this.txtEdad.Disabled = table.Rows[0]["LOTE"].ToString().Trim() != string.Empty;
          this.txtVacuna.Disabled = table.Rows[0]["LOTE"].ToString().Trim() != string.Empty;
          this.txtLote.Disabled = table.Rows[0]["LOTE"].ToString().Trim() != string.Empty;
          this.txtFecha.Disabled = table.Rows[0]["LOTE"].ToString().Trim() != string.Empty;
          this.divConsulta.Visible = false;
          this.divEdicion.Visible = true;
        }
      }
      catch
      {
      }
    }

    protected void _Save(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      if (!DB.ExecuteNonQuery(string.Format("[HCL00005SI] @FECHA = '{0}', @LOTE = '{1}', @ROWUSERID = '{2}', @ROWGUID = '{3}'", (object) this.txtFecha.Value.ToString(), (object) this.txtLote.Value.ToString(), (object) this.Session["CurrentUSR_ROWGUID"].ToString(), (object) this._GUID.Value.ToString())))
        return;
      ((Site_Master) this.Master)._Notify("Actualizado");
      this.Validar();
    }

    protected void _Cancel(object sender, EventArgs e)
    {
      this.divConsulta.Visible = true;
      this.divEdicion.Visible = false;
    }

    protected void _ActualizarEstado(object sender, EventArgs e)
    {
      if (!Convert.ToBoolean(this.Session["CurrentUSR_ROLEDITAR"].ToString()))
        return;
      if (!DB.ExecuteNonQuery(string.Format("[HCL00005P1] @ESTADO = '{0}', @PACGUID = '{1}', @ROWUSERID = '{2}', @ROWSGXID = '{3}'", (object) this.cmbEstado.Value.ToString(), (object) this.Session["CurrentPAX_ROWGUID"].ToString(), (object) this.Session["CurrentUSR_ROWGUID"].ToString(), (object) this.Session["CURRENTUSR_SGXID"].ToString())))
        return;
      this.Validar();
    }
  }
}
