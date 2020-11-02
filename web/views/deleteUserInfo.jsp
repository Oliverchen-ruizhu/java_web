<%@ page import="net.jdbc.test.JDBC" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: olive
  Date: 2020/11/2
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete User Info</title>
    <script>alert("网络错误");</script>
</head>
<body>
<%
    JDBC jdbc=new JDBC();
    String user=request.getParameter("user");
    String sql = "delete from student where(userAccount='"+user+"');";
    try {
        int flag = jdbc.updata(sql);
        //int flag=1;
        if(flag==1){
            System.out.println("删除成功");
        }else {
            System.out.println("网络错误");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    String sql1 = "select * from student";
    ResultSet result = jdbc.result(sql1);
%>
    <% if (result!=null){
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
</body>
</html>
