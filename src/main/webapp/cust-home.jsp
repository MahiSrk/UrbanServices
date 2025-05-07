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
<div class="container">
	<center><img alt="" src="images/customer-dashboard.jpg" width="100%"></center>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>