<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("delete from services where service_id="+request.getParameter("id"));
	response.sendRedirect("manage-services.jsp");
%>