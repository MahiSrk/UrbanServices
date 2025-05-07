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

<h2 class="text-center" style="margin-top: 20px">Welcome Admin - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>
<div class="container" style="margin-top:20px; margin-bottom: 60px;">

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from providers where provider_id="+request.getParameter("id"));
	rs.next();
%>

<table class="table table-bordered">
<tr>
	<td><img alt="" src="uploads/<%=rs.getInt(1)%>.jpg"></td>
	<td>
		<table>
		<tr>
			<td><b>ID</b></td>
			<td><%=rs.getString(1)%></td>
		</tr>
		<tr>
			<td><b>Name</b></td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<tr>
			<td><b>Contact</b></td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td><b>Email</b></td>
			<td><%=rs.getString(4)%></td>
		</tr>
		
		<tr>
			<td><b>Address 1</b></td>
			<td><%=rs.getString(5)%></td>
		</tr>
		<tr>
			<td><b>Address 2</b></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<tr>
			<td><b>City</b></td>
			<td><%=rs.getString(7)%></td>
		</tr>
		<tr>
			<td><b>Description</b></td>
			<td><%=rs.getString(9)%></td>
		</tr>
		<tr>
			<td><b>Profession</b></td>
			<td><%=rs.getString(11)%></td>
		</tr>
		<tr>
			<td><b>Status</b></td>
			<td><%=rs.getString(12)%></td>
		</tr>
		</table>
	</td>
</tr>

</table>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>