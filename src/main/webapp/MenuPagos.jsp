<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Gesti�n de pagos</title>
    
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
             <!-- STATISTIC-->
            
            
            <section class="statistic">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <a href="InsertarProducto.jsp"><h2 class="text"><span >Crear Producto</span></h2></a>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                     
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <a href="ProductosServlet?action=listar"><h2 class="text"><span >Ver productos</span></h2></a>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <a href="InsertarCliente.jsp"><h2 class="text"><span >Agregar Cliente</span></h2></a>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <a href="ClienteServlet?action=listar"><h2 class="text"><span >Ver Clientes</span></h2></a>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <a href="RegistrarVenta.jsp"><h2 class="text"><span >Registrar Pagos</span></h2></a>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- END STATISTIC-->
             
             <section>
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6">
                              
                            </div>
                            <div class="col-xl-6">
                              
                                <!-- END PROGRESS-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
              
           
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
       