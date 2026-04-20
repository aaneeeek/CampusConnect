package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.UtilityCls;

import java.io.IOException;

/**
 * Servlet implementation class PlanifierCours
 */
@WebServlet("/PlanifierCours")
public class PlanifierCours extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PlanifierCours() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			boolean isLoggedIn = UtilityCls.permission("administrateur", "", request.getSession(false));
			if (isLoggedIn){
				request.getRequestDispatcher("/WEB-INF/view/plannifier.jsp").forward(request, response);
			}else {
				response.getWriter().println("<h1> Access Revoked </h1>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
