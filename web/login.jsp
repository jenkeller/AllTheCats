<%-- 
    Document   : index
    Author     : Emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="userinfo" class="utils.UserInfo" scope="session" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllTheCats Adoption Website!</title>
        <link rel="cat icon" href="images/favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <script>
            function resetError() {
                var errorText = document.getElementById("errorP");
                errorText.style.display = "none";
            }
        </script>
    <center>
        <form action="" method=POST>
            <p>Enter your login credentials.</p>
            <label id="myLabel">Username:</label>
            <% if (userinfo.getName() != null) {%>
            <input id="myTextFields" type="email" name="username" value="<%=userinfo.getEmail()%>" onkeypress="resetError();" required>
            <% } else { %>
            <input id="myTextFields" type="email" name="username" required>
            <% }%>
            <br> <br>
            <label id="myLabel">Password:</label>
            <% if (userinfo.getPassword() != null) {%>
            <input id="myTextFields" type="password" name="password" value="<%=userinfo.getPassword()%>" required>
            <% } else { %>
            <input id="myTextFields" type="password" name="password" required>
            <% }%>
            <br> <br>
            <input type="hidden" name="action" value="login">
            <input type="submit" name="submit" id="myButton" value="Login">
        </form>
        <br> <br>
        <% if (userinfo.getErrorText() != null && !userinfo.getErrorText().isEmpty()) {%>
        <p id="errorP"><%=userinfo.getErrorText()%></p>
        <% }%>
        <hr>
        <p>If you would like to log into an administrative account, please enter the password here.</p>
        <form action="" method="POST">
            <input type="hidden" name="action" value="adminLogin">
            <input type="password" name="password" id="myTextFields" onkeypress="resetError();" required>
            <input type="submit" name="submit" id="myButton" value="Login">
        </form>
        <hr>
        <p>If you are a new user, please create a new account.</p>
        <form action="" method=POST>
            <input type="hidden" name="action" value="createAccount">
            <input type="submit" name="submit" id="myButton" value="Create New Account">
        </form>
        <br> <br>
        <p>
            <u>Contact Us:</u> <br>
            <b>Phone:</b> 888-123-1234 <br>
            <b>Email:</b> allthecats@gmail.com  
        </p>
    </center>
</body>
</html>
