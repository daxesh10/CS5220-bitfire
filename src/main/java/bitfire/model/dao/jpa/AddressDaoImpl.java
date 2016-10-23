package bitfire.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import bitfire.model.Address;
import bitfire.model.Wallet;
import bitfire.model.dao.AddressDao;

@Repository
public class AddressDaoImpl implements AddressDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Address getAddress(int addressId) {
		return entityManager.find(Address.class, addressId);
	}

	@Override
	public List<Address> getAddresses(Wallet wallet) {
		List<Address> addresses=entityManager.createQuery("from Address where wallet = :wallet",Address.class)
				.setParameter("wallet", wallet)
				.getResultList();
		return addresses;
	}

	@Override
	@Transactional
	public Address saveAddress(Address address) {
		return entityManager.merge(address);
	}

	@Override
	@Transactional
	public Address setPrimary(Address address, Wallet wallet) {
		
		Address Oldaddress=entityManager.createQuery("from Address a where a.wallet = :wallet and a.primary = :primary order by a.addressId asc",Address.class)
				.setParameter("wallet", wallet)
				.setParameter("primary", true)
				.getSingleResult();
		Oldaddress.setPrimary(false);	
		saveAddress(Oldaddress);

		return saveAddress(address);
	}

	@Override
	public Address getPrimaryAddress(Wallet wallet) {
		
		return entityManager.createQuery("from Address where wallet = :wallet and primary = :primary",Address.class)
				.setParameter("wallet", wallet)
				.setParameter("primary", true)
				.getSingleResult();
	}
}

