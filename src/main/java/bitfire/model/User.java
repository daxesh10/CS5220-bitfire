package bitfire.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue
	@Column(name="user_id", nullable=false)
	int userId;
	
	@Column(unique=true, nullable=false)
	String email;
	
	@Column(nullable=false)
	String name;
	
	@Column(nullable=false)
	String password;

	@OneToOne
	Wallet walletId;
	
}
