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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		JsonElement jsonElement = JsonParser.parseReader(reader);
		JsonObject jsonObject = jsonElement.getAsJsonObject();
		String matricule = jsonObject.get("matricule").getAsString();
		Float note = Float.parseFloat(jsonObject.get("note").getAsString());
		String id_groupe = jsonObject.get("id_groupe").getAsString();
		Enseignant enseignant= (Enseignant) request.getSession().getAttribute("personne");
		try {
			enseignant.RemplirNote(matricule, note, id_groupe);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INf/view/layoutEnseignant.jsp").forward(request, response);
	
	}

}
