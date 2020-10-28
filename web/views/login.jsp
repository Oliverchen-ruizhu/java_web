<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: olive
  Date: 2020/9/28
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>login page</title>
    <style type="text/css">
        a {text-decoration: none}
        #header {
            text-align: left;  /*文本左对齐*/
            padding: 15px 15px 15px 15px;
            margin: 0 10px 0 10px;
            background-color:#129FD7;  /*定义背景颜色*/
            color:#000000;  /*定义文字颜色*/
            font-size: 18px;  /*字体大小 18 像素*/
            line-height: 25px;  /*行高 25 像素*/
            width: 450px;  /*段落宽度 500 像素*/
        }
        #lop_header{
            padding: 0px 0px 0px 12px;

        }
        body{  /*定义网页窗口属性，清除页边距，定义居中显示*/
            padding: 100px 0px 0px 1000px ;
            margin: 12px auto;
            background-image:url("../imgs/wallhaven-eyp1pl_1920x1080.png");/*背景图片*/
            background-size:100% 145%;
            background-repeat:no-repeat;
        }
        #form_1{
            padding: 0px 0px 0px 120px;
        }
        #fl{
            padding: 10px 10px 1px 12px;
            width:500px;
            background-image: url("../imgs/footer_bg.gif");
            width: 0;
        }
    </style>
    <script language="javascript">

        function Click(){
            var user_str=document.getElementById("username").value;
            var password_str=document.getElementById("password").value;

            var check_str=document.getElementById("check").value;
            if (user_str===null||user_str===undefined||user_str===""){
                alert("用户名为空");
                return false;
            }
            else if(password_str===null||password_str===undefined||password_str===""){
                alert("密码为空");
                return false;
            }
            else if (check_str===null||check_str===undefined||check_str===""){
                alert("验证码为空");
                return false;
            }
            else if (check_str!=="uwx6"){
                alert("验证码错误");
                return false;
            }
            else{
                alert("提交成功");
                return true;
            }
        }
    function clearAll() {
        document.getElementById("username").value="";
        document.getElementById("password").value="";
    }
    </script>
</head>
<body>
<div id="header">
    <pre><a href="register.jsp" style="color: aqua">还没有账号?(点我)</a>                <span id="time"><%=new java.util.Date().toLocaleString()%></span></pre>
</div>
<div id="lop_header">
    <h1><span style="color: #196299" id="loginpage">登录</span></h1>
</div>

<div>
    <form id="form_1" action="/servlet/MyServlet" method="post" name="login" onSubmit="return Click()"><!--数据提交-->
        <!--"action'用户点击提交按钮时，表单被提交到的位置。-->
        <table>
            <tr>
                <td>
                    用户名:
                </td>
                <%//request主要用来处理客户端浏览器提交的请求中的各项参数和选项
                    String name = new String();
                    String password = new String();
                    Cookie [] mycookie = request.getCookies();
                    for (int i=0;i<mycookie.length-1;i++){
                        if (mycookie[i].getName().equals("name")){
                            name = mycookie[i].getValue();
                        }else if(mycookie[i].getName().equals("pwd")){
                            password = mycookie[i].getValue();
                        }

                    }
                %>
                <td>
                    <input type="text" value="<%=name%>" name="userAccount" id="userAccount">
                </td>
            </tr>
            <tr>
                <td>
                    密&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <input type="password" value="<%=password%>" name="password" id="password">
                </td>
            </tr>
            <tr>
                <td>
                    用户类型:
                </td>
                <td>
                    <input type="radio" id="usertype" name="usertype" value="学生">学生
                    <input type="radio" id="usertype1" name="usertype" value="老师">老师
                    <input type="radio" id="usertype2" name="usertype" value="管理员">管理员
                </td>
            </tr>
            <tr>
                <td>
                    验证码：
                </td>
                <td>
                    <input type="text" name="check" size="5" id="check">
                </td>
                <td>
                    <img src="timg.jpg" alt="验证码" width="50" height="25">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <button id="login" type="submit">提交</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="reset"  type="button" onclick="clearAll()">重置</button>
                </td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="checkbox" name="remember" id="remember" >记住密码
                </td>
            </tr>
        </table>
    </form>
    <div id="fl">
        <h2>oliverchen_info@163.com</h2>
    </div>
</div>
</body>
</html>
