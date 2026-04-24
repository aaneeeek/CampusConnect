package controller;

import java.io.IOException;
import java.sql.SQLException;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String matricule=request.getParameter("matricule");
		String note = request.getParameter("note");
		Float note2 = Float.parseFloat(note);
		String id_groupe = request.getParameter("id_groupe");
		Enseignant enseignant= (Enseignant) request.getSession().getAttribute("enseignant");
		
		if("save".equals("action")) {
			try {
				enseignant.RemplirNote(matricule, note2, id_groupe);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	}

}
