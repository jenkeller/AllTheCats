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
    <center>
        <form action="allTheCatsAdoption" method="POST">
            <center><img src="images/frontPageCat.jpg" alt="Front Page Cat" style="width:500px;height:400px;"></center>
            <p>
                Welcome to the <b>AllTheCats</b> adoption website! <br>
                Here at <b>AllTheCats</b> we are dedicated to saving the lives of homeless cats and kittens. <br>
                Please login to view our adoptable cats and kittens. <br>
                The account creation process will have you fill out an adoption application to determine if you are an acceptable adopter. <br>
                We hope you can find your perfect furry friend!
            </p>
            <input type="submit" name="submit" value="Login" id="myButton">
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

