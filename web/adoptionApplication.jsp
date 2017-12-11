<%-- 
    Document   : adoptionApplication
    Author     : Emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllTheCats Adoption Website!</title>
        <link rel="cat icon" href="images/favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <form action="" method="POST">
            <center><img src="images/frontPageCat.jpg" alt="Front Page Cat" style="width:500px;height:400px;"></center>
            <p>
                Here at AllTheCats, we take adoption very seriously. <br>
                In order to proceed with adoption, you must first fill out this application form. <br>
                If we find that you are not fit to adopt, you are not permitted to enter our site. <br>
                Thank you for your understanding.
            </p>
            <fieldset align="center">
                <table align="center">
                    <tr>
                        <td><label id="myLabel">Have you owned a pet before?</label></td>
                        <td><input type="radio" name="pet" value="Yes" id="myLabel" required>Yes</td>
                        <td><input type="radio" name="pet" value="No" id="myLabel" required>No</td>
                    </tr>
                    <tr>
                        <td><label id="myLabel">Do you wish to de-claw your new cat?</label></td>
                        <td><input type="radio" name="claw" value="Yes" id="myLabel" required>Yes</td>
                        <td><input type="radio" name="claw" value="No" id="myLabel" required>No</td>
                    </tr>
                    <tr>
                        <td><label id="myLabel">Do you understand that a cat can live 15 to 20 years?</label></td>
                        <td><input type="radio" name="age" value="Yes" id="myLabel" required>Yes</td>
                        <td><input type="radio" name="age" value="No" id="myLabel" required>No</td>
                    </tr>
                    <tr>
                        <td><label id="myLabel">Have you told your children not to pull on the tail?</label></td>
                        <td><input type="radio" name="tail" value="Yes" id="myLabel" required>Yes</td>
                        <td><input type="radio" name="tail" value="I don't have kids" id="myLabel" required>I don't have kids</td>
                    </tr>
                    <tr>
                        <td><label id="myLabel">Have you guarded your Christmas tree yet?</label></td>
                        <td><input type="radio" name="age" value="Yes" id="myLabel" required>Yes</td>
                        <td><input type="radio" name="age" value="Well you should think about it" id="myLabel" required>Well you should think about it</td>
                    </tr>
                </table>
                <br> <br>
                <center>
                    <input type="hidden" name="action" value="submitApp">
                    <input type="submit" name="submit" id="myButton" value="Submit Application">
                </center>
            </fieldset>
        </form>
        <br> <br>
        <p>
            <u>Contact Us:</u> <br>
            <b>Phone:</b> 888-123-1234 <br>
            <b>Email:</b> allthecats@gmail.com  
        </p>
    </body>
</html>
