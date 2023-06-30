<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
				<div class="d-flex">
             	<div class="card col-sm-6">
             		<div class="card-body">
             			<h2>Modificar Cliente</h2>
             			<br>
             				<form name="form" method="get" action="ClienteServlet">
             				<input type="hidden" name="instruccion" value="actualizarBBDD">
	             			<input type="hidden" name="codi" value="${ClienteActualizar.cod_Cli}">
	             			
	             			
	             			<div class="form-group">
	             			<label for "cod_ins">Código</label>
							<input style="background: #fff;" type="text" name="codi" id="codi" disabled="disabled" value="${ClienteActualizar.cod_Cli}">
							</div>
							<div class="form-group">
							<label for "nombre" >Dni</label>
							<input  type="text" name="dni" id="dni" value="${ClienteActualizar.dni}">
							</div>	
							<div class="form-group">
							<label for "stk_min" >Nombre</label>
							<input  type="text" name="nomb" id="nomb" value="${ClienteActualizar.nomb}">
							</div>
							<div class="form-group">
							<label for "stk_act" >Direccion</label>
							<input  type="text" name="dire" id="dire" value="${ClienteActualizar.direcci}">
							</div>
							<div class="form-group">
							<label for"Estado">Estado</label>
							<input type="text" name="esta" id="esta" value="${ClienteActualizar.estad}">
							</div>
				
							
							<div class="botones"  style="margin-top:20px;">
								<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
							</div>	
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					
             					</form>             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             	
             		
             		</div>
             	</div>
			</div>
</body>
</html>