<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, util.*, java.util.*, modelo.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <%
	List<GenerarPedido> lisTemp =(List<GenerarPedido>) request.getAttribute("LISTAPEDIDO");
	%>
    <title>Generar pedido</title>
    <!-- <link rel="stylesheet" href="css/prov.css" > -->
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
             		
             		<div class="col-md-13" style="margin-bottom: 30px;">
             		
             			<div class="d-flex">
							<div class="col-sm-4">
								<div class="card">
									<form name="form" method="get" action="GenerarPedidoServlet">
									<div class="card-body">
										<div class="form-group">
										 	<h3><b>Generar pedido </b> </h3>
										</div>
										<div class="form-group d-flex">
											<div class="col-sm-6 d-flex">
												
												<select name="cod_ins" class="form-control" style="width: 380px; height:35px;  margin-right: 7px;">
													<% 
														Connection con = MySqlConexion.getConexion();
														String sql_ins = "CALL LISTA_INSUMOSMPROV";
														PreparedStatement psi = con.prepareStatement(sql_ins);
														ResultSet rsi = psi.executeQuery();
														while(rsi.next()){
													%>
													<option value="<%=rsi.getInt(1)%>"><%=rsi.getString(2) %> </option>
													<% } %>
												</select>
												<button type="submit" name="instruccion" value="buscarInsumo" class="btn btn-success">Buscar</button>
											</div>
										</div>
										<div class="form-group d-flex" >
											<div class="">
												<input type="hidden" name="codIns" value="${InsumoBuscado.getCod_ins()}" placeholder="ID" class="form-control" readonly>
											</div>	
											<div class="col-sm-8 d-flex">
												<input type="text" name="nombre" readonly value="${InsumoBuscado.getNombre()}" class="form-control" placeholder="Nombre">
											</div>
										</div>
										<div class="form-group d-flex" >
											<div class="col-sm-6">
												<input type="text" name="stkAct" readonly value="${InsumoBuscado.getStk_act()}" placeholder="Actual" class="form-control">
											</div>	
											<div class="col-sm-6 d-flex">
												<input type="text" name="precio" readonly value="${InsumoBuscado.getPrecioXkilo()}" class="form-control" placeholder="s/.0.00">
											</div>
										</div>
										<div class="form-group d-flex" >
											<div class="col-sm-6 d-flex">
												<input type="text" name="stkMin" readonly value="${InsumoBuscado.getStk_min()}" class="form-control" placeholder="Minimo">
											</div>
											<div class="col-sm-6">
												<input type="number" min="1" name="cant" placeholder="Ingresa Cantidad" class="form-control" >
											</div>	
										</div>	
										<div class="form-group d-flex" >
											<div class="col-sm-8 d-flex">
												<% String ide = request.getParameter("cod_ins");
												if (ide != null){ %>
												<select name="cod_prov" class="form-control" style="width: 200px; height:35px;  margin-right: 20px;">
													<%		
														int id = Integer.parseInt(ide);
														String sql_Prov = "CALL LISTA_PROVINSDISPO(?)";
														CallableStatement psp = con.prepareCall(sql_Prov);
														psp.setInt("ins", id);
														ResultSet rsp = psp.executeQuery();
														while(rsp.next()){
													%>
													<option value="<%=rsp.getInt(1)%>"><%=rsp.getString(2) %> </option>
													<% } %>
												</select>
												<%}else{ %>
												<input name="cod_prov" class="form-control" type="text" placeholder="Proveedor">
												<%} %>
											</div>
										</div>
									</div>
										<div class="form-group">
											<button name="instruccion" value="addtolist" class="btn btn-outline-info" style="margin-left: 30px">Agregar</button>
										</div>
									</form>
								</div>
								
							
							</div>
							
							<div class="col-sm-8">
								<div class="card">
									<form name="formi" method="get" action="GenerarPedidoServlet">
									<div class="card-body">
										<div class="d-flex col-sm-6 ml-auto">
										<label for "NroPedido">Nro Pedido</label>
										<div class="col-sm-3 d-flex">
											<input type="text" readonly name="NroPedido" class="form-control">
										</div>
											<div class="col-sm-3 d-flex">
												<label >Fecha pedido</label>
											</div>
										
							
					
											<div class="col-sm-6 d-flex">
												<input type="date" name="fecha_pedido" value="" class="form-control">
											</div>
										
											<div class="col-sm-3 d-flex">
												<label >Fecha llegada</label>
											</div>
										
										
											<div class="col-sm-6 d-flex">
												<input type="date" name="fecha_entrega" value="" class="form-control" >
											</div>
										</div>
										
										<br>
										
										<table class="table table-hover">
											<thead>
												<tr>
													<th>Nro</th>
													<th>Insumo</th>
													<th>Cantidad</th>
													<th>Proveedor</th>
													<th>Subtotal</th>
													<th>Acciones</th>
												
												</tr>
											
											</thead>
												
											<tbody>
											<% if (lisTemp != null) { %>
												<% for (GenerarPedido temp: lisTemp) { %>
													<tr>
														<td></td>
														<td><%= temp.getNom_ins() %></td>
														<td><%= temp.getCantidad() %></td>
														<td><%= temp.getNom_prov() %></td>
													    <td><%= temp.subtotal() %></td>
													    <td><a href="GenerarPedidoServlet?instruccion=eliminar&IdInsumo=<%= temp.getCod_ins() %>&IdProveedor=<%= temp.getCod_prov() %>">Eliminar</a></td>
													</tr>
												<% } %>
											<% } %>
											</tbody>
										</table>
										
										
									</div>
									<div class="card-footer">
										
										<input type="submit" value="Generar pedido" class="btn btn-success" >
										<input type="hidden" name="instruccion" value="insertar">
										<input type="button" value="Cancelar" class="btn btn-danger" >
									</div>
									</form>
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
<script src="https://kit.fontawesome.com/8ff637b780.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
	function validar(){
		var cantidad = document.getElementsByName("cant")[0].value;
		var cantVal = !/^([0-9])* $/;
		if(cantVal.test(cantidad))
			alert("Debe ingresar una cantidad");
	}
	
	validar();
</script>
</html>