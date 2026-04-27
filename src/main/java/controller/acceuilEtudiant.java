package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Etudiant;
import utils.CourseConflictException;
import utils.UtilityCls;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class acceuilEtudiant
 */
@WebServlet("/acceuilEtudiant")
public class acceuilEtudiant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public acceuilEtudiant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String contentPage = null;
		Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne");
		Map<String, Float>ListeNote = new HashMap<>();
		
		try {
			boolean isLoggedIn = UtilityCls.permission("etudiant", "", request.getSession(false));
			if (isLoggedIn){
				if("sinscrire".equals(action)) {
					contentPage= "/WEB-INF/view/etudiant.jsp";
				}
				else if("note".equals(action)){
					ListeNote = etudiant.VoirNote();
					request.setAttribute("ListeNote", ListeNote);
					contentPage = "/WEB-INF/view/ListeNote.jsp";
				}
				request.setAttribute("contentPage", contentPage);
				
				request.getRequestDispatcher("/WEB-INf/view/layout_etudiant.jsp").forward(request, response);
				System.out.println("################################" + request.getSession(false).getAttribute("type_compte"));
				
				
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
		Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne");
		System.out.println(etudiant.idPersonne);
		String action = request.getParameter("action");
		String id_groupe = request.getParameter("id_groupe");
	
		if("sinscrire".equals(action)){
		try {
			etudiant.Sinscrire(id_groupe);
		} catch (CourseConflictException e) {
			response.getWriter().println("<h1>You can't add register into this group. (Timetable Conflict) </h1>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INf/view/layout_etudiant.jsp").forward(request, response);
	}
	}
	}


