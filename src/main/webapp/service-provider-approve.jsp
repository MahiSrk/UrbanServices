<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("update providers set status='Active' where provider_id="+request.getParameter("id"));
	response.sendRedirect("manage-service-providers.jsp");
%>