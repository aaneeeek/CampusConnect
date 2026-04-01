<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Création de Compte</title>
        <link href="${pageContext.request.contextPath}/static/css/connexion_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/acceuil_admin.css" rel="stylesheet">
    </head>
    </head>
    <body>
        <%@ page import="java.util.ArrayList, model.Enseignant" %>
        <form method="post" action="">
            <div class="input-div">
                <label>Intitulé du Cours</label>
                <input type="text" name="intitule" required>
            </div>
            <div class="input-div">
                <label>Code du Cours</label>
                <input type="text" name="code_cours" required>
            </div>
            <div class="input-div">
                <label>Description du Cours</label>
                <textarea name="description" id=""></textarea>
            </div>
            <div class="input-div">
                <label>Volume Horraire</label>
                <input type="number" name="code_cours" required>
            </div>
            <div class="input-div">
                <label>Capacité du Cours</label>
                <input type="number" name="capacite" required>
            </div>
            <div class="input-div">
                <label>Capacité du Cours</label>
                <select name="id_enseignant">
                    <option value=""></option>
                    <% 
                        ArrayList<Enseignant> listeEnseignant = (ArrayList<Enseignant>) request.getAttribute("listeEnseignant"); 
                        if (listeEnseignant != null){
                            for (Enseignant enseignant : listeEnseignant){
                    %>
                        <option value="<%= enseignant.idEnseignant %>"><%= enseignant.nom %> <%= enseignant.prenom %></option>
                    <% 
			     
                            }
                            
                        } 
                    
                    %>
                </select>
            </div>
        </form>
        <script src="${pageContext.request.contextPath}/static/javascript/create_cours.js"></script>

    </body>
</html>