<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <title>Login</title>
</head>

<body>
    <div class="main">
    <div class="form">
        <h2>Welcome back! Login</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password">
            </div>
            <div class="btns">
                <input type="submit" name="submit" id="submit">
                <a href="./signup.jsp">Signup</a>
            </div>
            
        </form>
    </div>
</div>
</body>

</html>