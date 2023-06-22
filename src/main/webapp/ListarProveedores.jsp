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
             		<div class="col-md-10">
            
             		<h2 style="margin-left:20px;">Listado de proveedores</h2>
             		<br>
             			<table>
							<tr>							
								<td style="font-weight:bold;" class="col-md-1">Codigo</td>
								<td style="font-weight:bold;" class="col-md-2">Nombre</td>
								<td style="font-weight:bold;" class="col-md-1">Telefono</td>
								<td style="font-weight:bold;" class="col-md-1">Estado</td>
								<td style="font-weight:bold;" class="col-md-1">Insumo</td>
								<td style="font-weight:bold;" class="col-md-3"></td>
							</tr>
							
						  	<% for (Proveedores tempProv: lisProveedores) { %>
							<tr>
								<td class="col-md-1"><%= tempProv.getCod_prov() %></td>
								<td class="col-md-2"><%= tempProv.getNombre() %></td>
								<td class="col-md-1"><%= tempProv.getNumeroTel() %></td>
								<td class="col-md-1"><%= tempProv.getEstado() %></td>
								<td class="col-md-1"><%= tempProv.getCod_ins() %></td>
								<td class="col-md-3">
								<a style="margin-left:20px;" href="ProveedorServlet?instruccion=cargar&CProveedor=<%= tempProv.getCod_prov() %>">Modificar</a>
								<a style="margin-left:20px;" href="ProveedorServlet?instruccion=eliminar&CProveedor=<%= tempProv.getCod_prov() %>&CInsumo=<%= tempProv.getCod_ins() %>">Eliminar</a></td>
							</tr>
							<% } %>
						</table>
						<div style="margin-top: 20px;" class="btn">
							<input style="margin-right: 10px;" class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='AgregarProveedor.jsp'"/>
							<input class="btn btn-secondary" type="button" value="Insumo" onclick="window.location.href='AgregarInsumoProv.jsp'"/>
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
       