<%-- 
    Document   : profile
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
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <form action="" method=POST>
            <p>Edit your credentials.</p>
            <fieldset align="center">
                <table align="center">
                    <tr>
                        <td>
                            <label id="myLabel">Name:</label>
                        </td>
                        <td>
                            <%if (!userinfo.getName().isEmpty()) {%>
                            <input id="myTextFields" type="text" name="name" value="<%=userinfo.getName()%>" required>
                            <% } else { %>
                            <input id="myTextFields" type="text" name="name" required>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Username:</label>
                        </td>
                        <td>
                            <%if (!userinfo.getEmail().isEmpty()) {%>
                            <input id="myTextFields" type="email" name="username" value="<%=userinfo.getEmail()%>" required>
                            <% } else { %>
                            <input id="myTextFields" type="email" name="username" required>
                            <% } %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label id="myLabel">Password:</label>
                        </td>
                        <td>
                            <%if (!userinfo.getPassword().isEmpty()) {%>
                            <input id="myTextFields" type="password" name="password" value="<%=userinfo.getPassword()%>" required>
                            <% } else { %>
                            <input id="myTextFields" type="password" name="password" required>
                            <% } %>
                        </td>
                    </tr>
                </table>
                <br> <br>
                <fieldset>
                    <legend>Billing Address</legend>
                    <table align="center">
                        <tr>
                            <td>
                                <label id="myLabel">Street</label>
                            </td>
                            <td>
                                <%if (!userinfo.getAddress().getStreet().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="street" size="45" value="<%=userinfo.getAddress().getStreet()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="street" size="45" required>
                                <% }%>
                            </td>
                        </tr>
                    </table>
                    <table align="center">
                        <tr>
                            <td>
                                <label id="myLabel">City</label>
                            </td>
                            <td>
                                <%if (!userinfo.getAddress().getCity().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="city" value="<%=userinfo.getAddress().getStreet()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="city" required>
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">State</label>
                            </td>
                            <td>
                                <%if (!userinfo.getAddress().getState().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="state" size="15" value="<%=userinfo.getAddress().getState()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="state" size="15" required>
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">Zip</label>
                            </td>
                            <td>
                                <%if (!userinfo.getAddress().getZip().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="zip" size="10" value="<%=userinfo.getAddress().getZip()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="zip" size="10" required>
                                <% }%>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br> <br>
                <fieldset>
                    <legend>Phone Number</legend>
                    <table align="center">
                        <tr>
                            <td>
                                <label id="myLabel">(</label>
                            </td>
                            <td>
                                <%if (!userinfo.getPhone().getAreaCode().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="areaCode" size="5" value="<%=userinfo.getPhone().getAreaCode()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="areaCode" size="5" required>
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">)</label>
                            </td>
                            <td>
                                <%if (!userinfo.getPhone().getMiddleThree().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="middleThree" size="5" value="<%=userinfo.getPhone().getMiddleThree()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="middleThree" size="5" required>
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">-</label>
                            </td>
                            <td>
                                <%if (!userinfo.getPhone().getLastFour().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="lastFour" size="7" value="<%=userinfo.getPhone().getLastFour()%>" required>
                                <% } else { %>
                                <input id="myTextFields" type="text" name="lastFour" size="7" required>
                                <% }%>
                            </td>
                        </tr>
                    </table>
                </fieldset> 
                <br> <br>
                <script type="text/javascript">
                    function showTable() {
                        document.getElementById("creditTable").style.display = "table";
                    }
                    function hideTable() {
                        document.getElementById("creditTable").style.display = "none";
                    }
                </script>
                <fieldset>
                    <legend>Payment Type</legend>
                    <input type="radio" name="payment" value="credit" required onclick="showTable()" checked>Credit Card
                    <input type="radio" name="payment" value="cash" required onclick="hideTable()">Cash
                    <table align="center" id="creditTable">
                        <tr>
                            <td>
                                <label id="myLabel">Credit Card Number</label>
                            </td>
                            <td>
                                <%if (!userinfo.getCard().getNumber().isEmpty()) {%>
                                <input id="myTextFields" type="password" name="number" value="<%=userinfo.getCard().getNumber()%>" size="20">
                                <% } else { %>
                                <input id="myTextFields" type="password" name="number" size="20">
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">Expiration Month</label>
                            </td>
                            <td>
                                <%if (!userinfo.getCard().getMonth().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="month" value="<%=userinfo.getCard().getMonth()%>" size="5">
                                <% } else { %>
                                <input id="myTextFields" type="text" name="month" size="5">
                                <% }%>
                            </td>
                            <td>
                                <label id="myLabel">Expiration Year</label>
                            </td>
                            <td>
                                <%if (!userinfo.getCard().getYear().isEmpty()) {%>
                                <input id="myTextFields" type="text" name="year" value="<%=userinfo.getCard().getYear()%>" size="5">
                                <% } else { %>
                                <input id="myTextFields" type="text" name="year" size="5">
                                <% }%>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br> <br>
                <input type="hidden" name="action" value="accountSaved">
                <% if (userinfo.getName().isEmpty()) {%>
                <input type="submit" name="submit" id="myButton" value="Create Account">
                <% } else { %>
                <input type="submit" name="submit" id="myButton" value="Save">
                <% }%>
            </fieldset>
        </form>
        <br> <br>
    <center>
        <p>
            <u>Contact Us:</u> <br>
            <b>Phone:</b> 888-123-1234 <br>
            <b>Email:</b> allthecats@gmail.com  
        </p>
    </center>
</body>
</html>

