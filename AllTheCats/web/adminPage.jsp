<%-- 
    Document   : adminPage
    Author     : Emily
--%>

<%@page import="db.CatDB"%>
<%@page import="utils.Cat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="userinfo" class="utils.UserInfo" scope="session" />
<jsp:useBean id="cats" class="utils.Cats" scope="application" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AllTheCats Adoption Website!</title>
        <link rel="cat icon" href="favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="cart.jsp">Edit Adoptable Cats</a></li>
            <li><a href="login.jsp">Log Out</a></li>
        </ul>
        <fieldset>

        </fieldset>
        <input type="text" id="myInput" onkeyup="searchTable()" placeholder="Search for name, keyword, or age..">
        <div class="dropdown" align="center">
            <button onclick="openOptions()" class="dropbtn">Filter Cats by Age</button>
            <div id="myDropdown" class="dropdown-content">
                <a href="#" onclick="getKittens()">Kittens (Less Than 1 Year Old)</a>
                <a href="#" onclick="getAdults()">Adults (1 - 8 Years Old)</a>
                <a href="#" onclick="getElderly()">Elderly (8+ Years Old)</a>
            </div>
        </div>
        <script>
            // Close the dropdown menu if the user clicks outside of it
            window.onclick = function (event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            };
            function openOptions() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
            function getKittens() {

            }
            function getAdults() {

            }
            function getElderly() {

            }
            function searchTable() {
                // Declare variables 
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];//name
                    td1 = tr[i].getElementsByTagName("td")[2];//description
                    td2 = tr[i].getElementsByTagName("td")[3];//age
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                    if (td1) {
                        if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                    if (td2) {
                        if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
        <table id="myTable" align="center">
            <tr class="header">
                <th style="width:20%;"></th>
                <th style="width:15%;">Name</th>
                <th style="width:30%;">Description</th>
                <th style="width:15%;">Age  (Years)</th>
                <th style="width:15%;">Adoption Fee</th>
                <th style="width:5%;"></th>
            </tr>
            <!--dynamic based on db -->
            <!-- remove buttons -->
            <%
                cats = CatDB.selectAllCats();
                for (Cat cat : cats.getCats()) {
            %>
            <tr>
                <td></td>
                <td><%=cat.getName()%></td>
                <td><%=cat.getDescription()%></td>
                <td><%=cat.getAge()%></td>
                <% if (cat.isKitten()) { %>
                <td>90</td>
                <% } else { %>
                <td>50</td>
                <% }%>
                <td>
                    <form action="" method=POST>
                        <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                        <input type="hidden" name="remove" value="true">
                        <input type="submit" name="removeButton" id="removeButton" value="Remove">
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
