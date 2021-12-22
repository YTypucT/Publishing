<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Менеджер</title>
</head>
<body style="background: lightblue">
<h1 align="middle" style="margin: 100px">Менеджер</h1>
<div class="wrapper">
    <a class="btn btn-success"  href="/manager/writer">Добавление и удаление писателей</a>
    <a class="btn btn-success" href="/manager/manuscript">Добавление и удаление рукописей</a>
    <a class="btn btn-success"  href="/manager/book">Добавление и удаление книг</a>
    <a class="btn btn-success"  href="/manager/contract">Добавление и удаление договоров</a>
    <a style="margin-top: 40px" class="btn btn-success" href="/manager/client">Добавление и удаление клиентов</a>
    <a class="btn btn-success"  href="/manager/order">Добавление и удаление заказов</a>
    <a style="margin-top: 40px" href="/" class="btn btn-danger">Выход</a>
</div>
</body>

<style>
    .wrapper{
        background: #5A1C6E;
        padding: 10px;
        border: 1px solid black;
        display: flex;
        width: 30%;
        justify-content: center;
        justify-items: center;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
        height: 60vh;
    }
    .wrapper > a{
        margin: 10px;
        width: 100%;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</html>