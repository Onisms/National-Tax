<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp" %>
    <title>角色管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="/role/update" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs">
                    <div><b></b><strong>角色管理</strong>&nbsp;-&nbsp;编辑角色</div>
                    <input type="hidden" name="id" value="${ role.id }"/>
                </div>
                <div class="tableH2">编辑角色</div>
                <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0"
                       cellspacing="0">
                    <tr>
                        <td class="tdBg" width="200px">角色名称：</td>
                        <td><input name="name" value="${ role.name }"/></td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">角色权限：</td>
                        <td>
                            <c:forEach items="${ privilegeList }" var="privilege">
                                <input name="privilegeIds" type="checkbox" value="${ privilege.id }" />${ privilege.name }
                            </c:forEach>
                            <input id="pids" type="hidden" value="${pids}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdBg" width="200px">状态：</td>
                        <td>
                            <input name="state" type="radio" value="有效" checked/>有效
                            <input name="state" type="radio" value="无效"/>无效
                        </td>
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
<script type="text/javascript">

    //当页面加载完成的时候，自动调用该方法
    window.onload= function () {
        $("input[value='${role.state}']").attr("checked","checked");
        //获得所要回显的值，此处为：1,2,3,4,5,6,
        var checkeds = $("#pids").val();
        //拆分为字符串数组
        var checkArray = checkeds.split(",");//[1,2,3,4,5,6]
        //获得所有的复选框对象
        var checkBoxAll = $("input[name='privilegeIds']");
        //获得所有复选框的value值，然后，用checkArray中的值和他们比较，如果有，则说明该复选框被选中
        for (var i = 0; i < checkArray.length; i++) {
            //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
            $.each(checkBoxAll, function (j, checkbox) {
                //获取复选框的value属性
                var checkValue = $(checkbox).val();
                if (checkArray[i] == checkValue) {
                    $(checkbox).attr("checked", true);
                }
            });
        }
    }
</script>
</body>
</html>