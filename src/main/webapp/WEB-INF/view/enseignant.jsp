<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Groupe, model.Enseignant, java.util.*" %>

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

<div class="middle-form" style="display:grid; grid-template-columns:1fr 1fr 1fr; width:780px; gap:15px;">

    <!-- GROUPE -->
    <div>
        <label>Choisir Groupe</label>
        <select onchange="showCorrespondant(this)" id="group-select">
            <option value="">-- Sélectionner --</option>

            <%
            Enseignant enseignant = (Enseignant) request.getSession().getAttribute("personne");
            ArrayList<Groupe> groupes = enseignant.getGroupesCours();

            for(Groupe groupe : groupes){
            %>
                <option value="<%= groupe.idGroupe %>">
                    <%= groupe.code_cours %> - <%= groupe.nom_groupe %>
                </option>
            <%
            }
            %>
        </select>
    </div>

    <!-- ETUDIANTS -->
    <div>
        <label>Étudiant</label>

        <%
        for(Groupe groupe : groupes){
        %>
            <select style="display:none;" data-name="students" data-id="<%= groupe.idGroupe %>">
                <option value="">-- Choisir étudiant --</option>

                <%
                try {
                    for (String id : groupe.getEtudiant()){
                %>
                        <option value="<%= id %>"><%= id %></option>
                <%
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
                %>
            </select>
        <%
        }
        %>
    </div>

    <!-- NOTE -->
    <div>
        <label>Note</label>
        <input id="note" type="number" step="0.1" min="0" max="20" placeholder="Ex: 15.5" required>

        <button type="button" onclick="save()" class="form-button" style="margin-top:10px;">
            Enregistrer
        </button>
    </div>

</div>

<script>

function showCorrespondant(sel){
    const id = sel.value;

    document.querySelectorAll('[data-name="students"]').forEach(elt => {
        elt.style.display ="none";
    });

    const target = document.querySelector('[data-id="' + id +'"]');
    if(target){
        target.style.display = "block";
    }
}

async function save(){

    const note = document.getElementById("note").value;
    const id_groupe = document.getElementById("group-select").value;

    const studentSelect = document.querySelector('[data-id="' + id_groupe +'"]');

    if(!id_groupe || !studentSelect || !studentSelect.value){
        alert("Veuillez sélectionner un groupe et un étudiant");
        return;
    }

    const matricule = studentSelect.value;

    const response = await fetch("${pageContext.request.contextPath}/acceuilEnseignant",{
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: new URLSearchParams({
            note: note,
            matricule: matricule,
            id_groupe: id_groupe
        })
    });

    if (response.ok){
        alert("✅ Note enregistrée avec succès");
    } else {
        const text = await response.text();
        alert("❌ " + text);
    }
}

</script>

</body>
</html>