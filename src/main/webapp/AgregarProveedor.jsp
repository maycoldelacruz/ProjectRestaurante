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
	             				
		             				<label for "cod_prov">Código</label>
									<input type="text" name="cod_prov" id="cod_prov">
					
									<label  for "nombre">Nombre</label>
									<input  type="text" name="nombre" id="nombre">									
									
									
									<label for "numerotel">Telefono</label>
									<input type="text" name="numerotel" id="numerotel">
									
									<!--  
									<label for "cod_ins">Código Insumo</label>
									<input type="text" name="cod_ins" id="cod_ins">
										<input class= "btn" type="button" value="Nuevo insumo" style="border: 1px solid black; margin-right:20px;" 
										onclick="window.location.href='InsertarInsumo.jsp'"/>
										<input class="btn" type="button" onclick="abrir()" value="Consultar">								
									-->
									
									<label for"estado" style="display:block; margin-top:20px;">Estado</label>
									<input type="text" name="estado" id="estado">
									
									<div class="botones">
										<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
										<input class="btn btn-primary" type="reset" value="Limpiar"/>
										<input class="btn btn-secondary" type="button" value="Cancelar" onclick="window.location.href='ProveedorServlet?instruccion=listar'"/>
									</div>
						</form>
							
             		</div>
             		<div class="col-md-2 modal" style="position: absolute;">
						<table>
								<tr>							
									<td style="font-weight:bold;" class="col-md-1">CÓDIGO</td>
									<td style="font-weight:bold;" class="col-md-2">NOMBRE</td>
								</tr>
						</table>
						<button class="btn-close-modal">Cerrar</button>
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
       