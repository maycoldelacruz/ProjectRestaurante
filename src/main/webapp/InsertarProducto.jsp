<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <meta charset="ISO-8859-1">
    <title>Inicio</title>
    
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
             <!-- STATISTIC-->
            
            <!-- END STATISTIC-->
             
             <!-- CONTENIDO-->
      		<div class="d-flex">
		<div class="card col-sm-6">
			<div class="card-body">
		<h1 style= "text-align: center">Insertar registros</h1>
		
	<form name="formIn" method="get" action="ProductosServlet">
	    <input type="hidden" name="instruccion" value="insertarBBDD">
		<table width="50%" border="0">
		
		
		
			<div class="form-group">
				<label>Codigo de Producto</label>
				<input type="text" name="codi" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Nombre</label>
				<input type="text" name="nomb" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Precio</label>
				<input type="text" name="prec" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Stock</label>
				<input type="text" name="stoc" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Estado</label>
					<input type="text" name="esta" class="form-control">
			</div>	
			
			
			<div class="botones" style="margin-top:20px;">
			<input style="margin-right:20px;" class="btn btn-primary" type="submit" value="Enviar"/>
			<input class="btn btn-primary" type="reset" value="Limpiar"/>
			</div>
		</table>
	</form>
			
			</div>
		</div>
	
	</div>
	
	    <!-- END PAGE CONTAINER-->
	  
	   
	   
	 </div>
	 <!-- END DIV PRINCIPAL-->   
	 
     <jsp:include page="Main_Vendor.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>