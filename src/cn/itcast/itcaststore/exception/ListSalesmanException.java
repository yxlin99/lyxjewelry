package cn.itcast.itcaststore.exception;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListSalesmanException
 */
@WebServlet("/ListSalesmanException")
public class ListSalesmanException extends Exception {

	private static final long serialVersionUID = 1L;

	public ListSalesmanException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ListSalesmanException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public ListSalesmanException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public ListSalesmanException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
}
