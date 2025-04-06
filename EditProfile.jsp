<%-- 
    Document   : EditProfile
    Created on : 12 Jan, 2022, 11:44:39 AM
    Author     : 91974
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    
                <h1>Edit Profile</h1>
                <form name="frmeditprofile" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/EditUploadAction.jsp">
                    <table>
                    <%
                String se="select * from tbl_shop where shop_id='"+session.getAttribute("shopid")+"'";
                ResultSet rs=con.selectCommand(se);
                int i=0;
                if(rs.next())
                  {
                        %>
                  
                                  
          <tr>
                    <td>Shop Name</td>
                <td><input type="text" name="txtfname" value="<%=rs.getString("shop_name")%>"></td>
                </tr>
                <tr>
                 <td>Contact</td>
                <td><input type="text" name="txtcontact" pattern="[0-9]{10}"  value="<%=rs.getString("shop_contact")%>" required></td>
                </tr>
                 <tr>
                <td>Email</td>
                <td><input type="email" name="txtemail"  value="<%=rs.getString("shop_email")%>" required></td>
                </tr>
                 
                 <tr>
                     <td>Address</td>
                <td><textarea name="txtaddress"  value="<%=rs.getString("shop_address")%>" required></textarea>
                </td>                  
                 </tr>
                <tr>
                    <td>Photo</td>
                    <td><img width="100" height="70" src="../Assets/User/<%=rs.getString("shop_photo")%>">
                        <br><input type="file" name="image" value="<%=rs.getString("shop_photo")%>"></td>
                </tr>
                <%
            }
            %>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn" value="EDIT">
                    </td>
                </tr>
               </table>
    </form>
    </body>
</html>

