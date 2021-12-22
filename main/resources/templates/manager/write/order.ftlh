<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Клиенты</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<a href="/manager" class="btn btn-success">Главная страница</a>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Клиент</th>
            <th scope="col">Цена</th>
            <th scope="col">Количество</th>
            <th scope="col">Дата</th>
            <th scope="col">Книги</th>
            <th scope="col">Удалить</th>
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
                <td>
                    <button class="btn btn-danger delete-button" id=${manuscript.getCode_man()}>Удалить</button>
                </td>
            </tr>
        </#list>

        </tbody>
    </table>

    <form action="/manager/order" method="post">
        <input required type="number" name="cost" placeholder="Цена">
        <input required type="number" name="count" placeholder="Количество">
        <input required type="date" name="date" placeholder="Дата">

        <div style="display: flex">
            <p>Клиент: </p>
            <select name="client">
                <#list clients as client>
                    <option value="${client.getName_client()}">${client.getName_client()}</option>
                </#list>
            </select>
        </div>

        <div style="display: flex">
            <p>Книга: </p>
                <#list books as book>
                    <input type="checkbox" name="book[]" value="${book.getName_book()}">${book.getName_book()}</input>
                </#list>
        </div>

        <button type="submit">Добавить</button>
    </form>
</div>

</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/order/' + parseInt(this.id, 10),         /* Куда пойдет запрос */
                method: 'DELETE',             /* Метод передачи (post или get) */
                contentType: "application/json",       /* Тип данных в ответе (xml, json, script, html). *//* Параметры передаваемые в запросе. */
                success: function(data){   /* функция которая будет выполнена после успешного запроса.  */
                    reload()
                }
            });
        });
    });
</script>
<style>
    .container {
        display: flex;
        flex-direction: row;
    }

    form {
        display: flex;
        flex-direction: column;
    }
</style>

</html>