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
<a href="/" class="btn btn-danger">Выход</a>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">First</th>
        <th scope="col">Last</th>
        <th scope="col">Handle</th>
        <th scope="col">Handle</th>
        <th scope="col">Handle</th>
        <th scope="col">Handle</th>
    </tr>
    </thead>

    <tbody>

        <#list manuscripts as manuscript>
        <tr>
            <th scope="row">${manuscript.getCode_man()?string.computer}</th>
            <td>${manuscript.getName_man()}</td>
            <td>${manuscript.getText()}</td>
            <td>${manuscript.getGenre()}</td>
            <td>${manuscript.getCount_characters()}</td>
            <td>${manuscript.getStatus()}</td>
            <td><a href="/redactor/edit/${manuscript.getCode_man()?string.computer}">Изменить</a></td>
        </tr>
        </#list>
    </tbody>
</table>



</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</html>