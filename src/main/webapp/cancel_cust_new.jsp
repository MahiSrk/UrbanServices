<%@include file="config.jsp"%>
<%
    response.setContentType("text/html; charset=UTF-8");
    
    int bookingId = Integer.parseInt(request.getParameter("id"));
    
    try {
        // Update booking status to "Cancelled"
        PreparedStatement ps = con.prepareStatement("UPDATE booking SET booking_status=? WHERE booking_id=?");
        ps.setString(1, "Cancelled");
        ps.setInt(2, bookingId);
        
        int rowsUpdated = ps.executeUpdate();
        
        if (rowsUpdated > 0) {
            out.print("<script>alert('Booking cancelled successfully'); location.href='cust-home.jsp';</script>");
        } else {
            out.print("<script>alert('Error: Booking not found or could not be cancelled'); location.href='cust-home.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<h4>Error: " + e.getMessage() + "</h4>");
    } finally {
        if (con != null) con.close();
    }
%>
