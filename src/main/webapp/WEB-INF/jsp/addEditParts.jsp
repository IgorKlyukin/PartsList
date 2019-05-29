<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        <c:if test="${parts.id == 0}"> Добавление пользователя</c:if>
        <c:if test="${parts.id != 0}"> Редактирование пользователя </c:if>
    </title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #20a088;
            margin-left: 25px;
        }
        .tg td {
            font-family: "Times New Roman", sans-serif;
            font-size: 15px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
        }
        .tg th {
            font-family: "Times New Roman", sans-serif;
            font-size: 15px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
        }
        h3{
            color: #085a4b;
        }
        a{
            color: #328072;
        }
    </style>
</head>
<body>
<h3>
    <c:if test="${parts.id == 0}"> Добавление пользователя</c:if>
    <c:if test="${parts.id != 0}"> Редактирование пользователя </c:if>
</h3>
<form:form method="POST" commandName="parts" action="/addParts">
    <form:hidden path="id"/>
    <table>
        <tr>
            <td>Наименование</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Необходимость</td>
            <td><form:checkbox path="need"/></td>
        </tr>
        <tr>
            <td>Количество</td>
            <td><form:input path="count"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Сохранить"/></td>
        </tr>
    </table>
</form:form>
</body>
</html>
