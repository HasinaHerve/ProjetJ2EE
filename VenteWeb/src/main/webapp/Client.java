package prod;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Client implements Serializable {
	@Id
	private String cin;
	private String nomCli;
	private String pCli;
	private String adCli;
	private String telCli;
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Client(String cin, String nomCli, String pCli, String adCli, String telCli) {
		super();
		this.cin = cin;
		this.nomCli = nomCli;
		this.pCli = pCli;
		this.adCli = adCli;
		this.telCli = telCli;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getNomCli() {
		return nomCli;
	}
	public void setNomCli(String nomCli) {
		this.nomCli = nomCli;
	}
	public String getpCli() {
		return pCli;
	}
	public void setpCli(String pCli) {
		this.pCli = pCli;
	}
	public String getAdCli() {
		return adCli;
	}
	public void setAdCli(String adCli) {
		this.adCli = adCli;
	}
	public String getTelCli() {
		return telCli;
	}
	public void setTelCli(String telCli) {
		this.telCli = telCli;
	}
	
	

}
