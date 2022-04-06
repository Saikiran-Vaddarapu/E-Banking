<%@ page import="java.sql.*"%>
<html>
<head>
<title> Transaction History </title>
<meta name="viewport" content= "width=device-width, initial-scale=1.0">
<style>
table.center {
    margin-left: auto; 
    margin-right: auto;
  }
  table{
      width: 700px;
  }
  td {
      padding: 10px;
      color:crimson;
      background-color: beige;
      font-size:medium;
  }
  th{
      padding: 10px;
      color:indigo;
      background-color: deepskyblue;
  }
</style>
</head>
<body bgcolor="BurlyWood">
<h1 style="text-align:center"> Transaction History </h1>
<%
  String user = "root"; 
  Connection con=null;
  PreparedStatement r =null;
  Statement st=null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/first",user,"root"); %>
    <%  st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from transaction order by time desc ");
 %>
 <table border="4px solid black" class="center">
    <tr>
        <th> Sender A/C </th>
        <th> Receiver A/C </th>
        <th> Amount </th>
        <th> Date & Time </th>
    </tr>
<%  while(rs.next()){ %>
<tr>
           <td><%= rs.getInt(1) %></td>
           <td><%= rs.getInt(2) %></td>
           <td><%=  rs.getInt(3) %></td>
           <td><%=  rs.getString(4) %></td>
       </tr>
  <% }  %>   
</table>
</body>
</html>