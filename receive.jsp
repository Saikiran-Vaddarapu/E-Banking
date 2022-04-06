<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <title> Server </title>
</head>
<body>
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","root");

    String name=request.getParameter("txt1");
    String psw=request.getParameter("pw");
    PreparedStatement p=con.prepareStatement("select password from login where name = ?");
    p.setString(1,name);
    ResultSet r=p.executeQuery();
    if(r.next())
     {
         String k = r.getString(1);
         if(psw.equals(k)){
             out.println("Login Successful "+"<br>");
             out.println("Hello "+name);
             %>
             <jsp:forward page="display.jsp" >
                <jsp:param name="nam" value= "<%= name %>"></jsp:param>  
            </jsp:forward> 
        <%  }
         else
         out.println(" Authentication Failed ");
     }
     else{
         out.println("Seems you haven't signed up yet ");
     }
    %>
</body>
</html>