package bitfire.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="transactions")
public class Transaction implements Serializable{

	private static final long serialVersionUID = 1L;

	@Column(unique=true,name="tx_id")
	String txId;
	
	@Id
	@GeneratedValue
	@Column(name="transaction_id")
	int transactionId;
	
	double USD;
	
	double bitcoin;
	
	@OneToOne
	@JoinColumn(name="sender_address_id")
	Address sender;
	
	@OneToOne
	@JoinColumn(name="receiver_address_id")
	Address receiver;
	
	@Column(name="notified_sender")
	Boolean notifiedSender;
	
	@Column(name="notified_receiver")
	Boolean notifiedReceiver;

	Date date;
	
	public String getTxId() {
		return txId;
	}

	public void setTxId(String txId) {
		this.txId = txId;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public double getUSD() {
		return USD;
	}

	public void setUSD(double uSD) {
		USD = uSD;
	}

	public double getBitcoin() {
		return bitcoin;
	}

	public void setBitcoin(double bitcoin) {
		this.bitcoin = bitcoin;
	}

	public Address getSender() {
		return sender;
	}

	public void setSender(Address sender) {
		this.sender = sender;
	}

	public Address getReceiver() {
		return receiver;
	}

	public void setReceiver(Address receiver) {
		this.receiver = receiver;
	}

	public Boolean getNotifiedSender() {
		return notifiedSender;
	}

	public void setNotifiedSender(Boolean notifiedSender) {
		this.notifiedSender = notifiedSender;
	}

	public Boolean getNotifiedReceiver() {
		return notifiedReceiver;
	}

	public void setNotifiedReceiver(Boolean notifiedReceiver) {
		this.notifiedReceiver = notifiedReceiver;
	}
	
}
