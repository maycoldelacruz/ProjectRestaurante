<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
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
<%
		List<Productos> lisProductos=(List<Productos>) request.getAttribute("LISTAPRODUCTOS");
	%>

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
             <div class="d-flex text-center">
			<div class="col-sm-8">
				<div class="table table-hover text-center">
						<h2>Listado de Productos</h2>
							
							<table>
								<tr>
									<td >CODIGO</td>
									<td >NOMBRE</td>
									<td>PRECIO</td>
									<td >STOCK</td>
									<td>ESTADO</td>
									<td>ACCION</td>
									<td>ACCION</td>
								</tr>
								
								<% for (Productos tempProd: lisProductos) { %>
								<tr>
									<td ><%= tempProd.getCod_prod() %></td>	
									<td><%= tempProd.getNomb() %></td>	
									<td ><%= tempProd.getPrec() %></td>	
									<td><%= tempProd.getStoc() %></td>
									<td><%= tempProd.getEstad() %></td>		
									<td><a href="ProductosServlet?instruccion=cargar&IdProducto=<%= tempProd.getCod_prod()%>">Actualizar</a></td>	
									<td><a href="ProductosServlet?instruccion=eliminar&IdProducto=<%= tempProd.getCod_prod()%>">Eliminar</a></td>	
								</tr>		
								<% } %>
							
							</table>
							<div style="margin-top: 20px;" class="btn">
							<input class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='InsertarProducto.jsp'"/>
							<!-- <input class="btn btn-primary" type="button" value="Modificar" onclick="window.location.href='ModificarInsumo.jsp'"/> -->
							</div>
				
				</div>
			</div>	
		</div>
             	
            
             <!-- FOOTER-->
             <jsp:include page="Footer.jsp" />
             <!-- END FOOTER-->
             
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