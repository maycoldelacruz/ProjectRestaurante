<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

			<div class="d-flex">
             	<div class="card col-sm-6">
             		<div class="card-body">
             			<h2>Modificar Producto</h2>
             			<br>
             				<form name="form" method="get" action="ProductosServlet">
             				<input type="hidden" name="instruccion" value="actualizarBBDD">
	             			<input type="hidden" name="codi" value="${ProductoActualizar.cod_prod}">
	             			
	             			
	             			<div class="form-group">
	             			<label for "cod_ins">Código</label>
							<input style="background: #fff;" type="text" name="codi" id="codi" disabled="disabled" value="${ProductoActualizar.cod_prod}">
							</div>
							<div class="form-group">
							<label for "nombre" >Nombre</label>
							<input  type="text" name="nomb" id="nomb" value="${ProductoActualizar.nomb}">
							</div>	
							<div class="form-group">
							<label for "stk_min" >Precio</label>
							<input  type="text" name="prec" id="prec" value="${ProductoActualizar.prec}">
							</div>
							<div class="form-group">
							<label for "stk_act" >Stock</label>
							<input  type="text" name="stoc" id="stoc" value="${ProductoActualizar.stoc}">
							</div>
							<div class="form-group">
							<label for"Estado">Estado</label>
							<input type="text" name="esta" id="esta" value="${ProductoActualizar.estad}">
							</div>
				
							
							<div class="botones"  style="margin-top:20px;">
								<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
							</div>	
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					</form>             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             		
             		</div>
             	</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>