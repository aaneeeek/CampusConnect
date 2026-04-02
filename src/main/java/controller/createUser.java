package controller;
import utils.ConnectDatabase;
import utils.UtilityCls;
import jakarta.servlet.ServletException;
import model.Admin;
import model.Enseignant;
import model.Etudiant;

import java.sql.Date;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createUser")
public class createUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public createUser() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			boolean isLoggedIn = UtilityCls.permission("administrateur", "", request.getSession(false));
			if (isLoggedIn){
				request.getRequestDispatcher("/WEB-INF/view/create_user.jsp").forward(request, response);
			}else {
				response.getWriter().println("<h1>Access Revoked</h1>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accountType = request.getParameter("type_compte");
		try {
			Admin admin = (Admin) request.getSession().getAttribute("personne");
			if (accountType.contentEquals("student")) {
				Etudiant etudiant = admin.CreerCompteEtudiant(
						request.getParameter("nom"),
						request.getParameter("prenom"),
						request.getParameter("mot_de_passe"),
						Date.valueOf(request.getParameter("date_naissance")),
						request.getParameter("matricule"),
						Integer.parseInt(request.getParameter("niveau")),
						request.getParameter("filiere")
					);
				}
				
			else {
				Enseignant enseignant = admin.AjouterEnseignant(
						request.getParameter("nom"),
						request.getParameter("prenom"),
						Date.valueOf(request.getParameter("date_naissance")),
						request.getParameter("mot_de_passe"),
						request.getParameter("statut"),
						request.getParameter("departement")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/view/create_user.jsp").forward(request, response);
	}

}
