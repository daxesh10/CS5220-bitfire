package bitfire.model.dao;

import java.util.List;

import bitfire.model.Transaction;

public interface TransactionDao {

	Transaction getTransaction(int id);
	
	Transaction getTrans(String txId);
	
	List<Transaction> getSenderTransacations(int senderUserId);
	
	List<Transaction> getReceiverTransacations(int receiverUserId);
	
	List<Transaction> getTransactionSenderAddress(int senderAddressId);
	
	List<Transaction> getTransactionReceiverAddress(int receiverAddressId);
	
	List<Transaction> getAllTransactions(int userId);
}
