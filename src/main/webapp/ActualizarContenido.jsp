<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar Contenido</title>
    
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
					<!-- <div class="container justify-content-center">
					  <div class="row justify-content-center">
					  	
					    <div class="col-md-6">
					      <form>
					      <h2>Actualizar Contenido</h2>
					        <div class="form-group">
					          <label for="titulo">Título</label>
					          <input type="text" class="form-control" id="titulo">
					        </div>
					        <div class="form-group">
					          <label for="descripcion">Descripción</label>
					          <textarea class="form-control" id="descripcion"></textarea>
					        </div>
					        <div class="form-group">
					          <label for="imagen">Selecciona Contenido</label>
					          <div class="custom-file">
					            <input type="file" class="custom-file-input" id="imagen" onchange="mostrarImagen(event)">
					            <label class="custom-file-label" for="imagen">Buscar en mi PC</label>
					          </div>
					          <small id="imagenHelpBlock" class="form-text text-muted">
					            Archivo seleccionado: <span id="nombreArchivo"></span>
					          </small>
					        </div>
					        <div id="vistaPreviaImagen" class="form-group" style="display: none;">
					          <label for="imagenVistaPrevia">Vista previa:</label>
					          <img id="imagenVistaPrevia" class="img-fluid">
					        </div>
					        <div class="row">
					          <div class="col text-left">
					            <input type="submit" class="btn btn-primary" value="Actualizar">
					            
					          </div>
					          <div class="col text-right">
					          	
					          	<a href="Listar_Contenido.jsp"><input type="submit" class="btn btn-danger" value="Cancelar"></a>
					            
					          </div>
					        </div>
					      </form>
					    </div>
					  </div>
					</div>-->
					<h2>Editar Contenido</h2>
    <form action="ContenidoServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="idContenido" value="${contenido.idContenido}">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" value="${contenido.titulo}">
        <br>
        <label for="descripcion">Descripción:</label>
        <textarea name="descripcion">${contenido.descripcion}</textarea>
        <br>
        <input type="submit" value="Actualizar">
    </form>
  

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
       