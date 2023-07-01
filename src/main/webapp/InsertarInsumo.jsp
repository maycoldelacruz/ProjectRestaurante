<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*, java.sql.*, util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Agregar Insumo</title>
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
             				          
				            <a href="Menu_gestionPedidos.jsp"><input type="button" class="btn btn-success" value="Volver"></a>				            
				        
             	<div class="row justify-content-center">
             		<div class="col-md-9">
             		
             		<form name="formIn" method="get" action="InsumosServlet">
	             			<input type="hidden" name="instruccion" value="insertarBBDD">
             				<h2>Agregar insumo</h2>
             								
							<label >Nombre</label>
							<input  type="text" name="nombre" id="nombre">
							
							<label >Stock mínimo</label>
							<input  type="text" name="stk_min" id="stk_min">
							
							<label >Stock actual</label>
							<input  type="text" name="stk_act" id="stk_act">
							
							<label >Precio por kilo</label>
							<input type="text" name="preciok" id="preciok">
							
							<label >Categoria</label>
							
							<select name="cod_tipo" id="cod_tipo" 
									style="width: 350px; 
										height:25px; 
										display: block;
										margin-bottom: 20px;">
									<% 
									Connection con=MySqlConexion.getConexion();
										String sql_tipos = "CALL LISTAR_CATEGORIAS";
										
										PreparedStatement psc = con.prepareStatement(sql_tipos);
										ResultSet rsc = psc.executeQuery();
										while(rsc.next()){
									%>
									<option value="<%=rsc.getInt(1)%>"><%=rsc.getString(2) %> </option>
									<% } %>
							
							</select>		
							<input class= "btn btn-success" type="button" value="Nueva categoría" style="border: 1px solid black; margin-right:20px" 
								onclick="window.location.href='InsertarCategoria_Ins.jsp'"/>
							
								
							<div class="botones" style="margin-top:20px;">
								<input style="margin-right:20px;" class="btn btn-primary" type="submit" value="Enviar"/>
								<input class="btn btn-primary" type="reset" value="Limpiar"/>
							</div>
							
						</form>
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
<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
</html>
       