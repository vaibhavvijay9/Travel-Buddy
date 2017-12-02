<%@page import="java.sql.PreparedStatement"%>
<%@page import="package1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<% 
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String name=fname+" "+lname;
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String usertype=request.getParameter("group3");
	int t_flag=0,t_flag1=0;
	
	if(usertype.equalsIgnoreCase("tourist"))
	{
		String query="insert into tourists values(?,?)";
		String query1="insert into login values(?,?,?)";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, name);
			t_flag=ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement(query1);
			ps1.setString(1, email);
			ps1.setString(2, password);
			ps1.setString(3, usertype);
			t_flag1=ps1.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	if(usertype.equalsIgnoreCase("guide"))
	{
		String city=request.getParameter("guide_city");
		String query="insert into guides values(?,?,?,?)";
		String query1="insert into login values(?,?,?)";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, "Y");
			ps.setString(4, city);
			t_flag=ps.executeUpdate();
			
			PreparedStatement ps1=con.prepareStatement(query1);
			ps1.setString(1, email);
			ps1.setString(2, password);
			ps1.setString(3, usertype);
			t_flag1=ps1.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	if(t_flag==1 && t_flag1==1)
	{
		request.setAttribute("SignSuccessMessage", "Registration Successful!!!");
        RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
        rd.forward(request, response);
	}
%>