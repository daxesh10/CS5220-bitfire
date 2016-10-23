package bitfire.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import bitfire.model.Wallet;
import bitfire.model.dao.WalletDao;

@Repository
public class WalletDaoImpl implements WalletDao{

    @PersistenceContext
    private EntityManager entityManager;
    
	@Override
	@Transactional
	public Wallet saveWallet(Wallet wallet) {
		entityManager.merge(wallet);
		return null;
	}


}
