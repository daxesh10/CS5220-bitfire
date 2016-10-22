package bitfire.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import bitfire.model.User;
import bitfire.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public User getUser(int id) {
		return entityManager.find(User.class, id);
	}

	@Override
	public User getUserDetails(String walletId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User saveUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}
    
}
