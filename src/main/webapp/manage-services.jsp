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

<%@include file="config.jsp"%>

<%
	if(request.getParameter("login")!=null){
		String sname = request.getParameter("sname");
		String scost = request.getParameter("scost");
		con.createStatement().executeUpdate("insert into services(service_name, service_cost, providers_id) values('"+sname+"',"+scost+","+session.getAttribute("uid")+")");
	}

	ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'urban' AND TABLE_NAME = 'services';");
	rs.next();
	int id = rs.getInt(1);
%>


<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center">Services</h3>
            </div>
            <hr>

            <form action="manage-services.jsp" method="post">
				<div class="form-group">
	            	<label for="">ID</label>
	                <input id="id" name="id" type="text" class="form-control" value="<%=id%>" readOnly style="background: white;">
				</div>            
                <div class="form-group">
                    <label for="">Service Name</label>
                    <input id="sname" name="sname" type="text" class="form-control" placeholder="Enter Service Name" required>
                </div>
                <div class="form-group">
                    <label for="">Service Cost</label>
                    <input id="scost" name="scost" type="number" class="form-control"
                        placeholder="Enter Service Cost" min=300 required>
                </div>

                <div class="form-group">
	                <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="login" id="login">Add</button>
                </div>
            </form>
        </div>
    </div>
<%
	rs = con.createStatement().executeQuery("select * from services where providers_id="+session.getAttribute("uid"));
%>
	
	<div class="main" style="color:white;background: white;">
		<h2 style="color:black;">Services List</h2>
		
		<table id="tableID" class="display" style="width:100%; color:black;">
		<thead>
			<tr>
				<th>Service ID</th>
				<th>Name</th>
				<th>Cost</th>
	            <th></th>
	            <th></th>
			</tr>
		</thead>
		<tbody>
	<%
				while(rs.next()){
	%>
			<tr>
	            <td><%=rs.getString("service_id")%></td>
				<td><%=rs.getString("service_name")%></td>
				<td><%=rs.getString("service_cost")%></td>
				<td><a href='edit-service.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Edit</a></td>
				<td><a href='delete-service.jsp?id=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Delete</a></td>
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