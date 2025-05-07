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

<h2 class="text-center" style="margin-top: 20px">Welcome Admin - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from customer");
%>
<div class="container">
	<div class="main" style="color:white;background: white;">
		<h2 style="color:black;">Customers List</h2>
	
		<table id="tableID" class="display" style="width:100%; color:black;">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Contact</th>
	            <th>City</th>
	            <th>Status</th>
	            <th></th>
	            <th></th>
	            <th></th>
			</tr>
		</thead>
		<tbody>
	<%
				while(rs.next()){
	%>
			<tr>
	            <td><%=rs.getString("customer_id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("contact")%></td>
				<td><%=rs.getString("city")%></td>
				<td><%=rs.getString("status")%></td>
				<td><a href='cust-view-more.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>View</a></td>
				<td><a href='cust-approve.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Approve</a></td>
				<td><a href='cust-delete.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block' onclick="return confirm('Delete record?')">Delete</a></td>
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