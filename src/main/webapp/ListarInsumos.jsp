<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista insumos</title>
<!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
	<%
		List<Insumos> lisInsumos=(List<Insumos>) request.getAttribute("LISTAINSUMOS");
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
            <div class="main-content">

				<div class="section__content section__content--p30">
				<a class="btn btn-success"  href="Menu_gestionPedidos.jsp">Menu Pedidos</a>
						
             		<div class="container-fluid">
            		
	            		
	             				<h2>Listado de Insumos</h2>
	             			
	             			
						</div>
             		
             		<div class="col-md-3" style="margin-top: 20px;">
		             			<input class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='InsertarInsumo.jsp'"/>
							</div>
             		<table class="table">
						<thead>
							<tr>
								<th class="col-1" scope="col">CÓDIGO</th>
								<th class="col-2" scope="col">NOMBRE</th>
								<th class="col-1" scope="col">STOCK MINIMO</th>
								<th class="col-1" scope="col">STOCK ACTUAL</th>
								<th class="col-1" scope="col">PRECIO POR KILO</th>
								<th class="col-1" scope="col">CÓDIGO TIPO</th>
								<th class="col-1"></th>
								<th class="col-1"></th>
							</tr>
						</thead>
						<tbody>
							<% for (Insumos tempIns: lisInsumos) { %>
							<tr>
							    <th scope="row"><%= tempIns.getCod_ins() %></th>
								<td><%= tempIns.getNombre() %></td>
								<td><%= tempIns.getStk_min() %></td>
								<td><%= tempIns.getStk_act() %></td>
								<td><%= tempIns.getPrecioXkilo() %></td>
								<td><%= tempIns.getCod_tipo() %></td>
								<td><a class="btn btn-info" href="InsumosServlet?instruccion=cargar&IdInsumo=<%= tempIns.getCod_ins() %>">Actualizar</a></td>
								<td><a class="btn btn-danger" href="InsumosServlet?instruccion=eliminar&IdInsumo=<%= tempIns.getCod_ins() %>">Eliminar</a></td>
							</tr>
							 <%} %>
						</tbody>
					</table>
             		
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