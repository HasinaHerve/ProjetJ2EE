package controlleur;

import java.io.IOException;
import java.util.Date;
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
import java.io.OutputStream;

import prod.Admin;
import prod.Client;
import prod.IVenteLocal;
import prod.Produit;

@WebServlet("/mservlet")
public class ModifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Long idProduit=(long) 0;
	Double prix=(double) 0;
	String photo=null;
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
		if(request.getParameter("action").equals("modifier")) {
			Produit p=new Produit();
			prix=Double.parseDouble(request.getParameter("prix"));
			p.setIdProduit(idProduit);
			p.setNomProduit(request.getParameter("nomProduit"));
			p.setDescription(request.getParameter("description"));
			p.setTaille(request.getParameter("taille"));
			p.setPrix(prix);
			p.setStatus("Disponible");
			p.setPhoto(photo);
			
			vente.updateProduit(p);
			List<Produit> produit1=vente.getAllProduit();
			request.setAttribute("produit", produit1);
			request.getRequestDispatcher("Liste.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		List<Produit> produit=vente.getAllProduit();
		for (int i = 0; i < produit.size(); i++) {
            if(request.getParameter(String.valueOf(produit.get(i).getIdProduit()))!=null) {
            	idProduit=produit.get(i).getIdProduit();
            	prix=produit.get(i).getPrix();
            	session.setAttribute("idProduit",produit.get(i).getIdProduit());
            	session.setAttribute("nomProduit",produit.get(i).getNomProduit());
            	session.setAttribute("description",produit.get(i).getDescription());
            	session.setAttribute("taille",produit.get(i).getTaille());
            	session.setAttribute("prix",produit.get(i).getPrix()); 
            	photo=produit.get(i).getPhoto();
            	response.sendRedirect("ModifProduit.jsp");
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
            if(request.getParameter(String.valueOf("imp"+produit.get(i).getIdProduit()))!=null) {
            	List<Client> c=vente.getClientParCin(produit.get(i).getCin());
            	String nom=null;
    			for (int j = 0; j < c.size(); j++) {
    				nom=c.get(j).getNomCli();
    			}
            	// Set the response content type to PDF
                response.setContentType("application/pdf");

                // Set the header for PDF file download
                response.setHeader("Content-Disposition", "attachment; filename=\"invoice.pdf\"");

                // Generate the invoice content and write it to the response output stream
                try (OutputStream out = response.getOutputStream()) {
                    imprimer(out,produit.get(i).getCin(),nom,produit.get(i).getPrix());
                }
            	List<Produit> produit1=vente.getAllProduit();
            	request.setAttribute("produit", produit1);
            	request.getRequestDispatcher("Liste.jsp").forward(request, response);
            }
        }
		
		
	}
	private void imprimer(OutputStream out, String cin, String nom, Double p) throws IOException {
        // Use a PDF generation library (e.g., iText) to create the invoice PDF
        // Customize the invoice layout and content as per your requirements
        
        // Example: Create a simple invoice using plain text
        StringBuilder invoiceContent = new StringBuilder();
        invoiceContent.append("Facture\n\n");
        invoiceContent.append("Date: ").append(new Date()).append("\n");
        invoiceContent.append("Client: ").append(nom).append(" ").append(cin);
        invoiceContent.append("prix\t\t").append(p).append("\n");

        // Write the invoice content to the output stream
        out.write(invoiceContent.toString().getBytes());
    }
	

}
