<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<head>
<style>
        .navbar a
        {
            display: inline-block;
            padding: 10px;
            font-style: normal;
            font-size: 40px;
            color: teal;
        }
        .intro
        {
            margin-left: 50px;
            margin-right: 50px;
        }
        .intro h1
        {
            color: indigo;
        }
        footer
        {
            margin-top: 20px;
            margin-left: 50px;
            margin-right: 50px;
            background-color:darkgreen;
            color: aliceblue;
            text-align: center;
            padding: 20px;
        }
        table{
      width: 400px;
        }
        td {
      padding: 20px;
      color:maroon;
      background-color: beige;
      font-size:medium;
           }
</style>
</head>
<body>
    <div class="navbar">
    <nav>
        <a href = ""> Home </a>
        <a href = ""> About Us</a>
        <a href = "#cust_care"> Customer Care </a>
        <a href = "#MyAccount"> My Account </a>
    </nav>
    </div>
    <img src = "https://www.paisabazaar.com/wp-content/uploads/2019/01/Electronic-Banking.jpg"
     width="80%" height = "430px"/>
     <hr>
    <marquee> Important Announcement to Stakeholders </marquee>
    <div class="intro">
    <h1> WELCOME </h1>
    <h3> Banking consists of many activities that can be done through a number of financial institutions that accept deposits from individuals and other entities, and then use this money to offer loans and to invest and earn profit.
    Banks can be placed into certain categories based on the type of 
    business they conduct. Commercial banks provide services to private individuals and businesses. Retail banking provides credit, deposit, and 
    money management to individuals and families. </h3>
    ---------------------------------------------------------------------
    <h1 id="MyAccount"> MY ACCOUNT DETAILS </h1>
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/first","root","root");
    String res = request.getParameter("nam");
    int accountNumber = 0;
    PreparedStatement p=con.prepareStatement("select ACCOUNTNO from login where name = ?");
    p.setString(1,res);
    ResultSet r=p.executeQuery();
    if(r.next())
    accountNumber = r.getInt(1);
    %>
    <h3>
        <table border="1px solid black">
            <tr>
        <td> Name </td> <td> <%= res %> </td> </tr>
        <tr><td> Account No </td> <td> <%= accountNumber %> </td></tr>
        <tr><td> Account Type </td><td> Savings </td></tr>
        <tr><td>    Status    </td> <td> Active </td></tr>
        </table>
    </h3>

    <h3> OPERATIONS : <a href = "balance.jsp"> View Balance </a> &nbsp; <a href = "transactform.jsp"> Transact </a>
    &nbsp; <a href = "transhistform.jsp"> Transaction History </a>  </h3>
    ----------------------------------------------------------------------
     <h1 id = "cust_care"> CUSTOMER CARE </h1>
     <h3>
        All-India Toll Free number : 1800 22 22 44 / 1800 208 2244 <br>
        Charged Numbers               : 080-61817110   <br>
        Dedicated number for NRI : +918061817110     <br>
        <a href = "mailto:vaddarapusaikiran@gmail.com"> Register your Complaints</a>
     </h3>
     </div>
     <footer>
         CopyRight @All Rights Reserved <br>
          Bank of India <br>
          Contact Us
     </footer>
</body>
</html>

<!--
-->