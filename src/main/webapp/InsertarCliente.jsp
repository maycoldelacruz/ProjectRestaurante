<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <meta charset="ISO-8859-1">
    <title>Agregar producto</title>
    
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
      		 <section class="statistic">
			   <div class="container justify-content-center">
		<div class="row justify-content">
			<div class="col-md-8">
		
	<form name="formIn" method="post" action="ClienteServlet?action=create">
	    <div id="contact-form" class="form-container" data-form-container>
				<div class="col text-right">
				    <a href="MenuPagos.jsp"><input type="button" class="btn btn-success" value="Volver"></a>
				</div>
				<div class="row justify-content-center">
				            <h2><b><i>Agregar nuevo Cliente</i></b></h2>
				</div>
			
			<div class="form-group">
				<label>Dni</label>
				<input type="text" name="dni" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Nombre</label>
				<input type="text" name="nomb" class="form-control">
			</div>
			
			<div class="form-group">
				<label>direccion</label>
				<input type="text" name="direc" class="form-control">
			</div>
			
			<div class="form-group">
				<label>Estado</label>
					<input type="text" name="esta" class="form-control">
			</div>	
			
			
			<div class="botones" style="margin-top:20px;">
			<input style="margin-right:20px;" class="btn btn-primary" type="submit" value="Enviar"/>
			<input class="btn btn-primary" type="reset" value="Limpiar"/>
			</div>
			</div>
	</form>
	
			
			</div>
		</div>
	
	</div>
	</section>
	
	    <!-- END PAGE CONTAINER-->
	  
	   
	   
	 </div>
	 <!-- END DIV PRINCIPAL-->   
	 
     <jsp:include page="Main_Vendor.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</div>
</body>
</html>
