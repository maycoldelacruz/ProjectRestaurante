<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subir Contenido</title>
    
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
					<div class="container">
    <h1 class="mt-5">Programar Publicación en Redes Sociales</h1>
    <form class=" " id="programacionForm" style="width: 60%;">
      <div class="form-group">
        <label for="titulo">Título:</label>
        <input type="text" class="form-control" id="titulo" placeholder="Ingrese el título de la publicación">
      </div>
      <div class="form-group">
        <label for="descripcion">Descripción:</label>
        <textarea class="form-control" id="descripcion" rows="3" placeholder="Ingrese una descripción para la publicación"></textarea>
      </div>
      <div class="form-group">
        <label for="imagen">Imagen:</label>
        <input type="file" class="form-control-file" id="imagen">
      </div>
      <div class="form-group">
        <label for="redesSociales">Red Social a Publicar:</label>
        <div class="col-12">
        
	<select name="cbomarca" id="cbomarca" onchange="pasar()" >
	 <% 
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 String url="jdbc:mysql://localhost/restaurante?useTimezOne=true&serverTimezone=UTC";
	 String usr = "root";
	 String psw = "adminsi"; 
	 String sql = "call listar_redsocial";
	 Connection cn=DriverManager.getConnection(url,usr,psw);
	 PreparedStatement ps=cn.prepareStatement(sql);
	 ResultSet rs=ps.executeQuery();
	 while(rs.next()){
	 %>
	 <option><%= rs.getString(2) %></option>
	 <%
	 }
	 %>	

	</select>
	</div>
	</div>
      <div class="form-group">
        <label for="programarFecha">Fecha de Programación:</label>
        <input type="datetime-local" class="form-control" id="programarFecha" style="width: 200px;">
      </div>
      <button type="submit" class="btn btn-primary">Programar Publicación</button>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<a href="Menu_RSociales.jsp"><input type="submit" class="btn btn-success " value="Volver"></a>
		</div>
      
    </form>
  </div>

  <script type="text/javascript">

 function pasar(){

 document.form1.submit();

 }

	</script>

	


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
       