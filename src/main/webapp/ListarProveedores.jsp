<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Proveedores</title>
    <!--SCRIPT-->
    <jsp:include page="Main_Vendor.jsp" />
    <!--END SCRIPT-->
	<%
		List<Proveedores> lisProveedores=(List<Proveedores>) request.getAttribute("LISTARPROVEEDORES");
	%>
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
            <div class="container justify-content-center">
             	<div class="row justify-content-center">
             		<div class="col-md-12">
            		<div class="col-md-11">
             		<div class="col-md-10">
	            		<div class="col-md-5">
	             				<h2>Listado de Provedores</h2>
	             		</div>
	             		<div style="margin-top: 20px;" class="col-md-5">
							<input style="margin-right: 10px;" class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='AgregarProveedor.jsp'"/>
							<input class="btn btn-secondary" type="button" value="Insumo" onclick="window.location.href='AgregarInsumoProv.jsp'"/>
						</div>
					</div>
             		<br>
             			<table class="table">
             				<thead>
								<tr>							
									<th class="col-md-1" scope="col">Codigo</th>
									<th class="col-md-2">Nombre</th>
									<th class="col-md-1">Telefono</th>
									<th class="col-md-1">Estado</th>
									<th class="col-md-1">Insumo</th>
									<th class="col-md-3"></th>
								</tr>
							</thead>
							<tbody>
							  	<% for (Proveedores tempProv: lisProveedores) { %>
								<tr>
									<th class="col-md-1" ><%= tempProv.getCod_prov() %></th>
									<td class="col-md-2"><%= tempProv.getNombre() %></td>
									<td class="col-md-1"><%= tempProv.getNumeroTel() %></td>
									<td class="col-md-1"><%= tempProv.getEstado() %></td>
									<td class="col-md-1"><%= tempProv.getCod_ins() %></td>
									<td class="col-md-3">
									<a style="margin-left:20px;" class="btn btn-info" href="ProveedorServlet?instruccion=cargar&CProveedor=<%= tempProv.getCod_prov() %>">Modificar</a>
									<a style="margin-left:20px;" class="btn btn-danger" href="ProveedorServlet?instruccion=eliminar&CProveedor=<%= tempProv.getCod_prov() %>&CInsumo=<%= tempProv.getCod_ins() %>">Eliminar</a></td>
								</tr>
								<% } %>
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
       