<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>


<%
	try
	{
        String user=request.getParameter("user");
        HttpSession ss=request.getSession();
        ss.setAttribute("deleteuser",user);
        Connection con= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");
        
        String sql="select * from register where username=?";
        PreparedStatement smt=con.prepareStatement(sql);
        smt.setString(1,user);
        ResultSet rs=smt.executeQuery();
        
        %>

    
<html>
    <style>
        body{
            align-items: center;
            text-align: center;
            background: darkgrey;
        }

        .table{
            align-items: center;
            text-align: center;
            margin: 0;
            margin:100px;
            justify-content: center;
            
        }
        table{
            align-items: center;
            text-align: center;
            justify-content: center;
            background: black;
            color: white;
            

        }
        table caption{
            font-size: 50px;
            text-decoration: underline;
            padding-bottom: 20px;
            color: crimson;
        }
        table tr{
            font-size: 25px;
            padding: 20px;
        }


        .search{
            width: 320px;
            height: 250px;
            color: white;
            background: black;
            margin: 100px 600px;
            align-items: center;
        }
        p{
            font-size: 19px;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            margin: 10px;
            padding-top: 20px;
            color: red;
            text-align: center;
            text-decoration: underline;
        }

        input[type="text"]{
            height: 45px;
            width: 90%;
            outline: none;
            background: transparent;
            border-radius: 7px;
            border: 1px solid #ccc;
            padding-left: 15px;
            font-size: 16px;
            border-bottom-width: 2px;
            transition:all 0.3s ease;
	        color:#fff;
        }

        input:focus,
        input:valid{
            border-color:darkgray;
        }

        .button{
            height:45px;
            width:45px 0;
            padding-bottom:10px;
            padding-top: 20px;
        }

        .button input{
            height:90%;
            width:80%;
            outline:none;
            background:#fb2525;
            color:#fff;
            border:none;
            font-size:18px;
            font-weight:500;
            letter-spacing:1px;
            border-radius:20px;
        }

        .button input:hover{
            cursor:pointer;
            border:2px solid #fb2525;
            background:transparent;
            color:#fb2525;
        }
        
        .bt{
            height:45px;
            width:45px 0;
            padding-bottom:10px;
            padding-top: 7px;
        }

        .bt input{
            height:90%;
            width:80%;
            outline:none;
            background:#fb2525;
            color:#fff;
            border:none;
            font-size:18px;
            font-weight:500;
            letter-spacing:1px;
            border-radius:20px;
        }

        .bt input:hover{
            cursor:pointer;
            border:2px solid #fb2525;
            background:transparent;
            color:#fb2525;
        }
    </style>
    <body>
        <div class="search">
            <form action="search.jsp" method="post">
                <div class="heading"><p>Enter User Name to Fetch Details</p></div>
                <input type="text" name="user" placeholder="User Name"> 
                <div class="button">
                    <input type="submit" value="Search" onclick="st()">
                </div>
                <div class="bt">
                    <a href="admin.html"><input type="button" value="Home" ></a>
                </div>
                
            </form>
        </div>
        <div class="table" >
            <table border="5px" id="table" align="center">
                <caption id="he">Details Of Person Having User Name as <%=user%></caption>
                <tr>
                    <td>FName</td>
                    <td>LName</td>
                    <td>Date Of Birth</td>
                    <td>User Name</td>
                    <td>Email</td>
                    <td>Phone Number</td>
                    <td>Password</td>
                    <td>Gender</td>
                    <td>Option</td>
                </tr>
                <%

                    while(rs.next()){
                        %>

                            <tr>
                                <td><%=rs.getString(1) %></td>
                                <td><%=rs.getString(2) %></td>
                                <td><%=rs.getString(3) %></td>
                                <td><%=rs.getString(4) %></td>
                                <td><%=rs.getString(5) %></td>
                                <td><%=rs.getString(6) %></td>
                                <td><%=rs.getString(7) %></td>
                                <td><%=rs.getString(8) %></td>
                                <td>
                                    <a href="#">Update</a>
                                    <br>
                                    <a href="delete.jsp">Remove</a>
                                </td>
                            </tr>

                        <%
                        }%>
                        
            </table>

        </div>
    </body>
</html>

<%    
    }
    catch(Exception e){
        out.println(e);
    }
        
%>