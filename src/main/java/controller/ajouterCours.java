package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;
import model.Enseignant;
import utils.UtilityCls;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

/**
 * Servlet implementation class ajouterCours
 */
@WebServlet("/ajouterCours")
public class ajouterCours extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ajouterCours() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			boolean isLoggedIn = UtilityCls.permission("administrateur", "", request.getSession(false));
			if (isLoggedIn){
				ArrayList<Enseignant> listeEnseignant = Enseignant.getListeEnseignant();
				request.setAttribute("listeEnseignant", listeEnseignant);
				request.getRequestDispatcher("/WEB-INF/view/create_cours.jsp").forward(request, response);
			}else {
				response.getWriter().println("<h1>Access Revoked</h1>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Admin admin = (Admin) request.getSession().getAttribute("personne");
		try {
			admin.AjouterCours(
					request.getParameter("code_cours"), 
					request.getParameter("intituler"), 
					request.getParameter("description"), 
					Integer.parseInt(request.getParameter("volume_horraire")), 
					Integer.parseInt(request.getParameter("capacite")), 
					request.getParameter("id_enseignant")
					);
			Map<String, String[]> groupes = request.getParameterMap();
			for (String key : groupes.keySet()) {
				if (key.startsWith("nom_groupe_")) {
					String noGroupe = key.substring(11);
					admin.ajouterGroupeCours(
							request.getParameter("nom_groupe_" + noGroupe), 
							Integer.parseInt(request.getParameter("volume_horraire_groupe_" + noGroupe)), 
							Integer.parseInt(request.getParameter("capacite_groupe_" + noGroupe)), 
							request.getParameter("code_cours") + "_" + noGroupe, 
							request.getParameter("id_enseignant_" + noGroupe), 
							request.getParameter("code_cours")
						);
				}
			}
			request.getRequestDispatcher("/WEB-INF/view/create_cours.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
