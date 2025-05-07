<%@include file="config.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	PreparedStatement ps = con.prepareStatement("select * from customer where email=? and password=? and status='Active'");
	
	ps.setString(1, email);
	ps.setString(2, password);
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		session.setAttribute("user","customer");
		session.setAttribute("uid", rs.getString(1));
		session.setAttribute("uname",rs.getString(2));
%>
<script type="text/javascript">
	alert("Customer login successful");
	location.href="cust-home.jsp";
</script>
<%
	}
	else{
%>
<script type="text/javascript">
	alert("Customer login failed. Invalid email/password or account not verified yet.");
	location.href="admin-login.jsp";
</script>
<%
	}
%>
