<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Писатели</title>
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
            <th scope="col">№ паспорта</th>
            <th scope="col">Адрес</th>
            <th scope="col">Почта</th>
            <th scope="col">Фио</th>
            <th scope="col">Телефон</th>
            <th scope="col">Удалить</th>
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
                <td>
                    <button class="btn btn-danger delete-button" id=${manuscript.getCode_man()}>Удалить</button>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <form action="/manager/writer" method="post">
        <input type="number" name="id" placeholder="№ паспорта" required>
        <input type="text" name="fio" placeholder="ФИО" required>
        <input type="text" name="address" placeholder="Адрес" required>
        <input type="email" name="email" placeholder="email" required>
        <input type="tel" pattern="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$" name="phone" placeholder="Телефон" required>
        <button type="submit">Добавить</button>
    </form>

</div>
</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/writer/' + parseInt(this.id, 10),         /* Куда пойдет запрос */
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