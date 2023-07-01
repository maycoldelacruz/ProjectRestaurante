<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*, java.sql.*, util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Agregar insumo a proveedor</title>
    <link rel="stylesheet" href="css/prov.css" >
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
             <div class="container justify-content-center">
             	<div class="row justify-content-center">
             		<div class="col-md-9">
             		<h2>Nuevo Insumo</h2>
             		<br>
             			<form name="form" method="get" action="ProveedorServlet">
	             			<input type="hidden" name="instruccion" value="insertarInsumo">
	             			
					
							<label for "cod_prov">Proveedor</label>
							<select name="cod_prov" id="cod_prov" 
									style="width: 350px; 
										height:25px; 
										display: block;
										margin-bottom: 20px;">
									<% 
										Connection con=MySqlConexion.getConexion();
										String sql_Prov = "CALL LISTAR_PROVEEDORES";
										
										PreparedStatement psp = con.prepareStatement(sql_Prov);
										ResultSet rsp = psp.executeQuery();
										while(rsp.next()){
									%>
									<option value="<%=rsp.getInt(1)%>"><%=rsp.getString(2) %> </option>
									<% } %>
							
							</select>								
							
							<label for "cod_ins">Insumo</label>
							<select name="cod_ins" id="cod_ins" 
									style="width: 350px; 
										height:25px; 
										display: block;
										margin-bottom: 20px;">
									<% 
										String sql_Ins = "CALL LISTAR_INSUMOS";
										PreparedStatement psi = con.prepareStatement(sql_Ins);
										ResultSet rsi = psi.executeQuery();
										while(rsi.next()){
									%>
									<option value="<%=rsi.getInt(1)%>"><%=rsi.getString(2) %> </option>
									<% } %>
							
							</select>		
							<input class="btn" type="button" value="Nuevo insumo" style="border: 1px solid black; margin-right:20px;" 
							onclick="window.location.href='InsertarInsumo.jsp'"/>
															
							<div class="botones" style="margin-top:20px;">
								<input style="margin-right: 20px;" class="btn btn-primary" type="submit" value="Enviar"/>
								<input style="margin-right: 20px;" class="btn btn-primary" type="reset" value="Limpiar"/>
								<input class="btn btn-secondary" type="button" value="Cancelar" onclick="window.location.href='ListarProveedores.jsp'"/>
							</div>
						</form>
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
<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
</html>
       