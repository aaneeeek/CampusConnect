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
		<%@ page import="java.util.ArrayList, model.Enseignant, model.Groupe, model.Salle, model.Seance" %>
		<script>
			window.touteSeances = [];
			<%
				for (Seance seance : Seance.getListSeance()){
			%>
				window.touteSeances.push({salle: "<%= seance.salle %>", jour: "<%= seance.jour %>", heure: "<%= seance.heure %>", groupe: "<%= seance.groupe %>", enseignant: "<%= seance.enseignant %>"});
			<%
				}
			%>
			console.log(window.touteSeances);
		</script>
		<script src="${pageContext.request.contextPath}/static/javascript/plannifier.js"></script>
		<span style="color: darkblue; font-weight:700; font-size:18px; padding: 8px; border-radius: 5px; margin: 4px; background-color:white; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);"><a href="${pageContext.request.contextPath}/acceuilAdmin">&larr; Acceuil</a></span>
		<br><br>
		<div class="whole">
			<div class="teachers">
			<%	
				ArrayList<Enseignant> listeEnseignant = Enseignant.getListeEnseignant();
				if (listeEnseignant != null){
					for (Enseignant enseignant : listeEnseignant){
			%>
				<div data-name="teacher" id="<%= enseignant.idEnseignant %>" onclick="listGroupes(event); setEnseignant('<%= enseignant.idEnseignant %>')"><%= enseignant.nom %> <%= enseignant.prenom %></div>
			<%
					}
				}
			%>
			</div>
			<div>
				<div class="days">
					<span id="Lundi" onclick="setJour('Lundi')">Lundi</span>
					<span id="Mardi" onclick="setJour('Mardi')">Mardi</span>
					<span id="Mercredi" onclick="setJour('Mercredi')">Mercredi</span>
					<span id="Jeudi" onclick="setJour('Jeudi')">Jeudi</span>
					<span id="Vendredi" onclick="setJour('Vendredi')">Vendredi</span>
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
						<div style="display: none;" data-name="groups" data-id="<%= groupe.idEnseignant %>" id="<%= groupe.idGroupe %>" onclick="setGroupe('<%= groupe.idGroupe %>')">
							<span><%=groupe.getNom_groupe() %></span>
							<span><%=groupe.CapaciteGroupe() %>P</span>
						</div>
					<%
									}
								}
							}
						}
					%>
				</div>
				<br>
				<div style="height:fit-content; display: grid; grid-template-columns: 40px 1fr;">
					<div style="height: 100%;">
						<div style="height:48%; position: relative; background-color:aqua;" id="07:30:00" onclick="setHeure('07:30:00')">
							<span style="position: absolute; top: 3px">7:30</span>
							<span style="position: absolute; bottom: 3px">11:00</span>
						</div><br>
						<div style="height:48%; position: relative; background-color:aqua;" id="12:00:00" onclick="setHeure('12:00:00')">
							<span style="position: absolute; top: 3px">12:00</span>
							<span style="position: absolute; bottom: 3px">15:00</span>
						</div>
					</div>
					
					<div class="halls">
						<%
							for (Salle salle : Salle.getListeSalle()){
						%>
							<div id="<%= salle.idSalle %>" data-name="salle" onclick="setSalle('<%= salle.idSalle %>')">
								<div class="name"><%= salle.idSalle %></div>
								<div>
									<span><%= salle.capacite %> Places</span><br>
									<span><%= salle.type_salle %></span>
								</div>
							</div>
						<%
							}
						%>	
					</div>
				</div>
				<br>
				
			</div>
			<br>
			<div style="display: flex; flex-direction: row; justify-content: space-between; width: 100%; margin-top: 16px;">
				<button style="padding: 8px; font-size: 16px; font-weight: 700; color: white; background-color: green; border: none; border-radius: 5px; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);" onclick="setProgram()">Ajouter au Plan</button>
				<button style="padding: 8px; font-size: 16px; font-weight: 700; color: white; background-color: green; border: none; border-radius: 5px; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);" onclick="saveProgram()">Enregistrer</button>
			</div>
		</div>
		<script>
			function listGroupes(e){
				console.log(e.target.id);
				document.querySelectorAll(`[data-name="groups"]`).forEach(elt => {elt.style.display = "none"});
				document.querySelectorAll('[data-id="' + e.target.id + '"]').forEach(elt => {elt.style.display = "inline-block"});
				document.querySelectorAll(`[data-name="teacher"]`).forEach(elt => {elt.style.backgroundColor = "#eef2ff"});
				e.target.style.backgroundColor = 'darkblue';
			}
		</script>
		

	</body>
</html>