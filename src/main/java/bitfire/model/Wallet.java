package bitfire.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;





@Entity
@Table(name="wallets")
public class Wallet implements Serializable{

	@Id
	@GeneratedValue
	@Column(name="user_id", nullable=false)
	int walletId;
	
	@OneToOne
	@JoinColumns({@JoinColumn(name="user_id",referencedColumnName="user_id")
	,@JoinColumn(name="email",referencedColumnName="email")})		
	User user;

	@OneToMany(fetch=FetchType.LAZY)	
	List<Address> address;

	
	
	
	
	
	public int getWalletId() {
		return walletId;
	}

	public void setWalletId(int walletId) {
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
