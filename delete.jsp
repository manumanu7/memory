<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>


<%
	try
	{
        HttpSession ss=request.getSession();
        String user=(String) ss.getAttribute("deleteuser");

        Connection con= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");

        String sql="delete from register where username=?";
        PreparedStatement smt=con.prepareStatement(sql);
        smt.setString(1,user);

        int res=smt.executeUpdate();

        if(res>0){
            %>


            <html>
                <style>
                    *{
                        margin:0px;
                        padding:0px;
                        box-sizing: border-box;
                        font-family: 'Poppins', sans-serif;
                        
                    }

                    body{
                            background: linear-gradient(transparent,0,0,0,0.5);
                            padding:10px;
                    }

                    .mess{
                        margin: 20px 0px;
                        text-align: center;
                        align-items: center;
                        align-content: center;
                    }
                    
                    h1{
                        align-items: center;
                        align-content: center;
                        text-align: center;
                        font-size: 30px;
                        margin-bottom: 20px;
                        font-family: Verdana, Geneva, Tahoma, sans-serif;
                        font-weight: lighter;

                    }

                    h1 span{
                        font: 35px;
                        font-family: Arial, Helvetica, sans-serif;
                        font-weight: bold;
                        text-decoration: underline;
                    }
                    a{
                        align-items: center;
                        align-content: center;
                        text-align: center;
                        font-size: 15px;
                        margin: 30px;
                        font-weight: lighter;
                        color: blue;
                    }
                    



                </style>
                <body>
                    <div class="mess">
                    <h1>Records Registered on User name<span> <%=user%> </span>has been deleted successfully.......</h1>
                    
                    <a href="admin.html">home</a>
                    <a href="search.jsp">back</a>
                </div>
                </body>
            </html>


            <%
        }
        else{
            out.println("deletion failed.......");
        }





    }
    catch(Exception e){
        out.println(e);
    }
%>
