<%-- 
    Document   : Login
    Created on : 30 Dec, 2021, 12:07:15 PM
    Author     : 91974
--%>
<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            String user="",pwd="";
        if(request.getParameter("btnlogin")!=null)
        {
            user=request.getParameter("txtuser");
            pwd=request.getParameter("txtpsswd");
            String sel="select * from tbl_shop where shop_username='"+user+"' and shop_password='"+pwd+"'";
            ResultSet rs=con.selectCommand(sel);
            if(rs.next())
            {
                session.setAttribute("shopid",rs.getString("shop_id"));
                session.setAttribute("shoppsswd",rs.getString("shop_password"));
                response.sendRedirect("../Shop/HomePage.jsp");
            }
        }
        %>
        <h1>Login</h1>
        <form name="frmLogin" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtuser" required></td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="Password" name="txtpsswd" required></td>
                </tr>
                  <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnlogin" value="Login">
                        <input type="Reset" name="btnreset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
