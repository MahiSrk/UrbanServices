<%@include file="config.jsp"%>

<%
	con.createStatement().executeUpdate("update booking set booking_status='Reject' where booking_id="+request.getParameter("id"));
	response.sendRedirect("view-service-provider-bookings.jsp");
%>