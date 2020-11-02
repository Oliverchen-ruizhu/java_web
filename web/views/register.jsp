<%@ page import="java.util.Map" %>
<%@ page import="control.RegisterControl" %><%--
  Created by IntelliJ IDEA.
  User: olive
  Date: 2020/9/28
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>register page</title>
    <style type="text/css">
        a {text-decoration: none}
        #header1{
            padding: 15px 10px 15px 10px;
            background-color: #565656;
            line-height: 25px;  /*行高 25 像素*/
            width: 450px;  /*段落宽度 450 像素*/
        }

        #title{
            font-size: 25px;  /*字体大小 25 像素*/
            text-align: left;  /*文本左对齐*/
        }
        #data{
            float: right;
            text-align: right;  /*文本右对齐*/
            color:#F0EEEE;
            font-size: 15px;
        }
        #title1{
            font-size: 25px;  /*字体大小 25 像素*/
            text-align: left;  /*文本左对齐*/
        }
        #data1{
            float: right;
            text-align: right;  /*文本右对齐*/
            color:#F0EEEE;
            font-size: 15px;
        }
        #header2{
            padding: 30px 0px 10px 20px;
            font-size: 40px;
            color:#424242;
        }
        #return{
            float: right;
            text-align: right;  /*文本右对齐*/
            color:#424242;

        }
        #form_1{
            padding: 10px 0px 0px 120px;
        }
        body{
            padding: 100px 0px 0px 100px ;
            background-image: url("../imgs/wallhaven-43glo3_1920x1080.png");
            background-size: 100% 100%;
            width: 450px;  /*段落宽度 450 像素*/
        }
        #type{
            padding: 10px 0px 10px 0px ;
        }

        #name {
            padding: 10px 0px 10px 0px ;
        }
        #Account {
            padding: 10px 0px 10px 0px ;
        }
        #password1 {
            padding: 10px 0px 10px 0px ;
        }
        #password2 {
            padding: 10px 0px 10px 0px ;
        }
        #telenumber {
            padding: 10px 0px 10px 0px ;
        }
        #mail {
            padding: 10px 0px 10px 0px ;
        }
        #position {
            padding: 10px 0px 10px 0px ;
        }
        #checknumber {
            padding: 10px 0px 10px 0px ;
        }
        #button {
            padding: 10px 0px 10px 0px ;
        }
        #autour {
            padding: 15px 0px 15px 5px;
            background-image: url("../imgs/footer_bg.gif");
            width: 0;
        }
    </style>
    <script language="javascript">
        //注册信息动作
        function register(){
            var result=false;
            var user_type=document.getElementsByName("usertype");
            for(var i=0;i<user_type.length;i++){
                if (user_type[i].checked){
                    result=true;
                }
            }
            if(!result){
                alert("请选择您的用户类型");
                return result;
            }
            var username_list = new Array();
            username_list[0] = document.getElementById("username");
            username_list[1] = document.getElementById("userAccount");
            username_list[2] = document.getElementById("pwd1");
            username_list[3] = document.getElementById("pwd2");
            username_list[4] = document.getElementById("phone_number");
            username_list[5] = document.getElementById("email_address");
            username_list[6] = document.getElementById("working_address");
            username_list[7] = document.getElementById("check_number");
            var j;
            for(j=0;j<username_list.length;j++){
                if(username_list[j].value===""){
                    break;
                }
            }
            switch(j){
                case 0:
                    alert("用户名为空");
                    return false;
                    break;
                case 1:
                    alert("用户账号为空");
                    return false;
                    break;
                case 2:
                    alert("密码为空");
                    return false;
                    break;
                case 3:
                    alert("确认密码为空");
                    return false;
                    break;
                case 4:
                    alert("手机号为空");
                    return false;
                    break;
                case 5:
                    alert("邮箱为空");
                    return false;
                    break;
                case 6:
                    alert("所在单位填写为空");
                    return false;
                    break;
                case 7:
                    alert("验证码为空");
                    return false;
                    break;
            }
            if (j===username_list.length)
            {
                var isphone = /^[1][3,4,5,7,8,9][0-9]{9}$/;//检验手机号是否正确
                var isemail =  /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;//检验是否为电子邮箱
                var ischinese = /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;//不能以‘_’开头和结尾包括汉字数字和英文
                if(username_list[2].value!==username_list[3].value){
                    alert("两次密码不一致");
                    return false;
                }else if(!isphone.test(username_list[4].value)){
                    alert("手机号格式错误");
                    return false;
                }else if(!isemail.test(username_list[5].value)){
                    alert("电子邮箱格式错误");
                    return false;
                }else if(!ischinese.test(username_list[6].value)){
                    alert("所在单位地址填写格式错误");
                    return false;
                }else if(username_list[7].value!=="uwx6"){
                    alert("验证码不正确");
                    return false;
                }else{
                    alert("提交成功");
                    return true;
                }
            }
        }
        //修改信息动作
        function register1() {
            var username_list = new Array();
            username_list[0] = document.getElementById("username");
            username_list[1] = document.getElementById("pwd1");
            username_list[2] = document.getElementById("pwd2");
            username_list[3] = document.getElementById("phone_number");
            username_list[4] = document.getElementById("email_address");
            username_list[5] = document.getElementById("working_address");
            username_list[6] = document.getElementById("check_number");
            var j;
            for(j=0;j<username_list.length;j++){
                if(username_list[j].value===""){
                    break;
                }
            }
            switch(j){
                case 0:
                    alert("用户名为空");
                    return false;
                    break;
                case 1:
                    alert("密码为空");
                    return false;
                    break;
                case 2:
                    alert("确认密码为空");
                    return false;
                    break;
                case 3:
                    alert("手机号为空");
                    return false;
                    break;
                case 4:
                    alert("邮箱为空");
                    return false;
                    break;
                case 5:
                    alert("所在单位填写为空");
                    return false;
                    break;
                case 6:
                    alert("验证码为空");
                    return false;
                    break;
            }
            if (j===username_list.length)
            {
                var isphone = /^[1][3,4,5,7,8,9][0-9]{9}$/;//检验手机号是否正确
                var isemail =  /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;//检验是否为电子邮箱
                var ischinese = /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;//不能以‘_’开头和结尾包括汉字数字和英文
                if(username_list[1].value!==username_list[2].value){
                    alert("两次密码不一致");
                    return false;
                }else if(!isphone.test(username_list[3].value)){
                    alert("手机号格式错误");
                    return false;
                }else if(!isemail.test(username_list[4].value)){
                    alert("电子邮箱格式错误");
                    return false;
                }else if(!ischinese.test(username_list[5].value)){
                    alert("所在单位地址填写格式错误");
                    return false;
                }else if(username_list[6].value!=="uwx6"){
                    alert("验证码不正确");
                    return false;
                }else{
                    alert("提交成功");
                    return true;
                }
            }
        }
        function clearAll() {
            document.getElementById("username").value="";
            document.getElementById("pwd1").value="";
            document.getElementById("pwd2").value="";
            document.getElementById("phone_number").value="";
            document.getElementById("email_address").value="";
            document.getElementById("working_address").value="";
            document.getElementById("check_number").value="";
        }
    </script>
