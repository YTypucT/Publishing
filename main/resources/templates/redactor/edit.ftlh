<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
</head>
<body>
<div>
    <form method="post" action="/redactor/edit">
        <textarea name="text" id="" cols="120" rows="50" >${value}</textarea>
        <input type="hidden" name="id" value="${id}">
        <button type="submit">Внести изменения</button>
    </form>
</div>

</body>
</html>