<%@ page import="java.sql.*" %>

<%
	try
	{
	Connection con= null;
  	Class.forName("oracle.jdbc.driver.OracleDriver");
  	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","surya123");
    
    String sql="select * from register";
    PreparedStatement smt=con.prepareStatement(sql);
    ResultSet rs=smt.executeQuery();
        
%>

<html>
    <style>
        body{
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
        .button{
            margin: o;
            padding-left: 200px;
            
        }
        input{
            position: absolute;
            top: 15%;
            width: 100px;
            height: 40px;
            border: none;
            border-radius: 20px;
            background: red;
            font-size: 20px;
            font-family:'Times New Roman', Times, serif;
            font-weight: lighter;

        }

        input[type="button"]{
            margin: 0 1000px;
        }

        input:hover{
            border: 2px solid red;
            background: transparent;
        }
        table td a{
            text-decoration: none;
            color: blue;
        }
        table td{
            padding:0px 7px;
        }
    </style>
    <body>
        <div class="button">
            <a href="add.html"><input type="submit" value="ADD"></a>

        </div>
        <div class="button">
            <a href="admin.html"><input type="button" value="Home"></a>

        </div>
        <div class="table">
            <table border="5" align="center">
                <caption>Registered Member Details</caption>
                <tr>
                    <td>First Name</td>
                    <td>Last Name</td>
                    <td>Date Of Birth</td>
                    <td>User Name</td>
                    <td>Email</td>
                    <td>Phone Number</td>
                    <td>Password</td>
                    <td>Gender</td>
                    <td>Options</td>
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
                                    <a href="#">Remove</a>
                                </td>
                            </tr>

                        <%
                    }

                %>
            </table>
        </div>
    </body>
</html>


<%


%>

<%
    }
    catch(Exception e){
        out.println(e);
    }
%>