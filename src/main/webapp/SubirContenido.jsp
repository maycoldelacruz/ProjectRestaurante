<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subir Contenido</title>
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
				  <div class="row justify-content-center">
				    <div class="col-md-6">
				      <form action="ContenidoServlet?action=create" id="frmagregar" method="post" enctype="multipart/form-data">
				        <div id="contact-form" class="form-container" data-form-container>
				          <div class="col text-right">
				            <a href="Menu_RSociales.jsp"><input type="button" class="btn btn-success" value="Volver"></a>
				          </div>
				          <div>
				            <h2>Subir Contenido</h2>
				          </div>
				          <div class="form-group">
				            <label for="titulo">Título</label>
				            <input type="text" class="form-control" id="titulo" name="titulo">
				          </div>
				          <div class="form-group">
				            <label for="descripcion">Descripción</label>
				            <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
				          </div>
				          <div class="form-group">
				            <label for="imagen">Selecciona Contenido</label>
				            <div class="custom-file">
				              <input type="file" class="form-control-file" id="imagen" name="imagen" onchange="mostrarImagen(event)">
				              <span style="display: none;"    id="nombreArchivo"></span>
				            </div>
				          </div>
				          <div id="vistaPreviaImagen" class="form-group" style="display: none;">
				            <label for="imagenVistaPrevia">Vista previa:</label>
				            <img id="imagenVistaPrevia" class="img-fluid">
				          </div>
				          <div class="row">
				            <div class="col text-left">
				              <input type="submit" class="btn btn-primary" value="Guardar">
				              <input type="reset" class="btn btn-danger" value="Limpiar">
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
	
function mostrarNombreArchivo(event) {
    const input = event.target;
    const nombreArchivo = input.files[0].name;
    document.getElementById("nombreArchivo").textContent = nombreArchivo;
  }

  document.getElementById("imagen").addEventListener("change", mostrarNombreArchivo);
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
       