<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*, util.*, java.util.*, modelo.*" %>


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
			<div class="col-sm-5">
				<div class="card">
					<form name="form" method="get" action="RegistrarVentaServlet">
					<div class="card-body">
						<div class="form-group">
						 	<label>Datos Del Cliente</label>
						</div>
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="text" name="dni" value="${clienteseleccionado.getDni()}" class="form-control" placeholder="Dni">
								<button type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info">Buscar</button>
							</div>
							<div class="col-sm-6">
								<input type="text" name="nomcliente" value="${clienteseleccionado.getNomb()}" placeholder="Datos Cliente" class="form-control">
							</div>
						</div>
						<div class="form-group">
						 	<label>Datos Producto</label>
						</div>
						<div class="form-group d-flex">
							<div class="col-sm-6 d-flex">
								<input type="text" name="codigoproducto" value="${productoseleccionado.getCod_prod()}" class="form-control" placeholder="Codigo">
								<button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">Buscar</button>
							</div>
							<div class="col-sm-6">
								<input type="text" name="nomproductos" value="${productoseleccionado.getNomb()}" placeholder="Datos Productos" class="form-control">
							</div>
						</div>
						<div class="form-group d-flex" >
							<div class="col-sm-6 d-flex">
								<input  type="text" name="precio" value="${productoseleccionado.getPrec()}" class="form-control" placeholder="s/.0.00">
							</div>
							<div class="col-sm-3">
								<input type="number" name="cant" value="1" min="1" placeholder="" class="form-control">
							</div>	
							<div class="col-sm-3">
								<input type="text" name="stock" value="${productoseleccionado.getStoc()}" placeholder="stock" class="form-control">
							</div>	
						</div>
					</div>
						<div class="form-group">
							<button type="submit" name="accion" value="addtolist" class="btn btn-outline-info">Agregar Producto</button>
						</div>
					</form>
				</div>
			
			
			</div>
				
			<div class="col-sm-7">
				<div class="card">
					<div class="card-body">
						<div class="d-flex col-sm-6 ml-auto align-items-center">
							<label>Nro de Serie</label>
							<input type="text" name="NroSerie" value="${nserie}"class="form-control">
						</div>
						<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Codigo</th>
									<th>Descripcion</th>
									<th>Precio</th>
									<th>Cantidad</th>
									<th>Subtotal</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
					<%-- 
					<% if (lisTemp != null) { %>
					<% for (Venta temp: lisTemp) { %>
					--%>
						<c:forEach var="list" items="${lista}">
    							<tr>
      							 	<td>${list.getItem()}</td>
      							 	<td>${list.getIdproducto()}</td>
      							 	<td>${list.getPrecio()}</td>
      							 	<td>${list.getCantidad()}</td>
      							 	<td>${list.getSubtotal()}</td>
        						 	<td class="d-flex">
        						 		<a href="#" class="btn btn-warning">Editar</a>
        						 		<a href="#" class="btn btn-danger" style="margin-left: 8px;">Eliminar</a>
        						 	</td>
    							</tr>
    					</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex">
						<div class="col-sm-6">
							<a href="RegistrarVentaServlet?accion=GenerarVenta" class="btn btn-success">Generar Venta</a>
							<input type="submit" name="accion" value="Cancelar" class="btn btn-danger" >
						</div>
						<div class="col-sm-4 ml-auto">
							<input type="text" name="txtTotal" value="S/ ${totalPagar}" readonly class="form-control">
						</div>
					</div>
				</div>
			</div>
		</div>
	    <!-- END PAGE CONTAINER-->
	 </div>
	</div>
	 <!-- END DIV PRINCIPAL-->   
	 
     <jsp:include page="Main_Vendor.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>