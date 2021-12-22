<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Manuscript</title>
</head>
<body>
<a href="/consultant" class="btn btn-success">Главная страница</a>
<table class="table">
    <thead>
    <tr>
        <th scope="col">id</th>
        <th scope="col">Название рукописи</th>
        <th scope="col">Жанр</th>
        <th scope="col">Кол-во символов</th>
        <th scope="col">Текст</th>
        <th scope="col">Статус</th>
    </tr>
    </thead>

    <tbody>

    <#list manuscripts as manuscript>
        <tr>
            <th scope="row">${manuscript.getCode_man()}</th>
            <td>${manuscript.getName_man()}</td>
            <td>${manuscript.getGenre()}</td>
            <td>${manuscript.getCount_characters()}</td>
            <td>${manuscript.getStatus()}</td>
        </tr>
    </#list>

    </tbody>
</table>
</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</html>