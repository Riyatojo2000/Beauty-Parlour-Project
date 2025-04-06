<%-- 
    Document   : SubCategory
    Created on : 30 Dec, 2021, 11:16:24 AM
    Author     : 91974
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Category</title>
    </head>
    
        <%
            String eid="",ename="";
            if(request.getParameter("btnsave")!=null)
            {
                String cat="",sub="";
                cat=request.getParameter("txtcname");
                sub=request.getParameter("txtsname");
                
                 if(request.getParameter("txthidden")!=null)
                {
                    String up="update tbl_subcategory set subcategory_name='"+sub+"' where subcategory_id='"+request.getParameter("txthidden")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("SubCategory.jsp");
                }
                 String ins="insert into tbl_subcategory(subcategory_name,category_id)values('"+sub+"','"+cat+"')";
                //out.println(ins);
                con.executeCommand(ins);
            }
             if(request.getParameter("cid")!=null)
            {
                String del="";
                del="delete from tbl_subcategory where subcategory_id='"+request.getParameter("cid")+"'";
                con.executeCommand(del);
                response.sendRedirect("SubCategory.jsp");
            }
             if(request.getParameter("eid")!=null)
            { 
                String se1="select * from tbl_subcategory where subcategory_id='"+request.getParameter("eid")+"'";
                ResultSet rs=con.selectCommand(se1);
                if(rs.next())
                {
                    eid=rs.getString("subcategory_id");
                     ename=rs.getString("subcategory_name");
                }    
            }
            %>
        <body>
        <h1>Sub Category</h1>
        <form name="frmSub" method="post">
            <table>
                  <input type="hidden" name="txthidden" value="<%=eid%>" required>
                 <tr>
                <td>Sub Category</td>
                <td><input type="text" name="txtsname"value="<%=ename%>"></td>
                </tr>
                 <tr>
                    <td>Category</td>
                    <td><select name="txtcname">
                            <option>--select--</option>
                             <%
                                String sel="select * from tbl_category";
                                ResultSet rs=con.selectCommand(sel);
                                while(rs.next())
                                {
                                    %>
                                    <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
                                            <%
                                }
                                %>
                                }
                        </select></tr>
                        <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="save">
                        <input type="submit" name="btncancel" value="cancel">
                    </td>
                </tr>
            </table>
            <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>SubCategory</td>
                <td>Category</td>
                <td>Action</td>
            </tr>
            <%
            String s="select * from tbl_category c inner join tbl_subcategory sc on c.category_id=sc.category_id";
            ResultSet rs2=con.selectCommand(s);
            int i=0;
            while(rs2.next())
            {
                
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs2.getString("category_name")%></td>
                <td><%=rs2.getString("subcategory_name")%></td>
                <td><a href="SubCategory.jsp?cid=<%=rs2.getString("subcategory_id")%>">Delete</a>/<a href="SubCategory.jsp?eid=<%=rs2.getString("subcategory_id")%>">Edit</a></td></td>
            </tr>
            <%
            }
            %>
        </table>
        </form>
    </body>
</html>
