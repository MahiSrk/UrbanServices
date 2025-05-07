<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("delete from customer where customer_id="+request.getParameter("id"));
	response.sendRedirect("manage-customers.jsp");
%>