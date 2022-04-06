<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <title> Balance </title>
</head>
<body>
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","root");

    int account=Integer.parseInt(request.getParameter("account"));
    String mail =request.getParameter("mail");

    PreparedStatement p=con.prepareStatement("select balance from login where ACCOUNTNO = ?");
    p.setInt(1,account);
    ResultSet r=p.executeQuery();
    if(r.next())
    out.println("Balance is : "+r.getInt(1));
    %>
</body>
</html>    