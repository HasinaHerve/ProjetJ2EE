<%@ page language="java" contentType="text/html; charset-ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Liste</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="Datatables/dt/css/dataTables.bootstrap4.min.css">
	<script src="ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="Datatables/dt/js/jquery.dataTables.min.js"></script>
    <script src="Datatables/dt/js/dataTables.bootstrap4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
	<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    
	
</head>
<style type="text/css">
.esp1 {
  background-color: #999999;
  font-size: 110%;
  width: 100%;
  padding-bottom: 10px;

}


.esp1:hover,
.esp1:focus {
  background-color: #006622;
}
.dec:hover,
.dec:focus{
    width:20%;
}
h5,
.modif{
	color: #999999;	
}
h5:hover,
h5:focus{
    color: white;
}
.nav-link{
	color: white;	
}
.containerTab {
  padding: 20px;
  color: white;
}
.nav-link:hover,
.nav-link:focus,
.modif:hover,
.modif:focus{
    color: #1f1f24;
}
.form-control{
    font-size:14px;
}
.btn{
    font-size:14px;
}
.centre {
  margin: auto;
  width: 90%;
  padding: 10px;
}
.user{
    position:fixed;right:5px;top:1px;
}
.user1{
    position:fixed;left:5px;top:1px;
}
@media screen and (max-width: 600px) {
  .user{
    position:fixed;right:70px;top:1px;
  }
 
}
.notification {
  color: white;
  text-decoration: none;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification .badge {
  position: absolute;
  top: -2px;
  right: -4px;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: #e60000;
  color: white;
}
</style>
<script>
function myFunction() {
  var x = document.getElementById("user");
  if (x.className === "dropdown dropbottom user") {
    x.className = "dropdown dropbottom user1";
  } else {
    x.className = "dropdown dropbottom topnav";
  }
}
</script>
<body style=" font-family: 'Times New Roman', 'Times', 'serif';font-size:14px">
    <nav class="navbar navbar-expand-sm fixed-top" style="background-color:#1f1f24;">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<img src="image/menu1.png" id="menu" alt="">
		</button>
        <div class="dropdown dropbottom user" id="user">
            <a class="nav-link" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="color:#999999" href="#"><h5><img src="image/utB.png" id="us" alt="">Utilisateur</h5></a>
            <div class="dropdown-menu shadow p-4 mb-4 bg-white" style="text-align:center">
                <a class="nav-link" data-toggle="modal" data-target="#Modal1" href="#"><p class="modif" style="font-size:14px;">Modification</p></a>
                <a data-toggle="tooltip" data-placement="bottom" title="Se déconnecter" href="Index.jsp"><img class="dec" src="image/dec1.png" alt=""></a>
            </div>
        </div>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav" style="padding-left:70px;font-size:1.5vw">
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tooltip" data-placement="bottom" title="Voir toutes les listes" href="#" ><h5 style="color:white">Liste des produits</h5></a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tooltip" data-placement="bottom" title="Afficher le formulaire d'ajout d'un produit"  href="AjoutProduit.jsp"><h5>Produits</h5></a>
				</li>
            </ul>
		</div>
    </nav> 
    <form action="mservlet" method="post">
	   	<div id="b2" class="containerTab" style="padding-top:80px">
	         <div class="centre shadow p-4 mb-4 bg-white" id="" style="background-color:white;border-radius:5px;padding-left:50px;padding-right:0px;padding-bottom:5px;">
	              <div class="table-responsive">
		              <table class="table table-hover" id="myTable">
		                    <thead>
			                 	<tr>
			                     	<th>IdProduit</th>
			                     	<th>NomProduit</th>
			                     	<th>Description</th>
			                     	<th>Taille</th>
			                     	<th>Photo</th>
			                     	<th>Prix</th>
			                     	<th>Status</th>  
			                     	<th>CinClient</th> 
			                     	<th>Facture</th>
			                     	<th>Modifier</th>  
			                     	<th>Supprimer</th>     
			                     </tr>
		                     </thead>
		                     <tbody style="color:#737373">
		                     	  <c:forEach items="${produit}" var="p">
		                     	  	<tr>
		                     	  		<td>${p.idProduit}</td>
		                     	  		<td>${p.nomProduit}</td>
		                     	  		<td>${p.description}</td>
		                     	  		<td>${p.taille}</td>
		                     	  		<td><a href="${p.photo}" class="glightbox"><img src="${p.photo}" class="menu-img" alt="" style="height:40px"/> </a></td>
		                     	  		<td>${p.prix}</td>
		                     	  		<td>${p.status}</td>
		                     	  		<td>${p.cin}</td>
		                     	  		<td>
		                     	  			<c:if test="${p.cin!=null}">  
											   	<button class="btn btn-info" value="modifier" style="font-size:14px" name="imp${p.idProduit}" value="${p.idProduit}">Imprimer</button>
											</c:if>
		                     	  		</td>
		                     	  		<td><button class="btn btn-info" value="modifier" style="font-size:14px" name="${p.idProduit}" value="${p.idProduit}">Modifer</button></td>
		                     	  		<td><button class="btn btn-danger" value="supprimer" style="font-size:14px" name="s${p.idProduit}" value="${p.idProduit}">Supprimer</button></td>
		                     	  	</tr>
		                     	  </c:forEach>
		                     </tbody>
		                </table>
	                </div>
	          </div> 
	    </div>
    </form>
    <div class="modal fade" id="Modal1">
        <div class="modal-dialog">
            <form class="form-horizontal" name="form" method="POST" action="servlet">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" style="color: #1f1f24"><img class="img-fluid" src="image/modP.png" >Modification du mot de passe</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body" style="">
                        <div class="container text-center" style="border: 1px solid #006622;border-radius: 5px;"></br>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-4" style="">Ancien mot de passe:</label>
                                        <div class="col-8" style="column-width: 400px;">
                                            <input type="password" maxlength="12" class="form-control" placeholder="Entrez votre ancien mot de passe" name="amdp" value="" required>
                                            <span class="container text-left">
                                                <label class="control-label text-danger"></label> 
                                            </span>					    
                                        </div>
                                    </div></br>
                                    <div class="row">
                                        <label class="control-label col-4" for="pwd" onclick="verif()" style="">Nouveau mot de passe:</label>
                                        <div class="col-8" style="column-width: 400px;">          
                                            <input maxlength="12" type="password" class="form-control" id="nmdp" placeholder="Entrez votre nouveau mot de passe" name="nmdp" value="" required>
                                            <span class="container text-left">
                                                <label class="control-label text-danger"></label> 
                                            </span>	 
                                        </div>
                                    </div>                                 
                                </div>     
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <div class="btn-group">
                            <div class="col-6">
                                <button type="reset" class="btn btn-danger" id="connecter" name="annuler" value="annuler">Annuler <img class="img-fluid" src="image/cancel.png"></button>
                            </div>
                            <div class="col-7">
                                <button type="submit" class="btn btn-success" name="action" value="modifmdp">Enregistrer<img class="img-fluid" src="image/save.png"></button>
                            </div>	        
                        </div>
                    </div>
                </div>
            </form>		    
        </div>
    </div>
    <c:if test="${requestScope.supprimer!=null}">  
		<div class="modal fade" id="ModalS">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h5 class="modal-title text-danger">Suppréssion</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body" style="color:#737373">
	                    <label class="control-label">Etes-vous sûr de vouloir supprimer le produit numéro ${requestScope.supprimer}</label>
	                </div>
	                
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <div class="btn-group">
	                        <div class="col-6">
	                            <button type="submit" class="btn btn-secondary" data-dismiss="modal">Non</button>
	                        </div>
	                        <form method="post" action="mservlet">
		                        <div class="col-7">
		                            <button type="submit" class="btn btn-danger" name="validSupp${requestScope.supprimer}">Oui</button>
		                        </div>
	                        </form>		        
	                    </div>
	                </div>
	                
	            </div>
	        </div>
	    </div>
	    <script>
    	    	$('#ModalS').modal('show');	      
	    </script>
	</c:if>
    
    <div class="jumbotron jumbotron-fluid text-center" style="margin-bottom:0;background-color:#e6e6e6;color:#999999;">
		<p>copyright Vente en ligne | 2023 All Right Reserved</p>
	</div>
<script>
	$(document).ready(function() {
	    $('#myTable').DataTable();
	});
</script>
</body>
</html>