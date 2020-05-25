<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <%@include file="/common/header.jsp" %>
    <title>用户管理</title>

</head>
<body class="rightBody">
<form id="form" name="form" action="/account/update" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs">
                    <div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;修改用户</div>
                </div>
                <div class="tableH2">修改用户</div>
                <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0"
                       cellspacing="0">
                    <input type="hidden" name="id" value="${ account.id }"/>
                    <tr>
                        <td class="tdBg" width="200px">所属部门：</td>
                        <td>
                            <select name="deptId">
                                <c:forEach var="dept" items="${deptList}">
                                    <option value="${dept.id}">${dept.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">头像：</td>
                        <td>
                            <c:if test="${account.headImg==null}">
                                没有上传图片
                            </c:if>
                            <c:if test="${account.headImg!=null}">
                                <img src="/upload/${account.headImg}" width="20%">
                            </c:if>
                            <input type="file" name="headImg"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">用户名：</td>
                        <td><input name="name" value="${ account.name }"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">密码：</td>
                        <td><input name="password" value="${ account.password }"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">性别：</td>
                        <td>
                            <input name="gender" type="radio" value="1" <c:if test="${ account.gender == 1 }">checked</c:if>/>男
                            <input name="gender" type="radio" value="0" <c:if test="${ account.gender == 0 }">checked</c:if>/>女
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">角色：</td>
                        <td>
                            <select name="roleId">
                                <c:forEach var="role" items="${roleList}">
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">电子邮箱：</td>
                        <td><input name="email" value="${ account.email }"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">手机号：</td>
                        <td><input name="mobile" value="${ account.mobile }"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">生日：</td>
                        <td><%--<input id="birthday" name="birthday"  value="${ account.birthday }"/>--%>
                            <input id="birthday" name="birthday" readonly="true"
                                   value="<fmt:formatDate value='${ account.birthday }' pattern='yyyy-MM-dd' />"
                                   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">状态：</td>
                        <td>
                            <input name="state" type="radio" value="正常" <c:if test="${ account.state eq '正常' }">checked</c:if>/>正常
                            <input name="state" type="radio" value="冻结" <c:if test="${ account.state eq '冻结' }">checked</c:if>/>冻结
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">备注：</td>
                        <td><textarea name="remark" cols="75" rows="3">${account.remark}</textarea></td>
                    </tr>
                </table>
                <div class="tc mt20">
                    <input type="submit" class="btnB2" value="修改"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="javascript:history.go(-1)" class="btnB2" value="返回"/>
                </div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    window.onload= function () {
        $("[name='deptId']").find("option[value='${account.deptId}']").attr("selected","selected");
        $("[name='roleId']").find("option[value='${account.roleId}']").attr("selected","selected");
    }
</script>
</body>
</html>