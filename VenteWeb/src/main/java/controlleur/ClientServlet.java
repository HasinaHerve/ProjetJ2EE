package controlleur;
import javax.servlet.http.*; 
import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prod.Admin;
import prod.Client;
import prod.IVenteLocal;
import prod.Produit;

@WebServlet("/cservlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IVenteLocal vente;
    public ClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Produit> produit=vente.getAllProduit();
		request.setAttribute("produit", produit);
		request.getRequestDispatcher("AcceuilClient.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String action=request.getParameter("action");
		List<Produit> produit=vente.getAllProduit();
		for (int i = 0; i < produit.size(); i++) {
            if(request.getParameter(String.valueOf(produit.get(i).getIdProduit()))!=null) {
            	List<Client> client=vente.getClientParCin(request.getParameter("validCin"));
    			if(client.size()==0) {
    				request.setAttribute("commandeError", "Votre cin n'a pas encore été enregistrer");
    				doGet(request,response);
    				request.setAttribute("commandeError", null);
    			}
    			else {
    				Produit p=new Produit();
                	p.setIdProduit(produit.get(i).getIdProduit());
                	p.setNomProduit(produit.get(i).getNomProduit());
                	p.setDescription(produit.get(i).getDescription());
                	p.setPhoto(produit.get(i).getPhoto());
                	p.setTaille(produit.get(i).getTaille());
                	p.setPrix(produit.get(i).getPrix());   
                	p.setCin(request.getParameter("validCin"));
                	p.setStatus("Réservée");
                	vente.updateProduit(p);
                	request.setAttribute("commandeSucces", "Commande effectuée");
                	doGet(request,response);
    			}
            	
            }
        }
		if(action.equals("connecter")) {
			List<Client> client=vente.getClientParCin(request.getParameter("cin"));
			if(client.isEmpty()) {
				request.setAttribute("connection", "Ce compte n'existe pas");
            	request.getRequestDispatcher("LoginClient.jsp").forward(request, response);
            }
			else {
				for (int i = 0; i < client.size(); i++) {
					if(client.get(i).getMdpClient().equals(request.getParameter("mdp"))) {
						  
				        session.setAttribute("id",client.get(i).getCin());
						request.setAttribute("connection", "Connection réussie");
						List<Produit> produit1=vente.getAllProduit();
						request.setAttribute("produit", produit1);
						request.getRequestDispatcher("AcceuilClient.jsp").forward(request, response);
	            	}
	            	else {
	            		request.setAttribute("connection", "Mot de passe incorrecte");
		            	request.getRequestDispatcher("LoginClient.jsp").forward(request, response);
	            	}
				}
			}       
		}
		if(action.equals("modifmdp")) {
			List<Client> ut=vente.getClientParCin(session.getAttribute("id").toString());
			for (int i = 0; i < ut.size(); i++) {
				if(ut.get(i).getMdpClient().equals(request.getParameter("amdp"))) {
					Client c=new Client();
					c.setCin(ut.get(i).getCin());
					c.setNomCli(ut.get(i).getNomCli());
					c.setpCli(ut.get(i).getpCli());
					c.setAdCli(ut.get(i).getAdCli());
					c.setTelCli(ut.get(i).getTelCli());
					c.setMdpClient(request.getParameter("nmdp"));
					vente.updateClient(c);
					request.setAttribute("connection", "Votre mot de passe a été changer");
	            	request.getRequestDispatcher("LoginClient.jsp").forward(request, response);
            	}
            	else {
            		List<Produit> produit1=vente.getAllProduit();
					request.setAttribute("produit", produit1);
					request.getRequestDispatcher("AcceuilClient.jsp").forward(request, response);
            	}
			}
	               
	            
		}
		

	}

}
