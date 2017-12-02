<%@page import="package1.DBInfo"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<% 
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String usertype=null;
	
	String query="select usertype from login where username=? and password=?";
	try
	{
		Connection con=DBInfo.getConn();	
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet res=ps.executeQuery();
		while(res.next())
		{
			usertype=res.getString(1);
		}
		
		if(null!=usertype)
   		{
	    	if(usertype.equalsIgnoreCase("tourist"))
	    	{
	    		
	    		response.sendRedirect("/RoyalGuides/home.jsp");
	    		session.setAttribute("username",username);
	    	}
		}
		else
		{
			request.setAttribute("SignInMessage", "Wrong username or password");
	        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	        rd.forward(request, response);
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}	
%>
