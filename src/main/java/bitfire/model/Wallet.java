package bitfire.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


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
	List<Address> address;
	
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

	public List<Address> getAddress() {
		return address;
	}

	public void setAddress(List<Address> address) {
		this.address = address;
	}
	
}
