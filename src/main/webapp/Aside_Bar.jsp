<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard 2</title>

    <!-- Fontfaces CSS-->
    <link href="css/font-face.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="vendor/vector-map/jqvmap.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
</head>

<body>
    
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar2">
            <div class="logo">
                <a href="index.jsp">
                    <img src="images/icon/logo.webp" alt="Digital Business" />
                </a>
            </div>
            <div class="menu-sidebar2__content js-scrollbar1">
                <div class="account2">
                    <div class="image img-cir img-120">
                        <img src="images/icon/avatar-04.jpg" alt="USUARIO" />
                    </div>
                    <h4 class="name">Administrador</h4>
                    <a href="login.jsp">Cerrar Sesion</a>
                </div>
                <nav class="navbar-sidebar2">
                    <ul class="list-unstyled navbar__list">
                        <li>
                          <a class="js-arrow" href="#">
                              <i class="zmdi zmdi-settings"></i>Configuracion
                              <span class="arrow">
                                  <i class="fas fa-angle-down"></i>
                              </span>
                          </a>
                          <ul class="list-unstyled navbar__sub-list js-sub-list">
                              
                              
                              <li>
                               <a class="js-arrow" href="registration.jsp">
                                <i class="fas fa-copyright"></i>Registrar Nuevo Usuario
                           
                               </a>
                               
              
                              
                          </ul>

                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-box"></i>Productos
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="InsertarProducto.jsp">
                                        <i class="fas fa-plus-square"></i>Agregar Nuevo Producto</a>
                                </li>
                                <li>
                                    <a href="ProductosServlet?action=listar">
                                        <i class="fab fa-searchengin"></i>Consultar Productos</a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="far fa-address-book"></i>Proveedores
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="AgregarProveedor.jsp">
                                        <i class="fas fa-plus-square"></i>Crear</a>
                                </li>
                                <li>
                                    <a href="ProveedorServlet">
                                        <i class="fab fa-searchengin"></i>Consultar</a>
                                </li>
                            </ul>
                        </li> 
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-clipboard-check"></i>Ventas
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="RegistrarVenta.jsp">
                                        <i class="fas fa-plus-square"></i>Generar nueva venta</a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fab fa-searchengin"></i>Consultar Ventas</a>
                                </li>
                              
                            </ul>
                        </li>
                        
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-shopping-bag"></i>Pedidos
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
								<li>
									<a href="GenerarPedido.jsp"> 
										<i class="fas fa-plus-square"></i>Añadir Pedidos</a>
								</li>
								<li><a href="GenerarPedidoServlet?instruccion=visualizar"> <i
										class="fab fa-searchengin"></i>Consultar Pedidos
								</a></li>
	

							
							</ul>
                        </li>
                        
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-warehouse"></i>Almacen
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="InsertarInsumo.jsp">
                                        <i class="fas fa-plus-square"></i>Agregar Insumos</a>
                                </li>
                                <li>
                                    <a href="InsumosServlet">
                                        <i class="fas fa-plus-square"></i>Listar Insumos</a>
                                </li>
                                
                                
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-flag-checkered"></i>Informes
                                <span class="arrow">
                                    <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="Ventas_XFecha.jsp">
                                        <i class="fab fa-searchengin"></i>Ventas por Fecha</a>
                                </li>
                                <li>
                                    
                                    <a href="ServletCompra?tipo=cargaproveedor">
                                        <i class="fab fa-searchengin"></i>Compras por Proveedor</a>    
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

</body>

</html>
<!-- end document-->