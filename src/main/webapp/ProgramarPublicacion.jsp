<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.* , modelo.*" %>
    <%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Programar Publicación</title>
    
    <!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->

</head>

<body class="animsition">
     
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
					<div class="container justify-content-center">
			  <% Contenido obj = (Contenido) request.getAttribute("contenido"); 
			  %>
			  <div class="row justify-content-center">
			    <div class="col-md-6">
			      <form action="PublicacionServlet?action=program" id="frmagregar" method="post" >
			        <div id="contact-form" class="form-container" data-form-container>
			          <div class="col text-right">
			            <a href="ContenidoServlet?action=list"><input type="button" class="btn btn-success" value="Volver"></a>
			          </div>
			          <div>
			            <h2>Publicar Contenido</h2>
			          </div>
			          <div class="form-group">
			            <input type="text" name="idContenido" style="display:blok;" value="<%= obj.getIdContenido() %>">
			            <h3 >Título</h3>
			            <input disabled="disabled" type="text" class="form-control" id="titulo" name="titulo" value="<%= obj.getTitulo() %>">
			          </div>
			          <div class="form-group">
			            <h3 >Descripción</h3>
			            <textarea disabled="disabled" class="form-control" id="descripcion" name="descripcion"><%= obj.getDescripcion() %></textarea>
			          </div>
			          <div class="form-group">
			            <label for="imagen" style="display:none;">Selecciona Contenido</label>
			            <div class="">
			              <input type="file" style="display:none;" id="imagen" name="imagen" value="" onchange="mostrarImagen(event)">
			              <span style="display: none;" id="nombreArchivo"><%= obj.getNombreArchivo() %></span>
			            </div>
			          </div>
			          <div class="form-group">
				        <label for="programarFecha">Fecha de Programación:</label>
				        <input type="datetime-local" class="form-control" name="fecha" id="programarFecha" style="width: 200px;">
				      </div>
				      
				      
			          <div id="vistaPreviaImagen" class="form-group" > 
			            <label for="imagenVistaPrevia">Vista previa imagen:</label>
			            <img id="imagenVistaPrevia" class="img-fluid" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(obj.getArchivo()) %>" >
			          </div>
			          <div class="row">
			            <div class="col text-left">
			             <input type="submit" class="btn btn-primary" value="Programar Publicación">
			            </div>
			          </div>
			        </div>
			      </form>
			    </div>
			  </div>
			</div>
			
			<script>
			  function mostrarImagen(event) {
			    var input = event.target;
			    var nombreArchivo = input.files[0].name;
			    document.getElementById("nombreArchivo").textContent = nombreArchivo;
			
			    var vistaPreviaImagen = document.getElementById("vistaPreviaImagen");
			    var imagenVistaPrevia = document.getElementById("imagenVistaPrevia");
			
			    if (input.files && input.files[0]) {
			      var lector = new FileReader();
			
			      lector.onload = function(e) {
			        imagenVistaPrevia.src = e.target.result;
			        vistaPreviaImagen.style.display = "block";
			      };
			
			      lector.readAsDataURL(input.files[0]);
			    } else {
			      vistaPreviaImagen.style.display = "none";
			      imagenVistaPrevia.src = "";
			    }
			  }
			</script>
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
       