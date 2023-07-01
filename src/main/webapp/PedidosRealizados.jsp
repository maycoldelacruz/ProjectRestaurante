<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pedidos realizados</title>
<!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
	<%
		List <Pedido> lisPedido = (List <Pedido>) request.getAttribute("LISTASEG_PEDIDOS");
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
	            		<div class="col-md-8">
	             		<h2>Reporte pedidos</h2>
	             		
	             		<br>
	             			<table class="table">
	             				<thead>
									<tr>							
										<th scope="col" >CÓDIGO</th>
										<th class="col-md-2" scope="col" >Fecha Pedido</th>
										<th class="col-md-2" scope="col" >Fecha Entrega</th>
										
										<th class="col-md-2" scope="col" >Estado</th>
										<th ></th>
										
									</tr>
								</thead>
								<tbody>
							  		<% for(Pedido pedidos : lisPedido){ %>
									<tr>
										<th class="col-md-2" ><%=  pedidos.getNropedido() %></th>
										<td class="col-md-2 "><%= pedidos.getFpedido() %></td>
										<td class="col-md-2 "><%= pedidos.getFentrega() %></td>
										
										<td class="col-md-2 "><%= pedidos.getEstado() %></td>
										<td><a class="btn btn-secondary" style="margin-left:20px;" href="">Actualizar</a>
										<a class="btn btn-primary" style="margin-left:20px;" href="GenerarPedidoServlet?instruccion=detailss&NroPedido=<%= pedidos.getNropedido() %>">Detalles</a></td>
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