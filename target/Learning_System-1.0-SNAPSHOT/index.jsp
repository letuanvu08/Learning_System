<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<c:forEach var = "i" begin = "1" end = "5">
Item <c:out value = "${i}"/><p>
    </c:forEach>
<h1><%= "Hello World!" %>
<p> <c:out value="${test}"/> </p>
</h1>
<br/>
sdsafs
</body>
</html>