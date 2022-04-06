<!DOCTYPE html>
<head>
    <style>
        .mid
        {
            text-align:center;
        }
    </style>
</head>
<body>
    <div class = "mid">
        <h2> TRANSACTION FORM </h2>
        <form action="transactionprocess.jsp" method="post">
            Enter your Account No : <input type="number" name = "sender"><br>
            Enter recepient Account No : <input type="number" name = "receiver"><br>
            Enter the amount : <input type="number" name="balance"><br>
            <input type = "submit">
        </form>
    </div>
</body>
</html>