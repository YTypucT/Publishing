<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Менеджер</title>
</head>
<body>
<div class="wrapper">
    <a href="/" class="btn btn-danger">Выход</a>
    <a class="btn btn-success" href="/manager/manuscript">Рукописи</a>
    <a class="btn btn-success"  href="/manager/book">Книги</a>
    <a class="btn btn-success" href="/manager/client">Клиенты</a>
    <a class="btn btn-success"  href="/manager/order">Заказы</a>
    <a class="btn btn-success"  href="/manager/writer">Писатели</a>
    <a class="btn btn-success"  href="/manager/contract">Контракты</a>
</div>
</body>

<style>
    .wrapper{
        display: flex;
        width: 100%;
        justify-content: center;
        justify-items: center;
    }
    .wrapper > a{
        margin: 10px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</html>