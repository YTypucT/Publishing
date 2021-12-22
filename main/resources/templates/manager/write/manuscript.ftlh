<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Рукописи</title>
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
            <th scope="col">id</th>
            <th scope="col">Название рукописи</th>
            <th scope="col">Жанр</th>
            <th scope="col">Кол-во символов</th>
            <th scope="col">Текст</th>
            <th scope="col">Статус</th>
            <th scope="col">Удалить</th>
        </tr>
        </thead>

        <tbody>

        <#list manuscripts as manuscript>
            <tr>
                <th scope="row">${manuscript.getCode_man()}</th>
                <td>${manuscript.getName_man()}</td>
                <td>${manuscript.getGenre()}</td>
                <td>${manuscript.getCount_characters()}</td>
                <td><textarea disabled>${manuscript.getText()}</textarea></td>
                <td>${manuscript.getStatus()}</td>
                <td>
                    <button class="btn btn-danger delete-button" id=${manuscript.getCode_man()}>Удалить</button>
                </td>
            </tr>
        </#list>
        </tr>
        </tbody>
    </table>

    <div>
        <form action="/manager/manuscript" method="post">
            <input required type="text" name="name" placeholder="Название">
            <input required  type="text" name="text" placeholder="Текст">
            <input required type="text" name="genre" placeholder="Жанр">
            <input required type="number" name="count" placeholder="Количество символов">
            <div style="display: flex">
                <p>Статус: </p>
                <select required name="status">
                    <option value="Издана">Издана</option>
                    <option value="Редакция">Редакция</option>
                    <option value="Ожидание">Ожидание</option>
                </select>
            </div>
            <button type="submit">Добавить</button>
        </form>
    </div>
</div>


</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/manuscript/' + parseInt(this.id, 10),         /* Куда пойдет запрос */
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