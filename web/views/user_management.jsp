<%--
  Created by IntelliJ IDEA.
  User: olive
  Date: 2020/9/28
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="net.jdbc.test.JDBC" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="jdk.nashorn.internal.scripts.JD" %>
<%@ page import="sun.invoke.empty.Empty" %>
<html>
<head>
    <title>user_management page</title>
    <style type="text/css">
        a {text-decoration: none}
        #header_1{
            padding: 23px 50px 10px 23px;
            background-image: url("../imgs/top_left.gif");
            text-align: left;  /*文本右对齐*/
            width: 600px;
            background-size:100%,100%;
        }

        #header1_child{
            text-align: center;     /* 水平 */
            vertical-align: middle; /* 垂直 */
        }
        #title{
            font-size: 20px;
        }
        #return{
            text-align: right;  /*文本左对齐*/
        }
        #data{
            text-align: right;  /*文本右对齐*/
        }
        #form_1{
            padding: 10px 0px 10px 0px ;
        }
        #button_1{
            padding: 10px 0px 10px 0px ;
        }
        body{
            padding: 100px 0px 0px 690px ;
            background-image: url("../imgs/wallhaven-wyzl56_1920x1080.png");
            background-size: 100%;
        }
        .user_name1 {
            background-color: aqua;
        }
        .name1 {
            background-color: aqua;
        }
        .user_type1 {
            background-color: aqua;
        }
        .user_email {
            background-color: aqua;
            text-align: center;     /* 水平 */
            vertical-align: middle; /* 垂直 */
        }
        .user_postion {
            background-color: aqua;
        }
        .user_check {
            background-color: aqua;
            text-align: center;     /* 水平 */
            vertical-align: middle; /* 垂直 */
        }
        .user_number {
            background-color: aqua;
            text-align: center;     /* 水平 */
            vertical-align: middle; /* 垂直 */
        }
        .student_1{
            background-color: #A4A4A4;
            text-align: center;     /* 水平 */
            vertical-align: middle; /* 垂直 */
        }
        .list {
            padding: 10px 10px 10px 10px ;
        }
        .search{
            font-style:oblique;/*倾斜字体*/
            font-size: 10px;
            font-family: cursive;/*草书*/
        }
        #autor{
            padding: 30px 0px 10px 0px ;
            background-image: url("../imgs/footer_bg.gif");
            width: 630px;
        }
        #repassword{
            background-color: #A4A4A4;
            font-size: 15px;
            color: #EB0D3B;
        }
        #repassword1{
            background-color: #A4A4A4;
            font-size: 15px;
            color: #EB0D3B;
        }
        .delete{
            background-color: #A4A4A4;
            font-size: 15px;
            color: #EB0D3B;
        }
    </style>
    <script language="javascript">
        function resetpassword(){
            alert("将修改当前对象信息");
        }
        var XMLHttpReq = false;
        //创建XMLHttpRequest对象
        function createXMLHttpRequest() {
            if(window.XMLHttpRequest) { //主流浏览器
                XMLHttpReq = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { // IE浏览器
                try {
                    XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }
        }
        //发送请求函数
        function sendRequest(url) {
            createXMLHttpRequest();
            XMLHttpReq.open("POST", url, true);
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
            XMLHttpReq.send(null);  // 发送请求
        }
        // 处理返回信息函数
        function processResponse() {
            if (XMLHttpReq.readyState === 4) { // 判断对象状态
                if (XMLHttpReq.status === 200) { // 信息已经成功返回，开始处理信息
                    var result = XMLHttpReq.responseText;
                    document.getElementById("user_info").innerHTML = result;
                } else { //页面不正常
                    window.alert("您所请求的页面有异常!!!");
                }
            }
        }
        function Click(){
            var str = document.getElementById("input_info").value;
            if (str==="请输入用户姓名进行搜索"){
                alert("查找对象输入为空");
            }else {
                var url = "/views/searchResult.jsp?userName="+str;
                sendRequest(url);
            }
        }
        function Delete(id) {
            var userAccount = document.getElementById(id).value;
            var url = "/views/deleteUserInfo.jsp?user="+userAccount;
            sendRequest(url);
        }
    </script>
</head>
<body>
<div id="header_1">
    <tr>
        <td><span id="title">用户管理</span></td>

    </tr>
    <div id="header1_child">

        <span id="autorname">欢迎账户：
            <%
                if(request.getParameter("username")!=null) {
                    session.setAttribute("username", request.getParameter("username"));
                    session.setAttribute("theUser",request.getParameter("userType"));//当前登录的用户类型
                    Cookie user_name = new Cookie("name", request.getParameter("username"));//创建一个cookie对象保存用户名和密码
                    Cookie user_password = new Cookie("pwd", request.getParameter("password"));
                    session.setAttribute("remember",request.getParameter("remember"));
                    String flag = (String) session.getAttribute("remember");
                    response.addCookie(user_name);//添加
                    if (flag.equals("on")) {
                        response.addCookie(user_password);
                    }
                    session.setMaxInactiveInterval(60 * 5);//5分钟后过期
                }
        %><%=session.getAttribute("username")%><a href="login.jsp" id="return">注销</a></span>
        <div id="data"><%=new java.util.Date().toLocaleString()%></div>

    </div>
</div>

<div>
    <form id="form_1" name="usercontrol" method="post" action="/servlet/AlterServlet">
        <div id="button_1">
            <input id="input_info" type="text" name="operation" style="color: #A4A4A4" class="search" value="请输入用户姓名进行搜索" onfocus='if(this.value=="请输入用户姓名进行搜索"){this.value="";}; '
                   onblur='if(this.value==""){this.value="请输入用户姓名进行搜索";};'>
            <button id="search" type="button" onclick="Click()">查找</button>
        </div>
        <table border="5" class="list" id="user_info">
            <tr>
                <td class="user_name1" >用户ID</td>
                <td class="name1" >姓名</td>
                <td class="user_type1" >用户类型</td>
                <td class="user_number">手机号</td>
                <td class="user_email">邮箱</td>
                <td class="user_postion">所在单位</td>
                <td class="user_check">操作</td>
            </tr>

            <%
                JDBC jdbc = new JDBC();
                String sql = "select * from student";
                ResultSet result = jdbc.result(sql);
            %>
            <% if (result!=null){
                int flag=1;
                while (result.next()){%>
            <tr class="student_1">
                <td><%out.print(result.getInt("userId"));%></td>
                <td><%out.print(result.getString("userName"));%></td>
                <td><%out.print(result.getString("userType"));%></td>
                <td><%out.print(result.getString("phoneNumber"));%></td>
                <td><%out.print(result.getString("EmailAddress"));%></td>
                <td><%out.print(result.getString("workAddress"));%></td>
                <td>
                    <%request.setAttribute("theUser",session.getAttribute("theUser"));%>
                    <BUTTON id="repassword" type="submit" onClick="resetpassword()" value="<%out.print(result.getString("userAccount")+"|"+session.getAttribute("username")+"|"+session.getAttribute("theUser"));%>" name="alter">修改信息</BUTTON>
                    <%
                        if (session.getAttribute("theUser").equals("2")){
                    %>
                    <button id='<%=flag%>' type="button" value="<%out.print(result.getString("userAccount"));%>" onclick="Delete(id)" class="delete">删除信息</button><%}%>
                </td>
            </tr>
           <%
                    flag+=1;
                }
            }
               //关闭结果集、数据库操作对象、数据库连接
               //jdbc.close();
           %>
        </table>
    </form>
    <div id="autor">
        oliverchen_info@163.com
    </div>
</div>
</body>
</html>
