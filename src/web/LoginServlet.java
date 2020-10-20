package web;

import javax.servlet.ServletException;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>Servlet实例</TITLE>");
        out.println("</script>");
        out.println("</HEAD>");
        out.println("<BODY>");
        out.println("<CENTER>");
        out.println("<H1>欢迎用户（");
        //向服务器发送请求，获取数据
        String user = request.getParameter("username");
        String remember_pwd = request.getParameter("remember");
        String [] type = request.getParameterValues("usertype");
        String pwd = request.getParameter("password");
        for(int i=0;i<type.length;i++){
            out.print(type[i]);
        }
        out.println("）:");
        out.println(user+"</H1>");
        out.println("<H3>页面正在跳转</H3>");
        //该跳转方法能使用url进行传值，但request.setAttribute将无法传值，3秒后跳转
        response.setHeader("refresh", "3;url=/views/user_management.jsp?username="+user+"&password="+pwd+"&remember="+remember_pwd);
        out.println("</CENTER>");
        out.println("</BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
