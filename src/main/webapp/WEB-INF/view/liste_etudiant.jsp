<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Liste d'étudiants</title>
        <link href="${pageContext.request.contextPath}/static/css/connexion_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/listes.css" rel="stylesheet">
    </head>
    <body>
    	<%@ page import="java.util.ArrayList, model.Etudiant" %>
        <h1 class="paragraph" style="font-size: 35px;">Listes des Etudiants</h1>
    	<table>
    		<thead>
    			<tr>
    				<th>Matricules</th>
    				<th>Nom</th>
    				<th>Prenom</th>
    				<th>Filiere</th>
    			</tr>
    		</thead>
    		<tbody>
    			<% 
			        ArrayList<Etudiant> listeEtudiant = (ArrayList<Etudiant>) request.getAttribute("listeEtudiant"); 
		        	if (listeEtudiant != null){
		        		for (Etudiant etudiant : listeEtudiant){
			     %>
			     		<tr>
			     			<td>
			     				<%= etudiant.getMatricule() %>
			     			</td>
			     			<td>
			     				<%= etudiant.nom %>
			     			</td>
			     			<td>
			     				<%= etudiant.prenom %>
			     			</td>
			     			<td>
			     				<%= etudiant.getFiliere() %>
			     			</td>
			     		</tr>
			     	
			     <% 
			     
		        		}
		        		
		        	} 
			     
			     %>
    		</tbody>
    	</table>
        
    </body>
</html>