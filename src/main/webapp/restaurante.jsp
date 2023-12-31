<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*, modelo.*, util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="shortcut icon" href="./favicon.svg" type="images/svg+xml" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;700&family=Forum&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="./css/restaurante.css" />
	<title>Per� Criollo</title>
	<link rel="preload" as="image" href="./images/hero-slider-1.jpg" />
    <link rel="preload" as="image" href="./images/hero-slider-2.jpg" />
    <link rel="preload" as="image" href="./images/hero-slider-3.jpg" />
</head>
<body>
	<!-- 
    - #PRELOADER
  	-->
    <div class="preload" data-preaload>
      <div class="circle"></div>
      <p class="text">Per�<br />Criollo</p>
    </div>
    
    <!-- 
    - #TOP BAR
  	-->
    <div class="topbar">
      <div class="container">
        <address class="topbar-item">
          <div class="icon">
            <ion-icon name="location-outline" aria-hidden="true"></ion-icon>
          </div>

          <span class="span">
            Avenida Paseo De La Rep�blica, Miraflores, Lima
          </span>
        </address>

        <div class="separator"></div>

        <div class="topbar-item item-2">
          <div class="icon">
            <ion-icon name="time-outline" aria-hidden="true"></ion-icon>
          </div>

          <span class="span">9.30 am a 10.00 pm</span>
        </div>

        <a href="tel:+11234567890" class="topbar-item link">
          <div class="icon">
            <ion-icon name="call-outline" aria-hidden="true"></ion-icon>
          </div>

          <span class="span">+51 (01)242-8248</span>
        </a>

        <div class="separator"></div>

        <a href="mailto:booking@restaurant.com" class="topbar-item link">
          <div class="icon">
            <ion-icon name="mail-outline" aria-hidden="true"></ion-icon>
          </div>

          <span class="span">perucriollo@gmail.com</span>
        </a>
      </div>
    </div>
    
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

        <nav class="navbar" data-navbar>
          <button class="close-btn" aria-label="close menu" data-nav-toggler>
            <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
          </button>

          <a href="#" class="logo">
            <img
              src="./images/logo.svg"
              width="160"
              height="50"
              alt="Grilli - Home" />
          </a>

          <ul class="navbar-list">
            <li class="navbar-item">
              <a href="#home" class="navbar-link hover-underline active">
                <div class="separator"></div>

                <span class="span">Inicio</span>
              </a>
            </li>

            <li class="navbar-item">
              <a href="#about" class="navbar-link hover-underline">
                <div class="separator"></div>

                <span class="span">Nosotros</span>
              </a>
            </li>
            
            <li class="navbar-item">
              <a href="Eventos.jsp" class="navbar-link hover-underline">
                <div class="separator"></div>

                <span class="span">Eventos</span>
              </a>
            </li>

            <li class="navbar-item">
              <a href="#reservation" class="navbar-link hover-underline">
                <div class="separator"></div>

                <span class="span">Contacto</span>
              </a>
            </li>
          </ul>

          <div class="text-center">
            <p class="headline-1 navbar-title">Visítanos</p>

            <address class="body-4">
              Avenida Paseo De La República<br />
              Miraflores, Lima
            </address>

            <p class="body-4 navbar-text">Abierto: 9.30 am - 2.30pm</p>

            <a href="mailto:booking@grilli.com" class="body-4 sidebar-link"
              >perucriollo@gmail.com</a
            >

            <div class="separator"></div>

            <p class="contact-label">Solicitar reserva</p>

            <a
              href="tel:+88123123456"
              class="body-1 contact-number hover-underline">
              +51 (01)242-8248
            </a>
          </div>
        </nav>

        

        <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
          <span class="line line-1"></span>
          <span class="line line-2"></span>
          <span class="line line-3"></span>
        </button>

        <div class="overlay" data-nav-toggler data-overlay></div>
      </div>
    </header>
    
    <main>
    	<article>
    		<!-- 
        - #HERO
      -->

        <section class="hero text-center" aria-label="home" id="home">
          <ul class="hero-slider" data-hero-slider>
            <li class="slider-item active" data-hero-slider-item>
              <div class="slider-bg">
                <img
                  src="./images/hero-slider-1.jpg"
                  width="1880"
                  height="950"
                  alt=""
                  class="img-cover" />
              </div>

              <p class="label-2 section-subtitle slider-reveal">
                Tradicional y Elegante
              </p>

              <h1 class="display-1 hero-title slider-reveal">
                Por amor a nuestra <br />
                deliciosa gastronom�a
              </h1>

              <p class="body-2 hero-text slider-reveal">
                Ven con tu familia y disfruta el placer de la comida peruana
              </p>

              <a href="#" class="btn btn-primary slider-reveal">
                <span class="text text-1">Ver nuestro men�</span>

                <span class="text text-2" aria-hidden="true"
                  >Ver nuestro men�</span
                >
              </a>
            </li>

            <li class="slider-item" data-hero-slider-item>
              <div class="slider-bg">
                <img
                  src="./images/hero-slider-2.jpg"
                  width="1880"
                  height="950"
                  alt=""
                  class="img-cover" />
              </div>

              <p class="label-2 section-subtitle slider-reveal">
                Exquisita Experiencia
              </p>

              <h1 class="display-1 hero-title slider-reveal">
                Sabores inspirados por <br />
                nuestras tradiciones
              </h1>

              <p class="body-2 hero-text slider-reveal">
                Ven con tu familia y disfruta el placer de la comida peruana
              </p>

              <a href="#" class="btn btn-primary slider-reveal">
                <span class="text text-1">Ver nuestro men�</span>

                <span class="text text-2" aria-hidden="true"
                  >Ver nuestro men�</span
                >
              </a>
            </li>

            <li class="slider-item" data-hero-slider-item>
              <div class="slider-bg">
                <img
                  src="./images/hero-slider-3.jpg"
                  width="1880"
                  height="950"
                  alt=""
                  class="img-cover" />
              </div>

              <p class="label-2 section-subtitle slider-reveal">
                Incre�blemente delicioso
              </p>

              <h1 class="display-1 hero-title slider-reveal">
                Donde cada sabor<br />
                cuenta una historia
              </h1>

              <p class="body-2 hero-text slider-reveal">
                Ven con tu familia y disfruta el placer de la comida peruana
              </p>

              <a href="#" class="btn btn-primary slider-reveal">
                <span class="text text-1">Ver nuestro men�</span>

                <span class="text text-2" aria-hidden="true"
                  >Ver nuestro men�</span
                >
              </a>
            </li>
          </ul>

          <button
            class="slider-btn prev"
            aria-label="slide to previous"
            data-prev-btn>
            <ion-icon name="chevron-back"></ion-icon>
          </button>

          <button
            class="slider-btn next"
            aria-label="slide to next"
            data-next-btn>
            <ion-icon name="chevron-forward"></ion-icon>
          </button>

          <a href="#" class="hero-btn has-after">
            <img
              src="./images/hero-icon.png"
              width="48"
              height="48"
              alt="booking icon" />

            <span class="label-2 text-center span">Reservar una mesa</span>
          </a>
        </section>
        
        <!-- 
        - #SERVICE
      -->

        <section
          class="section service bg-black-10 text-center"
          aria-label="service">
          <div class="container">
            <p class="section-subtitle label-2">Sabores exquisitos</p>

            <h2 class="headline-1 section-title">Ofrecemos la mejor calidad</h2>

            <p class="section-text">
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry lorem Ipsum has been the industrys standard dummy text
              ever.
            </p>

            <ul class="grid-list">
              <li>
                <div class="service-card">
                  <a href="#" class="has-before hover:shine">
                    <figure
                      class="card-banner img-holder"
                      style="--width: 285; --height: 336">
                      <img
                        src="./images/service-1.jpg"
                        width="285"
                        height="336"
                        loading="lazy"
                        alt="Breakfast"
                        class="img-cover" />
                    </figure>
                  </a>

                  <div class="card-content">
                    <h3 class="title-4 card-title">
                      <a href="#">Desayunos</a>
                    </h3>

                    <a href="#" class="btn-text hover-underline label-2"
                      >Ver men�</a
                    >
                  </div>
                </div>
              </li>

              <li>
                <div class="service-card">
                  <a href="#" class="has-before hover:shine">
                    <figure
                      class="card-banner img-holder"
                      style="--width: 285; --height: 336">
                      <img
                        src="./images/service-2.jpg"
                        width="285"
                        height="336"
                        loading="lazy"
                        alt="Appetizers"
                        class="img-cover" />
                    </figure>
                  </a>

                  <div class="card-content">
                    <h3 class="title-4 card-title">
                      <a href="#">Aperitivos</a>
                    </h3>

                    <a href="#" class="btn-text hover-underline label-2"
                      >Ver men�</a
                    >
                  </div>
                </div>
              </li>

              <li>
                <div class="service-card">
                  <a href="#" class="has-before hover:shine">
                    <figure
                      class="card-banner img-holder"
                      style="--width: 285; --height: 336">
                      <img
                        src="./images/service-3.jpg"
                        width="285"
                        height="336"
                        loading="lazy"
                        alt="Drinks"
                        class="img-cover" />
                    </figure>
                  </a>

                  <div class="card-content">
                    <h3 class="title-4 card-title">
                      <a href="#">Bebidas</a>
                    </h3>

                    <a href="#" class="btn-text hover-underline label-2"
                      >Ver men�</a
                    >
                  </div>
                </div>
              </li>
            </ul>

            <img
              src="./images/shape-1.png"
              width="246"
              height="412"
              loading="lazy"
              alt="shape"
              class="shape shape-1 move-anim" />
            <img
              src="./images/shape-2.png"
              width="343"
              height="345"
              loading="lazy"
              alt="shape"
              class="shape shape-2 move-anim" />
          </div>
        </section>
        
        <!-- 
        - #ABOUT
      -->

        <section
          class="section about text-center"
          aria-labelledby="about-label"
          id="about">
          <div class="container">
            <div class="about-content">
              <p class="label-2 section-subtitle" id="about-label">
                Nuestra historia
              </p>

              <h2 class="headline-1 section-title">
                Cada sabor cuenta una historia
              </h2>

              <p class="section-text">
                Lorem Ipsum is simply dummy text of the printingand typesetting
                industry lorem Ipsum has been the industrys standard dummy text
                ever since the when an unknown printer took a galley of type and
                scrambled it to make a type specimen book It has survived not
                only five centuries, but also the leap into.
              </p>

              <div class="contact-label">Reservar por llamada</div>

              <a
                href="tel:+804001234567"
                class="body-1 contact-number hover-underline"
                >+51 (01)242-8248</a
              >

              <a href="#" class="btn btn-primary">
                <span class="text text-1">Conocer m�s</span>

                <span class="text text-2" aria-hidden="true">Conocer m�s</span>
              </a>
            </div>

            <figure class="about-banner">
              <img
                src="./images/about-banner.jpg"
                width="570"
                height="570"
                loading="lazy"
                alt="about banner"
                class="w-100"
                data-parallax-item
                data-parallax-speed="1" />

              <div
                class="abs-img abs-img-1 has-before"
                data-parallax-item
                data-parallax-speed="1.75">
                <img
                  src="./images/about-abs-image.jpg"
                  width="285"
                  height="285"
                  loading="lazy"
                  alt=""
                  class="w-100" />
              </div>

              <div class="abs-img abs-img-2 has-before">
                <img
                  src="./images/badge-2.png"
                  width="133"
                  height="134"
                  loading="lazy"
                  alt="" />
              </div>
            </figure>

            <img
              src="./images/shape-3.png"
              width="197"
              height="194"
              loading="lazy"
              alt=""
              class="shape" />
          </div>
        </section>
        
        <!-- 
        - #TESTIMONIALS
      -->

        <section
          class="section testi text-center has-bg-image"
          style="background-image: url('./images/testimonial-bg.jpg')"
          aria-label="testimonials">
          <div class="container">
            <p class="headline-2 testi-text">
              Quer�a darte las gracias por invitarme a esa incre�ble cena la
              otra noche. La comida fue extraordinaria.
            </p>

            <div class="wrapper">
              <div class="separator"></div>
              <div class="separator"></div>
              <div class="separator"></div>
            </div>

            <div class="profile">
              <img
                src="./images/testi-avatar.jpg"
                width="100"
                height="100"
                loading="lazy"
                alt="Sam Jhonson"
                class="img" />

              <p class="label-2 profile-name">Sam Jhonson</p>
            </div>
          </div>
        </section>

        <!-- 
        - #RESERVATION
      -->

        <section class="reservation" id="reservation">
          <div class="container">
            <div class="form reservation-form bg-black-10">
              <form action="" class="form-left">
                <h2 class="headline-1 text-center">Reservaci�n Online</h2>

                <p class="form-text text-center">
                  Solicitar reserva
                  <a href="tel:+88123123456" class="link">+88-123-123456</a>
                  o llena nuestro breve formulario
                </p>

                <div class="input-wrapper">
                  <input
                    type="text"
                    name="name"
                    placeholder="Your Name"
                    autocomplete="off"
                    class="input-field" />

                  <input
                    type="tel"
                    name="phone"
                    placeholder="Phone Number"
                    autocomplete="off"
                    class="input-field" />
                </div>

                <div class="input-wrapper">
                  <div class="icon-wrapper">
                    <ion-icon
                      name="person-outline"
                      aria-hidden="true"></ion-icon>

                    <select name="person" class="input-field">
                      <option value="1-person">1 Persona</option>
                      <option value="2-person">2 Personas</option>
                      <option value="3-person">3 Personas</option>
                      <option value="4-person">4 Personas</option>
                      <option value="5-person">5 Personas</option>
                      <option value="6-person">6 Personas</option>
                      <option value="7-person">7 Personas</option>
                    </select>

                    <ion-icon name="chevron-down" aria-hidden="true"></ion-icon>
                  </div>

                  <div class="icon-wrapper">
                    <ion-icon
                      name="calendar-clear-outline"
                      aria-hidden="true"></ion-icon>

                    <input
                      type="date"
                      name="reservation-date"
                      class="input-field" />

                    <ion-icon name="chevron-down" aria-hidden="true"></ion-icon>
                  </div>

                  <div class="icon-wrapper">
                    <ion-icon name="time-outline" aria-hidden="true"></ion-icon>

                    <select name="person" class="input-field">
                      <option value="08:00am">08 : 00 am</option>
                      <option value="09:00am">09 : 00 am</option>
                      <option value="010:00am">10 : 00 am</option>
                      <option value="011:00am">11 : 00 am</option>
                      <option value="012:00am">12 : 00 am</option>
                      <option value="01:00pm">01 : 00 pm</option>
                      <option value="02:00pm">02 : 00 pm</option>
                      <option value="03:00pm">03 : 00 pm</option>
                      <option value="04:00pm">04 : 00 pm</option>
                      <option value="05:00pm">05 : 00 pm</option>
                      <option value="06:00pm">06 : 00 pm</option>
                      <option value="07:00pm">07 : 00 pm</option>
                      <option value="08:00pm">08 : 00 pm</option>
                      <option value="09:00pm">09 : 00 pm</option>
                      <option value="10:00pm">10 : 00 pm</option>
                    </select>

                    <ion-icon name="chevron-down" aria-hidden="true"></ion-icon>
                  </div>
                </div>

                <textarea
                  name="message"
                  placeholder="Message"
                  autocomplete="off"
                  class="input-field"></textarea>

                <button type="submit" class="btn btn-secondary">
                  <span class="text text-1">Reservar una mesa</span>


                  <span class="text text-2" aria-hidden="true"
                    >Reservar una mesa</span
                  >
                </button>
              </form>

              <div
                class="form-right text-center"
                style="
                  background-image: url('./images/form-pattern.png');
                ">
                <h2 class="headline-1 text-center">Cont�ctanos</h2>

                <p class="contact-label">Agendar una reserva</p>

                <a
                  href="tel:+88123123456"
                  class="body-1 contact-number hover-underline"
                  >+51 (01)242-8248</a
                >

                <div class="separator"></div>

                <p class="contact-label">Direcci�n</p>

                <address class="body-4">
                  Avenida Paseo De La Rep�blica, <br />
                  Miraflores, Lima
                </address>

                <p class="contact-label">Almuerzo</p>

                <p class="body-4">
                  Lunes a Domingo <br />
                  12.00 am - 2.30pm
                </p>

                <p class="contact-label">Cena</p>

                <p class="body-4">
                  Lunes a Domingo <br />
                  5.00 pm - 10.00pm
                </p>
              </div>
            </div>
          </div>
        </section>
        <main>
        <section class="section event bg-black-10" aria-label="event">
          <div class="container">
            <p class="section-subtitle label-2 text-center">
              Publicaciones recientes
            </p>

            <h2 class="section-title headline-1 text-center">
              Pr�ximos Eventos
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
                      alt="Flavour so good you’ll try to eat with your eyes."
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
        
        
        

    	</article>
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
              Avenida Paseo De La Rep�blica, Miraflores, Lima
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
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>