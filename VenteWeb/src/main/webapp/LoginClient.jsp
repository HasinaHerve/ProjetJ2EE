<%@ page language="java" contentType="text/html; charset-ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Se connecter</title>
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

h5{
	color: #999999;	
}
h5:hover,
h5:focus{
    color: white;
}
.form-control{
    font-size:14px;
}
.btn{
    font-size:14px;
}
</style>
<body style=" font-family: 'Times New Roman', 'Times', 'serif';background-color:white;font-size:14px">
	<div class="container-fluid" style="padding-top: 85px;">
	  	<div class="row" >	
		    <div class="col-md-2" style="padding-top: 20px;position:fixed;z-index:1;">
				
		    </div>
	
		    <div class="col-md-10" id="ea" style="height: 700px;padding-left: 31.25%;padding-right: 5.25%;padding-top: 20px">
		    	<div class="shadow p-4 mb-4 bg-white" style="border-radius: 5px;width: 80%;text-align: center;padding-right:20px;">
					<h4 style="color:#1f1f24"><img class="img-fluid" src="image/aut.png">Authentification</h4></br>
						<c:if test="${requestScope.connection!=null}">  
						   	<div class="alert alert-warning alert-dismissible fade show" style="margin-left:17px">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								${requestScope.connection}
							</div> 
						</c:if>
						
						<form method="POST"  action="cservlet">
						<div class="form-group">
							<div class="row">
								<label class="control-label col-md-4" for="nomU">Cin:</label>
								<div class="col-md-8" style="column-width: 400px;">
									<input type="text" class="form-control" placeholder="Entrez votre cin" onkeypress="return event.charCode>=48 && event.charCode<=57" name="cin" maxlength="12" required>	
									<span class="container text-left">
										<label class="control-label text-danger"></label> 
									</span>		    
								</div>
							</div></br>
							<div class="row">
								<label class="control-label col-md-4" for="pwd" style="">Mot de passe:</label>
								<div class="col-md-8" style="column-width: 400px;">          
									<input type="password" class="form-control" maxlength="12" id="pwdl" placeholder="Entrez votre mot de passe" name="mdp" value="" required> 
									<span class="container text-left">
										<label class="control-label text-danger"></label> 
									</span>
									<span class="container text-center">
										<label class="control-label text-danger"></label> 
									</span>

								</div>

							</div></br>  
							<div class="row">
								<div class="col-md-4"></div>
								<div class="col-md-8" style="text-align:left">          
									<button type="submit" onmousedown="document.getElementById('spin').style.display='block';document.getElementById('conn').style.display='none'" class="btn btn-success" id="connecter" name="action" value="connecter">
										<div id="spin" style="color:white;display:none">
											<span class="spinner-border spinner-border-sm"></span>
											Se connecter
										</div>
										<div id="conn" style="color:white;">
											Se connecter
										</div>
									</button>       	
								</div>

							</div> 
							</form>
						</div>
				</div>
		    </div>		    
	    </div>



</body>
</html>