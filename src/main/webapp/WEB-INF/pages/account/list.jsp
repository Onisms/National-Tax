<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
    <link href="/css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
      	//全选、全反选
		function doSelectAll(){
			// jquery 1.6 前
			//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
			//prop jquery 1.6+建议使用
			$("input[name=ids]").prop("checked", $("#selAll").is(":checked"));
		}

        //模糊查询
        function doSearch() {
            $("#form1").attr("action", "/account/list");
            $("#form1").attr("method", "GET");
            $("#form1").submit();
        }

        //新增
        function insertPage(){
		    $("#form1").attr("action","/account/insertPage");
		    $("#form1").attr("method","GET");
            $("#form1").submit();
        }
        //编辑
        function updatePage(id){
            $("#form1").attr("action","/account/updatePage?id=" + id);
            $("#form1").submit();
        }
        //删除
        function doDelete(id){
            if (confirm("确定要删除吗？")) {
                $("#form1").attr("action","/account/delete?id=" + id);
                $("#form1").submit();
            }
        }
        //批量删除
        function doDeleteAll(){
            if (confirm("确定要删除吗？")) {
                $("#form1").attr("action", "/account/deleteBatch");
                $("#form1").submit();
            }
        }
        //导出用户列表
        function doExportExcel(){
            $("#form1").attr("action","/account/exportExcel");
            $("#form1").submit();
        }
        //导入
        function doImportExcel(){
            $("#form1").attr("action","/account/importExcel");
            $("#form1").submit();
        }
    </script>
</head>
<body class="rightBody">
<form id="form1" name="form1" action="" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>用户管理</strong></div> </div>
                <div class="search_art">
                    <li>
                        <input name="current" type="hidden" value="1"/>
                        用户名：<input name="name" id="userName" />
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="insertPage()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                        <input type="button" value="导出" class="s_button" onclick="doExportExcel()"/>&nbsp;
                    	<input name="accountExcel" type="file"/>
                        <input type="button" value="导入" class="s_button" onclick="doImportExcel()"/>&nbsp;

                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="140" align="center">用户名</td>
                            <td width="140" align="center">头像</td>
                            <td width="140" align="center">角色</td>
                            <td width="160" align="center">所属部门</td>
                            <td width="80" align="center">性别</td>
                            <td align="center">电子邮箱</td>
                            <td width="100" align="center">操作</td>
                        </tr>
                        <c:forEach items="${mapPage.records}" var="record">
                            <tr bgcolor="f8f8f8">
                                <td align="center">
                                    <input type="checkbox" name="ids" value="${ record.id }"/>
                                </td>
                                <td align="center">${ record.name }</td>
                                <td align="center">
                                    <c:if test="${record.headImg==null}">
                                        没有上传图片
                                    </c:if>
                                    <c:if test="${record.headImg!=null}">
                                        <img src="/upload/${record.headImg}" width="20%">
                                    </c:if>
                                </td>
                                <td align="center">${ record.roleName }</td>
                                <td align="center">${ record.deptName }</td>
                                <td align="center">${ record.gender==1?"男":"女" }</td>
                                <td align="center">${ record.email }</td>
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