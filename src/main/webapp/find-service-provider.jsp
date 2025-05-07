<%
	if(session.getAttribute("user")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        nav a.nav-link {
            color: #fff !important;
        }
    </style>

    <title>Online Urban Services</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%
	String cities[] = new String[]{"Ahmednagar", "Akola", "Akot", "Amalner", "Ambejogai", "Amravati", "Anjangaon", "Arvi", "Aurangabad", "Bhiwandi", "Dhule", "Kalyan-Dombivali", "Ichalkaranji", "Kalyan-Dombivali", "Karjat", "Latur", "Loha", "Lonar", "Lonavla", "Mahad", "Malegaon", "Malkapur", "Mangalvedhe", "Mangrulpir", "Manjlegaon", "Manmad", "Manwath", "Mehkar", "Mhaswad", "Mira-Bhayandar", "Morshi", "Mukhed", "Mul", "Greater Mumbai*", "Murtijapur", "Nagpur", "Nanded-Waghala", "Nandgaon", "Nandura", "Nandurbar", "Narkhed", "Nashik", "Navi Mumbai", "Nawapur", "Nilanga", "Osmanabad", "Ozar", "Pachora", "Paithan", "Palghar", "Pandharkaoda", "Pandharpur", "Panvel", "Parbhani", "Parli", "Partur", "Pathardi", "Pathri", "Patur", "Pauni", "Pen", "Phaltan", "Pulgaon", "Pune", "Purna", "Pusad", "Rahuri", "Rajura", "Ramtek", "Ratnagiri", "Raver", "Risod", "Sailu", "Sangamner", "Sangli", "Sangole", "Sasvad", "Satana", "Satara", "Savner", "Sawantwadi", "Shahade", "Shegaon", "Shendurjana", "Shirdi", "Shirpur-Warwade", "Shirur", "Shrigonda", "Shrirampur", "Sillod", "Sinnar", "Solapur", "Soyagaon", "Talegaon Dabhade", "Talode", "Tasgaon", "Thane", "Tirora", "Tuljapur", "Tumsar", "Uchgaon", "Udgir", "Umarga", "Umarkhed", "Umred", "Uran", "Uran Islampur", "Vadgaon Kasba", "Vaijapur", "Vasai-Virar", "Vita", "Wadgaon Road", "Wai", "Wani", "Wardha", "Warora", "Warud", "Washim", "Yavatmal", "Yawal", "Yevla"};
%>

<h2 class="text-center" style="margin-top: 20px">Welcome Customer - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>
<div class="container" style="margin-top:20px; margin-bottom: 60px;">
	<div class="row">
		<div class="form-group col-5">
    		<label for="">City</label>
        	<select class="form-control" name="city" id="city">
        	<option value="none">-- Select City --</option>
        	<% for(String city:cities){%>
			<option value="<%=city%>"> <%=city%></option>
			<% } %>
            </select>
        </div>

        <div class="form-group col-5">
            <label for="">Who's Required</label>
            <select class="form-control" name="profession" id="profession" required>
                <option value="none">Select Profession</option>
                <option value="Body Spa">Body Spa</option>
                <option value="Electrician">Electrician</option>
                <option value="Photographer">Photographer</option>
                <option value="Plumber">Plumber</option>
                <option value="Beautician">Beautician</option>
                <option value="Painter">Painter</option>
            </select>
        </div>

        <div class="form-group col-2">
            <label for="">Action</label>
            <button id="search" class="form-control btn btn-success" type="button" onclick="show()">Search</button>
        </div>
    </div>
    </form>

    <div class="table-responsive">
		<table id="providers" class="table">
        	<thead>
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Profession</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="result">
                <tr>
                    <td colspan='5'>Select city and profession..</td>
                </tr>
            </tbody>
        </table>
    </div>
    
<script>
function show() {
	x = document.getElementById("city").value;
	y = document.getElementById("profession").value;
	
    if (x=="none" || y == "none") {
    	alert("Don't leave search fields empty");
        document.getElementById("result").innerHTML = "<tr><td colspan='5'>please </td></tr>";;
        return;
    } 
    else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("result").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET", "search-providers.jsp?x=" + x+"&y="+y, true);
        xmlhttp.send();
    }
}
</script>
       
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>