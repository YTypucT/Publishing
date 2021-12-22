<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Книги</title>
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
            <th scope="col">Код книги</th>
            <th scope="col">Код рукописи</th>
            <th scope="col">Название книги</th>
            <th scope="col">Обложка</th>
            <th scope="col">Цвет книги</th>
            <th scope="col">Стартовая цена</th>
            <th scope="col">Цена</th>
            <th scope="col">Количество</th>
            <th scope="col">Год издания</th>
            <th scope="col">Удалить</th>

        </tr>
        </thead>

        <tbody>

        <#list books as book>
            <tr>
                <th scope="row">${book.getCode_book()?string.computer}</th>
                <td>${book.getCode_Man().getName_man()}</td>
                <td>${book.getName_book()}</td>
                <td>${book.getCover()}</td>
                <td>${book.getColor_print()}</td>
                <td>${book.getStart_price()?string.computer}</td>
                <td>${book.getPrice()?string.computer}</td>
                <td>${book.getCount()?string.computer}</td>
                <td>${book.getYear_of_public()?string.computer}</td>
                <td>
                    <button class="btn btn-danger delete-button" id=${manuscript.getCode_man()}>Удалить</button>
                </td>
            </tr>
        </#list>

        </tbody>
    </table>


    <div>
        <form action="/manager/book" method="post">
            <input type="text" name="name" placeholder="Название книги" required>

            <div style="display: flex">
                <p>Обложка: </p>
                <select required name="cover" style="width: 100%">
                    <option value="Мягкая">Мягкая</option>
                    <option value="Твердая">Твердая</option>
                </select>
            </div>


            <div style="display: flex">
                <p>Цветная печать: </p>
                <select required name="color" style="width: 100%">
                    <option value="Да">Да</option>
                    <option value="Нет">Нет</option>
                </select>
            </div>

            <input required type="number" name="start_price" placeholder="Стартовая цена">
            <input required type="number" name="price" placeholder="Цена">
            <input required type="number" name="count" placeholder="Количество">
            <input required type="number" name="year" placeholder="Год издания">

            <select required name="man" id="">
                <#list manus as man>
                    <option value="${man.getCode_man()?string.computer}">${man.getName_man()}</option>
                </#list>
            </select>

            <button class="btn btn-primary" type="submit">Добавить</button>
        </form>
    </div>

</div>

</body>

<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/book/' + parseInt(this.id, 10),         /* Куда пойдет запрос */
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