<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="package1.DBInfo" %>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

		<!DOCTYPE HTML>
<html>

<head>
    <title>Travel Buddy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/css/materialize.min.css">
    <link rel='stylesheet' href='css/style.min.css '>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script src="https://use.fontawesome.com/a2fcb19453.js"></script>

</head>

<body>
    <nav class="z-depth-0">
        <a href="login.jsp">
            <i class="fa fa-sign-in" aria-hidden="true"></i>
            login</a>
    </nav>
    <div class="rest-body">
        <h3>Search for Places in Rajasthan</h3>
        <%
        	Connection con=DBInfo.getConn();	
			
			PreparedStatement ps=con.prepareStatement("select city_name from cities");
			ResultSet res=ps.executeQuery();
			ArrayList<String> city_list = new ArrayList<String> ();
			while(res.next())
			{
				city_list.add(res.getString(1));
			}
			
			con.close();
         %>
        <div class="search-bar">
            <div class="input-field">
                <form action="login.html">
                    <input type="text" placeholder="search" id="autocomplete-input" class="autocomplete">
                    <button class="waves-effect waves-light btn submit-button">Search</button>
                </form>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>