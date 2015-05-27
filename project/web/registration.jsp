<%-- 
    Document   : test
    Created on : 25.05.2015, 2:26:05
    Author     : anya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Регистрация нового пользователя</title>
    </head>
    <body>
        
        <%
            session.invalidate();
            
            // результаты регистрации
            String reg_error = new String();
            Object error_reg = request.getAttribute("reg_error");
            if (error_reg != null)
            {
                reg_error = error_reg.toString();
            }
           
            // логин
            String login = new String();
            Object old_login = request.getAttribute("login");
            if (old_login != null)
            {
                login = old_login.toString();
            }
            
            // логин
            String name = new String();
            Object old_name = request.getAttribute("my_name");
            if (old_name != null)
            {
                name = old_name.toString();
            }
            
            // пароль
            String pwd = new String();
            Object old_pwd = request.getAttribute("pwd");
            if (old_pwd != null)
            {
                pwd = old_pwd.toString();
            }
        %>

        <p align="right" style="margin-right: 20px">
            <a href="index.jsp">На главную</a>
        </p>
        <form action="RegisterServlet">
        <table cellspacing="10" align="center">
            <tr><td><br></td></tr>
            <tr>
                <td align="right">Логин:</td>
                <td>
                    <input name="login" type="text" size="23" 
                           value="<%= login %>">
                </td>
            </tr>
            <tr>
                <td align="right">Имя:</td>
                <td>
                    <input name="my_name" type="text" size="23" 
                           value="<%= name %>">
                </td>
            </tr>
            <tr>
                <td align="right">Пароль:</td>
                <td>
                    <input name="pwd" type="text" size="23" 
                           value="<%= pwd %>">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Зарегистрироваться"></td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="color:red">
                    <%= reg_error %>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
