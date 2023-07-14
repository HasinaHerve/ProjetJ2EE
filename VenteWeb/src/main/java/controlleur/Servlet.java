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

@WebServlet(name="cs",urlPatterns="/servlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class Servlet extends HttpServlet{
	@EJB
	private IVenteLocal vente;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		request.getRequestDispatcher("Index.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String action=request.getParameter("action");
		HttpSession session=request.getSession();
		if(action.equals("ajouter")) {
			Produit p=new Produit();
			p.setNomProduit(request.getParameter("nomProduit"));
			p.setDescription(request.getParameter("description"));
			p.setTaille(request.getParameter("taille"));
			p.setPrix(Double.parseDouble(request.getParameter("prix")));
			p.setStatus("Disponible");
			
			Part file=request.getPart("photo");
			String imageFileName=getSubmittedFileName(file);
			String uploadPath="D:\\Bossy\\J2EE\\VenteWeb\\src\\main\\webapp\\image\\"+imageFileName;
		
			try
			{
				
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			}
			catch (Exception e) {

				e.printStackTrace();
			}
			p.setPhoto("image/"+imageFileName);
			vente.addProduit(p);
			List<Produit> produit=vente.getAllProduit();
			request.setAttribute("produit", produit);
			
			request.getRequestDispatcher("Liste.jsp").forward(request, response);
		}
		if(action.equals("connecter")) {
			List<Admin> admin=vente.getAdmin(request.getParameter("nomAdmin"));
			if(admin.isEmpty()) {
				request.setAttribute("connection", "Ce compte n'existe pas");
            	request.getRequestDispatcher("Index.jsp").forward(request, response);
            }
			else {
				for (int i = 0; i < admin.size(); i++) {
					if(admin.get(i).getMdp().equals(request.getParameter("mdp"))) {
						session.setAttribute("connection", "Connection réussie");
						List<Produit> produit=vente.getAllProduit();
						request.setAttribute("produit", produit);
		            	request.getRequestDispatcher("Liste.jsp").forward(request, response);
	            	}
	            	else {
	            		request.setAttribute("connection", "Mot de passe incorrecte");
		            	request.getRequestDispatcher("Index.jsp").forward(request, response);
	            	}
				}
			}
	               
	            
		}
		if(action.equals("modifmdp")) {
			List<Admin> admin=vente.getAdmin("Admin");
			for (int i = 0; i < admin.size(); i++) {
				if(admin.get(i).getMdp().equals(request.getParameter("amdp"))) {
					Admin a=new Admin();
					a.setNomAdmin("Admin");
					a.setMdp(request.getParameter("nmdp"));
					vente.updateAdmin(a);
	            	request.getRequestDispatcher("Index.jsp").forward(request, response);
            	}
            	else {
	            	request.getRequestDispatcher("AjoutProduit.jsp").forward(request, response);
            	}
			}
	               
	            
		}
		if(action.equals("ajouterClient")) {
			Client c=new Client();
			c.setCin(request.getParameter("cin"));
			c.setNomCli(request.getParameter("nomCli"));
			c.setpCli(request.getParameter("pCli"));
			c.setAdCli(request.getParameter("adCli"));
			c.setTelCli(request.getParameter("telCli"));
			vente.addClient(c);
			List<Produit> produit=vente.getAllProduit();
			request.setAttribute("produit", produit);
			request.getRequestDispatcher("AcceuilClient.jsp").forward(request, response);
		}
				
		
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
