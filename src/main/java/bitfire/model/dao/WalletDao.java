package bitfire.model.dao;

import bitfire.model.User;

public interface WalletDao {

	User getUser(String walletId);
}
