package prod;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
@Stateless(name="VENTE")
public class VenteEJBImpl implements IVenteLocal {
	@PersistenceContext(unitName="UP_VENTE")
	private EntityManager em;
	@Override
	public void addProduit(Produit p) {
		em.persist(p);
		
	}

	@Override
	public List<Produit> getAllProduit() {
		Query req=em.createQuery("select p from Produit p");
		return req.getResultList();
	}

	@Override
	public List<Produit> getProduitParNom(String nom) {
		Query req=em.createQuery("select p from Produit p where p.nomProduit like :x");
		req.setParameter("x", "%"+nom+"%");
		return req.getResultList();
	}

	@Override
	public Produit getProduit(Long idProduit) {
		Produit p=em.find(Produit.class, idProduit);
		return p;
	}

	@Override
	public void removeProduit(Long idProduit) {
		Produit p=em.find(Produit.class, idProduit);
		em.remove(p);
		
	}

	@Override
	public void updateProduit(Produit p) {
		Produit p1=em.find(Produit.class, p.getIdProduit());
		p1.setDescription(p.getDescription());
		p1.setNomProduit(p.getNomProduit());
		p1.setPhoto(p.getPhoto());
		p1.setPrix(p.getPrix());
		p1.setStatus(p.getStatus());
		p1.setTaille(p.getTaille());
		p1.setCin(p.getCin());
		em.persist(p1);
	}
	
	@Override
	public List<Admin> getAdmin(String nom) {
		Query req=em.createQuery("select a from Admin a where a.nomAdmin like :x");
		req.setParameter("x", "%"+nom+"%");
		return req.getResultList();
	}
	
	@Override
	public void updateAdmin(Admin a) {
		Admin a1=em.find(Admin.class, a.getNomAdmin());
		a1.setMdp(a.getMdp());
		em.persist(a1);
	}
	//Client
	@Override
	public void addClient(Client c) {
		em.persist(c);
		
	}

	@Override
	public List<Client> getAllClient() {
		Query req=em.createQuery("select c from Client c");
		return req.getResultList();
	}

	@Override
	public List<Client> getClientParCin(String cin) {
		Query req=em.createQuery("select c from Client c where c.cin like :x");
		req.setParameter("x", "%"+cin+"%");
		return req.getResultList();
	}

	@Override
	public Client getClient(String cin) {
		Client c=em.find(Client.class, cin);
		return c;
	}

}
