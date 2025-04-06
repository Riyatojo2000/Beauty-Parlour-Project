<%-- 
    Document   : ShopRegistration
    Created on : 12 Jan, 2022, 10:55:59 AM
    Author     : 91974
--%>

<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shop Registration</h1>
        <form name="frmshop" method="post" enctype="multipart/form-data" action="../Assets/Actionpages/ShopUploadAction.jsp">
            <table>
                <tr>
                    <td> Name</td>
                <td><input type="text" name="txtfname" required></td>
                </tr>
                <tr>
                 <td>Contact</td>
                <td><input type="text" name="txtcontact" pattern="[0-9]{10}" required></td>
                </tr>
               
                <tr>
                <td>Email</td>
                <td><input type="email" name="txtemail" required></td>
                </tr>
                <tr>
                     <td>Address</td>
                <td><textarea name="txtaddress" required></textarea>
                </td>                  
                </tr>
                <tr>
                <td>District Name</td>
                    <td><select name="txtdistrict" onchange="getPlace(this.value)">
                              <option>--select--</option>
                            <%
                               String sel="select * from tbl_district";
                               ResultSet rs=con.selectCommand(sel);
                               while(rs.next())
                               {
                                   %>
                                   <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                   <%
                               }
                           %>
                       
                        </select></tr>
                     <tr>
                    <td>Place Name</td>
                    <td><select name="txtpname" id="txtpname">
                            <option>--select--</option>
                             
                       
                        </select></tr>
                   
                        <td>Photo</td>
                <td><input type="file" name="txtphoto" required>
                </td>
            </tr>
                 <tr>
                <td>Username</td>
                <td><input type="text" name="txtuser" required></td>
                </tr>
                <tr>
                <td>Password</td>
                <td><input type="password" name="txtpsswd" required></td>
                </tr>
                <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="txtpsswd1" required></td>
                </tr>
                 
               
                        <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="submit" name="btncancel" value="cancel">
                    </td>
                </tr>
                 </table>
        </form>
    </body>
</html>
    </body>
</html>
<script src="../Assets/Jq/jQuery.js"></script>
<script>
function getPlace(did)
{
//alert(did);
$.ajax({
url: "../Assets/Ajaxpages/Ajaxplace.jsp?did="+did,

 success: function(html){
$("#txtpname").html(html);
                //alert(html);

 }
});
}
</script>