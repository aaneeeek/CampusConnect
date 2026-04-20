<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Planning des cours</title>
		<link href="${pageContext.request.contextPath}/static/css/plannifier.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
	</head>
	<body>
		<%@ page import="java.util.ArrayList, model.Enseignant, model.Groupe, model.Salle" %>
		<span style="color: darkblue; font-weight:700; font-size:18px; padding: 8px; border-radius: 5px; margin: 4px; background-color:white; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);"><a href="${pageContext.request.contextPath}/acceuilAdmin">&larr; Acceuil</a></span>
		<br><br>
		<div class="whole">
			<div class="teachers">
			<%	
				ArrayList<Enseignant> listeEnseignant = Enseignant.getListeEnseignant();
				if (listeEnseignant != null){
					for (Enseignant enseignant : listeEnseignant){
			%>
				<div id="<%= enseignant.idEnseignant %>" onclick="listGroupes(event)"><%= enseignant.nom %> <%= enseignant.prenom %></div>
			<%
					}
				}
			%>
			</div>
			<div>
				<div class="days">
					<span>Lundi</span>
					<span>Mardi</span>
					<span>Mercredi</span>
					<span>Jeudi</span>
					<span>Vendredi</span>
				</div>
				<br>
				<div class="halls">
					<%
						for (Salle salle : Salle.getListeSalle()){
					%>
						<div>
							<div class="name"><%= salle.idSalle %></div>
							<div>
								<span><%= salle.capacite %> Places</span>
								<span><%= salle.type_salle %></span>
							</div>
						</div>
					<%
						}
					%>	
				</div>
				<br>
				<div class="groups" id="group-section">
					<%
						if (listeEnseignant != null){
							for (Enseignant enseignant : listeEnseignant){
								ArrayList<Groupe> listeGroupes = enseignant.getGroupesCours();
								if (listeGroupes != null){
									for (Groupe groupe : listeGroupes){
					%>
						<div style="display: none;" data-name="groups" data-id="<%= groupe.idEnseignant %>">
							<span><%=groupe.getNom_groupe() %></span>
							<span><%=groupe.CapaciteGroupe() %></span>
						</div>
						<script>
							console.log("<%=groupe.getNom_groupe() %>");
						</script>
					<%
									}
								}
							}
						}
					%>
				</div>
			</div>
		</div>
		<script>
			function listGroupes(e){
				console.log(e.target.id);
				document.querySelectorAll(`[data-name="groups"]`).forEach(elt => {elt.style.display = "none"});
				document.querySelectorAll('[data-id="' + e.target.id + '"]').forEach(elt => {console.log(e.target.id); elt.style.display = "inline-block"});
				
			}
		</script>
	</body>
</html>