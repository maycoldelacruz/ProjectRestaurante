<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>  
<%@ page import="modelo.*" %>  
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
				<a class="btn btn-success"  href="Menu_RSociales.jsp">Menu Promociones</a>
						<a class="btn btn-primary" href="SubirContenido.jsp">Nuevo</a>
					<div class="container-fluid">

						<h2>
							<strong>Listado de Contenidos</strong>
						</h2>
						
					</div>
						
					<div class="row m-t-30">
						<div class="col-md-12">
						
						
						                    
							<!-- DATA TABLE-->
						<div class="table-responsive m-b-40">
							<table class="table ">
						    	<thead>
							        <tr>
							            <th>CODIGO</th>
							            <th>Título</th>
							            <th>Descripción</th>
							            <th>Archivo</th>
							            <th>Fecha de Creación</th>
							            <th>Usuario </th>
							            <th>Acciones</th>
							        </tr>
							    </thead>
						        <tbody >
						        	 <% for (Contenido contenido : Listado) {%>
						        	 <tr>
						        	 <td><%=contenido.getIdContenido() %></td>
						                <td width="15%"><b><%=contenido.getTitulo() %></b></td>
						                <td width="20%"><%=contenido.getDescripcion() %></td>
						                <td>
										    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(contenido.getArchivo()) %>" alt="Imagen del contenido" width="90">
										</td>

						                <td><%=contenido.getFechaCreacion() %></td>
						                
						                <td><%=contenido.getUNAME() %></td>
						                <td>
						                	<a class="btn btn-primary" href="PublicacionServlet?action=llevar&idContenido=<%=contenido.getIdContenido() %>">Publicar</a>
						                	<a class="btn btn-primary" href="PublicacionServlet?action=llevarpro&idContenido=<%=contenido.getIdContenido() %>">Programar</a>
						                	
						                    <a class="btn btn-success" href="ContenidoServlet?action=edit&idContenido=<%=contenido.getIdContenido() %>">Editar</a>
						                    <a class="btn btn-danger" href="ContenidoServlet?action=delete&idContenido=<%= contenido.getIdContenido() %>">Eliminar</a>

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
       