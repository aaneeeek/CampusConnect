<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*, model.Etudiant" %>
    <%@ page import="utils.ConnectDatabase" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/etudiant.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    	
    	<table>
    	<tr>
    	<th> ID </th>
    	<th> Nom </th>
    	<th> Action</th>
    	</tr>
    	
    	<%
    	Etudiant etudiant = (Etudiant) request.getSession().getAttribute("personne");
    	Connection connection = ConnectDatabase.getConnection();
    	PreparedStatement stmt = connection.prepareStatement(
    			"SELECT g.id_groupe, g.nom_groupe, g.id_enseignant " +
    				    "FROM groupe g " +
    				    "WHERE NOT EXISTS (" +
    				    "    SELECT 1 FROM inscrire i " +
    				    "    WHERE i.id_groupe = g.id_groupe " +
    				    "    AND i.matricule = ?" +
    				    ")"
    			);
    	try{
    	stmt.setString(1, etudiant.getMatricule());
    	ResultSet rs = stmt.executeQuery();
    	while(rs.next()){
    	%>
    		<tr>
    		<td><%= rs.getString("id_groupe") %></td>
    		<td><%= rs.getString("nom_groupe") %></td>
    		<td>
    		<form method= "post" action = "${pageContext.request.contextPath}/acceuilEtudiant?action=sinscrire">
    		<input type="hidden" name = "id_groupe" value = "<%= rs.getString("id_groupe") %>">
    		<a href ="${pagCcontext.request.contextPath }/acceuilEtudiant?action=sinscrire"><button type="submit"> S'inscrire </button></a>
    		</form>
    		</td>
    		</tr>
    	<% } }catch(Exception e){
    		%>
    		<h2>error</h2>
    		<%
    	}
    	%>
    		
    	
    	
    	</table>

</body>
</html>