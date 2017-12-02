package package1;

import java.sql.*;
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
		Connection con=DBInfo.getConn();
		Vector<String> cities=new Vector<String>();
		String query="select city_name from cities order by city_name";
		PreparedStatement ps;
		try
		{
			ps = con.prepareStatement(query);
			ResultSet res=ps.executeQuery();
			while(res.next())
			{
				cities.add(res.getString(1));
			}
			con.close();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return cities;	
		
	}
	
}