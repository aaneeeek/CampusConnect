package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Etudiant;
import utils.UtilityCls;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Servlet implementation class listeEtudiant
 */
@WebServlet("/listeEtudiant")
public class listeEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listeEtudiant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			boolean isLoggedIn = UtilityCls.permission("administrateur", "", request.getSession(false));
			if (isLoggedIn){
				ArrayList<Etudiant> listeEtudiant = Etudiant.getListeEtudiant();
				request.setAttribute("listeEtudiant", listeEtudiant);
				request.getRequestDispatcher("/WEB-INF/view/liste_etudiant.jsp").forward(request, response);
			}else {
				response.getWriter().println("<h1>Access Revoked</h1>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().println("<h1>Code: 500 SERVER ERROR<h1>");
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
