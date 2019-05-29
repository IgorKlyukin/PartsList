<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Parts</title>
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
        .uu{
            margin-left:25px ;
            text-align: left;
        }
        .h{
            margin-left:25px ;
            text-align: left;
        }
        h1{
            color: #035447;
        }
        h2{
            color: #085a4b;
        }
        a{
            color: #328072;
        }
    </style>
</head>

<body>
<h3>Компьютерные комплектующие</h3>

<form:form commandName="parts" action="/parts" method="GET" cssClass="h">
    <form:select path="empty" items="${sortName}"/>
    <input type="submit" value="Сортировка"/>
</form:form>

<c:url value="/parts" var="search" />
<form:form action="${search}"  method="GET" cssClass="h">
    <input type="text" name="searchName" value="${searchName}" placeholder="слово поиска"/>
    <input type="submit" value="Поиск" />
</form:form>

<a href="<c:url value="/addParts"/>" class="h">Добавить комплектующие</a>
<br/>
    <table class="tg" >
        <thead>
            <tr>
                <th>Наименование</th>
                <th>Необходимость</th>
                <th>Количество</th>
            </tr>
        </thead>
        <c:forEach items="${parts}" var="part">
            <tr>
                <td>${part.name}</td>
                <td>${part.need ? "Да" : "Нет"}</td>
                <td>${part.count}</td>
                <td><a href="<c:url value="/editParts?id=${part.id}"/>">Редактировать</a></td>
                <td><a href="<c:url value="/deleteParts?id=${part.id}"/>">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <table  class="tg" >
        <tr>
            <th>Можно собрать </th>
            <td>${min}</td>
            <th>компьютеров</th>
        </tr>
    </table>
<div id="pagination" class="uu">
    <p >Pagination: </p>

    <c:url value="/parts" var="prev">
        <c:param name="page" value="${page-1}"/>
        <c:param name="searchName" value="${searchName}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/parts" var="url">
                    <c:param name="page" value="${i.index}"/>
                    <c:param name="searchName" value="${searchName}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/parts" var="next">
        <c:param name="page" value="${page + 1}"/>
        <c:param name="searchName" value="${searchName}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>
</body>
</html>
