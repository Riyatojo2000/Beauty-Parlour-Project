<%-- 
    Document   : Category
    Created on : 30 Dec, 2021, 11:13:17 AM
    Author     : 91974
--%>

<%@page import="java.sql.ResultSet"  %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String cat="";
                cat=request.getParameter("txtcname");
                String ins="insert into tbl_category(category_name)values('"+cat+"')";
                con.executeCommand(ins);
            }
            %>
        <h1>Category</h1>
        <form name="frmCategory" method="post">
            <table border="1">
                 <tr>
                <td>Category</td>
                <td><input type="text" name="txtcname" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="btncancel" value="cancel">
                    </td>
                </tr>
            </table>
             <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>Category Name</td>
                <td>Action</td>

            </tr>
            <%
            String sel="select * from tbl_category";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("category_name")%></td>
                <td></td>
            </tr>
            <%
            }
            %>
        </form>
    </body>
</html>
