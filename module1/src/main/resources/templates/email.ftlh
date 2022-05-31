<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Email using FreeMarker</title>
</head>
<body>
<div style="margin-top: 10px">Greetings, ${authUserEmail}</div>
    <p> Thank you for registering. Please click on the below link to activate your account: </p>
    <blockquote><a href=${authUserLink}>Activate Now</a></blockquote>Link will expire in 15 minutes.
    <p>See you soon</p>
</div>
<br/>
<div> Regards, Felix Phan</div>
</body>
</html>