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
                        <input type="hidden" name="action" value="addCat">
                        <input type="submit" name="submit" id="myButton" value="Add a New Cat">
                    </form>
                </td>
            </tr>
        </table>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <p>
            As an administrator, you can edit the adoptable cats. <br>
            To edit a cat's information, select the <b>Edit</b> button next to a cat. <br>
            To remove a cat from the site, select the <b>Remove</b> button next to a cat. <br>
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
                <th style="width:15%;"></th>
                <th style="width:15%;">Name</th>
                <th style="width:30%;">Description</th>
                <th style="width:15%;">Age (Years)</th>
                <th style="width:15%;">Adoption Fee</th>
                <th style="width:5%;"></th>
                <th style="width:5%;"></th>
            </tr>
            <!--dynamic based on db -->
            <!-- remove buttons -->
            <%
                cats = CatDB.selectAllCats();
                for (Cat cat : cats.getCats()) {
            %>
            <tr>
                <td><img src="<%=cat.getImageSrc()%>" alt="cat" style="width:150px;height:150px;"></td>
                <td><%=cat.getName()%></td>
                <td><%=cat.getDescription()%></td>
                <td><%=cat.getAge()%></td>
                <% if (cat.isKitten()) { %>
                <td>$90</td>
                <% } else { %>
                <td>$50</td>
                <% }%>
                <td>
                    <form action="" method=POST>
                        <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                        <input type="hidden" name="todo" value="edit">
                        <input type="hidden" name="action" value="editCat">
                        <input type="submit" name="removeButton" id="myButton" value="Edit">
                    </form>
                </td>
                <td>
                    <form action="" method=POST>
                        <input type="hidden" name="cat" value="<%=cat.getName()%>,<%=cat.getDescription()%>">
                        <input type="hidden" name="todo" value="remove">
                        <input type="hidden" name="action" value="removeCat">
                        <input type="submit" name="removeButton" id="myButton" value="Remove" onclick="return confirm('Are you sure you want to remove <%=cat.getName()%>?')">
                    </form>
                </td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
