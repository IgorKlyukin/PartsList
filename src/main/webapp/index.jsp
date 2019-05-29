<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Проект на стажировку</h1>
<h2>Автор проекта, Клюкин Игорь Андреевич</h2>
<p>Click below button to direct the begin</p>
<form:form method = "GET" action = "/parts">
    <table>
        <tr>
            <td>
                <input type = "submit" value = "Parts"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
