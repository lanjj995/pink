<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; Utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>regist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function(){
            var date = new Date();
            function is(s){
                if (s<10){
                    return "0"+s;
                }
                return s;
            }
            var time = date.getFullYear()+"-"+is(date.getMonth())+"-"+ is(date.getDate());
            $("#time").text(time);
            $("form").submit(function () {

            });
            $("#username").blur(function(){
               var username = $(this).val();
               $.post("${pageContext.request.contextPath}/user/checkUsername","username="+username,function (data) {
                   if (data==null){
                       //alert("用户名可以使用");
                   }else {
                       //alert("用户名已经被使用");
                   }
               },"json");
               if (/^\d{6,}$/.test(username)){
                   return true;
                   console.info("true");
               }else{
                   return false;
                   console.info("false");
               }

            });


        });
    </script>
</head>
<body>
<div id="wrap">
    <div id="top_content">
        <div id="header">
            <div id="rightheader">
                <p>
                    <span id="time"></span>
                    <br />
                </p>
            </div>
            <div id="topheader">
                <h1 id="title">
                    <a href="#">main</a>
                </h1>
            </div>
            <div id="navigation">
            </div>
        </div>
        <div id="content">
            <p id="whereami">
            </p>
            <h1>
                注册
            </h1>
            <form action="${pageContext.request.contextPath}/user/regist" method="post">
                <table cellpadding="0" cellspacing="0" border="0"
                       class="form_table">
                    <tr>
                        <td valign="middle" align="right">
                            用户名:
                        </td>
                        <td valign="middle" align="left">
                            <input type="text" class="inputgri" name="username" id="username"/>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right">
                            真实姓名:
                        </td>
                        <td valign="middle" align="left">
                            <input type="text" class="inputgri" name="realname" id="realname"/>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right">
                            密码:
                        </td>
                        <td valign="middle" align="left">
                            <input type="password" class="inputgri" name="password" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle" align="right">
                            性别:
                        </td>
                        <td valign="middle" align="left">
                            男
                            <input type="radio" class="inputgri" name="sex" value="m" checked="checked"/>
                            女
                            <input type="radio" class="inputgri" name="sex" value="f"/>
                        </td>
                    </tr>

                    <tr>
                        <td valign="middle" align="right">
                            验证码:
                            <img id="num" src="${pageContext.request.contextPath}/user/code1" />
                            <a href="javascript:;" onclick="document.getElementById('num').src = '${pageContext.request.contextPath}/user/code1?'+(new Date()).getTime()">换一张</a>
                        </td>
                        <td valign="middle" align="left">
                            <input type="text" class="inputgri" name="code" />
                        </td>
                    </tr>
                </table>
                <p>
                    <input type="submit" class="button" value="Submit &raquo;" />
                </p>
            </form>
        </div>
    </div>
    <div id="footer">
        <div id="footer_bg">
            ABC@126.com
        </div>
    </div>
</div>
</body>
</html>
