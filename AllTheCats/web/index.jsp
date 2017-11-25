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
        <link rel="cat icon" href="favicon.ico"/>
        <link rel="stylesheet" href="stylesheet.css">
    </head>
    <body>
        <ul>
            <li><a class="active" href="index.jsp">Home</a></li>
                <% if (!userinfo.getName().isEmpty()) { %>
            <li><a href="cart.jsp">View Adoption Cart</a></li>
            <li><a href="profile.jsp">Edit Profile</a></li>
                <% }%>
            <li><a href="contact.jsp">Contact Us</a></li>
                <% if (userinfo.getName().isEmpty()) { %>
            <li><a href="login.jsp">Log In</a></li>
                <% } else {%>
            <li><a href="login.jsp">Log Out</a></li>
                <% }%>
        </ul>
        <h1>~<i>AllTheCats</i> Adoption Website~</h1>
        <center><img src="frontPageCat.jpg" alt="Front Page Cat" style="width:500px;height:400px;"></center>
        <p>
            Welcome to the <b>AllTheCats</b> adoption website! <br>
            Here at <b>AllTheCats</b> we are dedicated to saving the lives of homeless cats and kittens. <br>
            Below are our available cats for adoption. <br>
            Kittens are $90 and cats over 1 year old are $50. The animals are up to date on shots and have been spayed/neutered. <br>
            When you have selected your desired cat(s), please proceed to checkout to fill out the adoption application. <br>
            If your adoption application is approved, you may adopt your desired cat(s).
        </p>
        <!-- adoptable cats from database -->
        <input type="text" id="myInput" onkeyup="searchTable()" placeholder="Search for name, keyword, or age..">
        <div class="dropdown">
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
        <table id="myTable">
            <tr class="header">
                <th style="width:30%;">Name</th>
                <th style="width:50%;">Description</th>
                <th style="width:20%;">Age</th>
            </tr>
           <!--dynamic based on db -->
        </table>
    </body>
</html>
