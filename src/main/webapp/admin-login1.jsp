<%@include file="config.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	PreparedStatement ps = con.prepareStatement("select * from admin where admin_email=? and admin_pwd=?");
	
	ps.setString(1, email);
	ps.setString(2, password);
	
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		session.setAttribute("user","admin");
		session.setAttribute("uname",rs.getString(2));
%>
<script type="text/javascript">
	alert("Admin login successful");
	location.href="admin-home.jsp";
</script>
<%
	}
	else{
%>
<script type="text/javascript">
	alert("Admin login failed. Invalid email/password.");
	location.href="admin-login.jsp";
</script>
<%
	}
%>
