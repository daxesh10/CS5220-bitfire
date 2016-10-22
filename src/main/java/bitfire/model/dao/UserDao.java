package bitfire.model.dao;

import bitfire.model.User;

public interface UserDao {

	User getUser(int id);
	
	User getUserDetails(String walletId);
	
	User saveUser(User user);
}
