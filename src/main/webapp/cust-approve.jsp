<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("update customer set status='Active' where customer_id="+request.getParameter("id"));
	response.sendRedirect("manage-customers.jsp");
%>