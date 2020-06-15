package cn.itcast.itcaststore.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.itcaststore.dao.UserDao;
import cn.itcast.itcaststore.domain.Product;
import cn.itcast.itcaststore.domain.User;
import cn.itcast.itcaststore.exception.AddProductException;
import cn.itcast.itcaststore.exception.AddSalesmanException;
import cn.itcast.itcaststore.exception.ListProductException;
import cn.itcast.itcaststore.exception.ListSalesmanException;

/**
 * Servlet implementation class SalesmenService
 */
@WebServlet("/SalesmenService")
public class SalesmenService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao dao = new UserDao();
    
    
    // 添加销售人员
 	public void addProduct(User u) throws AddSalesmanException {
 		try {
 			dao.addSalesman(u);
 		} catch (SQLException e) {
 			e.printStackTrace();
 			throw new AddSalesmanException("添加销售人员失败");
 		}
 	}
 	
 
 	// 查找所有销售人员信息
 	public List<User> listAllSalesmen() throws ListSalesmanException {
 		try {
 			return dao.listAllSalesman();
 		} catch (SQLException e) {
 			e.printStackTrace();
 			throw new ListSalesmanException("查询销售人员失败");
 		}
 	}
 	
 	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalesmenService() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
