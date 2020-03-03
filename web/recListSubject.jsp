<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <h1>Список оценок по предмету</h1>
        <a href="index.jsp">Главная страница</a><br>
        <p>${info}</p>
        <p>Вошедший пользователь: ${user.login}</p>
        <ul>
            <c:forEach var="history" items="${listHistories}">
                <li>
                   По предмету ${history.subject.name} поставлено ${history.grade.name} ученику ${history.person.name}.
                </li>
            </c:forEach>
        </ul>

