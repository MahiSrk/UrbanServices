<%@include file="config.jsp"%>

<%
	String sdate = request.getParameter("sdate");
	String stime = request.getParameter("stime");
	int sid = Integer.parseInt(request.getParameter("sid"));
	int cid = Integer.parseInt(session.getAttribute("uid").toString());
	
	PreparedStatement ps = con.prepareStatement("insert into booking(service_date, service_time, customer_id, provider_id) values(?,?,?,?)");
	
	ps.setString(1, sdate);
	ps.setString(2, stime);
	ps.setInt(4, sid);
	ps.setInt(3, cid);
	
	ps.executeUpdate();
%>
<script>
	alert("Service provider booking done successfully. Wait for service provider to accept booking");
	location.href = "cust-home.jsp";
</script>