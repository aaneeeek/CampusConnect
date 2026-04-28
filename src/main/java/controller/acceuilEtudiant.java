package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Etudiant;
import utils.CourseConflictException;
import utils.UtilityCls;

import java.io.IOException;
import java.util.*;

@WebServlet("/acceuilEtudiant")
public class acceuilEtudiant extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String contentPage = null;

        Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne");

        try {
            boolean isLoggedIn = UtilityCls.permission("etudiant", "", request.getSession(false));

            if (isLoggedIn) {

                if ("sinscrire".equals(action)) {
                    contentPage = "/WEB-INF/view/etudiant.jsp";
                }

                else if ("note".equals(action)) {

                    // 🔥 Récupération nouvelle structure
                    Map<String, Map<String, Float>> notesParMatiere =
                            etudiant.voirNotesParMatiere();

                    Map<String, Float> moyennes = new HashMap<>();

                    float totalGeneral = 0;
                    int count = 0;

                    // 🔥 Calcul des moyennes par matière
                    for (String matiere : notesParMatiere.keySet()) {

                        Map<String, Float> notes = notesParMatiere.get(matiere);

                        float cm = notes.getOrDefault("CM", 0f);
                        float td = notes.getOrDefault("TD", 0f);
                        float tp = notes.getOrDefault("TP", 0f);

                        float moyenne = (0.7f * cm) + (0.2f * td) + (0.1f * tp);

                        moyennes.put(matiere, moyenne);

                        totalGeneral += moyenne;
                        count++;
                    }

                    float moyenneGenerale = count > 0 ? totalGeneral / count : 0;

                    // 🔥 Envoi à la JSP
                    request.setAttribute("notesParMatiere", notesParMatiere);
                    request.setAttribute("moyennes", moyennes);
                    request.setAttribute("moyenneGenerale", moyenneGenerale);

                    contentPage = "/WEB-INF/view/ListeNote.jsp";
                }

                request.setAttribute("contentPage", contentPage);

                request.getRequestDispatcher("/WEB-INF/view/layout_etudiant.jsp")
                       .forward(request, response);

            } else {
                response.getWriter().println("<h1>Access Revoked</h1>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
System.out.println("servelt appele");
        Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne");
        String action = request.getParameter("action");
        String id_groupe = request.getParameter("id_groupe");

        if ("sinscrire".equals(action)) {
            try {
                etudiant.Sinscrire(id_groupe);

                request.getRequestDispatcher("/WEB-INF/view/layout_etudiant.jsp")
                       .forward(request, response);

            } catch (CourseConflictException e) {
                response.getWriter().println("<h1>Conflit d'emploi du temps</h1>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}