<%-- 
    Document   : Product
    Created on : 30 Dec, 2021, 11:24:49 AM
    Author     : 91974
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <h1>Product</h1>
        <form name="frmProduct" method="post">
            <table>
                 <tr>
                    <td>Category</td>
                    <td><select name="txtcname">
                            <option value="select">--select--</option>
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                        </select></tr>
                         <tr>
                    <td>Sub Category</td>
                    <td><select name="txtsname">
                            <option value="select">--select--</option>
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                        </select></tr>
                           <tr>
                <td>Product Name</td>
                <td><input type="text" name="txtpname" required></td>
                </tr>
                   <tr>
                <td>Price</td>
                <td><input type="text" name="txtprice" required></td>
                </tr>
                 <tr>
                     <td>Description</td>
                <td><textarea name="txtdescription" required></textarea>
                </td>                  
                </tr>
                <tr>
                <td>Image</td>
                <td><input type="file" name="txtfile" required>
                </td>
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
