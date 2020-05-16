<%--
  Created by IntelliJ IDEA.
  User: ThrStones
  Date: 2020/5/15
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>测试回显+修改</h1>
<form action="update" method="post" >
    <input type="hidden" name="id" value="${testBean.id}">
    用户名：<input name="name" value="${testBean.name}"/><br/>
    <input type="submit" value="update"/>
</form>
</body>
</html>
