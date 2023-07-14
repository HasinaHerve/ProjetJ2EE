<%@ page language="java" contentType="text/html; charset-ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Vente en ligne</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="Datatables/dt/css/dataTables.bootstrap4.min.css">
  <script src="ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="Datatables/dt/js/jquery.dataTables.min.js"></script>
  <script src="Datatables/dt/js/dataTables.bootstrap4.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center me-auto me-lg-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>Vente<span>.</span></h1>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="#hero">Home</a></li>
          <li><a href="#menu">Menu</a></li>
        </ul>
      </nav><!-- .navbar -->

      <a class="btn-book-a-table" href="#book-a-table">Vos informations</a>
      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
      

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero d-flex align-items-center section-bg">
    <div class="container">
      <div class="row justify-content-between gy-5">
        <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
          <h2 data-aos="fade-up">Bienvenue sur<br>Vente de fripperie en ligne</h2>
          <p data-aos="fade-up" data-aos-delay="100">Vous pouvez commmander</p>
        </div>
        <div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
          <img src="image/Logo.jpg" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
        </div>
      </div>
    </div>
  </section><!-- End Hero Section -->

  <main id="main">
  
    <section id="menu" class="menu">
    <form action="cservlet" method="post">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Nos marchandises</h2>
          <p>Choisissez <span>Ce qui vous plait</span></p>
          <p class="cinvalid" style="font-family:inherit;width:20%">
                <input type="text" name="validCin" class="form-control" id="name" placeholder="Entrez votre cin" onkeypress="return event.charCode>=48 && event.charCode<=57" maxlength="12" required>
          </p>
        </div>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="300">

          <div class="tab-pane fade active show" id="menu-starters">

			
            <div class="row gy-5">
				<c:forEach items="${produit}" var="p">
	                  <div class="col-lg-4 menu-item">
	                  	<p class="ingredients" style="color:#1f1f24">
		                  ${p.status}
		                </p>
		                <a href="${p.photo}" class="glightbox"><img src="${p.photo}" class="menu-img" alt="" style="height:50%"/> </a>
		                <h4>${p.taille}</h4>
		                <p class="ingredients">
		                  ${p.description}
		                </p>
		                <p class="price" style="color:">
		                  ${p.prix} ar
		                </p>
		                <c:if test="${p.cin!=null}">  
						   	<p>
		                     	<button onmouseOver="d1()" class="btn btn-success" disabled>Commander</button>
		                	</p>  
						</c:if>
						<c:if test="${p.cin==null}">  
						   	<p>
		                     	<button onmouseOver="d1()" class="btn btn-success" name="${p.idProduit}" value="${p.idProduit}">Commander</button>
		                	</p>  
						</c:if>
		                
		              </div>   	 
	       		</c:forEach>
            </div>
            
          </div>
          </div>
         </div>

          </form>
    </section>
    
<section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Informations</h2>
          <p>Veuillez <span>les enregistrées</span> avant de faire une commande</p>
        </div>

        <div class="row g-0">
          <div class="col-lg-8 d-flex align-items-center reservation-form-bg" style="padding:50px">
            <form action="servlet" method="post">
            	</br>
            	</br>
            	<c:if test="${requestScope.ajoutClientErreur!=null}">  
					<div class="alert alert-warning alert-dismissible fade show" style="margin-left:17px">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
							${requestScope.ajoutClientErreur}
						</div> 
				</c:if>
				<c:if test="${requestScope.ajoutClientSucces!=null}">  
					<div class="alert alert-success alert-dismissible fade show" style="margin-left:17px">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
							${requestScope.ajoutClientSucces}
						</div> 
				</c:if>
              <div class="row gy-4" style="padding:50px">
                <div class="col-lg-4 col-md-6">
                  <input type="text" name="cin" class="form-control" id="name" placeholder="Entrez votre cin" onkeypress="return event.charCode>=48 && event.charCode<=57" maxlength="12" required>
                </div>
                <div class="col-lg-4 col-md-6">
                  <input type="text" class="form-control" name="nomCli" placeholder="Entrez votre nom" required>
                </div>
                <div class="col-lg-4 col-md-6">
                  <input type="text" class="form-control" name="pCli" placeholder="Entrer votre prénom">
                </div>
                <div class="col-lg-4 col-md-6">
                  <input type="text" class="form-control" name="adCli" placeholder="Entrer votre adresse" required>
                </div>
                <div class="col-lg-4 col-md-6">
                  <input type="text" class="form-control" name="telCli" placeholder="Entrer votre numéro téléphone" required>
                </div>
                <div class="col-lg-4 col-md-6">
                </div>
                <div class="col-lg-4 col-md-6">
                  <button type="reset" class="btn btn-danger" id="connecter">Annuler <img src="image/cancel.png" alt=""></button>
                </div>
                <div class="col-lg-4 col-md-6">
                  <button class="btn btn-success" name="action" value="ajouterClient" >Enregistrer <img src="image/yes.png" alt=""></button>
                </div>
               </div>
               </br>
            </br>
           </form>
          </div>
          <!-- End Reservation Form -->
	
        </div>
        

      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-geo-alt icon"></i>
          <div>
            <h4>Address</h4>
            <p>
              Ampasambazaha <br>
              Box-201<br>
            </p>
          </div>

        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-telephone icon"></i>
          <div>
            <h4>Nous contacter</h4>
            <p>
              <strong>Tel:</strong> 034 32 539 03<br>
              <strong>Email:</strong> vente@gmail.com<br>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links d-flex">
          <i class="bi bi-clock icon"></i>
          <div>
            <h4>Heure d'ouverture</h4>
            <p>
              <strong>Lundi-Samedi:</strong> 8H - 19H<br>
              Dimanche: Fermé
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 footer-links">
          <h4>Nous suivre sur</h4>
          <div class="social-links d-flex">
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          </div>
        </div>

      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Vente</span></strong>. All Rights Reserved
      </div>
    </div>

  </footer><!-- End Footer -->
  <!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
 <script>
	function d1(){
        document.getElementById("cinvalid").display='block';
    }
</script>
</body>

</html>