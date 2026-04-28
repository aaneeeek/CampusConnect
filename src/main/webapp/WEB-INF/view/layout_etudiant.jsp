<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/static/css/meta.css">
<link href="${pageContext.request.contextPath}/static/css/connexion_user.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/create_user.css" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
 <div class="content">
         <div class="zer">
            <p>BIENVENUE SUR TON ESPACE ETUDIANT</p>
        </div>

        <div class="mot">
          <a href="${pageContext.request.contextPath}/acceuilEtudiant?action=sinscrire"><p> S'INSCRIRE</p></a>
          <a href="/EDTEtudiant" ><p> VOIR EDT</p></a>
          <a href="${pageContext.request.contextPath}/acceuilEtudiant?action=note"><p> VOIR NOTE</p></a>
        </div>
        <div class="der">
       <jsp:include page="${contentPage}"></jsp:include>
       </div>
    </div>
    
</body>
</html>