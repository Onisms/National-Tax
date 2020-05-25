<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp" %>
    <title>用户管理</title>
    <script type="text/javascript">
        var vResult = false;

        //校验帐号唯一
        function doVerify() {
            //1、获取帐号
            var name = $("#name").val();
            if (name != "") {
                //2、校验
                $.ajax({
                    url: "/account/verifyName",
                    data: {"name": name},
                    type: "post",
                    async: false,//非异步
                    success: function (msg) {
                        if ("true"==msg) {
                            //帐号已经存在
                            alert("帐号已经存在。请使用其它帐号！");
                            //定焦
                            $("#name").focus();
                            vResult = false;
                        } else {
                            vResult = true;
                        }
                    }
                });
            }
        }

        //提交表单
        function doSubmit() {
            var name = $("#name");
            if (name.val() == "") {
                alert("用户名不能为空！");
                name.focus();
                return false;
            }
            var password = $("#password");
            if (password.val() == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            }
            //帐号校验
            doVerify();
            if (vResult) {
                //提交表单
                document.forms[0].submit();
            }
        }
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" action="/account/insert" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs">
                    <div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div>
                </div>
                <div class="tableH2">新增用户</div>
                <table id="baseInfo" width="100%" align="center" class="list" border="0"
                       cellpadding="0" cellspacing="0">
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
                            <input type="file" name="headImg"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">用户名：</td>
                        <td><input id="name" name="name" onchange="doVerify()"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">密码：</td>
                        <td><input name="password"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">性别：</td>
                        <td>
                            <input name="gender" type="radio" value="1" checked/>男
                            <input name="gender" type="radio" value="0"/>女
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
                        <td><input name="email"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">手机号：</td>
                        <td><input name="mobile"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">生日：</td>
                        <td>
                            <input id="birthday" name="birthday" readonly="true"
                                   onClick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">状态：</td>
                        <td>
                            <input name="state" type="radio" value="正常" checked/>正常
                            <input name="state" type="radio" value="冻结"/>冻结
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">备注：</td>
                        <td><textarea name="remark" cols="75" rows="3"></textarea></td>
                    </tr>
                </table>
                <div class="tc mt20">
                    <input type="submit" class="btnB2" value="保存"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="javascript:history.go(-1)" class="btnB2" value="返回"/>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>