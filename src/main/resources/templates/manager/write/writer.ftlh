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
<a style="margin: 5px" href="/manager" class="btn btn-success">Главная страница</a>
<div class="container">

    <div style="display: flex; flex-direction: column">
        <div>
            <input style="width: 100%" type="text" id="myInput" onkeyup="myFunction()" placeholder="Поиск № паспорта..">
        </div>

        <div>
            <table class="table table-bordered" id="myTable">
                <thead>
                <tr>
                    <th onclick="sortTable_2()" scope="col">№ паспорта</th>
                    <th onclick="sortTable(1)" scope="col">Фио</th>
                    <th onclick="sortTable(2)" scope="col">Адрес</th>
                    <th scope="col">Почта</th>
                    <th scope="col">Телефон</th>
                    <th scope="col">Удалить</th>
                </tr>
                </thead>

                <tbody>

                <#list writers as writer>
                    <tr>
                        <td scope="row">${writer.getNo_passport()?string.computer}</td>
                        <td>${writer.getFIO()}</td>
                        <td>${writer.getAddress()}</td>
                        <td>${writer.getEmail()}</td>
                        <td>${writer.getPhone()}</td>
                        <td>
                            <button class="btn btn-danger delete-button" id=${writer.getNo_passport()?string.computer}>Удалить</button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>

<div style = "margin: 8px">
    <form action="/manager/writer" method="post">
    <input type="number" min = "0" name="id" placeholder="№ паспорта" required>
    <input type="text" name="fio" placeholder="ФИО" required>
    <input type="text" name="address" placeholder="Адрес" required>
    <input type="email" name="email" placeholder="email" required>
    <input type="tel" pattern="^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$" name="phone" placeholder="Телефон" required>
    <button class="btn btn-primary" type="submit">Добавить</button>
</form></div>


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
        function sortTable_2() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("myTable");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (Number(x.innerHTML) > Number(y.innerHTML)) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
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