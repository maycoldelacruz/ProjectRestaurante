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
     List<Publicacion> Listado = (List<Publicacion>) request.getAttribute("publicaciones"); 
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
				<a class="btn btn-success"  href="Menu_RSociales.jsp">Menu Promociones</a>
						
					<div class="container-fluid">

						<h2>
							<strong>Promociones publicadas</strong>
						</h2>
						
					</div>
						
					
						                    
							<!-- DATA TABLE-->
						
							<div class="col-md-3" style="margin-top: 20px;">
		             			<a class="btn btn-primary" href="ContenidoServlet?action=list">Nuevo</a>
							</div>
							<table class="table ">
						    	<thead>
							        <tr>
							            <th>ID</th>
							            <th>Título</th>
							            <th>Imagen</th>							            
							            <th>Fecha de Publicacion</th>
							            <th>Estado</th>
							            <th>Acciones</th>
							        </tr>
							    </thead>
						        <tbody>
						        	 <% for (Publicacion publicacion : Listado) {%>
						        	 <tr>
						        	 <td><%=publicacion.getIdPublicacion() %></td>
						                <td><%=publicacion.getTitulo() %></td>
						                <td>
										    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(publicacion.getArchivo()) %>" alt="Imagen del contenido" width="50">
										</td>

						                <td><%=publicacion.getFechapublicacion()%></td>
						                
						                <td><%=publicacion.getEstado()%></td>
						                <td>
						                	<a href="PublicacionServlet?action=delete&idPublicacion=<%= publicacion.getIdPublicacion()%>">Eliminar</a>
						                </td>
						               </tr>
						               <%} %>
						        </tbody>						            
						     </table>        
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
       