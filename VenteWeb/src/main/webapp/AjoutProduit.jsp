<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>AjoutProduit</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
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
  width: 50%;
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
                <a data-toggle="tooltip" data-placement="bottom" title="Se d�connecter" href="Index.jsp"><img class="dec" src="image/dec1.png" alt=""></a>
            </div>
        </div>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav" style="padding-left:70px;font-size:1.5vw">
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tooltip" data-placement="bottom" title="Voir toutes les listes" href="AfficheListe" ><h5>Liste des produits</h5></a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" data-toggle="tooltip" data-placement="bottom" title="Afficher le formulaire d'ajout d'un produit"  href="#"><h5 style="color:white">Produits</h5></a>
				</li>
				<li class="notification">
                    <a onmouseover="document.getElementById('notif').src='image/notif1.png'" onmouseover="document.getElementById('notif').src='image/notif1.png'" onmouseout="document.getElementById('notif').src='image/notif0.png'" class="nav-link" data-toggle="tooltip" data-placement="bottom" title="Voir toutes les notifications" href="Notification.jsp"><h5><img src="image/notif0.png" id="notif" alt=""><span class="badge">
                    
                    </span></h5></a>
                    
                </li>
            </ul>
		</div>
    </nav>  
        
    <div class="container-fluid" style="padding-top:80px;">
        <div class="centre shadow p-4 mb-4 bg-white" id="etape1" style="background-color:white;border-radius:5px;padding-left:50px;padding-right:0px;padding-bottom:5px;">
            <p style="border-bottom:2px solid #1f1f24;width:19.5%;font-size:18px;color:#1f1f24">Ajouter un produit</p></br>
            <form class="form-horizontal" name="form" method="POST" action="servlet" enctype="multipart/form-data">
            	<div class="form-group">                     
					<div class="row" >
						<div class="col-8" style="">
                            <label class="control-label" style="">Nom:</label>
							<input id="cin" type="text" class="form-control" placeholder="Nom du produit" name="nomProduit"  value="" required>				    
                            <span class="container text-left">
					    		<label class="control-label text-danger"></label> 
					    	</span>
                        </div>
					</div></br>
                    <div class="row" >
						<div class="col-8" style="">
                            <label class="control-label" style="">Description:</label>
							<input type="text" class="form-control" placeholder="Description du produit" name="description" value="" required>
                            <span class="container text-left">
					    		<label class="control-label text-danger"></label> 
					    	</span>				    
						</div>
					</div></br>   
					<div class="row" >
						<div class="col-8" style="">
                            <label class="control-label" style="">Taille</label>
							<input type="text" class="form-control" placeholder="Taille du produit" name="taille" value="" required>
                            <span class="container text-left">
					    		<label class="control-label text-danger"></label> 
					    	</span>				    
						</div>
					</div></br>
					<div class="row" >
						<div class="col-8" style="">
                            <label class="control-label" style="">Photo</label>
							<div class="custom-file">
							    <input type="file" class="custom-file-input" id="customFile" name="photo" required>
							    <label class="custom-file-label" for="customFile">Photo du produit</label>
						  	</div>				    
						</div>
					</div></br>  
					<div class="row" >
						<div class="col-8" style="">
                            <label class="control-label" style="">Prix:</label>
							<input onkeypress="return event.charCode>=48 && event.charCode<=57" type="text" class="form-control" placeholder="Prix du produit en ariary" name="prix" value="" required>
                            <span class="container text-left">
					    		<label class="control-label text-danger"></label> 
					    	</span>				    
						</div>
					</div></br>        
				</div>
				<div class="row" >
                	<div class="col-3" style="margin-right:0px">
                         <button type="reset" class="btn btn-danger" id="connecter">Annuler <img src="image/cancel.png" alt=""></button>
                    </div></br>
                    <div class="col-9" style="padding-left:0px">
                         <button class="btn btn-success" name="action" value="ajouter" >Enregistrer <img src="image/yes.png" alt=""></button>
                    </div> 
				</div></br>
            </form>	 
    	</div>   		
    </div>
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
    
    <div class="jumbotron jumbotron-fluid text-center" style="margin-bottom:0;background-color:#e6e6e6;color:#999999;">
		<p>copyright Vente en ligne | 2023 All Right Reserved</p>
	</div>
<script>
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }
    $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
    });
    function c(){
        document.getElementById("us").src='m.png'
    }
    if(document.getElementById('pp').checked==true){
        document.getElementById('inpp').value="personne physique";
    }
    if(document.getElementById('pm').checked==true){
        document.getElementById('inpm').value="personne morale";
    }
    function verifMdp(){
		if(!document.forms['form1']['amdp'].value=="" && document.forms['form1']['nmdp'].value.length<5){
			alert("Le mot de passe est trop court(doit contenir au moins 5 caractères)");
			document.getElementById('nmdp').focus();
		}
	}
    function verifCin(){
		if(document.forms['form']['cin'].value.length<12){
			alert("Le numéro de la carte d'identité nationale doit contenir exactement 12 chiffres");
			document.getElementById('cin').focus();
		}
	}
</script>
</body>
</html>