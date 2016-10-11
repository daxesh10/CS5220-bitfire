package bitfire.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="wallets")
public class Wallet implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="wallet_id")
	String walletId;
	
	@OneToOne(mappedBy="walletId")
	@JoinColumn(name="user_id")
	User user;

	@OneToMany(mappedBy="wallet")
	Set<Address> address;
	
	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Address> getAddress() {
		return address;
	}

	public void setAddress(Set<Address> address) {
		this.address = address;
	}

	
	
}
