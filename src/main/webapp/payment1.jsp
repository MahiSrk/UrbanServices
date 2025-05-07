<%@include file="config.jsp"%>

<%
	
	String pdate = request.getParameter("pdate");
	int pamt = Integer.parseInt(request.getParameter("pamt"));
	int bid = Integer.parseInt(request.getParameter("booking_id"));
	String cardno = request.getParameter("cardno");
	String cardholder = request.getParameter("cardholder");
	String feedback = request.getParameter("feedback");
	
	PreparedStatement ps = con.prepareStatement("INSERT INTO payment (pdate, pamt, booking_id, cardno, cardholder, feedback) VALUES (?,?,?,?,?,?)");

	
	ps.setString(1,pdate);
	ps.setInt(2,pamt);
	ps.setInt(3,bid);
	ps.setString(4,cardno);
	ps.setString(5,cardholder);
	ps.setString(6,feedback);
	
	ps.executeUpdate();
	
	con.createStatement().executeUpdate("update booking set payment_status='Receieved' where booking_id="+bid);
%>
<script>
	alert("Payment received successfully. View receipt in your bookings");
	location.href = "cust-home.jsp";
</script>