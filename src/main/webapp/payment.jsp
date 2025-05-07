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
	ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'urban' AND TABLE_NAME = 'payment';");
	rs.next();
	int id = rs.getInt(1);

	rs = con.createStatement().executeQuery("select current_date");
	rs.next();
	String pdate = rs.getString(1);
%>

<div class="container" style="margin-top: 30px; max-width: 800px;margin-bottom: 60px;">
	<div class="card">
    	<div class="card-body">
        	<div class="card-title">
            	<h3 class="text-center">Payment Details</h3>
            </div>
			<hr>
			<form action="payment1.jsp" method="post">
			<div class="form-group">
            	<label for="">ID</label>
                <input id="id" name="id" type="text" class="form-control" value="<%=id%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Payment Date</label>
                <input id="name" name="pdate" type="text" class="form-control" value="<%=pdate%>" readOnly style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Payment Amount</label>
                <input id="name" name="pamt" type="text" class="form-control" style="background: white;">
			</div>
			<div class="form-group">
            	<label for="">Card Number</label>
                <input id="contact" name="cardno" type="text" class="form-control" placeholder="xxxx-xxxx-xxxx-xxxx" minlength="19" maxlength="19" pattern="^\d{4}-\d{4}-\d{4}-\d{4}$" required>
			</div>
			<div class="form-group">
            	<label for="">Card Holder</label>
                <input id="adder1" name="cardholder" type="text" class="form-control" placeholder="Enter Card Holder Name" required>
			</div>
			<div class="form-group">
            	<label for="">Feedback</label>
                <input id="adder2" name="feedback" type="text" class="form-control" placeholder="Enter Feedback" required>
			</div>

            <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="register" id="register">Pay Now</button>
            <input type="hidden" name="booking_id" value='<%=request.getParameter("id")%>'%>
            </form>
    	</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>