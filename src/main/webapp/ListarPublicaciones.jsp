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
     List<Contenido> Listado = (List<Contenido>) request.getAttribute("contenidos"); 
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
							<strong>Listado de Contenidos</strong>
						</h2>
						<p>Listado de contenidos subidos a la fecha</p>
					</div>
						
					<div class="row m-t-30">
						<div class="col-md-12">
						<a href="SubirContenido.jsp">Nuevo</a>
						<a href="Menu_RSociales.jsp">Menu</a>
						                    
							<!-- DATA TABLE-->
						<div class="table-responsive m-b-40">
							<table class="table table-borderless table-data3">
						    	<thead>
							        <tr>
							            <th>ID</th>
							            <th>Título</th>
							            <th>Descripción</th>
							            <th>Archivo</th>
							            <th>Fecha de Creación</th>
							            <th>Usuario ID</th>
							            <th>Acciones</th>
							        </tr>
							    </thead>
						        <tbody>
						        	 <% for (Contenido contenido : Listado) {%>
						        	 <tr>
						        	 <td><%=contenido.getIdContenido() %></td>
						                <td><%=contenido.getTitulo() %></td>
						                <td><%=contenido.getDescripcion() %></td>
						                <td>
										    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(contenido.getArchivo()) %>" alt="Imagen del contenido" width="50">
										</td>

						                <td><%=contenido.getFechaCreacion() %></td>
						                
						                <td><%=contenido.getUNAME() %></td>
						                <td>
						                	<a href="PublicarContenido.jsp">Publicar</a>
						                	<a href="ProgramarPublicacion.jsp">Programar</a>
						                	
						                    <a href="ContenidoServlet?action=edit&idContenido=<%=contenido.getIdContenido() %>">Editar</a>
						                    <a href="ContenidoServlet?action=delete&idContenido=<%= contenido.getIdContenido() %>">Eliminar</a>

						                </td>
						               </tr>
						               <%} %>
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
       