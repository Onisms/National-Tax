<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <link href="/css/login.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function logins() {
            document.forms[0].submit();
        }
        function setClean() {
            document.getElementById("account").value = "";
            document.getElementById("password").value = "";
        }
        //解决子框架嵌套的问题
        if (window != window.parent) {
            window.parent.location.reload(true);
        }
    </script>
    <style type="text/css">
        html {
            overflow-y: hidden;
        }
        .youbian input {
            border: 0px none;
            background-color: transparent;
            color: #555;
            padding-left: 10px;
            font-size: 16px;
            width: 100%;
            overflow: hidden;
        }
    </style>
</head>
<body scroll="no">
<form name="form1" action="login" method="post">
    <div id="lo_tf">
        <div class="outside">
            <div class="head">
                <table width="1000" height="60" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="840" align="left">
                            <img src="/images/login/form_03.png" width="332" height="47"/>
                        </td>
                        <td align="center">&nbsp;&nbsp;<a href="#"></a></td>
                    </tr>
                </table>
            </div>
            <div class="main2">
                <div class="content">
                    <div class="youbian">
                        <table width="251" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="12">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="45" align="left"></td>
                            </tr>
                            <tr>
                                <td height="13">&nbsp;
                                    <span>
                                        <div height=20 valign="middle" style="padding-left: 18px">
                                            <span color="red" id="errMsg">${ errorMsg }</span>
                                        </div>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td height="40">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="32" align="left">
                                                <span style="color:#767676;font-size:14px;">帐&nbsp;号:</span>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td background="/images/login/shuru_03.png" width="">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left">
                                                            <input id="account" name="name" value="admin" size="31"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="10">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="32" align="left"><span style="color:#767676;font-size:14px;">密&nbsp;码:</span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="40">
                                    <table width="100%" height="39" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td background="/images/login/shuru_03.png">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left">
                                                            <input id="password" name="password" type="hidden"
                                                                   value="admin" size="31"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td height="10">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="40">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right"><a href="#" onclick="javascript:logins();"><img
                                                    src="/images/login/form_15.png" width="95" height="37"/></a>
                                            </td>
                                            <td width="18">&nbsp;</td>
                                            <td align="left"><img src="/images/login/form_17.png" width="95"
                                                                  height="37" onclick="setClean()"/></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
            </div>
            <div class="foot">版权所有&nbsp;|&nbsp;国税局&nbsp;&nbsp;2018年</div>
        </div>
    </div>
</form>
</body>
</html>