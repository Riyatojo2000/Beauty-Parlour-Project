<%-- 
    Document   : UseList
    Created on : 26 Jan, 2022, 9:41:30 AM
    Author     : 91974
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <body>
    <%
        if(request.getParameter("aid")!=null)
            {
                String up="update tbl_shop set user_vstatus='1' where shop_id='"+request.getParameter("aid")+"'";
                con.executeCommand(up);
                out.println(up);
                response.sendRedirect("ShopList.jsp");
            }
        if(request.getParameter("rid")!=null)
            {
                String up1="update tbl_shop set shop_vstatus='2' where shop_id='"+request.getParameter("rid")+"'";
                con.executeCommand(up1);
                response.sendRedirect("ShopList.jsp");
            }
        %>
       
    <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>Shop Name</td>
                <td>Contact No</td>
                    <td>Email</td>
                      <td>Address</td>
                <td>Action</td>
            </tr>
            <%
            String sel="select * from tbl_shop where shop_vstatus='0' ";
            ResultSet rs=con.selectCommand(sel);
            int i=0;
            while(rs.next())
            {
               
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("shop_name")%></td>
                 <td><%=rs.getString("shop_contact")%></td>
                  <td><%=rs.getString("shop_email")%></td>
                   <td><%=rs.getString("shop_address")%></td>
                   <td><a href="ShopList.jsp?aid=<%=rs.getString("shop_id")%>">Accept</a>/<a href="ShopList.jsp?rid=<%=rs.getString("shop_id")%>">Reject</a></td>
            </tr>
            <%
            }
            %>
        </table>
    </body>
</html>