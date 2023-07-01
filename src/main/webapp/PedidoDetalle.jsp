<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle pedido</title>
<!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
	<%
		List <GenerarPedido> lisPedidode = (List <GenerarPedido>) request.getAttribute("LISTADET_PEDIDOS");
	%>
</head>
<body>
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
             		<div class="col-md-12">
	            		<div class="col-md-10">
	            		
	             		<h2>Reporte pedido  </h2>
	             		
	             		<br>
	             			<table class="table">
	             				<thead>
									<tr>
										<th  scope="col" >IdProveedor</th>
										<th class="col-md-3" scope="col" >Nombre</th>						
										<th scope="col" >IdInsumo</th>
										<th class="col-md-3" scope="col" >Nombre</th>
										<th class="col-md-1" scope="col" >Cantidad</th>
										<th class="col-md-1" scope="col" >Precio</th>
										<th class="col-md-1" scope="col" >Subtotal</th>
										<th class="col-md-2" scope="col" >Estado</th>
										<th ></th>
										
									</tr>
								</thead>
								<tbody>
							  		<% for(GenerarPedido pedidos : lisPedidode){ %>
									<tr>
										<th ><%= pedidos.getCod_prov() %></th>
										<td class="col-md-3 "><%= pedidos.getNom_prov() %></td>
										<th ><%=  pedidos.getCod_ins() %></th>
										<td class="col-md-3 "><%= pedidos.getNom_ins() %></td>
										<td class="col-md-1 "><%= pedidos.getCantidad() %></td>
										<td class="col-md-1 "><%= pedidos.getPrecio()%></td>
										<td class="col-md-1 "><%= pedidos.subtotal()%></td>
										<td class="col-md-2 "><%= pedidos.getEstado() %></td>
										<td><a class="btn btn-secondary" style="margin-left:20px;" href="">Actualizar</a>
									<tr>
									<%} %>
								</tbody>
							</table>
							
	             		</div>
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
</html>