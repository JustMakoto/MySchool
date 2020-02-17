<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My School</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" crossorigin="anonymous">
    </head>
<!--  -->
    <body>
        <h1>Сетевая школа</h1>
        <a href="index.jsp">Главная страница</a><br>
        <p>${info}</p>
        <p>Вошедший пользователь: ${user.login}</p>
        <br>
        <h2>Для гостей:</h2>
        <a href="newPerson">Регистрация нового пользователя</a><br>
        <c:if test="${userRole eq null}">
        <a href="showLogin">Войти</a><br>
        </c:if>        
        <br>
        <h2>Для вошедших пользователей:</h2>
        <h3>Для всех пользователей:</h3>
        <a href="listSubjects">Список предметов</a><br>
        <c:if test="${userRole ne null}">
        <a href="logout">Выйти</a><br>
        </c:if>
        <h3>Для учителей:</h3>
        <a href="addRecord">Поставить оценку ученику</a><br>
        <a href="recPerson">Оценки ученика</a><br>
        <a href="recSubject">Оценки по предмету</a><br>
        <br>
        <h2>Для администратора:</h2>
        <a href="newSubject">Добавить новый предмет</a><br>
        <a href="newGrade">Добавить новую оценку</a><br>
        <a href="listPersons">Список персон</a><br>
        <a href="listGrades">Список оценок</a><br>
    </body>
</html>
