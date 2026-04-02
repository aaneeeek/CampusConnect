<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Insert title here</title>
        <link href="${pageContext.request.contextPath}/static/css/create_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
    </head>
    </head>
    <body>
        <span style="color: darkblue; font-weight:700; font-size:18px; padding: 8px; border-radius: 5px; margin: 4px; background-color:white; box-shadow:0px 0px 20px rgba(2, 2, 47, 0.386);"><a href="${pageContext.request.contextPath}/acceuilAdmin">&larr; Acceuil</a></span>
        <form method="post" action="">
            <div class="middle-form">
                <p class="paragraph" style="font-size: 35px;">Formulaire de Création de Compte</p>
                <section class="split">
                    <div class="input-div">
                        <label>Prenom</label>
                        <input type="text" name="prenom" required>
                    </div>
                    <div class="input-div">
                        <label>Nom</label>
                        <input type="text" name="nom" required>
                    </div>
                    <div class="input-div">
                        <label>Date de naissance</label>
                        <input type="date" name="date_naissance" required>
                    </div>
                    <div class="input-div">
                        <label>Mot de Passe</label>
                        <input type="password" name="mot_de_passe" required>
                    </div>
                </section>
                <section id="section-2">
                    <p class="paragraph">Type de Compte</p>
                    <div class="split">
                        <div class="input-div">
                            <label>Compte Etudiant</label>
                            <input type="radio" name="type_compte" value="student" onchange="addInfo(this)" required>
                        </div>
                        <div class="input-div">
                            <label>Compte Enseignant</label>
                            <input type="radio" name="type_compte" value="teacher" onchange="addInfo(this)" required>
                        </div>
                    </div>
                    <div id="extra"></div>
                </section>
                
            </div>
        </form>
        <script src="${pageContext.request.contextPath}/static/javascript/create_user.js"></script>
    </body>
</html>