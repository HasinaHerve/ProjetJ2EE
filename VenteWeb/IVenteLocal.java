package prod;

import java.util.List;

import javax.ejb.Local;

@Local
public interface IVenteLocal {
	//Produit
	public void addProduit(Produit p);
	public List<Produit> getAllProduit();
	public List<Produit> getProduitParNom(String nom);
	public Produit getProduit(Long idProduit);
	public void removeProduit(Long idProduit);
	public void updateProduit(Produit p);
	//Admin
	public List<Admin> getAdmin(String nom);
	public void updateAdmin(Admin a);
	//Client
	public void addClient(Client c);
	public List<Client> getAllClient();
	public List<Client> getClientParCin(String cin);
	public Client getClient(String cin );
}
