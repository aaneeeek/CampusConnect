package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Personne;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class seConnecter
 */
@WebServlet("/seConnecter")
public class seConnecter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public seConnecter() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/connexion_user.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			System.out.println("################################" + session.getId());
			Personne.SeConnecter(request.getParameter("identifiant"), request.getParameter("mot_de_passe"), request.getParameter("type_compte"), session,	request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("<h1>Exeption Occured</h1>");
		}
		
	}

}
