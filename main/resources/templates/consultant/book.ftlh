<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Book</title>
</head>
<body>
<a href="/consultant" class="btn btn-success">Главная страница</a>
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
    </tr>
    </thead>

    <tbody>
        <#list books as book>
    <tr>
            <th scope="row">${book.getCode_book()}</th>
            <td>${book.getCode_Man().getName_man()}</td>
            <td>${book.getName_book()}</td>
            <td>${book.getCover()}</td>
            <td>${book.getColor_print()}</td>
            <td>${book.getStart_price()}</td>
            <td>${book.getPrice()}</td>
            <td>${book.getCount()}</td>
            <td>${book.getYear_of_public()}</td>
    </tr>
        </#list>

    </tbody>
</table>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</html>