<%-- 
    Document   : District
    Created on : 30 Dec, 2021, 10:57:09 AM
    Author     : 91974
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String dis="";
                dis=request.getParameter("txtdistrict");
                String ins="insert into tbl_district(district_name)values('"+dis+"')";
                con.executeCommand(ins);
            }
            %>
        <h1>District</h1>
    <form name="frmDistrict" method="post">
        <table border="1">
            <tr>
                <td>District Name</td>
                <td> <td><input type="text" name="txtdistrict" required></td>
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
                <td>District Name</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_district";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
                
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td></td>
            </tr>
            <%
            }
            %>
        </table>
        
        
    </form>
    </body>
</html>