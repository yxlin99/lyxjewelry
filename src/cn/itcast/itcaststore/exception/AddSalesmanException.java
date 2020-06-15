package cn.itcast.itcaststore.exception;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddSalesmanException
 */
@WebServlet("/AddSalesmanException")
public class AddSalesmanException extends Exception {
	private static final long serialVersionUID = 1L;
       
	public AddSalesmanException() {
		super();
	}

	public AddSalesmanException(String message, Throwable cause) {
		super(message, cause);
	}

	public AddSalesmanException(String message) {
		super(message);
	}

	public AddSalesmanException(Throwable cause) {
		super(cause);
	}

}
