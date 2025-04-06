<%-- 
    Document   : Place
    Created on : 30 Dec, 2021, 11:08:25 AM
    Author     : 91974
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
        <%
            String eid="",ename="";
             if(request.getParameter("btnsave")!=null)
             {
                 String place="",dis="";
                place=request.getParameter("txtpname");
                dis=request.getParameter("txtdistrict");
                if(request.getParameter("txthidden")!=null)
                {
                    String up="update tbl_place set place_name='"+place+"' where place_id='"+request.getParameter("txthidden")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("Place.jsp");
                }
                
                String ins="insert into tbl_place(place_name,district_id)values('"+place+"','"+dis+"')";
                //out.println(ins);
                con.executeCommand(ins);
            }
            if(request.getParameter("did")!=null)
            {
                String del="";
                del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
                con.executeCommand(del);
                response.sendRedirect("Place.jsp");
            }
            if(request.getParameter("eid")!=null)
            { 
                String se1="select * from tbl_place where place_id='"+request.getParameter("eid")+"'";
                ResultSet rs=con.selectCommand(se1);
                if(rs.next())
                {
                    eid=rs.getString("place_id");
                     ename=rs.getString("place_name");
                }    
            }
            %>
                <body>

        <h1>Place</h1>
        <form name="frmPlace" method="post">
            <table>
                <input type="hidden" name="txthidden" value="<%=eid%>" required>
                 <tr>
                    <td>District Name</td>
                    <td><select name="txtdistrict">
                            <option>--select--</option>
                            <%
                                String sel="select * from tbl_district";
                                ResultSet rs =con.selectCommand(sel);
                                while(rs.next())
                                {
                                    %>
                                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                            <%
                                }
                                %>
                                }
                        </select></tr>
                 <tr>
                <td>Place Name</td>
                <td><input type="text" name="txtpname" value="<%=ename%>"></td>
                </tr>
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
                <td>District</td>
                <td>Place</td>
                <td>Action</td>
            </tr>
            <%
            String se="select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
            ResultSet rs1=con.selectCommand(se);
            int i=0;
            while(rs1.next())
            {
                
            i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><a href="Place.jsp?did=<%=rs1.getString("place_id")%>">Delete</a>/<a href="Place.jsp?eid=<%=rs1.getString("place_id")%>">Edit</a></td>
            </tr>
            <%
            }
            %>
        </table>
        </form>
    </body>
</html>
