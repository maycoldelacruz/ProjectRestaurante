<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*, modelo.*" %>
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
		<h1 style= "text-align: center">Insertar registros</h1>
		
	<form name="formIn" method="get" action="ClienteServlet">
	    <input type="hidden" name="instruccion" value="insertarBBDD">
		<table width="50%" border="0">
		
		
		
			<div class="form-group">
				<label>Codigo de Cliente</label>
				<input type="text" name="codi" class="form-control">
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
		</table>
	</form>
			
			</div>
		</div>
	
	</div>

</body>
</html>