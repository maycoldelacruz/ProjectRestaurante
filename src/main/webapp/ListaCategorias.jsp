<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, modelo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista categorías</title>
<!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
	<%
		List<Categorias> lisTipo=(List<Categorias>) request.getAttribute("LISTATIPOS");
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
             		<div class="col-md-10">
	            		<div class="col-md-8">
	             		<h2>Listado de Categorías de insumos</h2>
	             		
	             		<br>
	             			<table class="table">
	             				<thead>
									<tr>							
										<th scope="col" >CÓDIGO</th>
										<th class="col-md-3" scope="col" >NOMBRE</th>
										<th ></th>
										
									</tr>
								</thead>
								<tbody>
							  	<% for (Categorias tempCat: lisTipo) { %>
									<tr>
										<th class="col-md-2" ><%= tempCat.getCod_tipo() %></th>
										<td class="col-md-2 "><%= tempCat.getNom_tipo() %></td>
										<td><a class="btn btn-info" style="margin-left:20px;" href="CategoriasServlet?instruccion=update&IdCate=<%= tempCat.getCod_tipo() %>">Actualizar</a>
										<a class="btn btn-danger" style="margin-left:20px;" href="CategoriasServlet?instruccion=delete&IdCate=<%= tempCat.getCod_tipo() %>">Eliminar</a></td>
									<tr>
								<% } %>
								</tbody>
							</table>
							<div style="margin-top: 20px;"class="btn">
								<input style="margin-right: 10px;" class="btn btn-primary" type="button" value="Agregar"  onclick="window.location.href='InsertarCategoria_Ins.jsp'"/>
								<input class="btn btn-warning" type="button" value="Agregar Insumo" onclick="window.location.href='InsertarInsumo.jsp'"/>
							</div>
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