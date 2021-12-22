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
            <th scope="col">Id</th>
            <th scope="col">Клиент</th>
            <th scope="col">Цена</th>
            <th scope="col">Количество</th>
            <th scope="col">Дата</th>
            <th scope="col">Книги</th>
    </tr>
    </thead>

    <tbody>

        <#list orders as order>
        <tr>
                <th scope="row">${order.getNo_order()}</th>
                <td>${order.getName_client().getName_client()}</td>
                <td>${order.getCost()?string.computer}</td>
                <td>${order.getCount()?string.computer}</td>
                <td>${order.getDate()}</td>
                <td>${order.stringBookList()}</td>
        </tr>
        </#list>

    </tbody>
</table>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</html>