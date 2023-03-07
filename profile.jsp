<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%

    HttpSession ss=request.getSession();
    String user=(String) ss.getAttribute("user");


    try{
        Connection con= null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");
		String qry ="select * from register where username=?";
		PreparedStatement pstmt = con.prepareStatement(qry);
		pstmt.setString(1,user);
        ResultSet rs= pstmt.executeQuery();

        while(rs.next())
		{

    %>

    <html>
<head>
	
	<link rel="stylesheet" href="profilelog.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
	<div class="wrapper">
		<div class="heading">
			<h3>Memory <span>Gallery</span></h3>
		</div>
		<nav>
			<div class="items">
				<span class="item"><a href="loggedin.html">Home</a></span>
				<span class="item"><a href="memorylog.html">Memories</a></span>
				<span class="item"><a href="aboutlog.html">About Us</a></span>
				<span class="item active"><a href="profile.jsp">Profile</a></span>
				<span class="item"><a href="contactlog.html">Contact us</a></span>
				<span class="item"><a href="index.html">Logout</a></span>
			</div>	
		</nav>
		
		
	</div>
	<!---Upto here the menu page is declared--->


    <div class="box">

        <div class="image">
            <img src="pro.jpg">
        </div>
        <div class="tab">
            <form>
                <div class="item">
                    <span class="labe">First Name : </span>
                    <span id="fname" class="sol"><%=rs.getString(1) %></span>
                </div>
                <div class="item">
                    <span class="labe">Last Name : </span>
                    <span id="lname" class="sol"><%=rs.getString(2) %></span>
                </div>
                <div class="item">
                    <span class="labe"> Date of Birth: </span>
                    <span id="dob" class="sol"><%=rs.getString(3) %></span>
                </div>
                <div class="item">
                    <span class="labe">Email : </span>
                    <span id="email" class="sol"><%=rs.getString(5) %></span>
                </div>
                <div class="item">
                    <span class="labe">Phone Number : </span>
                    <span id="phone" class="sol"><%=rs.getString(6) %></span>
                </div>
                <div class="item">
                    <span class="labe">User Name : </span>
                    <span id="user" class="sol"><%=rs.getString(4) %></span>
                </div>
                <div class="item">
                    <span class="labe">Gender : </span>
                    <span id="gender" class="sol"><%=rs.getString(8) %></span>
                </div>            
            </form>

           


        </div>
    </div>


    <!---Here onwards footer class is started--->
	<footer class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="about.html">about us</a></li>
                        <li><a href="#">our services</a></li>
                        <li><a href="#">privacy policy</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="contact.html">Contact us</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Shoping</h4>
                    <ul>
                        <li><a href="#" target="_blank">watch</a></li>
                        <li><a href="#" target="_blank">bag</a></li>
                        <li><a href="#" target="_blank">shoes</a></li>
                        <li><a href="#" target="_blank">dress</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                     <a href="https://www.youtube.com/c/manatechnologyManu" target="_blank"><i class="fab fa-youtube"></i></a>
                        <a href="https://manublogsmanu.blogspot.com/" target="_blank"><i class="fab fa-blogger-b"></i></a>
                     <a href="https://www.facebook.com/manojkumar.devisetti" target="_blank"><i class="fab fa-facebook-f" ></i></a>
                        <a href="https://www.instagram.com/loverboy_manoj/" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://t.me/manueditzmanumanueditz" target="_blank"><i class="fab fa-telegram"></i></a>
                     
                    </div>
                </div>
            </div>	
         <div class="copy">
             <span>&copy; CopyRights Belongs to Mr.Manoj D</span>
         </div>
        </div>
   </footer>

</body>
</html>





    <% 
}           
    }catch(Exception e){
        out.println(e);
    }


%>