<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*, model.Etudiant, model.Groupe,model.Enseignant, java.util.*" %>
    <%@ page import="utils.ConnectDatabase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Remplir Notes</title>
        <link href="${pageContext.request.contextPath}/static/css/connexion_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/create_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/enseignant.css" rel="stylesheet">
	</head>
<body>
<div style="display:grid; grid-template-columns:1fr 1fr 1fr; width:780px;" class="middle-form">
	<div class="ajout" >
		<select onchange="showCorrespondant(this)" id="group-select">
			<option></option>
			<%
	    	Enseignant enseignant = (Enseignant) request.getSession().getAttribute("personne");
			ArrayList<Groupe> groupes = enseignant.getGroupesCours();
	    	for(Groupe groupe : groupes){
	    	%>
	    		<option value="<%= groupe.idGroupe %>"><%= groupe.nom_groupe %></option>
	    	<%
	    		}
	    	%>
		</select>
	</div>
	
	<div>
		<%
		if (groupes.size() > 0){
		for(Groupe groupe : groupes){
		%>
			<select style="display:none;" data-name="students" data-id="<%= groupe.idGroupe %>">
				<option></option>
				<%
					for (String id : groupe.getEtudiant()){
				%>
					<option value="<%= id %>"><%= id %></option>
				<%
					}
				%>
			</select>
		<%
			}}
		%>
	</div>
	
	<div>
		<input id="note" type="text" required> <button onclick="save()" class="form-button">SAVE</button>
	</div>
</div>
<script type="text/javascript">
	function showCorrespondant(sel){
		const id = sel.value;
		document.querySelectorAll('[data-name="students"]').forEach(elt => {elt.style.display ="none";});
		document.querySelector('[data-id="' + id +'"]').style.display = "block"
	}

	async function save(){
		const note = document.getElementById("note").value;
		const id_groupe = document.getElementById("group-select").value;
		const matricule = document.querySelector('[data-id="' + id_groupe +'"]').value;
		const response = await fetch("/acceuilEnseignant",{
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				note, matricule, id_groupe
			})
		});
		console.log("happy");
		if (response.ok){
			const json = await response.json();
			console.log(json);
		}else{
			console.log("no");
		}
		
	}


</script>



</body>
</html>