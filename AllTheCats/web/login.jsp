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
        <link rel="cat icon" href="favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <ul>
            <li><a href="index.jsp">Home</a></li>
                <% if (!userinfo.getName().isEmpty()) { %>
            <li><a href="cart.jsp">View Adoption Cart</a></li>
            <li><a href="profile.jsp">Edit Profile</a></li>
                <% }%>
            <li><a href="contact.jsp">Contact Us</a></li>
                <% if (userinfo.getName().isEmpty()) { %>
            <li><a class="active" href="login.jsp">Log In</a></li>
                <% } else {%>
            <li><a href="login.jsp">Log Out</a></li>
                <% }%>
        </ul>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
    <center>
        <form action="login" method=POST>
            <p>Enter your login credentials.</p>
            <label id="myLabel">Username:</label>
            <% if (userinfo.getName() != null) {%>
            <input id="myTextFields" type="email" name="name" value="<%=userinfo.getEmail()%>" required>
            <% } else { %>
            <input id="myTextFields" type="email" name="name" required>
            <% }%>
            <br> <br>
            <label id="myLabel">Password:</label>
            <% if (userinfo.getPassword() != null) {%>
            <input id="myTextFields" type="password" name="password" value="<%=userinfo.getPassword()%>" required>
            <% } else { %>
            <input id="myTextFields" type="password" name="password" required>
            <% }%>
            <br> <br>
            <input type="submit" name="submit" id="myButton" value="Login">
        </form>
        <br> <br>
        <% if (userinfo.getErrorText() != null && !userinfo.getErrorText().isEmpty()) {%>
        <p id="errorP"><%=userinfo.getErrorText()%></p>
        <% }%>
        <hr>
        <p>If you are a new user, please create a new account.</p>
        <form action="createaccount" method=POST>
            <input type="submit" name="submit" id="myButton" value="Create New Account">
        </form>
    </center>
</body>
</html>
