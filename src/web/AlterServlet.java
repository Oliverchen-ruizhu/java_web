package web;

import jdk.nashorn.internal.scripts.JD;
import net.jdbc.test.JDBC;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

/**
 * @version 0.1
 * @Author: oliver chen
 * @Description: 修改操作
 * @Date:Create：in 2020/10/29 20:04
 * @Modified By：
 */
public class AlterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);//调用doPost方法
    }
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("alter", "alter");//当前页面表示修改属性为register.jsp复用做准备
        String userInfo[] = request.getParameter("alter").split("\\|");
        String userAccount = userInfo[0];//被操作对象
        String username = userInfo[1];//修改对象
        String userType = userInfo[2];//用户类型
        String sql = "select * from student " + "where(userAccount='" + userAccount + "')";
        JDBC jdbc = new JDBC();
        try {

            if (userAccount.equals(username)||userType.equals("2")) {
                ResultSet resultSet = jdbc.result(sql);
                Map map = jdbc.read(resultSet);
                request.setAttribute("userInfo", map);
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
            } else {
                System.out.println("当前登录对象和操作对象不一致，无法修改");
                request.setAttribute("username", username);
                request.setAttribute("fail_type","user type is not same");//当前登录对象和操作对象不一致，无法修改
                request.getRequestDispatcher("/views/loginfail.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
