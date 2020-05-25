<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp" %>
    <title>角色管理</title>
    <script type="text/javascript">

        //全选、全反选
        function doSelectAll() {
            // jquery 1.6 前
            //$("input[name=ids]").attr("checked", $("#selAll").is(":checked"));
            //prop jquery 1.6+建议使用
            $("input[name=ids]").prop("checked", $("#selAll").is(":checked"));
        }

        //模糊查询
        function doSearch() {
            $("#form1").attr("action", "/role/list");
            $("#form1").attr("method", "GET");
            $("#form1").submit();
        }

        //新增
        function insertPage() {
            $("#form1").attr("action", "/role/insertPage");
            $("#form1").attr("method", "GET");
            $("#form1").submit();
        }

        //编辑
        function updatePage(id) {
            $("#form1").attr("action", "/role/updatePage?id=" + id);
            $("#form1").submit();
        }

        //删除
        function doDelete(id) {
            if (confirm("确定要删除该条数据吗？")) {
                $("#form1").attr("action", "/role/delete?id=" + id);
                $("#form1").submit();
            }
        }

        //批量删除
        function doDeleteAll() {
            var r=document.getElementsByName("ids");
            var flag=false;
            var num=0;
            for(var i=0;i<r.length;i++){
                if(r[i].checked){
                    flag=true;
                    num++;
                }
            }
            if(!flag){
                alert("请至少选择一条数据删除！！！");
            }else{
                if (confirm("确定要删除吗？")) {
                    $("#form1").attr("action", "/role/deleteBatch");
                    $("#form1").submit();
                }
            }
        }
    </script>
</head>
<body class="rightBody">
<form name="form1" id="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs">
                    <div><b></b><strong>角色管理 </strong></div>
                </div>
                <div class="search_art">
                    <li>
                        <input name="current" type="hidden" value="1"/>
                        角色名称：<input name="name" id="name"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="insertPage()"/>&nbsp;
                        <input type="button" value="批量删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center">
                                <input type="checkbox" id="selAll" onclick="doSelectAll()"/>
                            </td>
                            <td width="120" align="center">角色名称</td>
                            <td align="center">权限</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                        <c:forEach items="${mapPage.records}" var="record">
                            <tr>
                                <td align="center">
                                    <input type="checkbox" name="ids" value="${ record.id }"/></td>
                                <td align="center">${ record.name }</td>
                                <td align="center">
                                    <c:forEach items="${record.privilegeList}" var="privilege">
                                        ${ privilege.name };
                                    </c:forEach>
                                </td>
                                <td align="center">${ record.state }</td>
                                <td align="center">
                                    <a href="javascript:updatePage(${ record.id })">编辑</a>
                                    <a href="javascript:doDelete(${ record.id })">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="c_pate" style="margin-top: 5px;">
                <table width="100%" class="pageDown" border="0" cellspacing="0"
                       cellpadding="0">
                    <tr>
                        <td align="right">
                            当前第 ${mapPage.current} 页，总共${mapPage.total}条记录，共 ${mapPage.pages} 页 &nbsp;&nbsp;
                            <c:if test="${mapPage.hasPrevious()}">
                                <a href="list?current=${mapPage.current-1}">上一页</a>
                            </c:if>
                            <c:if test="${mapPage.hasNext()}">
                                <a href="list?current=${mapPage.current+1}">下一页</a>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</form>

</body>
</html>