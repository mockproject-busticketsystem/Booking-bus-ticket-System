package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Collection;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import connect.ConnectionUtils;
import connect.MyConnect;


/**
 * Servlet implementation class JDBCFilter
 */
@WebServlet("/jdbcFilter")
public class JDBCFilter implements Filter {
	/*private static final long serialVersionUID = 1L;*/
	public JDBCFilter() {
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

	// Kiá»ƒm tra má»¥c tiÃªu cá»§a request hiá»‡n táº¡i lÃ  1 Servlet?
	private boolean needJDBC(HttpServletRequest request) {
		System.out.println("JDBC Filter");
		// 
		// Servlet Url-pattern: /spath/*
		// 
		// => /spath
		String servletPath = request.getServletPath();
		// => /abc/mnp
		String pathInfo = request.getPathInfo();

		String urlPattern = servletPath;

		if (pathInfo != null) {
			// => /spath/*
			urlPattern = servletPath + "/*";
		}

		// Key: servletName.
		// Value: ServletRegistration
		Map<String, ? extends ServletRegistration> servletRegistrations = request.getServletContext()
				.getServletRegistrations();

		// Táº­p há»£p táº¥t cáº£ cÃ¡c Servlet trong WebApp cá»§a báº¡n.
		Collection<? extends ServletRegistration> values = servletRegistrations.values();
		for (ServletRegistration sr : values) {
			Collection<String> mappings = sr.getMappings();
			if (mappings.contains(urlPattern)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		// Chá»‰ má»Ÿ connection (káº¿t ná»‘i) Ä‘á»‘i vá»›i cÃ¡c request cÃ³ Ä‘Æ°á»�ng dáº«n Ä‘áº·c biá»‡t.
		// (Cháº³ng háº¡n Ä‘Æ°á»�ng dáº«n tá»›i cÃ¡c servlet, jsp, ..)
		// 
		// TrÃ¡nh tÃ¬nh tráº¡ng má»Ÿ Connection vá»›i cÃ¡c yÃªu cáº§u thÃ´ng thÆ°á»�ng.
		// (Cháº³ng háº¡n image, css, javascript,... )
		// 
		if (this.needJDBC(req)) {

			System.out.println("Open Connection for: " + req.getServletPath());

			Connection conn = null;
			try {
				// Táº¡o Ä‘á»‘i tÆ°á»£ng Connection káº¿t ná»‘i database.
				conn = ConnectionUtils.getConnection();
				// SÃ©t tá»± Ä‘á»™ng commit false, Ä‘á»ƒ chá»§ Ä‘á»™ng Ä‘iá»�u khiá»ƒn.
				conn.setAutoCommit(false);

				// LÆ°u trá»¯ Ä‘á»‘i tÆ°á»£ng Connection vÃ o attribute cá»§a request.
				MyConnect.storeConnection(request, conn);

				// Cho phÃ©p request Ä‘i tiáº¿p.
				// (Ä�i tá»›i Filter tiáº¿p theo hoáº·c Ä‘i tá»›i má»¥c tiÃªu).
				chain.doFilter(request, response);

				// Gá»�i phÆ°Æ¡ng thá»©c commit() Ä‘á»ƒ hoÃ n thÃ nh giao dá»‹ch vá»›i DB.
				conn.commit();
			} catch (Exception e) {
				e.printStackTrace();
				ConnectionUtils.rollbackQuietly(conn);
				throw new ServletException();
			} finally {
				ConnectionUtils.closeQuietly(conn);
			}
		}
		// Vá»›i cÃ¡c request thÃ´ng thÆ°á»�ng (image,css,html,..)
		// khÃ´ng cáº§n má»Ÿ connection.
		else {
			// Cho phÃ©p request Ä‘i tiáº¿p.
			// (Ä�i tá»›i Filter tiáº¿p theo hoáº·c Ä‘i tá»›i má»¥c tiÃªu).
			chain.doFilter(request, response);
		}

	}



}
