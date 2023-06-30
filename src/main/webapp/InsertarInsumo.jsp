<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , modelo.*, java.sql.*" %>

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
             	<div class="row justify-content-center">
             		<div class="col-md-9">
             		<h2>Agregar insumo</h2>
             		<br>
             			<form name="formIn" method="get" action="InsumosServlet">
	             			<input type="hidden" name="instruccion" value="insertarBBDD">
	             									
							<label for "nombre" >Nombre</label>
							<input  type="text" name="nombre" id="nombre">
							
							<label for "stk_min" >Stock m�nimo</label>
							<input  type="text" name="stk_min" id="stk_min">
							
							<label for "stk_act" >Stock actual</label>
							<input  type="text" name="stk_act" id="stk_act">
							
							<label for"precioxkilo">Precio por kilo</label>
							<input type="text" name="preciok" id="preciok">
							
							<label for "cod_tipo" >Tipo</label>
							<select name="cod_tipo" id="cod_tipo" 
									style="width: 350px; 
										height:25px; 
										display: block;
										margin-bottom: 20px;">
									<% 
										Class.forName("com.mysql.cj.jdbc.Driver");
									 	String url = "jdbc:mysql://localhost/RESTAURANTE?useTimezOne=true&serverTimezone=UTC";
									 	String usr = "root";
									 	String psw = "baobei"; 
										String sql_tipos = "CALL LISTAR_CATEGORIAS";
										Connection con = DriverManager.getConnection(url,usr,psw); 
										PreparedStatement psc = con.prepareStatement(sql_tipos);
										ResultSet rsc = psc.executeQuery();
										while(rsc.next()){
									%>
									<option value="<%=rsc.getInt(1)%>"><%=rsc.getString(2) %> </option>
									<% } %>
							
							</select>		
							<input class= "btn" type="button" value="Nueva categor�a" style="border: 1px solid black; margin-right:20px" 
								onclick="window.location.href='InsertarCategoria_Ins.jsp'"/>
							
								
							<div class="botones" style="margin-top:20px;">
								<input style="margin-right:20px;" class="btn btn-primary" type="submit" value="Enviar"/>
								<input class="btn btn-primary" type="reset" value="Limpiar"/>
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
       