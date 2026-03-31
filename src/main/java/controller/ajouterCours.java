package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.UtilityCls;

import java.io.IOException;

/**
 * Servlet implementation class ajouterCours
 */
@WebServlet("/ajouterCours")
public class ajouterCours extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ajouterCours() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			boolean isLoggedIn = UtilityCls.permission("administrateur", "", request.getSession(false));
			if (isLoggedIn){
				request.getRequestDispatcher("/WEB-INF/view/create_cours.jsp").forward(request, response);
			}else {
				response.getWriter().println("<h1>Access Revoked</h1>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
