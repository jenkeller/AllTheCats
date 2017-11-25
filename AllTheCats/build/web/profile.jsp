<%-- 
    Document   : profile
    Created on : Nov 25, 2017, 4:12:03 PM
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
            <li><a class="active" href="profile.jsp">Edit Profile</a></li>
                <% }%>
            <li><a href="contact.jsp">Contact Us</a></li>
                <% if (userinfo.getName().isEmpty()) { %>
            <li><a href="login.jsp">Log In</a></li>
                <% } else {%>
            <li><a href="login.jsp">Log Out</a></li>
                <% }%>
        </ul>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        
    </body>
</html>
