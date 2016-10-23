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
	public Address setPrimary(int addressId, String walletId) {
		
		Address address=entityManager.createQuery("from Address where wallet = :wallet and isPrimary = :isPrimary",Address.class)
				.setParameter("wallet", walletId)
				.setParameter("isPrmary", true)
				.getResultList().get(0);
		address.setPrimary(false);
		saveAddress(address);
		
		Address newPrimaryAddress=getAddress(addressId);
		newPrimaryAddress.setPrimary(true);
		return saveAddress(newPrimaryAddress);
	}
}

