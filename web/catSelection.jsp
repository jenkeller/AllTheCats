<%-- 
    Document   : catSelection
    Author     : Emily
--%>

<%@page import="utils.Cat"%>
<%@page import="db.CatDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="userinfo" class="utils.UserInfo" scope="session" />
<jsp:useBean id="cats" class="utils.Cats" scope="application" />
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
                        <input type="hidden" name="action" value="cart">
                        <input type="submit" name="submit" id="myButton" value="View Cart">
                    </form>
                </td>
            </tr>
        </table>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
    <center><img src="images/contactCat.jpg" alt="Cat" style="width:500px;height:400px;"></center>
    <p>
        Select the cat(s) you wish to adopt and add them to your cart. <br>
        Once you have decided on your new family member(s), proceed to checkout.
    </p>

    <input type="text" id="myInput" onkeyup="searchTable()" placeholder="Search for name, keyword, or age..">
    <div class="dropdown" align="center">
        <button onclick="openOptions()" class="dropbtn">Filter Cats by Age</button>
        <div id="myDropdown" class="dropdown-content">
            <a href="#" onclick="getKittens()">Kittens (Less Than 1 Year Old)</a>
            <a href="#" onclick="getAdults()">Adults (1 - 8 Years Old)</a>
            <a href="#" onclick="getElderly()">Elderly (8+ Years Old)</a>
            <a href="#" onclick="refreshTable()">Refresh Table</a>
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
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            var max = 1.0;
            for (i = 0; i < tr.length; i++) {
                var td = tr[i].getElementsByTagName("td")[3];//age
                if(td){
                    var x = parseFloat(td.innerHTML.toUpperCase());
                    if(x < parseFloat(max)){
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function refreshTable(){
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "";
            }
        }
        function getAdults() {
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            var min = 1.0;
            var max = 8.0;
            for (i = 0; i < tr.length; i++) {
                var td = tr[i].getElementsByTagName("td")[3];//age
                if(td){
                    var x = parseFloat(td.innerHTML.toUpperCase());
                    if(x >= parseFloat(min) && x < parseFloat(max)){
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function getElderly() {
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            var min = 8.0;
            for (i = 0; i < tr.length; i++) {
                var td = tr[i].getElementsByTagName("td")[3];//age
                if(td){
                    var x = parseFloat(td.innerHTML.toUpperCase());
                    if(x >= parseFloat(min)){
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
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
                var found = false;
                for (t = 1; t <= 3; t++) {
                    td = tr[i].getElementsByTagName("td")[t];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                        }
                    }
                }
                if(found){
                    tr[i].style.display = "";
                }else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
    <table id="myTable" align="center">
        <tr class="header">
            <th style="width:20%;"></th>
            <th style="width:15%;">Name</th>
            <th style="width:30%;">Description</th>
            <th style="width:15%;">Age (Years)</th>
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
            <td><img src="<%=cat.getImageSrc()%>" alt="cat" style="width:200px;height:200px;"></td>
            <td contenteditable="true"><%=cat.getName()%></td>
            <td><%=cat.getDescription()%></td>
            <td><%=cat.getAge()%></td>
            <% if (cat.isKitten()) { %>
            <td>$90</td>
            <% } else { %>
            <td>$50</td>
            <% }
                String catStr = cat.getName() + "," + cat.getDescription();
                if (!cart.getCatsToAdopt().contains(catStr)) {
            %>
            <td>
                <form action="" method=POST>
                    <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                    <input type="hidden" name="action" value="addToCart">
                    <input type="submit" name="add" id="myButton" value="Add to Cart">
                </form>
            </td>
            <% } else {%>
            <td>
                <form action="" method=POST>
                    <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                    <input type="hidden" name="todo" value="remove">
                    <input type="hidden" name="action" value="removeFromCartSelect">
                    <input type="submit" name="removeButton" id="myButton" value="Remove from Cart" onclick="return confirm('Are you sure you want to remove <%=cat.getName()%>?')">
                </form>
            </td>
            <% } %>
        </tr>
        <% }%>
    </table>
    <br> <br>
    <p>
        <u>Contact Us:</u> <br>
        <b>Phone:</b> 888-123-1234 <br>
        <b>Email:</b> allthecats@gmail.com  
    </p>
</body>
</html>
