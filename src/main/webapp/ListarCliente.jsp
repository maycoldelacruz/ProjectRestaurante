<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%
		List<Clientes> lisClientes=(List<Clientes>) request.getAttribute("LISTACLIENTES");
	%>
	
<body>
			
			<div class="d-flex text-center">
			<div class="col-sm-8">
				<div class="table table-hover text-center">
						<h2>Listado de Clientes</h2>
							
							<table>
								<tr>
									<td >CODIGO</td>
									<td >DNI</td>
									<td>NOMBRE</td>
									<td >DIRECCION</td>
									<td>ESTADO</td>
									<td>ACCION</td>
									<td>ACCION</td>
								</tr>
								
								<% for (Clientes tempClient: lisClientes) { %>
								<tr>
									<td ><%= tempClient.getCod_Cli()%></td>	
									<td><%= tempClient.getDni()%></td>	
									<td ><%= tempClient.getNomb() %></td>	
									<td><%= tempClient.getDirecci()%></td>
									<td><%=	tempClient.getEstad()	%></td>		
									<td><a href="ClienteServlet?instruccion=cargar&IdCliente=<%= tempClient.getCod_Cli()%>">Actualizar</a></td>	
									<td><a href="ClienteServlet?instruccion=eliminar&IdCliente=<%= tempClient.getCod_Cli()%>">Eliminar</a></td>	
								</tr>		
								<% } %>
							
							</table>
							<div style="margin-top: 20px;" class="btn">
							<input class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='InsertarCliente.jsp'"/>
							<!-- <input class="btn btn-primary" type="button" value="Modificar" onclick="window.location.href='ModificarInsumo.jsp'"/> -->
							</div>
				
				</div>
			</div>	
		</div>
			
	
</body>
</html>