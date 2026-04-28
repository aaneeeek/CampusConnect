package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Enseignant;

/**
 * Servlet implementation class acceuilEnseignant
 */
@WebServlet("/acceuilEnseignant")
public class acceuilEnseignant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public acceuilEnseignant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String contentPage= null;
     String action= request.getParameter("action");
     if("remplir".equals(action)) {
    	 contentPage = "/WEB-INF/view/enseignant.jsp";
    	 request.setAttribute("contentPage", contentPage);
     }
     if("edt".equals(action)) {
    	 contentPage="/WEB-INF/view/edt.jsp";
    	 request.setAttribute("contentPage", contentPage);
     }
		request.getRequestDispatcher("/WEB-INF/view/layoutEnseignant.jsp").forward(request, response);
     
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		response.setContentType("text/plain");

	    try {
	        System.out.println("===== DOPOST APPELÉ =====");

	        String noteStr = request.getParameter("note");
	        String matricule = request.getParameter("matricule");
	        String id_groupe = request.getParameter("id_groupe");

	        System.out.println("NOTE = [" + noteStr + "]");
	        System.out.println("MAT = [" + matricule + "]");
	        System.out.println("GROUPE = [" + id_groupe + "]");

	        // 🔴 Vérification paramètres
	        if(noteStr == null || noteStr.isEmpty() ||
	           matricule == null || matricule.isEmpty() ||
	           id_groupe == null || id_groupe.isEmpty()){

	            response.setStatus(400);
	            response.getWriter().write("Paramètres manquants ou invalides");
	            return;
	        }

	        float note;
	        try {
	            note = Float.parseFloat(noteStr);
	        } catch (NumberFormatException e) {
	            response.setStatus(400);
	            response.getWriter().write("Format de note invalide");
	            return;
	        }

	        // 🔴 Vérification session
	        Enseignant enseignant = (Enseignant) request.getSession().getAttribute("personne");

	        if(enseignant == null){
	            response.setStatus(401);
	            response.getWriter().write("Session expirée ou enseignant non connecté");
	            return;
	        }

	        // 🔥 Appel métier
	        enseignant.RemplirNote(matricule.trim(), note, id_groupe.trim());

	        response.setStatus(200);
	        response.getWriter().write("Note enregistrée avec succès");

	    } catch (Exception e) {

	        e.printStackTrace(); // 🔴 très important pour debug

	        response.setStatus(500);

	        // 🔥 RENVOIE L’ERREUR RÉELLE (clé du debug)
	        response.getWriter().write("Erreur serveur : " + e.getMessage());
	    }

	    }
	}
	
