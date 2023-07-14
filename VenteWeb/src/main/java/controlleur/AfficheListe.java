package controlleur;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prod.IVenteLocal;
import prod.Produit;

/**
 * Servlet implementation class AfficheListe
 */
@WebServlet("/AfficheListe")
public class AfficheListe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private IVenteLocal vente;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficheListe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Produit> produit=vente.getAllProduit();
		request.setAttribute("produit", produit);
    	request.getRequestDispatcher("Liste.jsp").forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
