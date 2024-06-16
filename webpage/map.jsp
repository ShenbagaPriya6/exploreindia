<!DOCTYPE html>
<html>

<head>
    <title>A Journey Through India's Culture</title>
    <link rel="icon" type="image/x-icon" href="india.png">
    <link rel="stylesheet" type="text/css" href="style3.css">
    <script src="jquery-3.7.1.js"></script>
    <style>
        .state-links a:link {
            text-decoration: none;
            color: black;
            transition: color 0.3s;
        }

        .state-links a:visited {
            color: rgba(11, 0, 2, 0.951);
        }

        .state-links a:hover {
            color: rgb(142, 5, 5);
        }

        header {
            background-image: url('headerbg.png');
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
            padding: 20px;
            text-align: left;
        }
        .state-info {
            align-items: center;
            display: none;
            position: flex;
            background-color: #f9f9f9;
            border: 1px solid #fefefe;
            padding: 10px;
            z-index: 1;
        }
    </style>
</head>

<body>
    <header>
        <h1>Explore the State/Union Territories of India</h1>
    </header>
    <%
        String name=(String)session.getAttribute("user");
        out.print("<h1>Welcome "+name+" !!</h1>");
    %>
    <div class="state-links">
        <a href="#" onmouseover="showHint('Andhra Pradesh')">Andhra Pradesh</a>
        <a href="#" onmouseover="showHint('Arunachal Pradesh')">Arunachal Pradesh</a>
        <a href="#" onmouseover="showHint('Assam')">Assam</a>
        <a href="#" onmouseover="showHint('Bihar')">Bihar</a>
        <a href="#" onmouseover="showHint('Chhattisgarh')">Chhattisgarh</a>
        <a href="#" onmouseover="showHint('Goa')">Goa</a>
        <a href="#" onmouseover="showHint('Gujarat')">Gujarat</a>
        <a href="#" onmouseover="showHint('Haryana')">Haryana</a>
        <a href="#" onmouseover="showHint('Himachal Pradesh')">Himachal Pradesh</a>
        <a href="#" onmouseover="showHint('Jharkhand')">Jharkhand</a>
        <a href="#" onmouseover="showHint('Karnataka')">Karnataka</a>
        <a href="#" onmouseover="showHint('Kerala')">Kerala</a>
        <a href="#" onmouseover="showHint('Madhya Pradesh')">Madhya Pradesh</a>
        <a href="#" onmouseover="showHint('Maharashtra')">Maharashtra</a>
        <a href="#" onmouseover="showHint('Manipur')">Manipur</a>
        <a href="#" onmouseover="showHint('Meghalaya')">Meghalaya</a>
        <a href="#" onmouseover="showHint('Mizoram')">Mizoram</a>
        <a href="#" onmouseover="showHint('Nagaland')">Nagaland</a>
        <a href="#" onmouseover="showHint('Odisha')">Odisha</a>
        <a href="#" onmouseover="showHint('Punjab')">Punjab</a>
        <a href="#" onmouseover="showHint('Rajasthan')">Rajasthan</a>
        <a href="#" onmouseover="showHint('Sikkim')">Sikkim</a>
        <a href="#" onmouseover="showHint('Tamil Nadu')">Tamil Nadu</a>
        <a href="#" onmouseover="showHint('Telangana')">Telangana</a>
        <a href="#" onmouseover="showHint('Tripura')">Tripura</a>
        <a href="#" onmouseover="showHint('Uttarakhand')">Uttarakhand</a>
        <a href="#" onmouseover="showHint('Uttar Pradesh')">Uttar Pradesh</a>
        <a href="#" onmouseover="showHint('West Bengal')">West Bengal</a>
        <a href="#" onmouseover="showHint('Andaman and Nicobar Islands')">Andaman and Nicobar Islands</a>
        <a href="#" onmouseover="showHint('Chandigarh')">Chandigarh</a>
        <a href="#" onmouseover="showHint('Dadra and Nagar Haveli and Daman & Diu')">Dadra and Nagar Haveli and Daman & Diu</a>
        <a href="#" onmouseover="showHint('The Government of NCT of Delhi')">The Government of NCT of Delhi</a>
        <a href="#" onmouseover="showHint('Jammu & Kashmir')">Jammu & Kashmir</a>
        <a href="#" onmouseover="showHint('Ladakh')">Ladakh</a>
        <a href="#" onmouseover="showHint('Lakshadweep')">Lakshadweep</a>
        <a href="#" onmouseover="showHint('Puducherry')">Puducherry</a>
    </div>
    <div class="state-info" id="txtHint" style="text-align: center;font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"></div>
    <div style="align-items: center; margin:5%;text-align:center">
        <button onclick="window.location.href='quiz.jsp'"
            style="background-color:black;color:white;width:40% ;padding:15px"><b>HOW WELL YOU KNOW INDIA?</b></button>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var stateLinks = document.querySelectorAll(".state-links a");

            stateLinks.forEach(function (link) {
                link.addEventListener("click", function (event) {
                    event.preventDefault();

                    var stateName = this.textContent;
                    window.location.href = 'state.html?state=' + encodeURIComponent(stateName);
                });
            });
        });
        function showHint(state) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var data = JSON.parse(this.responseText);
                    var stateInfo = data[state];
                    document.getElementById("txtHint").innerHTML = stateInfo;
                    document.querySelector('.state-info').style.display = 'block';
                }
            };
            xmlhttp.open("GET", "content.json", true);
            xmlhttp.send();
        }

        document.querySelector('.state-links').addEventListener('mouseleave', function() {
            document.querySelector('.state-info').style.display = 'none';
        });
    </script>
</body>

</html>
