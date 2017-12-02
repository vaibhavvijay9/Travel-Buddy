<!DOCTYPE HTML>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="package1.Checksum"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<body class="home-page">
<nav class="z-depth-0">
        <a href="logout.jsp">
            <i class="fa fa-sign-out" aria-hidden="true"></i>
            logout</a>
    </nav>
    <%
    	String guide_name=request.getParameter("id1");
    	String guide_id=request.getParameter("id2");
    	String from_date=request.getParameter("id3");
    	String to_date=request.getParameter("id4");
    	int days=Integer.parseInt(request.getParameter("id5"));
    	double amount=300*days;		//Rs.300 per day
    	String tourist_id=(String)session.getAttribute("username");
    	String ct_id=request.getParameter("id6");
    	int city_id=Integer.parseInt(ct_id);
    	
    	System.out.println(guide_name+guide_id+from_date+to_date+days+amount+tourist_id+city_id);
    	
    	//-----------------------------------------------
     	String x="2tkEPvKwyU";
		String PRN=Integer.toString((int)(Math.random()*999999999)+1000000);
     	System.out.println(""+PRN);
     	
     	String checksum1=Checksum.checksumf("HACKATHON2017|"+PRN+"|"+(amount)+"|"+x);
     	System.out.println(""+checksum1);
     	
     	//here we insert into the bookings table
     	String query="insert into bookings values(?,?,?,?,?,?,?,?)";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,PRN );
			ps.setString(2,guide_id );
			ps.setString(3,tourist_id );
			ps.setString(4,from_date );
			ps.setString(5,to_date );
			ps.setInt(6,city_id );
			ps.setDouble(7,amount);
			ps.setString(8,"Pending");
			int flag=ps.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
     %>
        <div class=" container hire-form">
            <h4 class="center">Booking Details</h4>
            <form class="col s12" action="http://uat.rpp.rajasthan.gov.in/payments/v1/init" method="post">
            <table class="table-width">
                <tr>
                    <td class="firstCol">Guide Name</td>
                    <td><input class="inputHeight" value="<%=guide_name%>" type="text" readonly></td>
                </tr>
                <tr>
                    <td class="firstCol">Start Date</td>
                    <td><input class="inputHeight" value="<%=from_date%>" type="text" readonly></td>
                </tr>
                <tr>
                    <td class="firstCol">End Date</td>
                    <td><input class="inputHeight" value="<%=to_date%>" type="text" readonly></td>
                </tr>
                <tr>
                    <td class="firstCol">Amount</td>
                    <td><input class="inputHeight" value="<%=amount%>" type="text" readonly></td>
                </tr>
       			        
            </table>
			            
			<input type="hidden" name="MERCHANTCODE" value="HACKATHON2017" />
			<input type="hidden" name="PRN" value="<%=PRN %>" />
			<input type="hidden" name="REQTIMESTAMP" value="<%= LocalDateTime.now()
				    	       .format(DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS"))%>" />
			<input type="hidden" name="PURPOSE" value="GuideBooking" />
			<input type="hidden" name="AMOUNT" value="<%=amount %>" />
			<input type="hidden" name="SUCCESSURL" value="http://localhost:8080/RoyalGuides/Response.jsp" />
			<input type="hidden" name="FAILUREURL" value="http://localhost:8080/RoyalGuides/Response.jsp" />
			<input type="hidden" name="CANCELURL" value="http://localhost:8080/RoyalGuides/Response.jsp" />
			<input type="hidden" name="USERNAME" value="<%="demo"%>" />
			<input type="hidden" name="USERMOBILE" value="<%=String.valueOf("9985474855") %>" />
			<input type="hidden" name="USEREMAIL" value="<%=tourist_id  %>" />
			<input type="hidden" name="UDF1" value="" />
			<input type="hidden" name="UDF2" value="" />
			<input type="hidden" name="UDF3" value="" />
			<input type="hidden" name="CHECKSUM" value="<%=checksum1 %>" />
			<button type="submit" class="waves-effect waves-light btn hire-me-btn right">Proceed To Pay</button>
			</form>
    
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>