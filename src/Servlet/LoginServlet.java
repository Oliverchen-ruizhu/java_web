package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @version 0.1
 * @Author: oliver chen
 * @Description: Servlet设置
 * @Date:Create：in 2020/10/12 17:27
 * @Modified By：
 */
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);//调用doPost方法
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<HTML>");
        out.println("<HEAD><TITLE>Servlet实例</TITLE></HEAD>");
        out.println("<BODY>");
        out.println("<CENTER>");
        out.println("<H1>欢迎用户:");
        //向服务器发送请求，获取数据
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        out.println(user+"</H1>");
        out.println("<H3>正在进行跳转</H3>");
        //该跳转方法能使用url进行传值，但request.setAttribute将无法传值
        response.setHeader("refresh", "3;url=/views/user_management.jsp?username="+user+"&password="+pwd);
        out.println("</CENTER>");
        out.println("</BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
