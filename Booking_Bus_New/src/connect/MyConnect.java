package connect;

import java.sql.Connection;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.KhachHang;
import models.TaiKhoan;

public class MyConnect {
	public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";
	 
    private static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";
 
    public static void storeConnection(ServletRequest request, Connection conn) {
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }
    
    public static Connection getStoredConnection(ServletRequest request) {
        Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }

    public static void storeLoginedUser(HttpSession session, TaiKhoan loginedUser) {
        session.setAttribute("loginedUser", loginedUser);
    }
 
    public static TaiKhoan getLoginedUser(HttpSession session) {
        TaiKhoan loginedUser = (TaiKhoan) session.getAttribute("loginedUser");
        return loginedUser;
    }
    public static void storedLoginedCustom(HttpSession session, KhachHang khachHang)
    {
    	session.setAttribute("loginedKhachHang",khachHang );
    }
    public static KhachHang getLoginedKhachHang(HttpSession session) {
        KhachHang loginedUser = (KhachHang) session.getAttribute("loginedKhachHang");
        return loginedUser;
    }
 
 
    public static void storeUserCookie(HttpServletResponse response, TaiKhoan user) {
        System.out.println("Store user cookie");
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getEmail());
        // 1 ngÃ y (Ä�Ã£ Ä‘á»•i ra giÃ¢y)
        cookieUserName.setMaxAge(24 * 60 * 60);
        response.addCookie(cookieUserName);
    }
 
    public static String getUserNameInCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (ATT_NAME_USER_NAME.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
 
    // XÃ³a Cookie cá»§a ngÆ°á»�i dÃ¹ng
    public static void deleteUserCookie(HttpServletResponse response) {
        Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
        // 0 giÃ¢y. (Cookie nÃ y sáº½ háº¿t hiá»‡u lá»±c ngay láº­p tá»©c)
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);
    }

}
