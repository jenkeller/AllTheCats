<%-- 
    Document   : addCat
    Author     : Emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllTheCats Adoption Website!</title>
        <link rel="cat icon" href="favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <p>Enter the information related to the new cat.</p>
        <form action="" method="POST">
            <fieldset align="center">
                <table align="center">
                    <tr>
                        <td>
                            <label id="myLabel">Choose Image:</label>
                        </td>
                        <td>
                            <input type="file" name="image" accept="image/*" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Name:</label>
                        </td>
                        <td>
                            <input id="myTextFields" type="text" name="newCatName" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Description:</label>
                        </td>
                        <td>
                            <input id="myTextFields" type="text" name="newCatDesc" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Age:</label>
                        </td>
                        <td>
                            <input id="myTextFields" type="text" name="newCatAge" required>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br> <br>
            <center>
                <input type="hidden" name="action" value="catToBeAdded">
                <input type="submit" name="submit" id="myButton" value="Save">
            </center>
        </form>
    </body>
</html>
