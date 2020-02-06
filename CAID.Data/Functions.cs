// Decompiled with JetBrains decompiler
// Type: CAID.Data.Functions
// Assembly: CAID.Data, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0844A0A0-02E5-4ED4-B169-D67EFAEF31F2
// Assembly location: C:\Users\user\Desktop\CAID.Data - Copy.dll

using System;
using System.Text;
using System.Text.RegularExpressions;

namespace CAID.Data
{
  public class Functions
  {
    public static string _fnServerName
    {
      get
      {
        return DB.Connection.DataSource.ToString();
      }
    }

    public static string _fnEnviroment
    {
      get
      {
        if (Functions._fnServerName.Contains("CAIDSIGES01") || Functions._fnServerName.Contains("172.16.150.11"))
          return "Producción".ToUpper();
        if (Functions._fnServerName.Contains("CAIDSIGES02"))
          return "Pruebas".ToUpper();
        if (Functions._fnServerName.Contains("172.16.150.12"))
          return "PRODUCCION".ToUpper();
        return "Desarrollo".ToLower();
      }
    }

    public static string Msg { get; set; }

    public static bool _fnStrongPassword(string pwd, int minLength = 6, int numUpper = 0, int numLower = 0, int numNumbers = 0, int numSpecial = 0)
    {
      Functions.Msg = "Contraseña Válida!";
      Regex regex1 = new Regex("[A-Z]");
      Regex regex2 = new Regex("[a-z]");
      Regex regex3 = new Regex("[0-9]");
      Regex regex4 = new Regex("[^a-zA-Z0-9]");
      if (pwd.Length < minLength)
      {
        Functions.Msg = "Se requiere un mínimo de " + minLength.ToString() + " carácteres";
        return false;
      }
      if (regex1.Matches(pwd).Count < numUpper)
      {
        Functions.Msg = "Se requiere un mínimo de " + numUpper.ToString() + " letras mayúsculas";
        return false;
      }
      if (regex2.Matches(pwd).Count < numLower)
      {
        Functions.Msg = "Se requiere un mínimo de " + numLower.ToString() + " letras minúsculas";
        return false;
      }
      if (regex3.Matches(pwd).Count < numNumbers)
      {
        Functions.Msg = "Se requiere un mínimo de " + numNumbers.ToString() + " números";
        return false;
      }
      if (regex4.Matches(pwd).Count >= numSpecial)
        return true;
      Functions.Msg = "Se requiere un mínimo de " + numSpecial.ToString() + " carácteres especiales";
      return false;
    }

    public static string _fnEncryptStr(string sData)
    {
      try
      {
        byte[] numArray = new byte[sData.Length];
        return Convert.ToBase64String(Encoding.UTF8.GetBytes(sData));
      }
      catch (Exception ex)
      {
        throw new Exception("Error in base64Encode" + ex.Message);
      }
    }

    public static string _fnDecryptStr(string sData)
    {
      Decoder decoder = new UTF8Encoding().GetDecoder();
      byte[] bytes = Convert.FromBase64String(sData);
      char[] chars = new char[decoder.GetCharCount(bytes, 0, bytes.Length)];
      decoder.GetChars(bytes, 0, bytes.Length, chars, 0);
      return new string(chars);
    }
  }
}
