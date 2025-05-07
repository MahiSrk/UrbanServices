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

    <title>Online Maid Services</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<h2 class="text-center" style="margin-top: 20px">Welcome Customer - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from customer where customer_id="+session.getAttribute("uid"));
	rs.next();
	String cities[] = new String[]{"Ahmednagar", "Akola", "Akot", "Amalner", "Ambejogai", "Amravati", "Anjangaon", "Arvi", "Aurangabad", "Bhiwandi", "Dhule", "Kalyan-Dombivali", "Ichalkaranji", "Kalyan-Dombivali", "Karjat", "Latur", "Loha", "Lonar", "Lonavla", "Mahad", "Malegaon", "Malkapur", "Mangalvedhe", "Mangrulpir", "Manjlegaon", "Manmad", "Manwath", "Mehkar", "Mhaswad", "Mira-Bhayandar", "Morshi", "Mukhed", "Mul", "Greater Mumbai*", "Murtijapur", "Nagpur", "Nanded-Waghala", "Nandgaon", "Nandura", "Nandurbar", "Narkhed", "Nashik", "Navi Mumbai", "Nawapur", "Nilanga", "Osmanabad", "Ozar", "Pachora", "Paithan", "Palghar", "Pandharkaoda", "Pandharpur", "Panvel", "Parbhani", "Parli", "Partur", "Pathardi", "Pathri", "Patur", "Pauni", "Pen", "Phaltan", "Pulgaon", "Pune", "Purna", "Pusad", "Rahuri", "Rajura", "Ramtek", "Ratnagiri", "Raver", "Risod", "Sailu", "Sangamner", "Sangli", "Sangole", "Sasvad", "Satana", "Satara", "Savner", "Sawantwadi", "Shahade", "Shegaon", "Shendurjana", "Shirdi", "Shirpur-Warwade", "Shirur", "Shrigonda", "Shrirampur", "Sillod", "Sinnar", "Solapur", "Soyagaon", "Talegaon Dabhade", "Talode", "Tasgaon", "Thane", "Tirora", "Tuljapur", "Tumsar", "Uchgaon", "Udgir", "Umarga", "Umarkhed", "Umred", "Uran", "Uran Islampur", "Vadgaon Kasba", "Vaijapur", "Vasai-Virar", "Vita", "Wadgaon Road", "Wai", "Wani", "Wardha", "Warora", "Warud", "Washim", "Yavatmal", "Yawal", "Yevla"};

%>

<div class="container" style="margin-top: 30px; max-width: 800px;margin-bottom: 60px;">
	<div class="card">
    	<div class="card-body">
        	<div class="card-title">
            	<h3 class="text-center">View Customer Profile</h3>
            </div>
			<hr>
			<form action="edit-customer-profile.jsp" method="post">
			<div class="form-group">
            	<label for="">ID</label>
                <input id="id" name="id" type="text" class="form-control" value="<%=rs.getInt(1)%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Name</label>
                <input id="name" name="name" type="text" class="form-control" placeholder="Name" value="<%=rs.getString(2)%>" required>
			</div>
			<div class="form-group">
            	<label for="">Email</label>
                <input id="name" name="email" type="text" class="form-control" placeholder="Email" value="<%=rs.getString(3)%>" required>
			</div>
			<div class="form-group">
            	<label for="">Contact No.</label>
                <input id="contact" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="contact" type="text" class="form-control" placeholder="Contact" minlength="10" maxlength="10" value="<%=rs.getString(4)%>" required>
			</div>

			<div class="form-group">
            	<label for="">Address Line 1</label>
                <input id="adder1" name="adder1" type="text" class="form-control" placeholder="Enter Address line-1" value="<%=rs.getString(5)%>" required>
			</div>

			<div class="form-group">
            	<label for="">Address Line 2</label>
                <input id="adder2" name="adder2" type="text" class="form-control" placeholder="Enter Address line-2" value="<%=rs.getString(6)%>" required>
			</div>

            <div class="form-group">
            	<label for="">City</label>
                <select class="form-control" name="city" id="city">
	        	<option value="none">-- Select City --</option>
	        	<% for(String city:cities){%>
				<option value="<%=city%>" <%if(rs.getString(7).equals(city)) out.print(" selected");%>> <%=city%></option>
				<% } %>
				</select>
			</div>

            <div class="form-group">
            	<label for="">Password</label>
                <input id="password" name="password" type="text" class="form-control" placeholder="Enter 6 Character Password" minlength="4" value="<%=rs.getString(8)%>" required>
			</div>

            <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="register" id="register">Update</button>
            </form>
    	</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>