package cn.itcast.itcaststore.web.servlet.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.itcast.itcaststore.domain.Product;
import cn.itcast.itcaststore.exception.FindProductByIdException;
import cn.itcast.itcaststore.service.ProductService;
/**
 * 根据商品id查找指定商品信息的servlet
 */
public class FindProductByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 得到商品的id
		String id = request.getParameter("id");
		System.out.println(id);
		// 获取type参数值，此处的type用于区别普通用户和超级用户
		String type = request.getParameter("type");
		System.out.println(type);
		ProductService service = new ProductService();
		try {
			// 调用service层方法，通过id查找商品
			Product p = service.findProductById(id);
			request.setAttribute("p", p);
			// 普通用户默认不传递type值，会跳转到info.jsp页面
			if (type == null) {
				request.getRequestDispatcher("/client/info.jsp").forward(request,response);
				return;
			}						
			request.getRequestDispatcher("/admin/products/edit.jsp").forward(request, response);
			return;
		} catch (FindProductByIdException e) {
			e.printStackTrace();
		}
//		try {
//			// 调用service层方法，通过id查找商品
//			Product p = service.findProductById(id);
//			request.setAttribute("p", p);
//			System.out.println("product_id:"+p.getId());
//			// 普通用户默认不传递type值，会跳转到info.jsp页面
//			if(type == "user") {
//				System.out.println("type null return");
//				request.getRequestDispatcher("/client/info.jsp").forward(request,response);
//				return;
//			}
//			if(type.contentEquals("admin")) {
//				System.out.println("admin to edit products");
//				request.getRequestDispatcher("/admin/products/edit.jsp").forward(request, response);
//			}
//			if(type == "sales"){
//				System.out.println("sales to edit products");
//				request.getRequestDispatcher("/sales/products/edit.jsp").forward(request, response);
//			}
//			return;
//		} 
	}
}
