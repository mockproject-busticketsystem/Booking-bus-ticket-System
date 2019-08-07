package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.MyConnect;
import dao.TaiKhoanDAOImplement;
import models.TaiKhoan;


/**
 * Servlet implementation class LoginCookieFilter
 */
@WebServlet("/Login-Cookie-Filter")
public class LoginCookieFilter implements Filter {
	/*private static final long serialVersionUID = 1L;*/
       TaiKhoanDAOImplement tkDao = new TaiKhoanDAOImplement();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCookieFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
 
    }
 
    @Override
    public void destroy() {
 
    }
 
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
 
        TaiKhoan userInSession = MyConnect.getLoginedUser(session);
        // 
        if (userInSession != null) {
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
            chain.doFilter(request, response);
            return;
        }
 
        // Connection Ä‘Ã£ Ä‘Æ°á»£c táº¡o trong JDBCFilter.
      //  Connection conn = MyConnect.getStoredConnection(request);
 
        // Cá»� (flag) Ä‘á»ƒ kiá»ƒm tra Cookie.
        String checked = (String) session.getAttribute("COOKIE_CHECKED");
        //if (checked == null && conn != null)
        if(checked==null){
            String userName = MyConnect.getUserNameInCookie(req);
            TaiKhoan user = tkDao.findUser(userName);
			MyConnect.storeLoginedUser(session, user);
            // Ä�Ã¡nh dáº¥u Ä‘Ã£ kiá»ƒm tra Cookie.
            session.setAttribute("COOKIE_CHECKED", "CHECKED");
        }
        chain.doFilter(request, response);
    }
}
