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
    	<%@ page import="java.util.ArrayList, model.Enseignant" %>
        <h1 class="paragraph" style="font-size: 35px;">Listes des Enseignants</h1>
        <table>
    		<thead>
    			<tr>
    				<th>Identifiant</th>
    				<th>Nom</th>
    				<th>Prenom</th>
    				<th>Departement</th>
                    <th>Statut</th>
    			</tr>
    		</thead>
    		<tbody>
    			<% 
			        ArrayList<Enseignant> listeEnseignant = (ArrayList<Enseignant>) request.getAttribute("listeEnseignant"); 
		        	if (listeEnseignant != null){
		        		for (Enseignant enseignant : listeEnseignant){
			     %>
			     		<tr>
			     			<td>
			     				<%= enseignant.idEnseignant %>
			     			</td>
			     			<td>
			     				<%= enseignant.nom %>
			     			</td>
			     			<td>
			     				<%= enseignant.prenom %>
			     			</td>
			     			<td>
			     				<%= enseignant.departement %>
			     			</td>
                            <td>
                 				<%= enseignant.statut %>
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