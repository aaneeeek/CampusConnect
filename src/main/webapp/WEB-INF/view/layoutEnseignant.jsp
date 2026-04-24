<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/static/css/meta.css">
<meta charset="UTF-8">
</head>
<body>
	  <div class="content">
         <div class="zer">
            <p>BIENVENU SUR TON ESPACE ENSEIGNANT</p>
        </div>

        <div class="mot">
          <a href="${pageContext.request.contextPath}/acceuilEnseignant?action=edt" ><p> VOIR EDT</p></a>
          <a href="${pageContext.request.contextPath}/acceuilEnseignant?action=remplir" ><p> REMPLIR NOTE</p></a>
        </div>
       <div class="der">
       <jsp:include page="${contentPage}"></jsp:include>
       </div>
        
    </div>
</body>
</html>