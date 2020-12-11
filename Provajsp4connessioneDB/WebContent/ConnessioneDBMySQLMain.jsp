<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.provaDB.jsp.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="Provajsp4.css">
<title>Connessione a DB MySQL</title>
</head>
<body>
<h1>Prova connessione con DB MySQL</h1>
	<div>
		<%
		ConnessioneDriverMySQL connettidriver = new ConnessioneDriverMySQL();
		connettidriver.connettiDriver();
		if (connettidriver.getErrore()==1){
			out.print("<p>"+"Connessione driver ok"+"</p>");
		} else {
			out.print("<p>"+"Errore caricamento driver"+"</p>");
		}
		ConnessioneDBMySQL impostaconnessioneDB=new ConnessioneDBMySQL();
		Connection connessione=impostaconnessioneDB.connettiDB("localhost:3306/matteo?serverTimezone=UTC","AccountProva","rn5skCZucrBfARRaCzUT.");
		if (impostaconnessioneDB.getErrore()==1){
			out.print("<p>"+"Connessione DB ok"+"</p>");
		} else {
			out.print("<p>"+"Errore connessione DB"+"</p>");
		}
		%>
		<table>
		<tr>
		<th>Cognome</th>
		<th>Nome</th>
		<th>telefono</th>
		</tr>
		
		<%
		try {
			Statement stm = connessione.createStatement();
			
			out.print("<p>"+"Oggetto Statement ok"+"</p>");
			ResultSet rs = stm.executeQuery("select * from prova");
			while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString("cognome")+ "</td>" + "<td>"+ rs.getString("nome")+ "</td>"+ "<td>"+ rs.getString("telefono") +"</td>");
				out.print("</tr>");
			}
			
		} catch(Exception e){
			out.print("<p>"+"Errore sql"+"</p>");
			out.print("<p>"+e.getMessage()+"</p>");
		}
		/*try {
			ConnessioneDriverMySQL connettidriver = new ConnessioneDriverMySQL();
			connettidriver.connettiDriver();
			out.print("<p>"+"Connessione driver ok"+"</p>");
		} catch (Exception e){
			out.print("<p>"+"Errore generico"+"</p>");
			out.print("<p>"+ e.getMessage()+"</p>");
		}*/
		%>
		</table>
	</div>
</body>
</html>