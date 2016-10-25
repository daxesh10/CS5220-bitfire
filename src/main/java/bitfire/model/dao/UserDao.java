package bitfire.model.dao;

import bitfire.model.User;

public interface UserDao {

	User getUser(int id);
	
	User saveUser(User user);
	
	User getUserByUsername(String email);
}
