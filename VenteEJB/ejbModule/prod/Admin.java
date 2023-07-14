package prod;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Admin implements Serializable {
	@Id
	private String nomAdmin;
	private String mdp;
	public String getNomAdmin() {
		return nomAdmin;
	}
	public void setNomAdmin(String nomAdmin) {
		this.nomAdmin = nomAdmin;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public Admin() {
		super();
	}
	public Admin(String nomAdmin, String mdp) {
		super();
		this.nomAdmin = nomAdmin;
		this.mdp = mdp;
	}
	
	

}
