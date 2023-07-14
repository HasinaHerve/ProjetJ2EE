package controlleur;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		List<Produit> produit=vente.getAllProduit();
		for (int i = 0; i < produit.size(); i++) {
            if(request.getParameter(String.valueOf(produit.get(i).getIdProduit()))!=null) {
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
            	doGet(request,response);
            }
        }
		

	}

}
