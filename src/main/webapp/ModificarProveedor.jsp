<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Modificar Proveedor</title>
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
             		<h2>Modificar proveedor</h2>
             		<br>
             			<form name="form" method="get" action="ProveedorServlet">
	             			<input type="hidden" name="instruccion" value="actualizarBBDD">
	             			<input type="hidden" name="cod_prov" value="${ProveedorActualizar.cod_prov}">
					
								<label  for "nombre">Nombre</label>
								<input  type="text" name="nombre" id="nombre" value="${ProveedorActualizar.nombre}">									
									
								<label for "numerotel">Telefono</label>
								<input type="text" name="numerotel" id="numerotel" value="${ProveedorActualizar.numeroTel}">
								<!-- 
								<label for "cod_ins">Código Insumo</label>
								<input type="text" name="cod_ins" id="cod_ins" value="${ProveedorActualizar.cod_ins}">
								<input class="btn" type="button" value="Nuevo insumo" style="border: 1px solid black; margin-right:20px;" 
								onclick="window.location.href='InsertarInsumo.jsp'"/>
								<button><i class="fa-regular fa-circle-question" style="color: #000000; font-size: 20px;"></i></button>									
								 -->
								 
								<label for"estado" style="display:block; margin-top:20px;">Estado</label>
								<input type="text" name="estado" id="estado" value="${ProveedorActualizar.estado}">
								<select class="select"
										style="width: 350px; 
										height:25px; 
										display: block;
										margin-bottom: 20px;">
									<option>ACTIVO</option><option>INACTIVO</option>
								</select>
									
								<div class="botones">
									<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
									<input style="margin-right: 20px;" class="btn btn-primary" type="reset" value="Limpiar"/>
									<input class="btn btn-secondary" type="button" value="Cancelar" onclick="window.location.href='ListarProveedores.jsp'"/>
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
       