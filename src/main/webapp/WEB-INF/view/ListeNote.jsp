<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/note.css" rel="stylesheet">

<!-- 🔥 AJOUT GRAPHE -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<meta charset="UTF-8">
<title>Bulletin de Notes</title>
</head>

<body>

<div class="notes-container">
    <div class="notes-card">

        <h2 class="notes-title">Bulletin de Notes</h2>

        <%
        Map<String, Map<String, Float>> notesParMatiere =
            (Map<String, Map<String, Float>>) request.getAttribute("notesParMatiere");

        Map<String, Float> moyennes =
            (Map<String, Float>) request.getAttribute("moyennes");

        Float moyenneGenerale =
            (Float) request.getAttribute("moyenneGenerale");

        String statut = (moyenneGenerale != null && moyenneGenerale >= 10)
                        ? "Admis" : "Rattrapage";
        %>

        <!-- STATS -->
        <div class="stats">
            <div class="stat-box">
                <p>Moyenne Générale</p>
                <h3><%= moyenneGenerale != null ? String.format("%.2f", moyenneGenerale) : "0.00" %></h3>
            </div>

            <div class="stat-box <%= (moyenneGenerale != null && moyenneGenerale >= 10) ? "success" : "danger" %>">
                <p>Statut</p>
                <h3><%= statut %></h3>
            </div>
        </div>

        <% if(notesParMatiere != null && !notesParMatiere.isEmpty()){ %>

        <!-- TABLE -->
        <table class="notes-table">
            <thead>
                <tr>
                    <th>Matière</th>
                    <th>CM</th>
                    <th>TD</th>
                    <th>TP</th>
                    <th>Moyenne</th>
                </tr>
            </thead>
            <tbody>

            <%
            for(String matiere : notesParMatiere.keySet()){

                Map<String, Float> notes = notesParMatiere.get(matiere);

                float cm = notes.getOrDefault("CM", 0f);
                float td = notes.getOrDefault("TD", 0f);
                float tp = notes.getOrDefault("TP", 0f);

                float moyenne = moyennes.getOrDefault(matiere, 0f);

                String classe = moyenne >= 16 ? "note-good"
                               : (moyenne >= 10 ? "note-medium" : "note-bad");
            %>

                <tr>
                    <td><%= matiere %></td>
                    <td><%= cm %></td>
                    <td><%= td %></td>
                    <td><%= tp %></td>
                    <td class="<%= classe %>">
                        <strong><%= String.format("%.2f", moyenne) %></strong>
                    </td>
                </tr>

            <% } %>

            </tbody>
        </table>

        <!-- 📊 GRAPHE -->
        <canvas id="chart" style="margin-top:30px;"></canvas>

        <script>
        document.addEventListener("DOMContentLoaded", function(){

            const labels = [
                <% for(String matiere : moyennes.keySet()){ %>
                    "<%= matiere %>",
                <% } %>
            ];

            const data = [
                <% for(Float m : moyennes.values()){ %>
                    <%= m %>,
                <% } %>
            ];

            if(labels.length === 0) return;

            new Chart(document.getElementById("chart"), {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Moyenne par matière',
                        data: data
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 20
                        }
                    }
                }
            });

        });
        </script>

        <!-- PDF -->
        <div style="text-align:center; margin-top:20px;">
            <a href="exportPDF">
                <button class="form-button">Télécharger le bulletin PDF</button>
            </a>
        </div>

        <% } else { %>

            <div class="no-data">Aucune note disponible</div>

        <% } %>

    </div>
</div>

</body>
</html>