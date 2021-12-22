<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Контракты</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<a href="/consultant" class="btn btn-success">Главная страница</a>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">№ Контракта</th>
            <th scope="col">Книга</th>
            <th scope="col">Дата начала</th>
            <th scope="col">Длительность</th>
            <th scope="col">Расторжение</th>
            <th scope="col">Дата расторжения</th>
            <th scope="col">Удалить</th>
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
            <td>
                <button class="btn btn-danger delete-button" id=${manuscript.getCode_man()}>Удалить</button>
            </td>
        </tr>
        </#list>

        </tbody>
    </table>
    <div>
        <form action="/manager/contract" method="post">
            <input required type="text" name="№" placeholder="№ контракта">
            <select name="book">
                <#list clients as client>
                <option value="${book.getName_book()}">${book.getName_book()}</option>
            </#list>
            </select>
            <input required type="date" name="date" placeholder="Дата начала">
            <input required type="number" name="duration" placeholder="Длительность">
            <div style="display: flex">
                <p>Расторжение: </p>
                <select required name="status">
                    <option value="Да">Да</option>
                    <option value="Нет">Нет</option>
                </select>
            </div>
            <input required type="date" name="date_dis" placeholder="Дата расторжения">
            <button type="submit">Добавить</button>
        </form>
    </div>
</div>
</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/contract/' + parseInt(this.id, 10),         /* Куда пойдет запрос */
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