<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>信息发布管理</title>

    <script>
    	
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="/info/insert" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;新增信息</div></div>
    <div class="tableH2">新增信息</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">信息分类：</td>
            <td>
                <select name="categoryId">
                    <c:forEach items="${ categoryList }" var="category">
                        <option value="${ category.id }">${ category.name }</option>
                    </c:forEach>
                </select>
            </td>
            <td class="tdBg" width="200px">来源：</td>
            <td><input name="refer"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息标题：</td>
            <td colspan="3"><input name="name" /></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息内容：</td>
            <td colspan="3"><textarea id="editor" name="content"  cols="90" rows="3" ></textarea></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td colspan="3"><textarea name="remark" cols="90" rows="3"></textarea></td>
        </tr>
<%--        <tr>
            <td class="tdBg" width="200px">创建人：</td>
            <td>
                <input name="info.title" cssStyle="width:90%"/>
            </td>
            <td class="tdBg" width="200px">创建时间：</td>
            <td>
                <input name="info.title" cssStyle="width:90%"/>
            </td>
        </tr>--%>
    </table>
    
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>