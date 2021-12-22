<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Издательство</title>
</head>
<body style="background: lightblue">
    <h2 style="margin: 80px" align="center"> Издательство "Салют"</h2>

<div class="wrapper">
    <h3 align = center style="color: white"> Войти как:</h3>
    <a class="btn btn-success" href="/redactor">Редактор</a>
    <a class="btn btn-success"  href="/consultant">Консультант</a>
    <a class="btn btn-success"  href="/manager">Менеджер</a>
</div>
</body>
<style>
    .wrapper{
        background: #5A1C6E;
        padding: 10px;
        border: 1px solid black;
        display: flex;
        width: 20%;
        justify-content: center;
        justify-items: center;
        flex-direction: column;
        align-items: center;
        margin: 0 auto;
        height: 40vh;
    }
    .wrapper > a{
        margin: 10px;
        width: 100%;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</html>