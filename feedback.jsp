<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

		<%
        String user=request.getParameter("user");
        String fname=request.getParameter("fname");
	    String email=request.getParameter("email");
	    String message=request.getParameter("message");
	
	if(password.equals(conform)){
		try
		{
		Connection con= null;
      	Class.forName("oracle.jdbc.driver.OracleDriver");
      	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");
		String qry ="insert into  feedback values(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(qry);
			pstmt.setString(1,user);
			pstmt.setString(2,fname);
			pstmt.setString(3,email);
			pstmt.setString(4,message);
		int sts = pstmt.executeUpdate();
		if(sts>0){
			response.sendRedirect("contactlog.html");
		}
	out.println(sts+ " row inserted successfully");
		}
		catch(Exception e)
		{
		out.print(e);
		e.printStackTrace();
		}
	}
	else{
		out.println("Passwords does not match");
	}
		%>