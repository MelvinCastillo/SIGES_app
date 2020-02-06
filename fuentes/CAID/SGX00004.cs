// Decompiled with JetBrains decompiler
// Type: CAID.SGX00004
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
  public class SGX00004 : Page
  {
    private ArrayList xQueryParameters = new ArrayList();
    private ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    private string xQuery;
    protected HiddenField xGUID;
    protected HtmlButton btnSave;
    protected HtmlButton btnBack;
    protected DropDownList cmbEspecialidad;
    protected RequiredFieldValidator valcmbEspecialidad;
    protected HtmlSelect cmbC1;
    protected HtmlSelect cmbC2;
    protected HtmlSelect cmbC3;
    protected HtmlSelect cmbC4;
    protected HtmlSelect cmbC5;
    protected HtmlSelect cmbC6;
    protected HtmlSelect cmbC7;
    protected HtmlSelect cmbC8;
    protected HtmlSelect cmbC9;
    protected HtmlSelect cmbC10;
    protected HtmlSelect cmbC11;
    protected HtmlSelect cmbC12;
    protected HtmlSelect cmbC13;
    protected HtmlSelect cmbC14;
    protected HtmlSelect cmbC15;
    protected HtmlSelect cmbC16;
    protected HtmlSelect cmbC17;
    protected HtmlSelect cmbC18;
    protected HtmlSelect cmbC19;
    protected HtmlSelect cmbC20;
    protected HtmlSelect cmbC21;
    protected HtmlSelect cmbC22;
    protected HtmlSelect cmbC23;
    protected HtmlSelect cmbC24;
    protected HtmlSelect cmbC25;
    protected HtmlSelect cmbC26;
    protected HtmlSelect cmbC27;
    protected HtmlSelect cmbC28;
    protected HtmlSelect cmbC29;
    protected HtmlSelect cmbC30;
    protected HtmlSelect cmbC31;
    protected HtmlSelect cmbC32;
    protected HtmlSelect cmbC33;
    protected HtmlSelect cmbC34;
    protected HtmlSelect cmbC35;
    protected HtmlSelect cmbC36;
    protected HtmlSelect cmbC37;
    protected HtmlSelect cmbC38;
    protected HtmlSelect cmbC39;
    protected HtmlSelect cmbC40;
    protected HtmlSelect cmbC41;
    protected HtmlSelect cmbC42;
    protected HtmlSelect cmbC43;
    protected HtmlSelect cmbC44;
    protected HtmlSelect cmbC45;
    protected HtmlSelect cmbC46;
    protected HtmlSelect cmbC47;
    protected HtmlSelect cmbC48;
    protected HtmlSelect cmbC49;
    protected HtmlSelect cmbC50;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private string c1
    {
      get
      {
        return this.cmbC1.Value.ToString().Trim().ToUpper();
      }
    }

    private string c2
    {
      get
      {
        return this.cmbC2.Value.ToString().Trim().ToUpper();
      }
    }

    private string c3
    {
      get
      {
        return this.cmbC3.Value.ToString().Trim().ToUpper();
      }
    }

    private string c4
    {
      get
      {
        return this.cmbC4.Value.ToString().Trim().ToUpper();
      }
    }

    private string c5
    {
      get
      {
        return this.cmbC5.Value.ToString().Trim().ToUpper();
      }
    }

    private string c6
    {
      get
      {
        return this.cmbC6.Value.ToString().Trim().ToUpper();
      }
    }

    private string c7
    {
      get
      {
        return this.cmbC7.Value.ToString().Trim().ToUpper();
      }
    }

    private string c8
    {
      get
      {
        return this.cmbC8.Value.ToString().Trim().ToUpper();
      }
    }

    private string c9
    {
      get
      {
        return this.cmbC9.Value.ToString().Trim().ToUpper();
      }
    }

    private string c10
    {
      get
      {
        return this.cmbC10.Value.ToString().Trim().ToUpper();
      }
    }

    private string c11
    {
      get
      {
        return this.cmbC11.Value.ToString().Trim().ToUpper();
      }
    }

    private string c12
    {
      get
      {
        return this.cmbC12.Value.ToString().Trim().ToUpper();
      }
    }

    private string c13
    {
      get
      {
        return this.cmbC13.Value.ToString().Trim().ToUpper();
      }
    }

    private string c14
    {
      get
      {
        return this.cmbC14.Value.ToString().Trim().ToUpper();
      }
    }

    private string c15
    {
      get
      {
        return this.cmbC15.Value.ToString().Trim().ToUpper();
      }
    }

    private string c16
    {
      get
      {
        return this.cmbC16.Value.ToString().Trim().ToUpper();
      }
    }

    private string c17
    {
      get
      {
        return this.cmbC17.Value.ToString().Trim().ToUpper();
      }
    }

    private string c18
    {
      get
      {
        return this.cmbC18.Value.ToString().Trim().ToUpper();
      }
    }

    private string c19
    {
      get
      {
        return this.cmbC19.Value.ToString().Trim().ToUpper();
      }
    }

    private string c20
    {
      get
      {
        return this.cmbC20.Value.ToString().Trim().ToUpper();
      }
    }

    private string c21
    {
      get
      {
        return this.cmbC21.Value.ToString().Trim().ToUpper();
      }
    }

    private string c22
    {
      get
      {
        return this.cmbC22.Value.ToString().Trim().ToUpper();
      }
    }

    private string c23
    {
      get
      {
        return this.cmbC23.Value.ToString().Trim().ToUpper();
      }
    }

    private string c24
    {
      get
      {
        return this.cmbC24.Value.ToString().Trim().ToUpper();
      }
    }

    private string c25
    {
      get
      {
        return this.cmbC25.Value.ToString().Trim().ToUpper();
      }
    }

    private string c26
    {
      get
      {
        return this.cmbC26.Value.ToString().Trim().ToUpper();
      }
    }

    private string c27
    {
      get
      {
        return this.cmbC27.Value.ToString().Trim().ToUpper();
      }
    }

    private string c28
    {
      get
      {
        return this.cmbC28.Value.ToString().Trim().ToUpper();
      }
    }

    private string c29
    {
      get
      {
        return this.cmbC29.Value.ToString().Trim().ToUpper();
      }
    }

    private string c30
    {
      get
      {
        return this.cmbC30.Value.ToString().Trim().ToUpper();
      }
    }

    private string c31
    {
      get
      {
        return this.cmbC31.Value.ToString().Trim().ToUpper();
      }
    }

    private string c32
    {
      get
      {
        return this.cmbC32.Value.ToString().Trim().ToUpper();
      }
    }

    private string c33
    {
      get
      {
        return this.cmbC33.Value.ToString().Trim().ToUpper();
      }
    }

    private string c34
    {
      get
      {
        return this.cmbC34.Value.ToString().Trim().ToUpper();
      }
    }

    private string c35
    {
      get
      {
        return this.cmbC35.Value.ToString().Trim().ToUpper();
      }
    }

    private string c36
    {
      get
      {
        return this.cmbC36.Value.ToString().Trim().ToUpper();
      }
    }

    private string c37
    {
      get
      {
        return this.cmbC37.Value.ToString().Trim().ToUpper();
      }
    }

    private string c38
    {
      get
      {
        return this.cmbC38.Value.ToString().Trim().ToUpper();
      }
    }

    private string c39
    {
      get
      {
        return this.cmbC39.Value.ToString().Trim().ToUpper();
      }
    }

    private string c40
    {
      get
      {
        return this.cmbC40.Value.ToString().Trim().ToUpper();
      }
    }

    private string c41
    {
      get
      {
        return this.cmbC41.Value.ToString().Trim().ToUpper();
      }
    }

    private string c42
    {
      get
      {
        return this.cmbC42.Value.ToString().Trim().ToUpper();
      }
    }

    private string c43
    {
      get
      {
        return this.cmbC43.Value.ToString().Trim().ToUpper();
      }
    }

    private string c44
    {
      get
      {
        return this.cmbC44.Value.ToString().Trim().ToUpper();
      }
    }

    private string c45
    {
      get
      {
        return this.cmbC45.Value.ToString().Trim().ToUpper();
      }
    }

    private string c46
    {
      get
      {
        return this.cmbC46.Value.ToString().Trim().ToUpper();
      }
    }

    private string c47
    {
      get
      {
        return this.cmbC47.Value.ToString().Trim().ToUpper();
      }
    }

    private string c48
    {
      get
      {
        return this.cmbC48.Value.ToString().Trim().ToUpper();
      }
    }

    private string c49
    {
      get
      {
        return this.cmbC49.Value.ToString().Trim().ToUpper();
      }
    }

    private string c50
    {
      get
      {
        return this.cmbC50.Value.ToString().Trim().ToUpper();
      }
    }

    private string ROWGUID
    {
      get
      {
        return this.cmbEspecialidad.SelectedValue.ToString();
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
      this.cmbEspecialidad.Items.Clear();
      this.cmbEspecialidad.Items.Add(new ListItem("-- SELECCIONE --", string.Empty));
      foreach (DataRow row in (InternalDataCollectionBase) DB.ExecuteAdapter("SMX30014S1", this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure).Rows)
        this.cmbEspecialidad.Items.Add(new ListItem(row["NOMBRE"].ToString(), row["ROWGUID"].ToString()));
      if (this.Request.QueryString["X"] != null)
        return;
      this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
      this._IniciarControles();
    }

    private void _IniciarControles()
    {
      this.cmbEspecialidad.SelectedValue = string.Empty;
      this.cmbC1.Value = "0";
      this.cmbC2.Value = "0";
      this.cmbC3.Value = "0";
      this.cmbC4.Value = "0";
      this.cmbC5.Value = "0";
      this.cmbC6.Value = "0";
      this.cmbC7.Value = "0";
      this.cmbC8.Value = "0";
      this.cmbC9.Value = "0";
      this.cmbC10.Value = "0";
      this.cmbC11.Value = "0";
      this.cmbC12.Value = "0";
      this.cmbC13.Value = "0";
      this.cmbC14.Value = "0";
      this.cmbC15.Value = "0";
      this.cmbC16.Value = "0";
      this.cmbC17.Value = "0";
      this.cmbC18.Value = "0";
      this.cmbC19.Value = "0";
      this.cmbC20.Value = "0";
      this.cmbC21.Value = "0";
      this.cmbC22.Value = "0";
      this.cmbC23.Value = "0";
      this.cmbC24.Value = "0";
      this.cmbC25.Value = "0";
      this.cmbC26.Value = "0";
      this.cmbC27.Value = "0";
      this.cmbC28.Value = "0";
      this.cmbC29.Value = "0";
      this.cmbC30.Value = "0";
      this.cmbC31.Value = "0";
      this.cmbC32.Value = "0";
      this.cmbC33.Value = "0";
      this.cmbC34.Value = "0";
      this.cmbC35.Value = "0";
      this.cmbC36.Value = "0";
      this.cmbC37.Value = "0";
      this.cmbC38.Value = "0";
      this.cmbC39.Value = "0";
      this.cmbC40.Value = "0";
      this.cmbC41.Value = "0";
      this.cmbC42.Value = "0";
      this.cmbC43.Value = "0";
      this.cmbC44.Value = "0";
      this.cmbC45.Value = "0";
      this.cmbC46.Value = "0";
      this.cmbC47.Value = "0";
      this.cmbC48.Value = "0";
      this.cmbC49.Value = "0";
      this.cmbC50.Value = "0";
    }

    private void _IniciarFormulario()
    {
      if (this.Request.QueryString["X"] == null)
      {
        this.xGUID.Value = Guid.NewGuid().ToString().ToUpper();
        this._IniciarControles();
      }
      else
        this.Response.Redirect(this.xBase + ".aspx");
    }

    protected void _New(object sender, EventArgs e)
    {
      this._IniciarControles();
    }

    protected void _Export(object sender, EventArgs e)
    {
    }

    protected void _Save(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@ESPGUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@C1");
      this.xQueryValues.Add((object) this.c1);
      this.xQueryParameters.Add((object) "@C2");
      this.xQueryValues.Add((object) this.c2);
      this.xQueryParameters.Add((object) "@C3");
      this.xQueryValues.Add((object) this.c3);
      this.xQueryParameters.Add((object) "@C4");
      this.xQueryValues.Add((object) this.c4);
      this.xQueryParameters.Add((object) "@C5");
      this.xQueryValues.Add((object) this.c5);
      this.xQueryParameters.Add((object) "@C6");
      this.xQueryValues.Add((object) this.c6);
      this.xQueryParameters.Add((object) "@C7");
      this.xQueryValues.Add((object) this.c7);
      this.xQueryParameters.Add((object) "@C8");
      this.xQueryValues.Add((object) this.c8);
      this.xQueryParameters.Add((object) "@C9");
      this.xQueryValues.Add((object) this.c9);
      this.xQueryParameters.Add((object) "@C10");
      this.xQueryValues.Add((object) this.c10);
      this.xQueryParameters.Add((object) "@C11");
      this.xQueryValues.Add((object) this.c11);
      this.xQueryParameters.Add((object) "@C12");
      this.xQueryValues.Add((object) this.c12);
      this.xQueryParameters.Add((object) "@C13");
      this.xQueryValues.Add((object) this.c13);
      this.xQueryParameters.Add((object) "@C14");
      this.xQueryValues.Add((object) this.c14);
      this.xQueryParameters.Add((object) "@C15");
      this.xQueryValues.Add((object) this.c15);
      this.xQueryParameters.Add((object) "@C16");
      this.xQueryValues.Add((object) this.c16);
      this.xQueryParameters.Add((object) "@C17");
      this.xQueryValues.Add((object) this.c17);
      this.xQueryParameters.Add((object) "@C18");
      this.xQueryValues.Add((object) this.c18);
      this.xQueryParameters.Add((object) "@C19");
      this.xQueryValues.Add((object) this.c19);
      this.xQueryParameters.Add((object) "@C20");
      this.xQueryValues.Add((object) this.c20);
      this.xQueryParameters.Add((object) "@C21");
      this.xQueryValues.Add((object) this.c21);
      this.xQueryParameters.Add((object) "@C22");
      this.xQueryValues.Add((object) this.c22);
      this.xQueryParameters.Add((object) "@C23");
      this.xQueryValues.Add((object) this.c23);
      this.xQueryParameters.Add((object) "@C24");
      this.xQueryValues.Add((object) this.c24);
      this.xQueryParameters.Add((object) "@C25");
      this.xQueryValues.Add((object) this.c25);
      this.xQueryParameters.Add((object) "@C26");
      this.xQueryValues.Add((object) this.c26);
      this.xQueryParameters.Add((object) "@C27");
      this.xQueryValues.Add((object) this.c27);
      this.xQueryParameters.Add((object) "@C28");
      this.xQueryValues.Add((object) this.c28);
      this.xQueryParameters.Add((object) "@C29");
      this.xQueryValues.Add((object) this.c29);
      this.xQueryParameters.Add((object) "@C30");
      this.xQueryValues.Add((object) this.c30);
      this.xQueryParameters.Add((object) "@C31");
      this.xQueryValues.Add((object) this.c31);
      this.xQueryParameters.Add((object) "@C32");
      this.xQueryValues.Add((object) this.c32);
      this.xQueryParameters.Add((object) "@C33");
      this.xQueryValues.Add((object) this.c33);
      this.xQueryParameters.Add((object) "@C34");
      this.xQueryValues.Add((object) this.c34);
      this.xQueryParameters.Add((object) "@C35");
      this.xQueryValues.Add((object) this.c35);
      this.xQueryParameters.Add((object) "@C36");
      this.xQueryValues.Add((object) this.c36);
      this.xQueryParameters.Add((object) "@C37");
      this.xQueryValues.Add((object) this.c37);
      this.xQueryParameters.Add((object) "@C38");
      this.xQueryValues.Add((object) this.c38);
      this.xQueryParameters.Add((object) "@C39");
      this.xQueryValues.Add((object) this.c39);
      this.xQueryParameters.Add((object) "@C40");
      this.xQueryValues.Add((object) this.c40);
      this.xQueryParameters.Add((object) "@C41");
      this.xQueryValues.Add((object) this.c41);
      this.xQueryParameters.Add((object) "@C42");
      this.xQueryValues.Add((object) this.c42);
      this.xQueryParameters.Add((object) "@C43");
      this.xQueryValues.Add((object) this.c43);
      this.xQueryParameters.Add((object) "@C44");
      this.xQueryValues.Add((object) this.c44);
      this.xQueryParameters.Add((object) "@C45");
      this.xQueryValues.Add((object) this.c45);
      this.xQueryParameters.Add((object) "@C46");
      this.xQueryValues.Add((object) this.c46);
      this.xQueryParameters.Add((object) "@C47");
      this.xQueryValues.Add((object) this.c47);
      this.xQueryParameters.Add((object) "@C48");
      this.xQueryValues.Add((object) this.c48);
      this.xQueryParameters.Add((object) "@C49");
      this.xQueryValues.Add((object) this.c49);
      this.xQueryParameters.Add((object) "@C50");
      this.xQueryValues.Add((object) this.c50);
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

    protected void cmbEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.xQueryParameters.Clear();
      this.xQueryValues.Clear();
      this.xQueryParameters.Add((object) "@GUID");
      this.xQueryValues.Add((object) this.ROWGUID);
      this.xQueryParameters.Add((object) "@ROWSGXID");
      this.xQueryValues.Add((object) this.ROWSGXID);
      this.xQuery = this.xBase + "S2";
      DataTable dataTable = DB.ExecuteAdapter(this.xQuery, this.xQueryParameters, this.xQueryValues, CommandType.StoredProcedure);
      DataRow dataRow = dataTable.Rows.Count != 0 ? dataTable.Rows[0] : (DataRow) null;
      if (dataRow != null)
      {
        this.cmbC1.Value = Convert.ToBoolean(dataRow["C1"].ToString()) ? "1" : "0";
        this.cmbC2.Value = Convert.ToBoolean(dataRow["C2"].ToString()) ? "1" : "0";
        this.cmbC3.Value = Convert.ToBoolean(dataRow["C3"].ToString()) ? "1" : "0";
        this.cmbC4.Value = Convert.ToBoolean(dataRow["C4"].ToString()) ? "1" : "0";
        this.cmbC5.Value = Convert.ToBoolean(dataRow["C5"].ToString()) ? "1" : "0";
        this.cmbC6.Value = Convert.ToBoolean(dataRow["C6"].ToString()) ? "1" : "0";
        this.cmbC7.Value = Convert.ToBoolean(dataRow["C7"].ToString()) ? "1" : "0";
        this.cmbC8.Value = Convert.ToBoolean(dataRow["C8"].ToString()) ? "1" : "0";
        this.cmbC9.Value = Convert.ToBoolean(dataRow["C9"].ToString()) ? "1" : "0";
        this.cmbC10.Value = Convert.ToBoolean(dataRow["C10"].ToString()) ? "1" : "0";
        this.cmbC11.Value = Convert.ToBoolean(dataRow["C11"].ToString()) ? "1" : "0";
        this.cmbC12.Value = Convert.ToBoolean(dataRow["C12"].ToString()) ? "1" : "0";
        this.cmbC13.Value = Convert.ToBoolean(dataRow["C13"].ToString()) ? "1" : "0";
        this.cmbC14.Value = Convert.ToBoolean(dataRow["C14"].ToString()) ? "1" : "0";
        this.cmbC15.Value = Convert.ToBoolean(dataRow["C15"].ToString()) ? "1" : "0";
        this.cmbC16.Value = Convert.ToBoolean(dataRow["C16"].ToString()) ? "1" : "0";
        this.cmbC17.Value = Convert.ToBoolean(dataRow["C17"].ToString()) ? "1" : "0";
        this.cmbC18.Value = Convert.ToBoolean(dataRow["C18"].ToString()) ? "1" : "0";
        this.cmbC19.Value = Convert.ToBoolean(dataRow["C19"].ToString()) ? "1" : "0";
        this.cmbC20.Value = Convert.ToBoolean(dataRow["C20"].ToString()) ? "1" : "0";
        this.cmbC21.Value = Convert.ToBoolean(dataRow["C21"].ToString()) ? "1" : "0";
        this.cmbC22.Value = Convert.ToBoolean(dataRow["C22"].ToString()) ? "1" : "0";
        this.cmbC23.Value = Convert.ToBoolean(dataRow["C23"].ToString()) ? "1" : "0";
        this.cmbC24.Value = Convert.ToBoolean(dataRow["C24"].ToString()) ? "1" : "0";
        this.cmbC25.Value = Convert.ToBoolean(dataRow["C25"].ToString()) ? "1" : "0";
        this.cmbC26.Value = Convert.ToBoolean(dataRow["C26"].ToString()) ? "1" : "0";
        this.cmbC27.Value = Convert.ToBoolean(dataRow["C27"].ToString()) ? "1" : "0";
        this.cmbC28.Value = Convert.ToBoolean(dataRow["C28"].ToString()) ? "1" : "0";
        this.cmbC29.Value = Convert.ToBoolean(dataRow["C29"].ToString()) ? "1" : "0";
        this.cmbC30.Value = Convert.ToBoolean(dataRow["C30"].ToString()) ? "1" : "0";
        this.cmbC31.Value = Convert.ToBoolean(dataRow["C31"].ToString()) ? "1" : "0";
        this.cmbC32.Value = Convert.ToBoolean(dataRow["C32"].ToString()) ? "1" : "0";
        this.cmbC33.Value = Convert.ToBoolean(dataRow["C33"].ToString()) ? "1" : "0";
        this.cmbC34.Value = Convert.ToBoolean(dataRow["C34"].ToString()) ? "1" : "0";
        this.cmbC35.Value = Convert.ToBoolean(dataRow["C35"].ToString()) ? "1" : "0";
        this.cmbC36.Value = Convert.ToBoolean(dataRow["C36"].ToString()) ? "1" : "0";
        this.cmbC37.Value = Convert.ToBoolean(dataRow["C37"].ToString()) ? "1" : "0";
        this.cmbC38.Value = Convert.ToBoolean(dataRow["C38"].ToString()) ? "1" : "0";
        this.cmbC39.Value = Convert.ToBoolean(dataRow["C39"].ToString()) ? "1" : "0";
        this.cmbC40.Value = Convert.ToBoolean(dataRow["C40"].ToString()) ? "1" : "0";
        this.cmbC41.Value = Convert.ToBoolean(dataRow["C41"].ToString()) ? "1" : "0";
        this.cmbC42.Value = Convert.ToBoolean(dataRow["C42"].ToString()) ? "1" : "0";
        this.cmbC43.Value = Convert.ToBoolean(dataRow["C43"].ToString()) ? "1" : "0";
        this.cmbC44.Value = Convert.ToBoolean(dataRow["C44"].ToString()) ? "1" : "0";
        this.cmbC45.Value = Convert.ToBoolean(dataRow["C45"].ToString()) ? "1" : "0";
        this.cmbC46.Value = Convert.ToBoolean(dataRow["C46"].ToString()) ? "1" : "0";
        this.cmbC47.Value = Convert.ToBoolean(dataRow["C47"].ToString()) ? "1" : "0";
        this.cmbC48.Value = Convert.ToBoolean(dataRow["C48"].ToString()) ? "1" : "0";
        this.cmbC49.Value = Convert.ToBoolean(dataRow["C49"].ToString()) ? "1" : "0";
        this.cmbC50.Value = Convert.ToBoolean(dataRow["C50"].ToString()) ? "1" : "0";
      }
      else
      {
        this.cmbC1.Value = "0";
        this.cmbC2.Value = "0";
        this.cmbC3.Value = "0";
        this.cmbC4.Value = "0";
        this.cmbC5.Value = "0";
        this.cmbC6.Value = "0";
        this.cmbC7.Value = "0";
        this.cmbC8.Value = "0";
        this.cmbC9.Value = "0";
        this.cmbC10.Value = "0";
        this.cmbC11.Value = "0";
        this.cmbC12.Value = "0";
        this.cmbC13.Value = "0";
        this.cmbC14.Value = "0";
        this.cmbC15.Value = "0";
        this.cmbC16.Value = "0";
        this.cmbC17.Value = "0";
        this.cmbC18.Value = "0";
        this.cmbC19.Value = "0";
        this.cmbC20.Value = "0";
        this.cmbC21.Value = "0";
        this.cmbC22.Value = "0";
        this.cmbC23.Value = "0";
        this.cmbC24.Value = "0";
        this.cmbC25.Value = "0";
        this.cmbC26.Value = "0";
        this.cmbC27.Value = "0";
        this.cmbC28.Value = "0";
        this.cmbC29.Value = "0";
        this.cmbC30.Value = "0";
        this.cmbC31.Value = "0";
        this.cmbC32.Value = "0";
        this.cmbC33.Value = "0";
        this.cmbC34.Value = "0";
        this.cmbC35.Value = "0";
        this.cmbC36.Value = "0";
        this.cmbC37.Value = "0";
        this.cmbC38.Value = "0";
        this.cmbC39.Value = "0";
        this.cmbC40.Value = "0";
        this.cmbC41.Value = "0";
        this.cmbC42.Value = "0";
        this.cmbC43.Value = "0";
        this.cmbC44.Value = "0";
        this.cmbC45.Value = "0";
        this.cmbC46.Value = "0";
        this.cmbC47.Value = "0";
        this.cmbC48.Value = "0";
        this.cmbC49.Value = "0";
        this.cmbC50.Value = "0";
      }
    }
  }
}
