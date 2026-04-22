package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.UtilityCls;
import model.Seance;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

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
		BufferedReader reader = request.getReader();
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			sb.append(line);
		}
		String jsonString = sb.toString();  
		Gson gson = new Gson();

		Type type = new TypeToken<List<Seance>>() {}.getType();
		List<Seance> users = gson.fromJson(jsonString, type);

	}

}
