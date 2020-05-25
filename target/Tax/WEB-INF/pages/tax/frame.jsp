<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>

    <%@include file="/common/header.jsp" %>
    <title>国税协同办公平台-纳税服务</title>
    <link href="/css/nsfw/css.css" rel="stylesheet" type="text/css" />
    <link href="/css/nsfw/style.css" rel="stylesheet" type="text/css" />
</head>
<frameset cols="*,1222,*" class="bj" frameborder="no" border="0" framespacing="0">
    <frame src="../common/bg.jsp" scrolling="No" noresize="noresize"/>
    <frameset rows="156,*" cols="*" frameborder="no" border="0" framespacing="0">
        <frame src="/taxService/top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
        <frameset cols="14%,60%" frameborder="no" border="0" framespacing="0">
            <frame src="/taxService/left" scrolling="yes" noresize="noresize" id="leftFrame" />
            <frame src="../common/welcome.jsp" name="mainFrame" id="mainFrame" />
        </frameset>
    </frameset>
    <frame src="../common/bg.jsp" scrolling="No" noresize="noresize"/>
</frameset>
<body>
<br>
</body>
</html>