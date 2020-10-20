package net.jdbc.test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @version 0.1
 * @Author: oliver chen
 * @Description:  连接MySQL
 * @Date:Create：in 2020/10/19 19:14
 * @Modified By：
 */
public class JDBC {
    static final String DB_URL="jdbc:mysql://localhost:3306/test?serverTimezone=UTC&characterEncoding=utf-8";
    static final String USER = "root";
    static final String PASSWORD="zx236739";

    public List  resurt(String[] args){
        List<Map> list =new ArrayList<Map>();//创建list集合用于存入map的键值对集合
        try{
            //注册JDBC驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            //连接数据库
            Connection connection = DriverManager.getConnection(DB_URL,USER,PASSWORD);
            //操作数据库
            Statement statement = connection.createStatement();//获取操作数据库对象
            String sql = "select * from student";
            ResultSet resultSet = statement.executeQuery(sql);//执行sql，获取结果

            while (resultSet.next()){
                int user_id = resultSet.getInt("userId");
                String user_name = resultSet.getString("userName");
                String user_type = resultSet.getString("userType");
                String phone_number = resultSet.getString("phoneNumber");
                String Email_address = resultSet.getString("EmailAddress");
                String work_address = resultSet.getString("workAddress");
                String user_account = resultSet.getString("userAccount");
                String pass_word = resultSet.getString("passWord");
                Map map = new HashMap();
                map.put("user_id",user_id);
                map.put("user_name",user_name);
                map.put("user_type",user_type);
                map.put("phone_number",phone_number);
                map.put("Email_address",Email_address);
                map.put("work_address",work_address);
                map.put("user_account",user_account);
                map.put("pass_word",pass_word);
                list.add(map);
            }
            //输出检查
            for(Map map1 :list){
                System.out.println(map1);
            }
            //关闭结果集、数据库操作对象、数据库连接
            resultSet.close();
            statement.close();
            connection.close();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

}
