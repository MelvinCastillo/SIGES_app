// Decompiled with JetBrains decompiler
// Type: Charts.graphics
// Assembly: CAID, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: DACE6779-43A1-43CA-8F66-682269B28117
// Assembly location: C:\Users\user\Desktop\CAID.dll

using System.Collections.Generic;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Charts
{
  public class graphics : Page
  {
    protected HtmlForm form1;

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<graphics.Diagnostico> DiagnosticoPacientesRecibidos()
    {
      return graphics.Diagnostico.GetAll();
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<graphics.Genero> DistribucionPacientesGenero()
    {
      return graphics.Genero.GetAll();
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<graphics.RangoEdad> RangoEdadPacientes()
    {
      return graphics.RangoEdad.GetAll();
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<graphics.Status> StatusPacientes()
    {
      return graphics.Status.GetAll();
    }

    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    [WebMethod]
    public static List<graphics.Clacificacion> ClacificacionSocioeconomicaPacientes()
    {
      return graphics.Clacificacion.GetAll();
    }

    public class Diagnostico
    {
      public string DiagnosticoRecibidos { get; set; }

      public int Pacientes { get; set; }

      public static List<graphics.Diagnostico> GetAll()
      {
        return new List<graphics.Diagnostico>()
        {
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Espectro Autista (TEA)",
            Pacientes = 491
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Parálisis Cerebral Infantil",
            Pacientes = 164
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Down",
            Pacientes = 124
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Retraso Psicomotor",
            Pacientes = 65
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Déficit de Atencion y Aprendizaje",
            Pacientes = 44
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Trastorno del Habla y del Lenguaje",
            Pacientes = 44
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Diagnostico no definido",
            Pacientes = 26
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Discapacidad Intelectual",
            Pacientes = 9
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de West",
            Pacientes = 5
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Sindrome de Rett",
            Pacientes = 4
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Edward",
            Pacientes = 2
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Síndrome de Goldenhartd",
            Pacientes = 2
          },
          new graphics.Diagnostico()
          {
            DiagnosticoRecibidos = "Distrofia Muscular Degenerativa",
            Pacientes = 2
          },
          new graphics.Diagnostico()
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

      public static List<graphics.Genero> GetAll()
      {
        return new List<graphics.Genero>()
        {
          new graphics.Genero()
          {
            Sexo = "Masculino",
            Pacientes = 679
          },
          new graphics.Genero() { Sexo = "Femenino", Pacientes = 304 }
        };
      }
    }

    public class RangoEdad
    {
      public string Rango { get; set; }

      public int Pacientes { get; set; }

      public static List<graphics.RangoEdad> GetAll()
      {
        return new List<graphics.RangoEdad>()
        {
          new graphics.RangoEdad()
          {
            Rango = "De 4 a 6 años",
            Pacientes = 430
          },
          new graphics.RangoEdad()
          {
            Rango = "De 7 a 10 años",
            Pacientes = 289
          },
          new graphics.RangoEdad()
          {
            Rango = "De 0 a 3 años ",
            Pacientes = 264
          }
        };
      }
    }

    public class Status
    {
      public string Estatus { get; set; }

      public int Pacientes { get; set; }

      public static List<graphics.Status> GetAll()
      {
        return new List<graphics.Status>()
        {
          new graphics.Status()
          {
            Estatus = "En proceso evaluación",
            Pacientes = 444
          },
          new graphics.Status()
          {
            Estatus = "Plan Terapéutico",
            Pacientes = 285
          },
          new graphics.Status()
          {
            Estatus = "En Espera Plan Terapeutico",
            Pacientes = 183
          },
          new graphics.Status()
          {
            Estatus = "Retirado",
            Pacientes = 34
          },
          new graphics.Status()
          {
            Estatus = "Declinado",
            Pacientes = 19
          },
          new graphics.Status()
          {
            Estatus = "Salida por Edad",
            Pacientes = 17
          },
          new graphics.Status()
          {
            Estatus = "Fallecido",
            Pacientes = 1
          }
        };
      }
    }

    public class Clacificacion
    {
      public string ClasificacionSocial { get; set; }

      public int Pacientes { get; set; }

      public static List<graphics.Clacificacion> GetAll()
      {
        return new List<graphics.Clacificacion>()
        {
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "D+ (Media Baja)",
            Pacientes = 332
          },
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "D (Baja)",
            Pacientes = 272
          },
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "C (Media)",
            Pacientes = 182
          },
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "E (Extrema Pobreza)",
            Pacientes = 168
          },
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "C+ (Media Alta)",
            Pacientes = 27
          },
          new graphics.Clacificacion()
          {
            ClasificacionSocial = "AB (Alta)",
            Pacientes = 207
          }
        };
      }
    }
  }
}
