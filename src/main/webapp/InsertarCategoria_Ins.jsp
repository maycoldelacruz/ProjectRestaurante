<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Agregar Categoría</title>
    <link rel="stylesheet" href="css/prov.css" >
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
             		<div class="col-md-9">
             		<h2>Agregar categoría</h2>
             		<br>
             			<form name="formCt" method="get" action="CategoriasServlet">
	             			<input type="hidden" name="instruccion" value="insertarBBDD">
	             			
	             			<label for "cod_tipo">Código</label>
							<input type="text" name="cod_tipo" id="cod_tipo">
								
								
							<label for "nom_tipo" >Nombre</label>
							<input  type="text" name="nom_tipo" id="nom_tipo">
							
							<div class="botones" style="margin-top:20px;">
								<input style="margin-right:20px;" class="btn btn-primary" type="submit" value="Enviar"/>
								<input style="margin-right:20px;" class="btn btn-primary" type="reset" value="Limpiar"/>
								<input class="btn btn-secondary" type="button" value="Volver a insumo" onclick="window.location.href='InsertarInsumo.jsp'"/>
							</div>
							
						</form>
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
<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
</html>
       