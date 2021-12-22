<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Редактирование</title>
</head>
<body>
<div>
    <form method="post" action="/redactor/edit">
        <textarea name="text" id="" cols="100" rows="50" >${value}</textarea>
        <input type="hidden" name="id" value="${id}">
        <button style="margin: 8px" type="submit">Внести изменения</button>
    </form>
</div>

</body>
</html>