</head>
<body>
<%
    String tag = (String) request.getAttribute("alter");
    if(tag==null){
%>
<div id="header1">
    <span id="title">用户注册</span>
    <span id="data"><%=new java.util.Date().toLocaleString()%></span>
</div>
<div id="header2">
    <span>注册</span>
    <a id="return" href="/views/login.jsp">返回</a>
    <%}else {%>
    <div id="header1">
        <span id="title1">修改信息</span>
        <span id="data1"><%=new java.util.Date().toLocaleString()%></span>
    </div>
    <div id="header2">
        <span>修改</span>
        <a id="return" href="/views/user_management.jsp">返回</a>
    <%}%>

</div>
<div>
    <form id="form_1" method="post" name="setup" target="_blank" <%if (tag==null){%>action="/servlet/MyServlet" onSubmit="return register()"<%}else{ %>action="/servlet/UpdataServlet" onSubmit="return register1()"<%}%>>
        <table>
            <%if (tag==null){%>
            <tr>
                <td id="type">用户类型：</td>
                <td>
                    <input type="radio" name="usertype" value="学生">学生
                    <input type="radio" name="usertype" value="老师">老师
                    <input type="radio" name="usertype" value="管理员">管理员
                </td>
            </tr>
            <%}%>
            <%
                Map map = (Map) request.getAttribute("userInfo");
                RegisterControl registerControl = new RegisterControl();
                if (tag!=null){
                    for (Object key :map.keySet()){
                        if (key.equals("user_name")){
                            registerControl.setUsername((String) map.get(key));
                        }else if(key.equals("phone_number")){
                            registerControl.setPhone_number((String) map.get(key));
                        }else if(key.equals("Email_address")){
                            registerControl.setEmail_address((String) map.get(key));
                        }else if(key.equals("work_address")){
                            registerControl.setWorking_address((String) map.get(key));
                        }else if(key.equals("pass_word")){
                            registerControl.setPwd1((String) map.get(key));
                        }else if(key.equals("user_account")){
                            registerControl.setUserAccount((String) map.get(key));
                        }
                    }
                }
            %>
            <tr>
                <td id="name">
                    用&nbsp;户&nbsp;名:<br></td>
                <td>
                    <input id="username" name="username" type="text" id="username" <%if (tag!=null){%>value="<%=registerControl.getUsername()%>"<%}%> >
                </td>
            </tr>
            <%if (tag==null){%>
            <tr>
                <td id="Account">
                    用&nbsp;户&nbsp;账&nbsp;号:<br></td>
                <td>
                    <input id="userAccount" name="userAccount" type="text" id="userAccount">
                </td>
            </tr>
            <%}%>
            <tr>
                <td id="password1">
                    密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：
                </td>
                <td>
                    <input id="pwd1" name="pwd1" type="password" <%if (tag!=null){%>value="<%=registerControl.getPwd1()%>"<%}%>>
                </td>
            </tr>
            <tr>
                <td id="password2">
                    确认密码：
                </td>
                <td>
                    <input id="pwd2" type="password">
                </td>
            </tr>
            <tr><td id="telenumber">
                手&nbsp;机&nbsp;号：
            </td>
                <td>
                    <input id="phone_number" name="phone_number" type="text" <%if (tag!=null){%>value="<%=registerControl.getPhone_number()%>"<%}%>>
                </td></tr>
            <tr><td id="mail">
                邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：
            </td>
                <td>
                    <input id="email_address" name="email_address" type="text" <%if (tag!=null){%>value="<%=registerControl.getEmail_address()%>"<%}%>>
                </td></tr>
            <tr><td id="position">
                所在单位：
            </td>
                <td>
                    <input id="working_address" name="working_address" type="text" <%if (tag!=null){%>value="<%=registerControl.getWorking_address()%>"<%}%>>
                </td></tr>
            <tr><td id="checknumber">
                验证码：
            </td>
                <td>
                    <input id="check_number" type="text" size="5" >
                </td>
                <td>
                    <img src="/views/timg.jpg" alt="验证码" width="50">
                </td>
            </tr>
            <tr><td>
            </td>
                <td id="button">
                    <button id="reset" type="button" onclick="clearAll()">重置</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="setup" type="submit" <%if (tag!=null){%> name="alter" value="<%=registerControl.getUserAccount()%>"<%}%>>提交</button>
                </td></tr>
            <tr></tr>
        </table>

    </form>
    <div id="autour">
        oliverchen_info@163.com
    </div>
</div>
</body>
</html>
