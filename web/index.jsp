<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Main Page</title>
    </head>
<!--  -->
    <body>
        <h1>Сетевая школа</h1>
        <a href="index.jsp">Главная страница</a><br>
        <p>${info}</p>
        <p>Вошедший пользователь: ${user.login}</p>
        <br>
        <h2>Для всех:</h2>
        <a href="showLogin">Войти</a><br>
        <a href="logout">Выйти</a><br>
        <a href="newPerson">Регистрация нового пользователя</a><br>
        <br>
        <h2>Для вошедших пользователей:</h2>
        <h3>Для всех пользователей:</h3>
        <a href="listSubjects">Список предметов</a><br>
        <h3>Для учителей:</h3>
        <b><i>(поле status в таблице User имеет значение "teacher")</i></b><br>
        <a href="addRecord">Поставить оценку ученику</a><br>
        <a href="recPerson">Оценки ученика</a><br>
        <a href="recSubject">Оценки по предмету</a><br>
        <br>
        <h2>Для администратора:</h2>
        <b><i>(администратор должен иметь логин "admin", а поле status в таблице User должно иметь значение "administrator")</i></b><br>
        <a href="newSubject">Добавить новый предмет</a><br>
        <a href="newGrade">Добавить новую оценку</a><br>
        <a href="listPersons">Список персон</a><br>
        <a href="listGrades">Список оценок</a><br>
    </body>
</html>
