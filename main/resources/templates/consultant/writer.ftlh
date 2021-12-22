<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Client</title>
</head>
<body>
<a href="/consultant" class="btn btn-success">Главная страница</a>
<table class="table">
    <thead>
    <tr>
            <th scope="col">№ паспорта</th>
            <th scope="col">Адрес</th>
            <th scope="col">Почта</th>
            <th scope="col">Фио</th>
            <th scope="col">Телефон</th>
    </tr>
    </thead>

    <tbody>
        <#list writers as writer>
        <tr>
            <th scope="row">${writer.getNo_passport()}</th>
            <td>${writer.getFIO()}</td>
            <td>${writer.getAddress()}</td>
            <td>${writer.getEmail()}</td>
            <td>${writer.getPhone()}</td>
        </tr>
        </#list>

    </tbody>
</table>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</html>