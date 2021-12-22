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
<a style="margin: 5px" href="/manager" class="btn btn-success">Главная страница</a>

<div class="container">

    <div style="display: flex; flex-direction: column">
        <div>
            <input style="width: 100%" type="text" id="myInput" onkeyup="myFunction()" placeholder="Поиск клиента..">
        </div>

        <div>
            <table class="table table-bordered" id="myTable">
                <thead>
                <tr>
                    <th onclick="sortTable(0)" scope="col">Клиент</th>
                    <th onclick="sortTable(1)" scope="col">Адрес</th>
                    <th onclick="sortTable(2)" scope="col">Контактное лицо</th>
                    <th scope="col">Email</th>
                    <th scope="col">Телефон</th>
                    <th scope="col">Удалить</th>
                </tr>
                </thead>

                <tbody>

                <#list clients as client>
                    <tr>
                        <td scope="row">${client.getName_client()}</td>
                        <td>${client.getAddress()}</td>
                        <td>${client.getContact()}</td>
                        <td>${client.getEmail()}</td>
                        <td>${client.getPhone()}</td>
                        <td>
                            <button class="btn btn-danger delete-button" id="${client.getName_client()?no_esc}">Удалить</button>
                        </td>
                    </tr>
                </#list>

                </tbody>
            </table>
        </div>
    </div>


    <div style = "margin: 8px">
        <form action="/manager/client" method="post">
            <input required type="text" name="client" placeholder="Клиент">
            <input required type="text" name="address" placeholder="Адрес">
            <input required type="email" name="email" placeholder="Почта клиента">
            <input required type="text" name="contact" placeholder="ФИО">
            <input required type="tel" pattern="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$" name="phone"
                   placeholder="Номер телефона">
            <button class="btn btn-primary" type="submit">Добавить</button>
        </form>
    </div>

</div>
</body>
<script>
    $( document ).ready(function() {

        $(".delete-button").on("click", function (){
            $.ajax({
                url: '/manager/client/' + this.id,         /* Куда пойдет запрос */
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
    function sortTable(n) {
      var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
      table = document.getElementById("myTable");
      switching = true;
      // Set the sorting direction to ascending:
      dir = "asc";
      /* Make a loop that will continue until
      no switching has been done: */
      while (switching) {
        // Start by saying: no switching is done:
        switching = false;
        rows = table.getElementsByTagName("TR");
        /* Loop through all table rows (except the
        first, which contains table headers): */
        for (i = 1; i < (rows.length - 1); i++) {
          // Start by saying there should be no switching:
          shouldSwitch = false;
          /* Get the two elements you want to compare,
          one from current row and one from the next: */
          x = rows[i].getElementsByTagName("TD")[n];
          y = rows[i + 1].getElementsByTagName("TD")[n];
          /* Check if the two rows should switch place,
          based on the direction, asc or desc: */
          if (dir == "asc") {
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
              // If so, mark as a switch and break the loop:
              shouldSwitch = true;
              break;
            }
          } else if (dir == "desc") {
            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
              // If so, mark as a switch and break the loop:
              shouldSwitch = true;
              break;
            }
          }
        }
        if (shouldSwitch) {
          /* If a switch has been marked, make the switch
          and mark that a switch has been done: */
          rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
          switching = true;
          // Each time a switch is done, increase this count by 1:
          switchcount ++;
        } else {
          /* If no switching has been done AND the direction is "asc",
          set the direction to "desc" and run the while loop again. */
          if (switchcount == 0 && dir == "asc") {
            dir = "desc";
            switching = true;
          }
        }
      }
    }
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
        justify-content: center;
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