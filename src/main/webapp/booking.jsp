<%
	if(session.getAttribute("uname")==null){
		out.print("<script>alert('Please login');location.href='index.jsp';</script>");
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

<%@include file="config.jsp"%>

<%
	ResultSet rs = con.createStatement().executeQuery("select * from providers where provider_id="+request.getParameter("provider"));
	rs.next();
%>

<h2 class="text-center" style="margin-top: 20px">Welcome Customer - <%=session.getAttribute("uname").toString().toUpperCase()%></h2><hr>

<div class="container" style="margin-top: 30px;">
	<div class="card text-center">
    	<div class="card-header">
        	  <h3>Details about <%=rs.getString("name")%>  --></h3>
        	  
        </div>
        <div class="container" style="margin-top: 30px;">
            <div class="row">
                <div class="col">
                    <img style="height: 250px" src="uploads/<%=rs.getInt(1)%>.jpg">
                </div>
            </div>
        </div>

        <div class="card-body">
			<table class="table">
            <tr>
            	<th>Name</th>
				<th>Profession</th>
            	<th>Address</th>
				<th>City</th>
			</tr>
            <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("profession")%></td>
                <td><%=rs.getString("address1")%>, <%=rs.getString("address2")%></td>
               	<td><%=rs.getString("city")%></td>
			</tr>
            </table>
        </div>
    </div>
</div>
 
<div class="container" style="margin-bottom: 60px;margin-top: 20px;">
	<div class="card">
    	<div class="card-body">
        	<div class="card-title">
            	<h3 class="text-center">Book Service Provider</h3>
            </div>
            <hr>

            <form action="booking1.jsp" method="post">
            	<input type="hidden" name="sid" value="<%=rs.getInt(1)%>">
            	
                <div class="form-group">
                    <label for="">Service Date</label>
                    <input class="form-control" type="date" name="sdate" id="date" required>
                </div>
                <div class="form-group">
                    <label for="">Service Time</label>
                    <input class="form-control" type="time" name="stime" id="date" required>
                </div>
                <button style="margin-top: 30px" class="btn btn-block btn-primary" type="submit" name="book" id="book">Book Now</button>
            </form>

        </div>
    </div>
</div>


</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>