package package1;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;
public class DBInfo
{
    public static Connection con;
	static
	{
		 try
		 {
		  Class.forName("com.mysql.jdbc.Driver");
		 }
		 catch(ClassNotFoundException e)
		 {
		   e.printStackTrace();
		 }
	}
	public static Connection getConn()
	{
		try
		{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/royalguides","root","rat");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	public static void close()
	{
		try
		{
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static Vector<String> getCities()
	{
		Vector<String> city_list = new Vector<String>();
		try
		{
			Connection con=DBInfo.getConn();
			PreparedStatement ps=con.prepareStatement("select city_name from cities");
			ResultSet res=ps.executeQuery();
			while(res.next())
			{
				city_list.add(res.getString(1));
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return city_list;
	}
	
}