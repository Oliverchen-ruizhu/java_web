<%--
  Created by IntelliJ IDEA.
  User: olive
  Date: 2020/11/1
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="net.jdbc.test.JDBC" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Map" %>
<html>
<head>
    <title>Search Result</title>
</head>
<body>
<%
    String user = request.getParameter("userName");
    JDBC jdbc = new JDBC();
    String sql = "select * from student where(userName like '%"+user+"%')";
    ResultSet result = jdbc.result(sql);
    Map map = jdbc.read(result);
%>

<% if (map.size()==0) {
%>
    查询无结果<a href="/views/user_management.jsp">返回</a>
<%}else {
    result = jdbc.result(sql);
    int flag = 1;
    %>
<tr>
    <td class="user_name1" >用户ID</td>
    <td class="name1" >姓名</td>
    <td class="user_type1" >用户类型</td>
    <td class="user_number">手机号</td>
    <td class="user_email">邮箱</td>
    <td class="user_postion">所在单位</td>
    <td class="user_check">操作</td>
</tr>
    <%while (result.next()){%>
<tr class="student_1">
    <td><%out.print(result.getInt("userId"));%></td>
    <td><%out.print(result.getString("userName"));%></td>
    <td><%out.print(result.getString("userType"));%></td>
    <td><%out.print(result.getString("phoneNumber"));%></td>
    <td><%out.print(result.getString("EmailAddress"));%></td>
    <td><%out.print(result.getString("workAddress"));%></td>
    <td>
        <BUTTON id="repassword" type="submit" onClick="resetpassword();" value="<%out.print(result.getString("userAccount")+"|"+session.getAttribute("username")+"|"+session.getAttribute("theUser"));%>" name="alter">修改信息</BUTTON>
        <%
            if (session.getAttribute("theUser").equals("2")){
        %>
        <button id='<%=flag%>' type="button" value="<%out.print(result.getString("userAccount"));%>" onclick="Delete(id)" class="delete">删除信息</button><%}%>
    </td>
</tr>
<%
        }
    }
%>
</body>
</html>
