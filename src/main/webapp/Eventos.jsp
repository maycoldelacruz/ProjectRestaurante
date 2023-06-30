<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*, modelo.*, util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" href="./favicon.svg" type="images/svg+xml" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&family=Forum&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="./css/restaurante.css" />
	<title>Perú Criollo</title></head>
<body>
<!-- 
    - #HEADER
  -->

    <header class="header" data-header>
      <div class="container">
        <a href="#" class="logo">
          <img
            src="./images/icon/logo.webp"
            width="160"
            height="50"
            alt="Grilli - Home" />
        </a>

        <a href="#" class="btn btn-secondary">
          <span class="text text-1">Reservar Mesa</span>

          <span class="text text-2" aria-hidden="true">Reservar Mesa</span>
        </a>

        <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
          <span class="line line-1"></span>
          <span class="line line-2"></span>
          <span class="line line-3"></span>
        </button>

        <div class="overlay" data-nav-toggler data-overlay></div>
      </div>
    </header>
<!-- 
        - #EVENT
      -->
      <main>
        <section class="section event bg-black-10" aria-label="event">
          <div class="container">
            <p class="section-subtitle label-2 text-center">
              Publicaciones recientes
            </p>

            <h2 class="section-title headline-1 text-center">
              Próximos Eventos
            </h2>

            <ul class="grid-list">
            	
            <%
            	Connection con = MySqlConexion.getConexion();
            	String sql = "call ListarPublicacionesPublicadas()";
            	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            	PreparedStatement ps = con.prepareStatement(sql);
            	ResultSet rs = ps.executeQuery();
            	while (rs.next()) {
            %>
              <li>
                <div class="event-card has-before hover:shine">
                  <div
                    class="card-banner img-holder"
                    style="--width: 350; --height: 450">
                    <img
                      src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(rs.getBytes("archivo")) %>"
                      width="350"
                      height="450"
                      loading="lazy"
                      alt="Flavour so good youâ€™ll try to eat with your eyes."
                      class="img-cover" />

                    <time class="publish-date label-2"
                      ><%= dateFormat.format(rs.getDate("fecha_publicacion")) %></time
                    >
                  </div>

                  <div class="card-content">
                    <p class="card-subtitle label-2 text-center">
                    <%= rs.getString("titulo") %>
                    </p>

                    <h3 class="card-title title-2 text-center">
                    <%= rs.getString("descripcion") %>
                    </h3>
                  </div>
                </div>
              </li>
             <% } %>
            </ul>

            <a href="#" class="btn btn-primary">
              <span class="text text-1">Ver nuestro blog</span>

              <span class="text text-2" aria-hidden="true"
                >Ver nuestro blog</span
              >
            </a>
          </div>
        </section>
      </main>
        
        <!-- 
    - #FOOTER
  -->

    <footer
      class="footer section has-bg-image text-center"
      style="background-image: url('./images/footer-bg.jpg')">
      <div class="container">
        <div class="footer-top grid-list">
          <div class="footer-brand has-before has-after">
            <a href="#" class="logo">
              <img
            	src="./images/icon/logo.webp"
                width="160"
                height="50"
                loading="lazy"
                alt="grilli home" />
            </a>

            <address class="body-4">
              Avenida Paseo De La República, Miraflores, Lima
            </address>

            <a href="mailto:booking@grilli.com" class="body-4 contact-link"
              >perucriollo@gmail.com</a
            >

            <a href="tel:+88123123456" class="body-4 contact-link"
              >Agendar una reserva: +88-123-123456</a
            >

            <p class="body-4">Open : 09:00 am - 01:00 pm</p>

            <div class="wrapper">
              <div class="separator"></div>
              <div class="separator"></div>
              <div class="separator"></div>
            </div>

            <p class="title-1">Get News & Offers</p>

            <p class="label-1">
              Subscribe us & Get <span class="span">25% Off.</span>
            </p>

            <form action="" class="input-wrapper">
              <div class="icon-wrapper">
                <ion-icon name="mail-outline" aria-hidden="true"></ion-icon>

                <input
                  type="email"
                  name="email_address"
                  placeholder="Your email"
                  autocomplete="off"
                  class="input-field" />
              </div>

              <button type="submit" class="btn btn-secondary">
                <span class="text text-1">Suscribirse</span>

                <span class="text text-2" aria-hidden="true">Suscribirse</span>
              </button>
            </form>
          </div>

          <ul class="footer-list">
            <li>
              <a href="#" class="label-2 footer-link hover-underline">Home</a>
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline">Menus</a>
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >About Us</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Our Chefs</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Contact</a
              >
            </li>
          </ul>

          <ul class="footer-list">
            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Facebook</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Instagram</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Twitter</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Youtube</a
              >
            </li>

            <li>
              <a href="#" class="label-2 footer-link hover-underline"
                >Google Map</a
              >
            </li>
          </ul>
        </div>

        <div class="footer-bottom">
          <p class="copyright">
            &copy; 2023 Peru Criollo. Todos los derechos reservados
          </p>
        </div>
      </div>
    </footer>

    <!-- 
    - #BACK TO TOP
  -->

    <a
      href="#top"
      class="back-top-btn active"
      aria-label="back to top"
      data-back-top-btn>
      <ion-icon name="chevron-up" aria-hidden="true"></ion-icon>
    </a>
    
    <!-- 
    - custom js link
  -->
    <script src="./js/script.js"></script>

    <!-- 
    - ionicon link
  -->
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script
</body>
</html>