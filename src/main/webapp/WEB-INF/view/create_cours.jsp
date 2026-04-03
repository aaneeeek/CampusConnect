<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Création de Compte</title>
        <link href="${pageContext.request.contextPath}/static/css/create_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/acceuil_admin.css" rel="stylesheet">
    </head>
    </head>
    <body>
        <%@ page import="java.util.ArrayList, model.Enseignant" %>
        <span style="color: darkblue; font-weight:700; font-size:18px; padding: 8px; border-radius: 5px; margin: 4px; background-color:white; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);"><a href="${pageContext.request.contextPath}/acceuilAdmin">&larr; Acceuil</a></span>
        <form method="post" action="">
            <div class="middle-form" style="position: relative;">
                <p class="paragraph" style="font-size: 35px;">Créer Un Nouveau Cours</p>
                <div class="split">
                    <div class="input-div">
                        <label>Intitulé du Cours</label>
                        <input type="text" name="intitule" required>
                    </div>
                    <div class="input-div">
                        <label>Code du Cours</label>
                        <input type="text" name="code_cours" required>
                    </div>
                    <div class="input-div">
                        <label>Volume Horraire</label>
                        <input type="number" name="volume_horraire" required>
                    </div>
                    <div class="input-div">
                        <label>Capacité du Cours</label>
                        <input type="number" name="capacite" required>
                    </div>
                    <div class="input-div">
                        <label>Enseignant chargé de cours</label>
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
                </div>
                
                    <label>Description du Cours</label>
                    <textarea name="description" id=""></textarea>
                
                <br>

                <section style="position: relative;">
                    <p class="paragraph">Groupes de Cours</p>
                    <div id="groupes"></div>
                    <button onclick="addGroupe(event)" class="nouveau">&plus; Nouveau</button>
                </section><br><br>
                <button class="form-button" style="position:absolute; right:10px; bottom:15px;" type="submit">Créer Cours</button>
            </div>
            
        </form>
        <script>
            let groupeCount = 0;

            const addGroupe = (e=null)=>{
                if(e != null){
                    e.preventDefault();
                }
                const groupeContainer = document.getElementById("groupes");
                groupeContainer.innerHTML += `
                <br>
                <hr width="90%" color="darkblue" size="3px">
                    <div class="split">
                        <div class="input-div">
                                <label>Nom de Groupe</label>
                                <input type="text" name="nom_groupe_${groupeCount}" required>
                            </div>
                        <div class="input-div">
                            <label>Capacité du Groupe</label>
                            <input type="number" name="capacite_groupe_${groupeCount}" required>
                        </div>
                        <div class="input-div">
                            <label>Volume Horraire</label>
                            <input type="number" name="volume_horraire_groupe_${groupeCount}" required>
                        </div>
                        <div class="input-div">
                            <label>Responsable</label>
                            <select name="id_enseignant_${groupeCount}">
                                <option value=""></option>
                                <% 
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
                        
                    </div>
                `;
                groupeCount += 1;
            }

            addGroupe();
        </script>

    </body>
</html>