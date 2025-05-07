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
		String id = request.getParameter("id");
		String sname = request.getParameter("sname");
		String scost = request.getParameter("scost");
		con.createStatement().executeUpdate("update services set service_name='"+sname+"', service_cost="+scost+" where service_id="+id);
		response.sendRedirect("manage-services.jsp");
	}

	ResultSet rs = con.createStatement().executeQuery("SELECT * from services where service_id="+request.getParameter("id"));
	rs.next();
%>


<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="card-title">
                <h3 class="text-center">Services</h3>
            </div>
            <hr>

            <form action="edit-service.jsp" method="post">
				<div class="form-group">
	            	<label for="">ID</label>
	                <input id="id" name="id" type="text" class="form-control" value="<%=rs.getInt(1)%>" readOnly style="background: white;">
				</div>            
                <div class="form-group">
                    <label for="">Service Name</label>
                    <input id="sname" name="sname" type="text" class="form-control" value="<%=rs.getString(2)%>" placeholder="Enter Service Name" required>
                </div>
                <div class="form-group">
                    <label for="">Service Cost</label>
                    <input id="scost" name="scost" type="number" class="form-control"
                        placeholder="Enter Service Cost" min=300 value="<%=rs.getString(3)%>" required>
                </div>

                <div class="form-group">
	                <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="login" id="login">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>