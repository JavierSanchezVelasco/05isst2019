<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Solicitud View</title>
	<link rel="stylesheet" type="text/css" href="ISST-21/WebContent/CSS/estilos.css">
</head>
<body>
	<shiro:user>
    	Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
		<h2>Sigue los pasos para completar tu solicitud</h2>
		<c:if test="${solicitud.estado == 1}">
		<h3>Rellena el siguiente formulario</h3>
		<form action="FormularioServlet" method="get">
			<input type = "hidden" name = "id" value ="${id}" />
			<button type="submit">Rellenar Formulario</button>
		</form>
		</c:if>
		<c:if test="${solicitud.estado == 2}">
		<h3>Sube la memoria de tu trabajo</h3>
		<form action = "MemoriaServlet" method = "post" enctype = "multipart/form-data">
			<input type = "file" name = "file" />
			<input type = "hidden" name = "id" value ="${id}" />
			<input type = "hidden" name = "emailInvestigador" value ="${emailInvestigador}" />			
			<button type = "submit" > Subir memoria </button>
		</form>
		</c:if>
		<c:if test="${solicitud.estado == 3}">
		<h3>Has completado la solicitud correctamente</h3>
		<form action="EnviarServlet" method="post">
			<input type = "hidden" name = "id" value ="${id}" />
			<input type = "hidden" name = "email" value ="${solicitud.investigador.email}" />	
			<input type = "hidden" name = "solicitudes_list" value ="${solicitudes_list}" />
			<p>Pulsa para enviar tu solicitud <button type="submit">Enviar Solicitud</button></p>
		</form>
		</c:if>
		<c:if test="${solicitud.estado == 4}">
		<h4>Solicitud enviada para evaluar.</h4>
		</c:if>
		<form action="InvestigadorServlet" method="get">
			<input type = "hidden" name = "email" value ="${solicitud.investigador.email}" />	
			<input type = "hidden" name = "solicitudes_list" value ="${solicitudes_list}" />
			<p><button type="submit">Back</button></p>
		</form>
		
	</shiro:user>
</body>
</html>