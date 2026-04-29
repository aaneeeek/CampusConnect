<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Connexion</title>
        <link href="${pageContext.request.contextPath}/static/css/connexion_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/create_user.css" rel="stylesheet">
    </head>
    </head>
    <body>
        <form method="post" action="">
            <div class="middle-form">
                <p class="paragraph" style="font-size: 35px;">Formulaire De Connexion</p>
                <br>
                <p class="paragraph">Type de Compte</p>
                <div class="split_three">
                    <div class="input-div" style="width: 65%;">
                        <label>Compte Etudiant</label>
                        <input type="radio" name="type_compte" value="etudiant" required checked>
                    </div>
                    <div class="input-div" style="width: 65%;">
                        <label>Compte Enseignant</label>
                        <input type="radio" name="type_compte" value="enseignant" required>
                    </div>
                    <div class="input-div" style="width: 65%;">
                        <label>Compte Admin</label>
                        <input type="radio" name="type_compte" value="administrateur" required>
                    </div>
                </div>
                <div class="input-div">
                    <label>Identifiant</label>
                    <input type="text" name="identifiant" required>
                </div>
                <div class="input-div">
                    <label>Mot de Passe</label>
                    <input type="password" name="mot_de_passe" required>
                </div><br><br>
                <button class="form-button" style="position:absolute; right:10px; bottom:15px;" type="submit">Connexion</button>
            </div>
        </form>
    </body>
</html>