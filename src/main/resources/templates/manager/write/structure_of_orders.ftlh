<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Состав заказа</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<a style="margin: 5px" href="/manager/order" class="btn btn-success">Все заказы</a>
<div class="container">
    <div style="display: flex; flex-direction: column">
        <div>
            <input style="width: 100%" type="text" id="myInput" onkeyup="myFunction()" placeholder="Поиск книги..">
        </div>

        <div>
            <table class="table table-bordered" id="myTable">
                <thead>
                <tr>
                    <th scope="col">Книга</th>
                    <th scope="col">Цена</th>
                    <th scope="col">Количество</th>
                    <th scope="col">Удалить</th>

                </tr>
                </thead>

                <tbody>

                <#list order.getStructure_of_orders() as structure_of_order>
                    <tr>
                        <td>${structure_of_order.getBook().getName_book()}</td>
                        <td>${structure_of_order.getBook().getPrice()?string.computer}</td>
                        <td>${structure_of_order.getCount()?string.computer}</td>
                        <td>
                            <button class="btn btn-danger delete-button" id="${order.getNo_order()?string.computer}@${structure_of_order.getBook().getCode_book()?string.computer}">Удалить</button>
                        </td>
                    </tr>
                </#list>

                </tbody>
            </table>
        </div>
    </div>

<div style="margin: 8px">
    <form action="/manager/structure_of_order" method="post">

    <div style="display: flex">
        <p>Книга: </p>
        <select required name="book">
            <#list books as book>
            <option value="${book.getCode_book()?string.computer}">${book.getName_book()}</option>
        </#list>
        </select>
    </div>

<!--    <input required type="number" min = "0" name="cost" placeholder="Цена">-->
    <input required type="number" min="0" name="count" placeholder="Количество">
    <input type="hidden" name="id" value=${order.getNo_order()}>
    <button class="btn btn-primary" type="submit">Добавить</button>
</form></div>


</div>

</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/structure_of_order/' + this.id ,         /* Куда пойдет запрос */
                method: 'DELETE',             /* Метод передачи (post или get) */
                contentType: "application/json",       /* Тип данных в ответе (xml, json, script, html). *//* Параметры передаваемые в запросе. */
                success: function(data){   /* функция которая будет выполнена после успешного запроса.  */
                    window.location.href = window.location.pathname;
                },
                error: function(data){   /* функция которая будет выполнена после успешного запроса.  */
                    window.location.href = window.location.pathname;
                },
            });
        });
    });
    function myFunction() {
        // Объявить переменные
        let input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Перебирайте все строки таблицы и скрывайте тех, кто не соответствует поисковому запросу
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
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

    #myTable {
        border-collapse: collapse; /* Свернуть границы */
        width: 100%; /* Полная ширина */
        border: 1px solid #ddd; /* Добавить серую границу */
        font-size: 18px; /* Увеличить размер шрифта */
    }

    #myTable th, #myTable td {
        text-align: left; /* Выравнивание текста по левому краю */
        padding: 12px; /* Добавить отступ */
    }

    #myTable tr {
        /* Добавить нижнюю границу для всех строк таблицы */
        border-bottom: 1px solid #ddd;
    }

    #myTable tr.header, #myTable tr:hover {
        /* Добавить серый цвет фона для заголовка таблицы и при наведении курсора мыши */
        background-color: #f1f1f1;
    }
</style>

</html>