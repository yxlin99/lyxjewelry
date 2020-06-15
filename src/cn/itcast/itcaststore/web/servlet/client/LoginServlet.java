package cn.itcast.itcaststore.web.servlet.client;
import java.io.IOException;
import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.itcast.itcaststore.domain.User;
import cn.itcast.itcaststore.service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.获取登录页面输入的用户名与密码与IP地址
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(request.getParameter("username"));
		System.out.println(request.getParameter("password"));
		String ip_address ="";
		if (request.getHeader("x-forwarded-for") == null) {

			ip_address = request.getRemoteAddr();
		}
		else {
			ip_address= request.getHeader("x-forwarded-for");
		}
		
		// 2.调用service完成登录操作。
		UserService service = new UserService();
		try {
			User user = service.login(username, password,ip_address);
			
			// 3.登录成功，将用户存储到session中.
			request.getSession().setAttribute("user", user);
			// 获取用户的角色，其中用户的角色分普通用户和超级用户两种
			String role = user.getRole();
			// 如果是管理员，进入管理系统；
			if ("admin".equals(role)) {
				response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
				return;
			} else if("sales".equals(role)){
				//如果为销售人员则进入销售人员管理页面
				response.sendRedirect(request.getContextPath()+"/sales/login/home.jsp");
			}
			else{
				//否则为普通消费者，进入我的账户页面
				response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
				return;
			}
		} catch (LoginException e) {
			// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
			e.printStackTrace();
			request.setAttribute("register_message", e.getMessage());
			request.getRequestDispatcher("/client/login.jsp").forward(request, response);
			return;
		}
	}
}
