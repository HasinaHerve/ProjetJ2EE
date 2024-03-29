package controlleur;

import java.io.IOException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.*;
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
    			response.setContentType("application/pdf");
    			  
    	        response.setHeader(
    	            "Content-disposition",
    	            "inline; filename='Facture.pdf'");
    	  
    	        try {
    	  
    	            Document document = new Document();
    	  
    	            PdfWriter.getInstance(
    	                document, response.getOutputStream());
    	  
    	            document.open();
    	            Font font1 = new Font(Font.FontFamily.TIMES_ROMAN, 30,Font.ITALIC | Font.BOLD);
    	            Paragraph titre = new Paragraph("Vente en ligne\n",font1); 
    	            titre.setAlignment(Element.ALIGN_CENTER);
    	            Font font2 = new Font(Font.FontFamily.TIMES_ROMAN, 25,Font.ITALIC | Font.BOLD);
    	            Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 25,Font.ITALIC);
    	            Paragraph cin = new Paragraph("Cin:",font2);
    	            Paragraph cinValue = new Paragraph(produit.get(i).getCin(),font3);
    	            Paragraph n = new Paragraph("Nom:",font2);
    	            Paragraph nValue = new Paragraph(produit.get(i).getNomProduit(),font3);
    	            Paragraph prix = new Paragraph("Prix:",font2);
    	            Paragraph prixValue = new Paragraph(String.valueOf(produit.get(i).getPrix()),font3);
    	            
    	            document.add(titre);
    	            document.add(new Paragraph(cin+": "+cinValue+"\n"));
    	            document.add(new Paragraph(n+": "+nValue+"\n"));
    	            document.add(new Paragraph(prix+": "+prixValue+"\n"));
    	            document.close();
    	        }
    	        catch (DocumentException de) {
    	            throw new IOException(de.getMessage());
    	        }
            	List<Produit> produit1=vente.getAllProduit();
            	request.setAttribute("produit", produit1);
            	request.getRequestDispatcher("Liste.jsp").forward(request, response);
            }
        }
		
		
	}
	

}
