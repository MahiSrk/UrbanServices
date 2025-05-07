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
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

    <style>
        nav a.nav-link {
            color: #fff !important;
        }
    </style>

    <title>Online Urban Services</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<h2 class="text-center" style="margin-top: 20px">Welcome Service Provider - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>
<div class="container" style="margin-top:20px; margin-bottom: 60px;">

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select booking_id, booking_date, service_date, service_time, customer.name, booking_status, payment_status, customer.customer_id from booking, customer where booking.customer_id = customer.customer_id and provider_id="+session.getAttribute("uid"));
%>
<div class="main" style="color:white;background: white;">
	<h2 style="color:black;">Bookings List</h2>
	<table id="tableID" class="display" style="width:100%; color:black;">
	<thead>
		<tr>
			<th>Booking ID</th>
			<th>Booking Date</th>
			<th>Service Date</th>
			<th>Service Time</th>
	        <th>Customer Name</th>
	        <th>Booking Status</th>
	        <th>Payment Status</th>
	      	<th></th>
	      	<th></th>
	      	<th></th>
	      	<th></th>
			</tr>
		</thead>
		<tbody>
<%	while(rs.next()) { %>
			<tr>
	            <td><%=rs.getString(1)%></td>
	            <td><%=rs.getString(2)%></td>
	            <td><%=rs.getString(3)%></td>
	            <td><%=rs.getString(4)%></td>
	            <td><%=rs.getString(5)%></td>
	            <td><%=rs.getString(6)%></td>
	            <td><%=rs.getString(7)%></td>
				<td><a href='view-cust-details.jsp?id=<%=rs.getInt(8)%>' class='btn btn-primary btn-block'>Customer Details</a></td>
				<td><a href='accept-booking.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Confirm</a></td>
				<td><a href='reject-booking.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Reject</a></td>
				<td><% if(!rs.getString(7).equals("Pending")) {%><a href='view-receipt.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Payment Details</a><%} %></td>
			</tr>
<%
	}
%>
		</tbody>
	</table>
</div>
<script>
	$(document).ready(function() {
		$('#tableID').DataTable({ });
	});
</script>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>