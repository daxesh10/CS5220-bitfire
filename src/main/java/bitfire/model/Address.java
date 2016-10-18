package bitfire.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.ManyToOne;


@Entity
@Table(name="addresses")
public class Address implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="address_id")
	int addressId;
	
	String address;
	
	String label;
	
	@ManyToOne
	@JoinColumn(name="wallet_id",nullable=false)
	Wallet wallet;
	
	@Column(name="is_primay")
	boolean isPrimay;

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public boolean isPrimay() {
		return isPrimay;
	}

	public void setPrimay(boolean isPrimay) {
		this.isPrimay = isPrimay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Wallet getWallet() {
		return wallet;
	}

	public void setWallet(Wallet wallet) {
		this.wallet = wallet;
	}

}
