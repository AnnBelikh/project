package kyrs;

import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet
{
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
            ) throws ServletException, IOException
    {
        String url = "/registration.jsp";
        String login = request.getParameter("login");
        String my_name = request.getParameter("my_name");
        String pwd = request.getParameter("pwd");
        
        if (login.isEmpty() || pwd.isEmpty()|| my_name.isEmpty())
        {
            request.setAttribute("reg_error", "Не все поля заполнены!!");
            request.setAttribute("login", login);
            request.setAttribute("my_name", my_name);
            request.setAttribute("pwd", pwd);
        }
        else
        {
            try {
                String registrationResults =
                        new Database().registerNewUser(login,my_name, pwd);
                request.setAttribute("reg_error", registrationResults);
            } catch (SQLException e) {}
        }

        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
