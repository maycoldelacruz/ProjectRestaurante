<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Agregar Proveedor</title>
    <link rel="stylesheet" href="css/prov.css" >
    <script src="js/lista.js"></script>
    <!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
    <%
		List<Insumos> lisInsumos=(List<Insumos>) request.getAttribute("LISTAINSUMOS");
	%>
</head>

<body class="animsition" onload="cargar()">
     
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
             		<h2>Agregar proveedor</h2>
             		<br>
             			<form name="formPv" method="get" action="ProveedorServlet">
	             			<input type="hidden" name="instruccion" value="insertarBBDD">
	             				
		             								
									<label  for "nombre">Nombre</label>
									<input  type="text" name="nombre" id="nombre">									
									
									
									<label for "numerotel">Telefono</label>
									<input type="text" name="numerotel" id="numerotel">
									
									<label for"estado" style="display:block; margin-top:20px;">Estado</label>
									<select name="estado" id="estado" style="width: 350px; 
																			height:25px; 
																			display: block;
																			margin-bottom: 20px;">
										<option>ACTIVO</option>
										<option>INACTIVO</option>
									</select>
									
									<div class="botones">
										<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
										<input class="btn btn-primary" type="reset" value="Limpiar"/>
										<input class="btn btn-secondary" type="button" value="Cancelar" onclick="window.location.href='ProveedorServlet?instruccion=listar'"/>
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
       