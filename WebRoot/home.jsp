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

<body class="home-page">
    <nav class="z-depth-0">
        <a href="logout.jsp">
            <i class="fa fa-sign-out" aria-hidden="true"></i>
            logout</a>
    </nav>
    <div class="rest-body">
        <h3>Search for Places in Rajasthan</h3>
        <div class="search-bar">
            <div class="input-field">
                <form action="schedule.jsp" method="post" class="search-form">
                    <input type="text" placeholder="Search..." id="autocomplete-input" class="autocomplete" name="city" required>
                    <button class="waves-effect waves-light btn submit-button">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>