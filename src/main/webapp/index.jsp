<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Inicio</title>
    
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
                                    <a href="Menu_gestionPedidos.jsp"><h2 class="text"><span >Gestor de Pedidos</span></h2></a>
                                    
                                    <div class="icon">
                                        
                                        
                                        <i class="zmdi zmdi-account-o"></i>
                                     
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2><a href="Menu_RSociales.jsp">Gestor de Redes Sociales</a></h2>
                                    
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><span>Gestor de Productos</span></h2>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><a href="MenuPagos.jsp"><span>Pagos</span></a></h2>
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
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
                              <!-- TASK PROGRESS-->
                                <div class="au-card task-progress">
                                    <h3 class="title-3">Progreso de ventas por platos</h3>
                                    <div class="au-skill-container">
                                        <div class="au-progress">
                                            <span class="au-progress__title">Ceviche</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="90">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-progress">
                                            <span class="au-progress__title">Arroz con Pollo</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="85">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-progress">
                                            <span class="au-progress__title">Aji de Gallina</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="20">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="au-progress">
                                            <span class="au-progress__title">Pachamanca</span>
                                            <div class="au-progress__bar">
                                                <div class="au-progress__inner js-progressbar-simple" role="progressbar" data-transitiongoal="95">
                                                    <span class="au-progress__value js-value"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END TASK PROGRESS-->
                            </div>
                            <div class="col-xl-6">
                              <!-- CHAR PROGRESS-->
                            <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">Porcentaje Comidas y Postres</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div class="chart-note-wrap">
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--blue"></span>
                                                        <span>Comidas</span>
                                                    </div>
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--red"></span>
                                                        <span>Postres</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="percent-chart">
	                                                <div class="chartjs-size-monitor" 
	                                                	style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px;
	                                                	 overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
	                                                	 
		                                                <div class="chartjs-size-monitor-expand" 
		                                                	style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;
		                                                	pointer-events:none;visibility:hidden;z-index:-1;">
		                                                	
				                                                <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0">
				                                                </div>
		                                                </div>
		                                                <div class="chartjs-size-monitor-shrink" 
			                                                style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;
			                                                pointer-events:none;visibility:hidden;z-index:-1;">
			                                                
		                                                	<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
		                                                	
		                                                </div>
	                                                </div>
	                                                    <canvas id="percent-chart" height="280" width="259" class="chartjs-render-monitor" 
	                                                    style="display: block; width: 259px; height: 280px;"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
       