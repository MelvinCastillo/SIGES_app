// Decompiled with JetBrains decompiler
// Type: CAID.index
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using CAID.Data;
using CAID.Entity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAID
{
  public class index : Page
  {
    private static ArrayList xQueryParameters = new ArrayList();
    private static ArrayList xQueryValues = new ArrayList();
    private string xCommand;
    protected HiddenField data_genero;
    protected HiddenField data_em;
    protected HiddenField data_pa;

    private string xBase
    {
      get
      {
        return this.Page.GetType().BaseType.Name.ToString();
      }
    }

    private static string ROWUSERID
    {
      get
      {
        return CURRENTUSR.get_ID();
      }
    }

    private static string ROWSGXID
    {
      get
      {
        return CURRENTUSR.get_SGXID();
      }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["CURRENTUSR_ID"].ToString().Trim() == string.Empty)
      {
        this.Session.Abandon();
        this.Response.Redirect("LOGIN.aspx");
      }
      this.Response.AddHeader("Refresh", Convert.ToString(this.Session.Timeout * 60 - 10));
      if (!(this.Session["CurrentUSR_ROLDASHBOARD"].ToString().ToLower() != "index.aspx"))
        return;
      this.Response.Redirect(this.Session["CurrentUSR_ROLDASHBOARD"].ToString());
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<index.Diagnostico> DiagnosticoPacientesRecibidos()
    {
      return index.Diagnostico.GetAll();
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<index.Genero> DistribucionPacientesGenero()
    {
      return index.Genero.GetAll();
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<index.RangoEdad> RangoEdadPacientes()
    {
      return index.RangoEdad.GetAll();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<index.Status> StatusPacientes()
    {
      return index.Status.GetAll();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<index.Clacificacion> ClacificacionSocioeconomicaPacientes()
    {
      return index.Clacificacion.GetAll();
    }

    public class Diagnostico
    {
      public string DiagnosticoRecibidos { get; set; }

      public int Pacientes { get; set; }

      public static List<index.Diagnostico> GetAll()
      {
        return new List<index.Diagnostico>()
        {
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Espectro Autista (TEA)",
            Pacientes = 491
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Parálisis Cerebral Infantil",
            Pacientes = 164
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Down",
            Pacientes = 124
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Retraso Psicomotor",
            Pacientes = 65
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Déficit de Atencion y Aprendizaje",
            Pacientes = 44
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Habla y del Lenguaje",
            Pacientes = 44
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Diagnostico no definido",
            Pacientes = 26
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Discapacidad Intelectual",
            Pacientes = 9
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de West",
            Pacientes = 5
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Sindrome de Rett",
            Pacientes = 4
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Edward",
            Pacientes = 2
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Goldenhartd",
            Pacientes = 2
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Distrofia Muscular Degenerativa",
            Pacientes = 2
          },
          new index.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome Arnold Chiari",
            Pacientes = 1
          }
        };
      }
    }

    public class Genero
    {
      public string Sexo { get; set; }

      public int Pacientes { get; set; }

      public static List<index.Genero> GetAll()
      {
        DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object) 10, (object) index.ROWSGXID));
        List<index.Genero> generoList = new List<index.Genero>();
        foreach (DataRow row in (InternalDataCollectionBase) dataTable.Rows)
          generoList.Add(new index.Genero()
          {
            Sexo = row["Parametro"].ToString(),
            Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
          });
        return generoList;
      }
    }

    public class RangoEdad
    {
      public string Rango { get; set; }

      public int Pacientes { get; set; }

      public static List<index.RangoEdad> GetAll()
      {
        DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object) 15, (object) index.ROWSGXID));
        List<index.RangoEdad> rangoEdadList = new List<index.RangoEdad>();
        foreach (DataRow row in (InternalDataCollectionBase) dataTable.Rows)
          rangoEdadList.Add(new index.RangoEdad()
          {
            Rango = row["Parametro"].ToString(),
            Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
          });
        return rangoEdadList;
      }
    }

    public class Clacificacion
    {
      public string ClasificacionSocial { get; set; }

      public int Pacientes { get; set; }

      public static List<index.Clacificacion> GetAll()
      {
        DataTable dataTable = DB.ExecuteAdapter(string.Format("SGX00000R10 @REPORTID ='{0}', @ROWSGXID = '{1}'", (object) 20, (object) index.ROWSGXID));
        List<index.Clacificacion> clacificacionList = new List<index.Clacificacion>();
        foreach (DataRow row in (InternalDataCollectionBase) dataTable.Rows)
          clacificacionList.Add(new index.Clacificacion()
          {
            ClasificacionSocial = row["Parametro"].ToString(),
            Pacientes = Convert.ToInt32(row["Cantidad"].ToString())
          });
        return clacificacionList;
      }
    }

    public class Status
    {
      public string Estatus { get; set; }

      public int Pacientes { get; set; }

      public static List<index.Status> GetAll()
      {
        return new List<index.Status>()
        {
          new index.Status()
          {
            Estatus = "En proceso evaluación",
            Pacientes = 444
          },
          new index.Status()
          {
            Estatus = "Plan Terapéutico",
            Pacientes = 285
          },
          new index.Status()
          {
            Estatus = "En Espera Plan Terapeutico",
            Pacientes = 183
          },
          new index.Status() { Estatus = "Retirado", Pacientes = 34 },
          new index.Status() { Estatus = "Declinado", Pacientes = 19 },
          new index.Status()
          {
            Estatus = "Salida por Edad",
            Pacientes = 17
          },
          new index.Status() { Estatus = "Fallecido", Pacientes = 1 }
        };
      }
    }
  }
}
