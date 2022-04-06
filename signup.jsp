<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <title> SignUp </title>
</head>
<body>
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","root");
   
    String name=request.getParameter("txt1");
    String psw=request.getParameter("pw");
    int balance = Integer.parseInt(request.getParameter("bal"));
    String mail =request.getParameter("email");


    PreparedStatement p=con.prepareStatement("insert into login(name,password,balance,email) values(?,?,?,?)");
    p.setString(1,name);
    p.setString(2,psw);
    p.setInt(3,balance);
    p.setString(4,mail);
    int k=p.executeUpdate();
    if(k!=0){
    out.println(" Signed Up Successfully <br>");
    PreparedStatement q=con.prepareStatement("select ACCOUNTNO from login where email = ? ");
    q.setString(1,mail);
    ResultSet r = q.executeQuery();
    if(r.next())
    out.println(" Your Account Number is "+ r.getInt(1)); 
}
    %>
 <br>
<a href="index.html"> Click here to go back to home page </a>   
</body>
</html>
