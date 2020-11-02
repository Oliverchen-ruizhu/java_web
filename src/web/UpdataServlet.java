package web;

import control.RegisterControl;
import net.jdbc.test.JDBC;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

/**
 * @version 0.1
 * @Author: oliver chen
 * @Description:
 * @Date:Create：in 2020/10/29 21:09
 * @Modified By：
 */
public class UpdataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);//调用doPost方法
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        JDBC jdbc = new JDBC();
        RegisterControl registerControl = new RegisterControl();
        registerControl.setUsername(request.getParameter("username"));
        registerControl.setPwd1(request.getParameter("pwd1"));
        registerControl.setPhone_number(request.getParameter("phone_number"));
        registerControl.setEmail_address(request.getParameter("email_address"));
        registerControl.setWorking_address(request.getParameter("working_address"));
        registerControl.setUserAccount(request.getParameter("alter"));
        String sql = "update student set userName='"+registerControl.getUsername()+"',phoneNumber='"+registerControl.getPhone_number()+"',passWord='"+registerControl.getPwd1()+"',EmailAddress='"+registerControl.getEmail_address()+"',workAddress='"+registerControl.getWorking_address()+"' where(userAccount='"+registerControl.getUserAccount()+"');";
        try {
            int flag = jdbc.updata(sql);
            if(flag==1){
                System.out.println("修改成功");
                request.getRequestDispatcher("/views/altersuccess.jsp").forward(request,response);
            }else {
                System.out.println("网络错误");
                request.setAttribute("alter_register","网络错误");
                request.getRequestDispatcher("/views/loginfail.jsp").forward(request,response);
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
