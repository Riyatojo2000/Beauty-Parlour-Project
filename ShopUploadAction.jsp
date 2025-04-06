<%-- 
    Document   : ShopUploadAction
    Created on : 12 Jan, 2022, 11:00:50 AM
    Author     : 91974
--%>


<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizen</title>
    </head>
    <body>
        <%
           
        File savedFile=null;
        FileItem f_item=null;
       
       

String field_name="";
String file_name="";
String fn="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
       
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
         
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
               
                k++;
        }
       else
       {
 
 
           //f_item=(FileItem)itr.next();
           
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtphoto"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Assets\\User\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            fn="User_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);              
               
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
         
           
       }
           
           }
    //Strinh str1="insert into tbl_wantedlist ()";
    if(value[7].equals(value[8]))
    {
        String str1="insert into tbl_shop(shop_name,shop_contact,shop_email,shop_address,place_id,shop_photo,shop_username,shop_password)values('"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[5]+"','"+fn+"','"+value[6]+"','"+value[7]+"')";
  System.out.println(str1);
  out.println(str1);
   
   
    boolean status=con.executeCommand(str1);
   
    if(status==true)
    {
      %>
      <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='../../Guest/ShopRegistration.jsp'},100);
        </script>
     <%
   
     }
    }

else
    {
    %>
    <script>alert("password mismatch");</script>
     <%  
    }
    }
        %>
    </body>
</html>