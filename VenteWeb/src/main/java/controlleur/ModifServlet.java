package controlleur;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;


import prod.Admin;
import prod.Client;
import prod.IVenteLocal;
import prod.Produit;

@WebServlet("/mservlet")
public class ModifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Long idProduit=(long) 0;
	Double prix=(double) 0;
	@EJB
	private IVenteLocal vente;
    public ModifServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Produit> produit=vente.getAllProduit();
		for (int i = 0; i < produit.size(); i++) {
            if(request.getParameter(String.valueOf(produit.get(i).getIdProduit()))!=null) {
            	idProduit=produit.get(i).getIdProduit();
            	prix=produit.get(i).getPrix();
            	request.setAttribute("idProduit",produit.get(i).getIdProduit());
            	request.setAttribute("nomProduit",produit.get(i).getNomProduit());
            	request.setAttribute("description",produit.get(i).getDescription());
            	request.setAttribute("photo",(produit.get(i).getPhoto()));
            	request.setAttribute("taille",produit.get(i).getTaille());
            	request.setAttribute("prix",produit.get(i).getPrix());   
            	request.setAttribute("status",produit.get(i).getStatus());
            	request.getRequestDispatcher("ModifProduit.jsp").forward(request, response);
            }
            if(request.getParameter(String.valueOf("s"+produit.get(i).getIdProduit()))!=null) {
            	request.setAttribute("supprimer",produit.get(i).getIdProduit());
        		request.setAttribute("produit", produit);
            	request.getRequestDispatcher("Liste.jsp").forward(request, response);
            }
            if(request.getParameter(String.valueOf("validSupp"+produit.get(i).getIdProduit()))!=null) {
            	vente.removeProduit(produit.get(i).getIdProduit());
            	List<Produit> produit1=vente.getAllProduit();
            	request.setAttribute("produit", produit1);
            	request.getRequestDispatcher("Liste.jsp").forward(request, response);
            }
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Produit p=new Produit();
		p.setIdProduit(idProduit);
		p.setNomProduit(request.getParameter("nomProduit"));
		p.setDescription(request.getParameter("description"));
		p.setTaille(request.getParameter("taille"));
		p.setPrix(Double.parseDouble(request.getParameter("prix")));
		p.setStatus("Disponible");
		
		vente.updateProduit(p);
		List<Produit> produit=vente.getAllProduit();
		request.setAttribute("produit", produit);
		
		request.getRequestDispatcher("Liste.jsp").forward(request, response);
		
		
	}
	private static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}

}
