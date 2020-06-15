package cn.itcast.itcaststore.web.servlet.client;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.itcaststore.dao.UserDao;
import cn.itcast.itcaststore.domain.User;

public class LogoutServlet extends HttpServlet {
	private UserDao dao = new UserDao();
	
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取session对象.
		HttpSession session = request.getSession();
		// 销毁session
		session.invalidate();
		// flag标识
		String flag = request.getParameter("flag");
//		String id = request.getParameter("id");
//		String activeCode = request.getParameter("activeCode");
//		String password = request.getParameter("password");
//		String ip_address ="";
//		if (request.getHeader("x-forwarded-for") == null) {
//
//			ip_address = request.getRemoteAddr();
//		}
//		else {
//			ip_address= request.getHeader("x-forwarded-for");
//		}
//		User user = null;
//		System.out.println(activeCode+" "+password+" "+ip_address);
//		try {
//			//user = dao.findUserByID(id);
//			user = dao.findUserByActiveCode(activeCode);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		try {
//			dao.addlogoutlog(user.getUsername(),user.getRole(),ip_address);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}	
		if (flag == null || flag.trim().isEmpty()) {
			// 重定向到首页
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
	}
}