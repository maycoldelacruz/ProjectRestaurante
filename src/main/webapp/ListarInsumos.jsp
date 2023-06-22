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
            <div class="container justify-content-center">
             	<div class="row justify-content-center">
             		<div class="col-md-10">
            
             		<h2>Listado de Insumos</h2>
             		<br>
             			<table>
							<tr>							
								<td style="font-weight:bold;" class="col-md-1">CÓDIGO</td>
								<td style="font-weight:bold;" class="col-md-1">NOMBRE</td>
								<td style="font-weight:bold;" class="col-md-1">STOCK MINIMO</td>
								<td style="font-weight:bold;" class="col-md-1">STOCK ACTUAL</td>
								<td style="font-weight:bold;" class="col-md-1">PRECIO POR KILO</td>
								<td style="font-weight:bold;" class="col-md-1">CÓDIGO TIPO</td>
								<td style="font-weight:bold;" class="col-md-3"></td>
							</tr>
							
						  	<% for (Insumos tempIns: lisInsumos) { %>
							<tr>
								<td class="col-md-1" ><%= tempIns.getCod_ins() %></td>
								<td class="col-md-1 "><%= tempIns.getNombre() %></td>
								<td class="col-md-1"><%= tempIns.getStk_min() %></td>
								<td class="col-md-1"><%= tempIns.getStk_act() %></td>
								<td class="col-md-1"><%= tempIns.getPrecioXkilo() %></td>
								<td class="col-md-1"><%= tempIns.getCod_tipo() %></td>
								<td class="col-md-1"><a href="InsumosServlet?instruccion=cargar&IdInsumo=<%= tempIns.getCod_ins() %>">Modificar</a>
							</tr>
							<% } %>
						</table>
						<div style="margin-top: 20px;" class="btn">
							<input class="btn btn-primary" type="button" value="Agregar" onclick="window.location.href='InsertarInsumo.jsp'"/>
							<!-- <input class="btn btn-primary" type="button" value="Modificar" onclick="window.location.href='ModificarInsumo.jsp'"/> -->
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