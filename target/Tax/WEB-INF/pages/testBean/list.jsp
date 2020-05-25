<%--
  Created by IntelliJ IDEA.
  User: ThrStones
  Date: 2020/5/15
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3><a href="insertPage">跳转新增页面</a></h3>
<h1>list</h1>
<c:forEach items="${mapPage.records}" var="testBean">
    ${ testBean.name }--<a href="delete/${ testBean.id }">删除</a>--<a href="updatePage?id=${ testBean.id }">修改</a><br/>
</c:forEach>
<c:if test="${mapPage.hasPrevious()}">
    <a href="list?current=${mapPage.current-1}">上一页</a>
</c:if>
<c:if test="${mapPage.hasNext()}">
    <a href="list?current=${mapPage.current+1}">下一页</a>
</c:if>
共${mapPage.pages}页;共${mapPage.total}条
</body>
</html>
