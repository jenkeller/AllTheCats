<%-- 
    Document   : cart
    Author     : Emily
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="utils.Cat"%>
<%@page import="db.CatDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="cart" class="utils.Cart" scope="session" />
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
                        <input type="hidden" name="action" value="createAccount">
                        <input type="submit" name="submit" id="myButton" value="Edit Profile">
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
    <p>
        If your cart looks satisfactory, you may select <b>Complete Purchase</b>. <br>
        If you have a card on file, your card will be charged at this time.
    </p>
    <fieldset>
        <table id="myTable" align="center">
            <tr class="header">
                <th style="width:20%;"></th>
                <th style="width:15%;">Name</th>
                <th style="width:30%;">Description</th>
                <th style="width:15%;">Age (Years)</th>
                <th style="width:15%;">Adoption Fee</th>
                <th style="width:5%;"></th>
            </tr>
            <%
                double total = 0.0;
                for (String catStr : cart.getCatsToAdopt()) {
                    System.out.println(catStr);
                    String[] catStrArray = catStr.split(",");
                    String name = catStrArray[0];
                    String description = catStrArray[1];
                    Cat cat = CatDB.selectCat(name, description);
            %>
            <tr>
                <td><img src="<%=cat.getImageSrc()%>" alt="cat" style="width:150px;height:150px;"></td>
                <td><%=cat.getName()%></td>
                <td><%=cat.getDescription()%></td>
                <td><%=cat.getAge()%></td>
                <% if (cat.isKitten()) {
                        total += 90.0;
                %>
                <td>$90</td>
                <% } else {
                    total += 50.0;
                %>
                <td>$50</td>
                <% }%>
                <td>
                    <form action="" method=POST>
                        <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                        <input type="hidden" name="todo" value="remove">
                        <input type="hidden" name="action" value="removeFromCartCart">
                        <input type="submit" name="removeButton" id="myButton" value="Remove" onclick="return confirm('Are you sure you want to remove <%=cat.getName()%>?')">
                    </form>
                </td>
            </tr>
            <% }
                DecimalFormat priceFormatter = new DecimalFormat("$#0.00");
                String totalString = priceFormatter.format(total);
            %>
        </table>
        <table align="center">
            <tr>
                <td align="center">
                    <label id="myLabel">Total: <%=totalString%></label>
                </td>
            </tr>
            <tr>
                <td>
                    <form action="" method="POST">
                        <input type="hidden" name="action" value="confirm">
                        <input type="submit" name="submit" id="myButton" value="Complete Purchase">
                    </form>
                </td>
            </tr>
        </table>
    </fieldset>
    <br> <br>
    <p>
        <u>Contact Us:</u> <br>
        <b>Phone:</b> 888-123-1234 <br>
        <b>Email:</b> allthecats@gmail.com  
    </p>
</body>
</html>
