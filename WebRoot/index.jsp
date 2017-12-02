<!DOCTYPE HTML>
<html>

<head>
    <title>Travel Buddy</title>
    <link rel="icon" href="images/f.png" type="image/png" sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/css/materialize.min.css">
    <link rel='stylesheet' href='css/style.min.css '>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script src="https://use.fontawesome.com/a2fcb19453.js"></script>
</head>

<body class="login-page-background">
<!-- login failed message  -->
    <%
       if(null!=request.getAttribute("SignInMessage"))
       {
    %>
       <div class="success-message">
           <%=request.getAttribute("SignInMessage")%>
       </div>
    <%
	   }
    %>
    <h1 class="center head-login">Travel Buddy</h1>
    <div class="login-page z-depth-5">
        <div class="row login-fields">
        <h4>Login Here</h4>
            <form class="col s12" action="loginDone.jsp" method="post">
                <div class="row">
                    <div class="input-field col s12">
                 <i class="material-icons prefix">account_circle</i>
                        <input id="username" type="email" name="username" class="validate" required>
                        <label for="username">User ID</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                <i class="fa fa-key small prefix"></i>     
                        <input id="password" type="password" name="password" class="validate" required>
                        <label for="password">Password</label>
                    </div>
                </div>
                <button class="waves-effect waves-light btn login-button">Login</button>
                <p>Need an account?</p>
                <a href="signup.jsp">Sign Up</a>
            </form>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>