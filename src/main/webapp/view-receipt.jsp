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

<h2 class="text-center" style="margin-top: 20px">Welcome <%=session.getAttribute("user")%> - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("SELECT * from payment where booking_id = "+request.getParameter("id"));
	rs.next();	
%>

<div class="container" style="margin-top: 30px; max-width: 800px;margin-bottom: 60px;">
	<div class="card">
    	<div class="card-body">
        	<div class="card-title">
            	<h3 class="text-center">Payment Receipt</h3>
            </div>
			<hr>
			<div class="form-group">
            	<label for="">ID</label>
                <input id="id" name="id" type="text" class="form-control" value="<%=rs.getString(1)%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Payment Date</label>
                <input id="name" name="pdate" type="text" class="form-control" value="<%=rs.getString(2)%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Payment Amount</label>
                <input id="name" name="pamt" type="text" class="form-control" value="<%=rs.getString(3)%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Card Number</label>
                <input id="contact" name="cardno" type="text" class="form-control" value="<%=rs.getString(5)%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Card Holder</label>
                <input id="adder1" name="cardholder" type="text" class="form-control" value="<%=rs.getString(6)%>" readOnly style="background: white;">
			</div>
    	</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>