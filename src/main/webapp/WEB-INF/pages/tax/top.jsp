<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<link href="/css/nsfw/css.css" rel="stylesheet" type="text/css" />
	<link href="/css/nsfw/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function openApp(url) {
		window.top.location = url;
	}
	function delCookie() {
		top.document.cookie = "TopNode=;expires=Fri, 31 Dec 1999 23:59:59 GMT;";
	}
</script>
</head>

<body>
	<!-- 头部{ -->
	<table width="1222" border="0" align="center" cellpadding="0" cellspacing="0" background="/images/nsfw/xingzheng.png" class="top">
		<tr>
			<td width="26" height="106">&nbsp;</td>
			<td width="416" height="110" align="left" valign="middle">
				<img class="zxx_test_png" src="/images/home/ind01.png" width="470" height="90" alt="" />
			</td>
			<td width="135">&nbsp;</td>
			<td width="418">
				<object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="86">
					<param name="movie" value="/images/home/flash.swf" />
					<param name="quality" value="high" />
					<param name="wmode" value="transparent" />
					<param name="swfversion" value="6.0.65.0" />
					<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
					<param name="expressinstall" value="Scripts/expressInstall.swf" />
					</object>
					<!--<![endif]-->
				</object>
			</td>
			<td width="300" align="right" valign="top">
				<table width="350" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="17" height="9"></td>
                        <td width="66" height="9"></td>
                        <td width="120" height="5"></td>
                        <td width="17" height="9"></td>
						<td width="36" height="9"></td>
						<td width="17"></td>
						<td width="46"></td>
					</tr>
					<tr>
					    <td align="center"></td>
                        <td align="left"></td>
                        <td align="left"><a><b></b><font color="red">欢迎您，${sessionScope.SYS_USER.name }</font></a></td>
                        <td align="center"><img src="/images/nsfw/help.png" width="12" height="17" /></td>
						<td align="left"><a href="javascript:void(0)">帮助</a></td>
						<td width="17" align="center"><img src="/images/nsfw/exit.png" width="14" height="14"/></td>
						<td align="left" valign="middle"><a href="/sys/login_logout.action" target="_top">退出</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<!-- }头部 -->
	<!-- 导航{ -->
	<div class="banner">
		<div class="menu">
			<ul class="clearfix">
				<li class="hover"><a href="javascript:void(0);">工作主页</a></li>
				<li><a href="javascript:void(0);">行政管理</a></li>
				<li><a href="javascript:void(0);">后勤服务</a></li>
				<li><a href="javascript:void(0);">在线学习</a></li>
				<li><a href="/taxService/frame">纳税服务</a> </li>
				<li><a href="javascript:void(0);">我的空间</a></li>
			</ul>
		</div>
	</div>
	<!-- }导航 -->
</body>
</html>
