<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.* , modelo.*" %>
    <%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Contenido</title>
    
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
  <% Contenido obj = (Contenido) request.getAttribute("contenido"); %>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <form action="ContenidoServlet?action=update" id="frmagregar" method="post" enctype="multipart/form-data">
        <div id="contact-form" class="form-container" data-form-container>
          <div class="col text-right">
            <a href="ContenidoServlet?action=list"><input type="button" class="btn btn-success" value="Volver"></a>
          </div>
          <div>
            <h2>Actualizar Contenido</h2>
          </div>
          <div class="form-group">
            <input type="text" name="idContenido" style="display:none;" value="<%= obj.getIdContenido() %>">
            <h3 >T�tulo</h3>
            <input type="text" class="form-control" id="titulo" name="titulo" value="<%= obj.getTitulo() %>">
          </div>
          <div class="form-group">
            <h3 >Descripci�n</h3>
            <textarea class="form-control" id="descripcion" name="descripcion"><%= obj.getDescripcion() %></textarea>
          </div>
          <div class="form-group">
            <label for="imagen">Selecciona Contenido</label>
            <div class="">
              <input type="file" class="" id="imagen" name="imagen" value="" onchange="mostrarImagen(event)">
              <span style="display: block;" id="nombreArchivo"><%= obj.getNombreArchivo() %></span>
            </div>
          </div>
          <div id="vistaPreviaImagen" class="form-group" > 
            <label for="imagenVistaPrevia">Vista previa:</label>
            <img id="imagenVistaPrevia" class="img-fluid" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(obj.getArchivo()) %>" >
          </div>
          <div class="row">
            <div class="col text-left">
              <input type="submit" class="btn btn-primary" value="Guardar">
              <a href="ContenidoServlet?action=list"><input type="submit" class="btn btn-danger" value="Cancelar"></a>
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
       