<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Modificar Insumo</title>
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
             		<h2>Modificar Insumo</h2>
             		<br>
             			<form name="form" method="get" action="InsumosServlet">
	             			<input type="hidden" name="instruccion" value="actualizarBBDD">
	             			<input type="hidden" name="cod_ins" value="${InsumoActualizar.cod_ins}">
					
							<label for "cod_ins">Código</label>
							<input style="background: #fff;" type="text" name="cod_ins" id="cod_ins" disabled="disabled" value="${InsumoActualizar.cod_ins}">
								
							<label for "nombre" >Nombre</label>
							<input  type="text" name="nombre" id="nombre" value="${InsumoActualizar.nombre}">
							
							<label for "stk_min" >Stock mínimo</label>
							<input  type="text" name="stk_min" id="stk_min" value="${InsumoActualizar.stk_min}">
							
							<label for "stk_act" >Stock actual</label>
							<input  type="text" name="stk_act" id="stk_act" value="${InsumoActualizar.stk_act}">
							
							<label for"preciok">Precio por kilo</label>
							<input type="text" name="preciok" id="preciok" value="${InsumoActualizar.precioXkilo}">
							
							<label for "cod_tipo" >Código tipo</label>
							<input  type="text" name="cod_tipo" id="cod_tipo" value="${InsumoActualizar.cod_tipo}">
							<input class= "btn" type="button" value="Nueva categoría" style="border: 1px solid black; margin-right:20px" 
								onclick="window.location.href='InsertarCategoria_Ins.jsp'"/>
							
							<div class="botones"  style="margin-top:20px;">
								<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
								<input style="margin-right: 20px;" class="btn btn-primary" type="reset" value="Limpiar"/>
								<input class="btn btn-secondary" type="button" value="Cancelar" onclick="window.location.href='InsumosServelt?instruccion=listar'"/>
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
       