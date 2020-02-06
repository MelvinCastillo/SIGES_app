// Decompiled with JetBrains decompiler
// Type: CAID.Data.DB
// Assembly: CAID.Data, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 0844A0A0-02E5-4ED4-B169-D67EFAEF31F2
// Assembly location: C:\Users\user\Desktop\CAID.Data - Copy.dll

using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace CAID.Data
{
  public class DB : CAID.Data.Data
  {
    public static SqlConnection Connection
    {
      get
      {
        return new SqlConnection(CAID.Data.Data._CnnStr);
      }
    }

    public static bool ExecuteNonQuery(string sql, ArrayList parameteres, ArrayList values, CommandType type)
    {
      bool flag = false;
      SqlCommand sqlCommand = new SqlCommand(sql, DB.Connection);
      if (parameteres != null)
      {
        for (int index = 0; index <= parameteres.Count - 1; ++index)
          sqlCommand.Parameters.Add(new SqlParameter(parameteres[index].ToString(), values[index]));
      }
      sqlCommand.CommandType = type;
      sqlCommand.CommandTimeout = 0;
      try
      {
        sqlCommand.Connection.Open();
        sqlCommand.ExecuteNonQuery();
        flag = true;
      }
      catch (Exception ex)
      {
        string message = ex.Message;
        flag = false;
      }
      finally
      {
        sqlCommand.Connection.Close();
        sqlCommand.Dispose();
      }
      return flag;
    }

    public static object ExecuteScalar(string sql, ArrayList parameteres, ArrayList values, CommandType type)
    {
      object obj = new object();
      SqlCommand sqlCommand = new SqlCommand(sql, DB.Connection);
      if (parameteres != null)
      {
        for (int index = 0; index <= parameteres.Count - 1; ++index)
          sqlCommand.Parameters.Add(new SqlParameter(parameteres[index].ToString(), values[index]));
      }
      sqlCommand.CommandType = type;
      sqlCommand.CommandTimeout = 0;
      try
      {
        sqlCommand.Connection.Open();
        obj = sqlCommand.ExecuteScalar();
      }
      catch (Exception ex)
      {
        obj = (object) null;
      }
      finally
      {
        sqlCommand.Connection.Close();
        sqlCommand.Dispose();
      }
      return obj;
    }

    public static DataTable ExecuteAdapter(string sql, ArrayList parameteres, ArrayList values, CommandType type)
    {
      DataTable dataTable = new DataTable();
      SqlCommand selectCommand = new SqlCommand(sql, DB.Connection);
      if (parameteres != null)
      {
        for (int index = 0; index <= parameteres.Count - 1; ++index)
          selectCommand.Parameters.Add(new SqlParameter(parameteres[index].ToString(), (object) values[index].ToString()));
      }
      selectCommand.CommandType = type;
      selectCommand.CommandTimeout = 0;
      try
      {
        selectCommand.Connection.Open();
        new SqlDataAdapter(selectCommand).Fill(dataTable);
      }
      catch (Exception ex)
      {
        dataTable = new DataTable();
      }
      finally
      {
        selectCommand.Connection.Close();
        selectCommand.Dispose();
      }
      return dataTable;
    }

    public static DataSet ExecuteDsAdapter(string sql, ArrayList parameteres, ArrayList values, CommandType type)
    {
      DataSet dataSet = new DataSet();
      SqlCommand selectCommand = new SqlCommand(sql, DB.Connection);
      if (parameteres != null)
      {
        for (int index = 0; index <= parameteres.Count - 1; ++index)
          selectCommand.Parameters.Add(new SqlParameter(parameteres[index].ToString(), (object) values[index].ToString()));
      }
      selectCommand.CommandType = type;
      selectCommand.CommandTimeout = 0;
      try
      {
        selectCommand.Connection.Open();
        new SqlDataAdapter(selectCommand).Fill(dataSet);
      }
      catch (Exception ex)
      {
        dataSet = new DataSet();
      }
      finally
      {
        selectCommand.Connection.Close();
        selectCommand.Dispose();
      }
      return dataSet;
    }

    public static SqlDataReader ExecuteReader(string sql, ArrayList parameteres, ArrayList values, CommandType type)
    {
      SqlDataReader sqlDataReader = (SqlDataReader) null;
      SqlCommand sqlCommand = new SqlCommand(sql, DB.Connection);
      if (parameteres != null)
      {
        for (int index = 0; index <= parameteres.Count - 1; ++index)
          sqlCommand.Parameters.Add(new SqlParameter(parameteres[index].ToString(), (object) values[index].ToString()));
      }
      sqlCommand.CommandType = type;
      sqlCommand.CommandTimeout = 0;
      try
      {
        sqlCommand.Connection.Open();
        sqlDataReader = sqlCommand.ExecuteReader();
      }
      catch (Exception ex)
      {
        sqlDataReader = (SqlDataReader) null;
      }
      finally
      {
        sqlCommand.Connection.Close();
        sqlCommand.Dispose();
      }
      return sqlDataReader;
    }

    public static DataTable ExecuteAdapter(string sql)
    {
      DataTable dataTable = new DataTable();
      SqlCommand selectCommand = new SqlCommand(sql, DB.Connection);
      selectCommand.CommandType = CommandType.Text;
      selectCommand.CommandTimeout = 0;
      try
      {
        selectCommand.Connection.Open();
        new SqlDataAdapter(selectCommand).Fill(dataTable);
      }
      catch (Exception ex)
      {
        dataTable = new DataTable();
      }
      finally
      {
        selectCommand.Connection.Close();
        selectCommand.Dispose();
      }
      return dataTable;
    }

    public static bool ExecuteNonQuery(string sql)
    {
      bool flag = false;
      SqlCommand sqlCommand = new SqlCommand(sql, DB.Connection);
      sqlCommand.CommandType = CommandType.Text;
      sqlCommand.CommandTimeout = 0;
      try
      {
        sqlCommand.Connection.Open();
        sqlCommand.ExecuteNonQuery();
        flag = true;
      }
      catch (Exception ex)
      {
        flag = false;
      }
      finally
      {
        sqlCommand.Connection.Close();
        sqlCommand.Dispose();
      }
      return flag;
    }

    public static string _fnGUID()
    {
      return Guid.NewGuid().ToString().ToUpper();
    }
  }
}
