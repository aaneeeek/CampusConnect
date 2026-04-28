<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="model.Etudiant, model.Seance, java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0">
		<title>Emplois du temps</title>
		<link href="${pageContext.request.contextPath}/static/css/plannifier.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet">
	</head>
    <body>
        <div>
            <div class="days">
                <span id="Lundi" >Lundi</span>
                <span id="Mardi" >Mardi</span>
                <span id="Mercredi" >Mercredi</span>
                <span id="Jeudi" >Jeudi</span>
                <span id="Vendredi" >Vendredi</span>
            </div>
            <br>

            <div id="sc" style="width: 850px; margin: 0 auto; display: grid; grid-template-columns: repeat(5, 1fr); gap: 10px;">
            	<% Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne"); %>
            	<script type="text/javascript">
                    const seances = [
                            <% 	
                                for (Seance sc : etudiant.getProgramme()) { 
                            %>
                            {
                                heure: "<%= sc.heure %>",
                                jour: "<%= sc.jour %>",
                                salle: "<%= sc.salle %>",
                                groupe: "<%= sc.groupe %>",
                            },
                            <% } %>
                        ];
            		for (let h of ["07:30:00", "12:00:00"]) {
                        for (let j of ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi"]) {
                            let match = seances.find(sc => sc.heure === h && sc.jour === j);
                            for (sc of seances){
                                if (sc.heure === h && sc.jour === j){
                                    document.getElementById("sc").innerHTML +=  (`
                                        <div style="height: 70px; background-color: bisque">` +
                                            `<span style="font-weight: bold; color: blue;">` + sc.salle + `</span><br>` +
                                            `<span style="font-weight: bold; color: blue;">` + sc.groupe  + `</span><br>` +
                                            `<span style="font-weight: bold; color: blue;">` + h  + `</span>` +
                                        `</div>`);
                                    console.log("hello");
                                    break;
                                }
                                else if (sc === seances[seances.length - 1]){
                                    document.getElementById("sc").innerHTML += `
                                        <div style="height: 70px; background-color: red;"></div>
                                    `;
                                    console.log("not hello");
                                }
                            }
                        }
                    }
	            	
            		
            		
            	</script>
                
            </div>
        </div>
    </body>
</html>