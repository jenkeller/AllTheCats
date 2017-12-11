<%-- 
    Document   : editCat
    Author     : Emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="cat" class="utils.Cat" scope="application"/>
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
        <p>Edit the information related to this cat.</p>
        <form action="" method="POST">
            <fieldset align="center">
                <center><img src="<%=cat.getImageSrc()%>" alt="Front Page Cat" style="width:500px;height:400px;"></center>
                <table align="center">
                    <tr>
                        <td>
                            <label id="myLabel">Name:</label>
                        </td>
                        <td>
                            <label id="myLabel"><%=cat.getName()%></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Description:</label>
                        </td>
                        <td>
                            <input id="myTextFields" type="text" name="catDesc" value="<%=cat.getDescription()%>" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Age:</label>
                        </td>
                        <td>
                            <input id="myTextFields" type="text" name="cAge" value="<%=cat.getAge()%>" required>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br> <br>
            <center>
                <input type="hidden" name="action" value="saveCatInfo">
                <input type="submit" name="submit" id="myButton" value="Save">
            </center>
        </form>
    </body>
</html>
