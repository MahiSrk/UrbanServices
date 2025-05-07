<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("delete from providers where provider_id="+request.getParameter("id"));
	response.sendRedirect("manage-service-providers.jsp");
%>