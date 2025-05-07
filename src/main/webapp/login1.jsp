<%@include file="config.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	PreparedStatement ps = con.prepareStatement("select * from providers where email=? and password=? and status='Active'");
	
	ps.setString(1, email);
	ps.setString(2, password);
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		session.setAttribute("user","provider");
		session.setAttribute("uid", rs.getString(1));
		session.setAttribute("uname",rs.getString(2));
%>
<script type="text/javascript">
	alert("Service provider login successful");
	location.href="service-provider-home.jsp";
</script>
<%
	}
	else{
%>
<script type="text/javascript">
	alert('Service provider login failed. Invalid contact/password or account not verified yet.');
	location.href="login.jsp";
</script>
<%
	}
%>
