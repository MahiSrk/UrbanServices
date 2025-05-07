<%
	session.removeAttribute("user");
	session.invalidate();
%>
<script>
	alert("You are logged out successfully.");
	location.href = "index.jsp";
</script>