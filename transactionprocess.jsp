<%@ page import="java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<head>
    <title> Transaction Status </title>
</head>
<body>
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","root");
    
    int senderBalance = 0,receiverBalance = 0;
    int sender=Integer.parseInt(request.getParameter("sender"));
    int receiver =Integer.parseInt(request.getParameter("receiver"));
    
    int amount = Integer.parseInt(request.getParameter("balance"));
    PreparedStatement r=con.prepareStatement("select balance from login where ACCOUNTNO = ?");
    r.setInt(1,sender);
    ResultSet g=r.executeQuery();
    if(g.next())
         senderBalance=g.getInt(1);
    if(amount <= senderBalance){
    senderBalance = senderBalance - amount;
    %>
    <%    
    r=con.prepareStatement("update login set balance = ? where ACCOUNTNO = ? ");
    
    r.setInt(1,senderBalance);
    r.setInt(2,sender);
    r.executeUpdate();
    %>
    <br>
    <%
       r=con.prepareStatement("select balance from login where ACCOUNTNO = ?");
       r.setInt(1,receiver);
       ResultSet k=r.executeQuery();
       if(k.next())
         receiverBalance=k.getInt(1);
    %>
    <br>
    <%
    r=con.prepareStatement("update login set balance = ? where ACCOUNTNO = ? ");
    receiverBalance = receiverBalance + amount;
    r.setInt(1,receiverBalance);
    r.setInt(2,receiver);
    r.executeUpdate(); %>
    <%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String date = sdf.format(new Date());
  r=con.prepareStatement("insert into transaction values(?,?,?,?)");
  r.setInt(1,sender);
  r.setInt(2,receiver);
  r.setInt(3,amount);
  r.setString(4,date);
  r.executeUpdate();
     %>
       <script>
    alert("... Transaction in progress ....");
</script>
      <h1 style="text-align:center; color:green" > Transaction Successful </h1><br>
    <% } 
    else{
    %> 
    <script>
    alert("Insufficient Balance ");
</script>
     <h1 style="text-align: center; color: red;" color:red> Transaction Failed </h1><br>
    <% 
       } %>
</body>
</html>    