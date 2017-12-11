<%-- 
    Document   : confimation
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
        <table>
            <tr>
                <td>
                    <form action="" method="POST">
                        <input type="hidden" name="action" value="logoutAdmin">
                        <input type="submit" name="submit" id="myButton" value="Logout">
                    </form>
                </td>
                <td>
                    <form action="" method="POST">
                        <input type="hidden" name="action" value="backToCats">
                        <input type="submit" name="submit" id="myButton" value="View Cats">
                    </form>
                </td>
            </tr>
        </table>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
    <center><img src="images/contactCat.jpg" alt="Cat" style="width:500px;height:400px;"></center>
    <h3 align="center">Congratulations on Your Adoption!</h3>
    <p>
        A confirmation of your adoption has been sent to your email on file. <br>
        Please keep this for your records and to show the staff member on-site when you come to pickup your cat. <br>
        Your new friend will be ready in 1-2 business days. We will call you when they are ready. <br> <br>
        If you have entered credit card information, your card has been charged. <br>
        Otherwise, you may pay in cash upon pickup of your new cat. <br> <br>
        Thank you for rescuing a cat from <b>AllTheCats</b>!
    </p>
    <br> <br>
    <p>
        <u>Contact Us:</u> <br>
        <b>Phone:</b> 888-123-1234 <br>
        <b>Email:</b> allthecats@gmail.com  
    </p>
</body>
</html>
