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
        <h1 class="paragraph" style="font-size: 35px;">Campus Admin</h1>
        <div class="main-section">
            <div class="main-elt">
                <button class="elt">Gestion Etudiants</button>
                <ul>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/listeEtudiant") %>">Liste d'étudiant</a></li>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/createUser") %>">Création de Compte Etudiant</a></li>
                </ul>
            </div>

            <div class="main-elt">
                <button class="elt">Gestion Enseignants</button>
                <ul>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/listeEnseignant") %>">Liste d'enseignant</a></li>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/createUser") %>">Création de Compte Enseignant</a></li>
                    <li>Assignation de Cours</li>
                    <li>Assignation de groupes de Cours</li>
                </ul>
            </div>

            <div class="main-elt">
                <button class="elt">Gestion Cours</button>
                <ul>
                    <li>Liste Cours</li>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/ajouterCours") %>">Création de Cours</a></li>
                    <li>Création de Groupe de Cours</li>
                    <li><a href="<%=response.encodeURL(request.getContextPath() +"/PlanifierCours") %>">Plannifier les sceances de cours</a></li>
                </ul>
            </div>

            
        </div>
    </body>
</html>