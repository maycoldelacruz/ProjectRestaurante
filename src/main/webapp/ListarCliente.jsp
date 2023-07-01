<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>  <!-- Importar la clase List -->
<%@ page import="modelo.*" %>  <!-- Importar la clase Contenido (reemplaza "tu.paquete" con el paquete real) -->
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Contenidos</title>
    
    <!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->

</head>



<body class="animsition">
<%
		List<Clientes> lisClientes=(List<Clientes>) request.getAttribute("clientes");
	%>
	 <!-- DIV PRINCIPAL--> 
     <div class="page-wrapper">
     
        <!-- MENU LATERAL-->
           <jsp:include page="Aside_Bar.jsp" />
	    <!-- MENU LATERAL-->
	   
	    <!-- PAGE CONTAINER-->
           <div class="page-container2">
           
             <!-- MENU PANEL-->
             <jsp:include page="Header.jsp" />
             <!-- END MENU PANEL-->
          
            <!-- CONTENIDO-->
			<div class="main-content">

				<div class="section__content section__content--p30">
					<div class="container-fluid">

						<h2>
							<strong>Listado de Clientes</strong>
						</h2>
						<p>Listado de contenidos subidos a la fecha</p>
					</div>
						
					<div class="row m-t-30">
						<div class="col-md-12">
						<a href="SubirContenido.jsp">Nuevo</a>
						<a href="MenuPagos.jsp">Menu</a>
						                    
							<!-- DATA TABLE-->
						<div class="table-responsive m-b-40">
							<table class="table table-borderless table-data3">
						
							<thead>
								<tr>
									<td >CODIGO</td>
									<td >DNI</td>
									<td>NOMBRE</td>
									<td >DIRECCION</td>
									<td>ESTADO</td>
									<td>ACCION</td>
									<td>ACCION</td>
								</tr>
							</thead>
							<tbody>
								<% for (Clientes tempClient: lisClientes) { %>
								<tr>
									<td ><%= tempClient.getCod_Cli()%></td>	
									<td><%= tempClient.getDni()%></td>	
									<td ><%= tempClient.getNomb() %></td>	
									<td><%= tempClient.getDirecci()%></td>
									<td><%=	tempClient.getEstad()	%></td>		
									<td><a href="ClienteServlet?instruccion=cargar&IdCliente=<%= tempClient.getCod_Cli()%>">Actualizar</a></td>	
									<td><a href="ClienteServlet?action=eliminar&IdCliente=<%= tempClient.getCod_Cli()%>">Eliminar</a></td>	
								</tr>		
								<% } %>
							</tbody>
							</table>
							
				</div>
				</div>
				</div>
				</div>
				</div>
			
			
	<!-- CONTENIDO-->
            
             <!-- FOOTER-->
             <jsp:include page="Footer.jsp" />
             <!-- END FOOTER-->
             
           </div>
	    <!-- END PAGE CONTAINER-->
	 </div>
	 <!-- END DIV PRINCIPAL-->   
	 
     <jsp:include page="Main_Vendor.jsp" />
</body>
</html>