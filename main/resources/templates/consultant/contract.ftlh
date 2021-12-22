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
        <th scope="col">№ Контракта</th>
        <th scope="col">Книга</th>
        <th scope="col">Дата начала</th>
        <th scope="col">Длительность</th>
        <th scope="col">Расторжение</th>
        <th scope="col">Дата расторжения</th>
    </tr>
    </thead>

    <tbody>

        <#list contracts as contract>
        <tr>
            <th scope="row">${contract.getNo_contract()}</th>
            <td>${contract.getCode_book().getName_book()}</td>
            <td>${contract.getStart_date()}</td>
            <td>${contract.getDuration()}</td>
            <td>${contract.getDissolve()}</td>
            <td>${contract.getDissolve_date()}</td>
        </tr>
        </#list>

    </tbody>
</table>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</html>