package kyrs;

import java.io.IOException;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

@WebServlet(name = "ShowServlet", urlPatterns = {"/ShowServlet"})
public class ShowServlet extends HttpServlet
{
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
            ) throws ServletException, IOException
    {   
        HttpSession session = request.getSession(false);
        String url = "/gimmesomeshows.jsp";

        String t1 = request.getParameter("name1");
        String t2 = request.getParameter("name2");
        String t3 = request.getParameter("name3");
        String t4 = request.getParameter("name4");
        String t5 = request.getParameter("name5");
        String t6 = request.getParameter("name6");
        String t7 = request.getParameter("name7");
        String t8 = request.getParameter("name8");
        String t9 = request.getParameter("name9");
        String t10 = request.getParameter("name10");
        String t11 = request.getParameter("name11");
        String t12 = request.getParameter("name12");
        String t13 = request.getParameter("name13");
        String t14 = request.getParameter("name14");
        String t15 = request.getParameter("name15");
        String t16 = request.getParameter("name16");
        String t17 = request.getParameter("name17");
        String t18 = request.getParameter("name18");		
        String t19 = request.getParameter("name19");
        String t20 = request.getParameter("name20");
        String t21 = request.getParameter("name21");
        String t22 = request.getParameter("name22");
        String t23 = request.getParameter("name23");
        String t24 = request.getParameter("name24");
        String t25 = request.getParameter("name25");
        String t26 = request.getParameter("name26");
        String t27 = request.getParameter("name27");
        String t28 = request.getParameter("name28");
        String t29 = request.getParameter("name29");
        String t30 = request.getParameter("name30");
        String t31 = request.getParameter("name31");
        String t32 = request.getParameter("name32");
        String t33 = request.getParameter("name33");
        String t34 = request.getParameter("name34");	
        
        int a = 0; 
                if ("a".equals(t1)) {a=a+1;}
                if ("a".equals(t3)) {a=a+1;}
                if ("a".equals(t5)) {a=a+1;} 
				if ("a".equals(t6)) {a=a+1;}
				if ("a".equals(t8)) {a=a+1;}
				if ("a".equals(t9)) {a=a+1;}
                if ("a".equals(t10)) {a=a+1;}
                if ("a".equals(t11)) {a=a+1;}
                if ("a".equals(t12)) {a=a+1;} 
				if ("a".equals(t14)) {a=a+1;}
				if ("a".equals(t15)) {a=a+1;}
				if ("a".equals(t16)) {a=a+1;}
                if ("a".equals(t17)) {a=a+1;}
                if ("a".equals(t18)) {a=a+1;}
                if ("a".equals(t19)) {a=a+1;} 
				if ("a".equals(t20)) {a=a+1;}
				if ("a".equals(t21)) {a=a+1;}
				if ("a".equals(t22)) {a=a+1;}
                if ("a".equals(t23)) {a=a+1;}
                if ("a".equals(t24)) {a=a+1;}
                if ("a".equals(t25)) {a=a+1;} 
				if ("a".equals(t28)) {a=a+1;}
				if ("a".equals(t29)) {a=a+1;}
				if ("a".equals(t30)) {a=a+1;}
                if ("a".equals(t31)) {a=a+1;}
                if ("a".equals(t32)) {a=a+1;}
                if ("a".equals(t33)) {a=a+1;} 
		if ("a".equals(t34)) {a=a+1;}
				if ("b".equals(t2)) {a=a+1;}
				if ("b".equals(t4)) {a=a+1;}
				if ("b".equals(t7)) {a=a+1;}
				if ("b".equals(t13)) {a=a+1;}
                                if ("b".equals(t26)) {a=a+1;}
				if ("b".equals(t27)) {a=a+1;}
        
        int sum =0;                         
        if (a<=5) { sum = 1; }
        if (a>5 && a<=13) { sum = 2; }
        if (a>13 && a<=29) { sum = 3; }
        if (a>29 && a<=34) { sum = 4; }   
      
        String login = session.getAttribute("user").toString();        
        String registrationResults =
                new Database().SetData(login,sum);
        request.setAttribute("test_error", registrationResults);
        
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher =
                context.getRequestDispatcher("/gimmesomeshows.jsp");
        dispatcher.forward(request, response);
    }
}

