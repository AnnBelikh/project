<%-- 
    Document   : test
    Created on : 25.05.2015, 2:26:05
    Author     : anya
    ha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Вход в систему</title>
    </head>
    <body>
        <%              
            session.invalidate();
            
            // текст ошибки логина
            String login_error = new String();
            Object error_login = request.getAttribute("login_error");
            if (error_login != null)
            {
                login_error = error_login.toString();
            }            
            
            // текст ошибки пароля
            String pwd_error = new String();
            Object error_pwd = request.getAttribute("pwd_error");
            if (error_pwd != null)
            {
                pwd_error = error_pwd.toString();
            }
        %>
        
        
        <form action="LoginServlet">
        <table cellspacing="10" align="center">
            <tr>
                <td align="right">Логин:</td>
                <td><input name="login" type="text" size="18"></td>
            </tr>
            <tr>
                <td align="right">Пароль:</td>
                <td><input name="pwd" type="password" size="18"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Войти в систему"></td>
            </tr>
            <tr>
                <td align="right">или</td>
                <td><a href="registration.jsp">зарегистрироваться</a></td>
            </tr>
        </table>
        </form>
    </body>
</html>
