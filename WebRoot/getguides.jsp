<!DOCTYPE HTML>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="package1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<html>

<head>
    <title>Travel Buddy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/css/materialize.min.css">
    <link rel='stylesheet' href='css/style.min.css '>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script src="https://use.fontawesome.com/a2fcb19453.js"></script>
</head>

<body class="login-background">
<nav class="z-depth-0">
        <a href="logout.jsp">
            <i class="fa fa-sign-out" aria-hidden="true"></i>
            logout</a>
    </nav>
	<%
		String city=request.getParameter("city");
		String query0="select city_id from cities where city_name=?";
		int city_id=0;
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps0=con.prepareStatement(query0);
			ps0.setString(1, "Jaipur");
			ResultSet res0=ps0.executeQuery();
			while(res0.next())
			{
				city_id=res0.getInt(1);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	 	// here we are fetching available guides for the selected city
	
		String query="select guide_name from guides where city_id=? and guide_avail=?";
		Vector<String> guide_list=new Vector<String>();
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, city_id);
			ps.setString(2, "Y");
			ResultSet res=ps.executeQuery();
			while(res.next())
			{
				guide_list.add(res.getString(1));
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		int count=guide_list.size();
		System.out.println(count);
	  %>
    <div class="guide-page">
        <div class="guide-row">
        <%
        	for(int i=0;i<count;i++)
        	{
         %>
            <div class="card">
                  <div class="card-image">
                    <img class="img-circle" src="images/account_login.png">
                    <span class="card-title">Card Title</span>
                 </div>
                 <div class="card-content">
                    <p class="guide-name">Arun Kumar</p>
                </div>
                <div class="card-action">
                    <a href="#">This is a link</a>
                </div>
            </div>
            <%} %>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>