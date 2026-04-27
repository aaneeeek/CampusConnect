<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String, Float> liste= (Map<String, Float>) request.getAttribute("ListeNote");
%>
<table>
<tr>
<th>Matiere</th>
<th>Note</th>
</tr>
<%
if(liste != null){
	for(Map.Entry<String, Float> entry: liste.entrySet()){
%>
<tr>
<td><%= entry.getKey() %></td>
<td><%= entry.getValue() %></td>
</tr>
<%
	}
}else{
%>
<p>Aucune note</p>
<%
}
%>
</table>
</body>
</html>