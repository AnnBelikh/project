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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
            ) throws ServletException, IOException
    {
        String url = "/gimmesomeshows.jsp";
        String login = request.getParameter("login");
        String pwd = request.getParameter("pwd");
        boolean isUserValid = false;
        
        isUserValid = new Database().isUserValid(login, pwd);
        
        if(!isUserValid)
        {
            url = "/login_error.jsp";
        }
        else
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", login);
        }
        
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
