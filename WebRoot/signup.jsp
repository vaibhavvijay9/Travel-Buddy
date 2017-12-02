<!DOCTYPE HTML>
<%@page import="java.util.Vector"%>
<%@page import="package1.DBInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="package1.DBInfo"%>
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
<!-- registration successful message  -->
    <%
       if(null!=request.getAttribute("SignSuccessMessage"))
       {
    %>
       <div class="success-message">
           <%=request.getAttribute("SignSuccessMessage")%><a href="index.jsp">Login Now</a>
       </div>
    <%
	   }
    %>
    <div class="signup-page z-depth-5">
        <div class="row">
            <form class="col s12" action="signupDone.jsp" method="post"  name="registerForm" onsubmit="return validate()">
                <div class="row">
                    <div class="input-field col s6">
                        <input id="first_name" type="text" class="validate" name="fname" required>
                        <label for="first_name">First Name</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="last_name" type="text" class="validate" name="lname" required>
                        <label for="last_name">Last Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="email1" type="email" class="validate" name="email" required>
                        <label for="email1">Email</label>
                        <a id="errorMessage" class="right"></a>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="password1" type="password" class="validate" name="password" minlength="8" required>
                        <label for="password1">Password</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input id="confirm_password" type="password" class="validate" minlength="8" name="confirm_password" required>
                        <label for="confirm_password">Confirm Password</label>
                         <a id="passwordError" class="right"></a>
                    </div>
                </div>
                <p>
                    User Type:
                    <label>
                        <input class="with-gap tourist" name="group3" value="tourist" type="radio" checked/>
                        <span>Tourist</span>
                    </label>
                    <label>
                        <input class="with-gap guide" name="group3" value="guide" type="radio" />
                        <span>Guide</span>
                    </label>
                </p>
                <div id="guide">
                    <div class="input-field col s12">
                        
                        <select name="guide_city">
    	                <option value="" disabled selected>City</option>
                    <% 
	                    Connection con=DBInfo.getConn();
	                    Vector<String> v=DBInfo.getCities();
	                    for(int i=0;i<v.size();i++)
						{
					%>
						<option value="<%=v.get(i)%>"><%=v.get(i)%></option>					
					<%	
						}
					%>
                    </select>
                    </div>
                </div>
                <button type="submit" class="waves-effect waves-light btn signup-button">SignUp</button>
            </form>
        </div>
    </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>