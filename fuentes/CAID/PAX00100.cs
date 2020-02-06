// Decompiled with JetBrains decompiler
// Type: CAID.PAX00100
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
  public class PAX00100 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private DataTable dtQuiz = new DataTable();
    protected HiddenField xGUID;
    protected HiddenField xMASTER;
    protected HiddenField xGRUPONUM;
    protected HiddenField xPREGUNTANUM;
    protected HiddenField xPREGUNTAID;
    protected HiddenField xPREGUNTA;
    protected HiddenField xPOS;
    protected HiddenField xEND;
    protected Panel pnlConsulta;
    protected HtmlButton btnNew;
    protected HtmlButton btnNucleoFamiliar;
    protected HtmlInputText txtHoraIni;
    protected HtmlInputText txtPreguntaNum;
    protected HtmlSelect cmbPaciente;
    protected RequiredFieldValidator valcmbPaciente;
    protected Repeater rpNucleoFamiliar;
    protected HtmlInputText txtPregunta;
    protected RequiredFieldValidator RequiredFieldValidator3;
    protected HtmlSelect cmbRespuesta;
    protected RequiredFieldValidator valcmbRespuesta;
    protected TextBox txtRespuesta;
    protected HtmlButton btnNextQ;
    protected Panel pnlData;
    protected HtmlButton btnSave;
    protected HtmlButton btnCancel;
    protected HtmlSelect cmbCategoria;
    protected RequiredFieldValidator valcmbCategoria;
    protected HtmlSelect cmbMedico;
    protected RequiredFieldValidator valcmbMedico;
    protected HtmlSelect cmbTerapista;
    protected RequiredFieldValidator valcmbTerapista;
    protected HtmlSelect cmbEnfermera;
    protected RequiredFieldValidator valcmbEnfermera;
    protected HtmlSelect cmbAgente;
    protected RequiredFieldValidator valcmbAgente;
    protected TextBox txtComentarios;

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
        return this.cmbPaciente.Value.ToString().ToUpper();
      }
    }

    private string HORAINI
    {
      get
      {
        return this.txtHoraIni.Value.ToString().ToUpper();
      }
    }

    private string HORAFIN
    {
      get
      {
        return DateTime.Now.ToShortTimeString();
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

    private string MASTERGUID
    {
      get
      {
        return this.xMASTER.Value.ToString().ToUpper();
      }
    }

    private string GRUPONUM
    {
      get
      {
        return this.xGRUPONUM.Value.ToString().ToUpper();
      }
    }

    private string PREGUNTANUM
    {
      get
      {
        return this.xPREGUNTANUM.Value.ToString().ToUpper();
      }
    }

    private string PREGUNTAID
    {
      get
      {
        return this.xPREGUNTAID.Value.ToString().ToUpper();
      }
    }

    private string PREGUNTA
    {
      get
      {
        return this.xPREGUNTA.Value.ToString().ToUpper();
      }
    }

    private string RESPUESTAID
    {
      get
      {
        return this.cmbRespuesta.Value.ToString().ToUpper();
      }
    }

    private string RESPPUESTA1
    {
      get
      {
        return this.cmbRespuesta.Items[this.cmbRespuesta.SelectedIndex].Text;
      }
    }

    private string RESPPUESTA2
    {
      get
      {
        return this.txtRespuesta.Text.ToString().ToUpper();
      }
    }

    private string RESPPUESTA3
    {
      get
      {
        return "1";
      }
    }

    private string MEDICOID
    {
      get
      {
        return this.cmbMedico.Value.ToString().ToUpper();
      }
    }

    private string TERAPISTAID
    {
      get
      {
        return this.cmbTerapista.Value.ToString().ToUpper();
      }
    }

    private string ENFERMERAID
    {
      get
      {
        return this.cmbEnfermera.Value.ToString().ToUpper();
      }
    }

    private string AGENTEID
    {
      get
      {
        return this.cmbAgente.Value.ToString().ToUpper();
      }
    }

    private string CATEGORIAID
    {
      get
      {
        return this.cmbCategoria.Value.ToString().ToUpper();
      }
    }

    private string NOTAS
    {
      get
      {
        return this.txtComentarios.Text.Trim().ToUpper();
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
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpNucleoFamiliar.DataBind();
    }

    private void _Iniciar()
    {
      this.btnNucleoFamiliar.Visible = false;
      this.btnNew.Disabled = false;
      this.cmbPaciente.Disabled = false;
      this.cmbRespuesta.Disabled = true;
      this.txtRespuesta.Enabled = false;
      this.pnlConsulta.Visible = true;
      this.pnlData.Visible = false;
      this.txtRespuesta.Text = string.Empty;
      this.txtPregunta.Value = string.Empty;
      this.txtPreguntaNum.Value = string.Empty;
      this.cmbRespuesta.Items.Clear();
      this.cmbRespuesta.Items.Add(new ListItem("-- NO APLICA --", string.Empty));
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.xPOS.Value = "1";
      this.xEND.Value = "1";
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
      this.cmbMedico.Items.Clear();
      this.cmbTerapista.Items.Clear();
      this.cmbEnfermera.Items.Clear();
      this.cmbAgente.Items.Clear();
      this.cmbCategoria.Items.Clear();
      this.cmbMedico.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbTerapista.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbEnfermera.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbAgente.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.cmbCategoria.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@CLASEID");
      this.xQueryValues.Add((object) "1");
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbMedico.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@CLASEID");
      this.xQueryValues.Add((object) "2");
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbTerapista.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@CLASEID");
      this.xQueryValues.Add((object) "3");
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbEnfermera.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQueryParameters.Add((object) "@CLASEID");
      this.xQueryValues.Add((object) "4");
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX00300S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbAgente.Items.Add(new ListItem(row["FULLNAME"].ToString(), row["ROWGUID"].ToString()));
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@NOMBRE");
      this.xQueryValues.Add((object) "%");
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("PAX00200S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbCategoria.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
    }

    private void _IniciarEntrevista()
    {
      this.btnNucleoFamiliar.Visible = true;
      this.txtHoraIni.Value = DateTime.Now.ToShortTimeString();
      this.txtHoraIni.Disabled = true;
      this.cmbPaciente.Disabled = true;
      this.btnNew.Disabled = true;
      this.cmbRespuesta.Disabled = false;
      this.txtRespuesta.Enabled = true;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.dtQuiz = DB.ExecuteAdapter("PAX00100P1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.Session.Add("dtQuiz", (object) this.dtQuiz);
      if (this.dtQuiz.Rows.Count == 0)
        return;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xMASTER.Value = this.REFGUID;
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ESTADO");
      this.xQueryValues.Add((object) "A");
      this.xQueryParameters.Add((object) "@MEDICOID");
      this.xQueryValues.Add((object) "");
      this.xQueryParameters.Add((object) "@TERAPISTAID");
      this.xQueryValues.Add((object) "");
      this.xQueryParameters.Add((object) "@ENFERMERAID");
      this.xQueryValues.Add((object) "");
      this.xQueryParameters.Add((object) "@AGENTEID");
      this.xQueryValues.Add((object) "");
      this.xQueryParameters.Add((object) "@CATEGORIAID");
      this.xQueryValues.Add((object) "-1");
      this.xQueryParameters.Add((object) "@NOTAS");
      this.xQueryValues.Add((object) "");
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.xMASTER.Value.ToString());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      DB.ExecuteNonQuery("PAX00100_MSI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.dtQuiz.DefaultView.RowFilter = "PREGUNTANUM = " + this.xPOS.Value.ToString();
      DataTable table = this.dtQuiz.DefaultView.ToTable();
      this.xEND.Value = table.Rows[0]["PREGUNTATOTAL"].ToString();
      this.txtPreguntaNum.Value = table.Rows[0]["PREGUNTASTR"].ToString();
      this.txtPregunta.Value = table.Rows[0]["PREGUNTANOMBRE"].ToString();
      this.xGRUPONUM.Value = table.Rows[0]["GRUPOORDEN"].ToString();
      this.xPREGUNTANUM.Value = table.Rows[0]["PREGUNTANUM"].ToString();
      this.xPREGUNTAID.Value = table.Rows[0]["PREGUNTAID"].ToString();
      this.xPREGUNTA.Value = table.Rows[0]["PREGUNTANOMBRE"].ToString();
      this.cmbRespuesta.Items.Clear();
      this.cmbRespuesta.Items.Add(new ListItem("-- NO APLICA--", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) table.Rows)
        this.cmbRespuesta.Items.Add(new ListItem(row["RESPUESTANOMBRE"].ToString(), row["PREGUNTAID"].ToString()));
      this.txtRespuesta.Text = string.Empty;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpNucleoFamiliar.DataBind();
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xMASTER.Value = this.REFGUID;
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ESTADO");
      this.xQueryValues.Add((object) "F");
      this.xQueryParameters.Add((object) "@MEDICOID");
      this.xQueryValues.Add((object) this.MEDICOID);
      this.xQueryParameters.Add((object) "@TERAPISTAID");
      this.xQueryValues.Add((object) this.TERAPISTAID);
      this.xQueryParameters.Add((object) "@ENFERMERAID");
      this.xQueryValues.Add((object) this.ENFERMERAID);
      this.xQueryParameters.Add((object) "@AGENTEID");
      this.xQueryValues.Add((object) this.AGENTEID);
      this.xQueryParameters.Add((object) "@CATEGORIAID");
      this.xQueryValues.Add((object) this.CATEGORIAID);
      this.xQueryParameters.Add((object) "@NOTAS");
      this.xQueryValues.Add((object) this.NOTAS);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) this.xMASTER.Value.ToString());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      DB.ExecuteNonQuery("PAX00100_MSI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      if (!DB.ExecuteNonQuery("PAX00100_MSI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this._Iniciar();
    }

    protected void _NewQuiz(object sender, EventArgs e)
    {
      this._IniciarEntrevista();
    }

    protected void _Next(object sender, EventArgs e)
    {
      this.btnNucleoFamiliar.Visible = true;
      int num = Convert.ToInt32(this.xPOS.Value.ToString()) + 1;
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@MASTERGUID");
      this.xQueryValues.Add((object) this.MASTERGUID);
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@GRUPONUM");
      this.xQueryValues.Add((object) this.GRUPONUM);
      this.xQueryParameters.Add((object) "@PREGUNTANUM");
      this.xQueryValues.Add((object) this.PREGUNTANUM);
      this.xQueryParameters.Add((object) "@PREGUNTAID");
      this.xQueryValues.Add((object) this.PREGUNTAID);
      this.xQueryParameters.Add((object) "@PREGUNTA");
      this.xQueryValues.Add((object) this.PREGUNTA);
      this.xQueryParameters.Add((object) "@RESPUESTAID");
      this.xQueryValues.Add((object) this.RESPUESTAID);
      this.xQueryParameters.Add((object) "@RESPPUESTA1");
      this.xQueryValues.Add((object) this.RESPPUESTA1);
      this.xQueryParameters.Add((object) "@RESPPUESTA2");
      this.xQueryValues.Add((object) this.RESPPUESTA2);
      this.xQueryParameters.Add((object) "@RESPPUESTA3");
      this.xQueryValues.Add((object) this.RESPPUESTA3);
      this.xQueryParameters.Add((object) "@ROWGUID");
      this.xQueryValues.Add((object) Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Add((object) "@ROWUSERID");
      this.xQueryValues.Add((object) this.ROWUSERID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      if (!DB.ExecuteNonQuery("PAX00100SI", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure))
        return;
      this.txtRespuesta.Text = string.Empty;
      this.xPOS.Value = num.ToString();
      if (((DataTable) this.Session["dtQuiz"]).Rows.Count != 0)
      {
        try
        {
          ((DataTable) this.Session["dtQuiz"]).DefaultView.RowFilter = "PREGUNTANUM = " + this.xPOS.Value.ToString();
          DataTable table = ((DataTable) this.Session["dtQuiz"]).DefaultView.ToTable();
          this.txtPreguntaNum.Value = table.Rows[0]["PREGUNTASTR"].ToString();
          this.txtPregunta.Value = table.Rows[0]["PREGUNTANOMBRE"].ToString();
          this.xGRUPONUM.Value = table.Rows[0]["GRUPOORDEN"].ToString();
          this.xPREGUNTANUM.Value = table.Rows[0]["PREGUNTANUM"].ToString();
          this.xPREGUNTAID.Value = table.Rows[0]["PREGUNTAID"].ToString();
          this.xPREGUNTA.Value = table.Rows[0]["PREGUNTANOMBRE"].ToString();
          this.cmbRespuesta.Items.Clear();
          this.cmbRespuesta.Items.Add(new ListItem("-- NO APLICA --", string.Empty));
          foreach (DataRow row in (InternalDataCollectionBase) table.Rows)
            this.cmbRespuesta.Items.Add(new ListItem(row["RESPUESTANOMBRE"].ToString(), row["PREGUNTAID"].ToString()));
        }
        catch
        {
        }
      }
      if (num > Convert.ToInt32(this.xEND.Value.ToString()))
      {
        this.pnlConsulta.Visible = false;
        this.pnlData.Visible = true;
        this.btnNextQ.Disabled = num > Convert.ToInt32(this.xEND.Value.ToString());
      }
      else
      {
        this.xQueryParameters.Clear();
        this.xQueryValues.Clear();
        this.xQueryParameters.Add((object) "@REFGUID");
        this.xQueryValues.Add((object) this.REFGUID);
        this.xQueryParameters.Add((object) "@ROWSGXID");
        this.xQueryValues.Add((object) this.ROWSGXID);
        this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
        this.rpNucleoFamiliar.DataBind();
      }
    }

    protected void _OpenModalNF(object sender, EventArgs e)
    {
      ((Site_Master) this.Master)._OpenPAX00001(this.REFGUID, Guid.NewGuid().ToString().ToUpper());
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@REFGUID");
      this.xQueryValues.Add((object) this.REFGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.rpNucleoFamiliar.DataSource = (object) DB.ExecuteAdapter("PAX00001S3", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      this.rpNucleoFamiliar.DataBind();
    }
  }
}
