<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>信息发布管理</title>
    <script type="text/javascript">

        //全选、全反选
        function doSelectAll() {
            $("input[name=ids]").prop("checked", $("#selAll").is(":checked"));
        }

        function doSearch() {
            $("#form1").attr("action","/info/list");
            $("#form1").attr("method","GET");
            $("#form1").submit();
        }

        function insertPage() {
            $("#form1").attr("action","/info/insertPage");
            $("#form1").attr("method","GET");
            $("#form1").submit();
        }

        function updateState(id) {
            $("#form1").attr("action","/info/updateState?id="+id);
            $("#form1").submit();
        }

        function updatePage(id) {
            $("#form1").attr("action","/info/updatePage?id="+id);
            $("#form1").submit();
        }

        //删除
        function doDelete(id){
            if (confirm("确定要删除吗？")) {
                $("#form1").attr("action","/info/delete?id=" + id);
                $("#form1").submit();
            }
        }

        //批量删除
        function doDeleteAll(){
            if (confirm("确定要删除吗？")) {
                $("#form1").attr("action", "/info/deleteBatch");
                $("#form1").submit();
            }
        }
        
    </script>
</head>
<body class="rightBody">
<form id="form1" name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong></div> </div>
                <div class="search_art">
                    <li>
                        <input name="current" type="hidden" value="1"/>
                        信息标题：<input name="name" id="infoTitle" />
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="insertPage()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td align="center">信息标题</td>
                            <td width="120" align="center">信息分类</td>
                            <td width="120" align="center">创建人</td>
                            <td width="140" align="center">创建时间</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                        <c:forEach items="${ mapPage.records }" var="record">
                            <tr>
                                <td align="center"><input type="checkbox" name="ids" value="${ record.id }"/></td>
                                <td align="center">${ record.name }</td>
                                <td align="center">${ record.categoryName }</td>
                                <td align="center">${ record.accountName }</td>
                                <td align="center"><fmt:formatDate value="${ record.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td align="center">${ record.state }</td>
                                <td align="center">
                                	<span >
                                		<a href="javascript:updateState(${ record.id })">
                                            <c:if test="${ record.state eq '停用' }">启用</c:if>
                                            <c:if test="${ record.state=='启用' }">停用</c:if>
                                        </a>
                                	</span>
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
                        总共${mapPage.total}条记录，当前第 ${mapPage.current} 页，共 ${mapPage.pages} 页 &nbsp;&nbsp;
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