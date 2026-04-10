<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="utils.ConnectDatabase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</table>
    	
    	<table>
    	<tr>
    	<th> ID </th>
    	<th> Nom </th>
    	<th> Action</th>
    	</tr>
    	
    	<%
    	Connection connection = ConnectDatabase.getConnection();
    	PreparedStatement stmt = connection.prepareStatement("SELECT * FROM groupe");
    	ResultSet rs = stmt.executeQuery();
    	while(rs.next()){
    	%>
    		<tr>
    		<td><%= rs.getString("id_groupe") %></td>
    		<td><%= rs.getString("nom_groupe") %></td>
    		<td>
    		<form method= "post" action = "${pageContext.request.contextPath}/acceuilEtudiant">
    		<input type="hidden" name = "id_groupe" value = "<%= rs.getString("id_groupe") %>">
    		<a href ="${pagCcontext.request.contextPath }/acceuilEtudiant?action=sinscrire"><button type="submit"> S'inscrire </button></a>
    		</form>
    		</td>
    		</tr>
    	<% } 
    	%>
    		
    	
    	
    	</table>

</body>
</html>