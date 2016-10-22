package bitfire.model.dao;

import java.util.List;

import bitfire.model.Address;

public interface AddressDao {

	Address getAddress(int addressId);
	
	List<Address> getAddresses(String walletId);

	Address addAddress(String address);
	
	Address setPrimary(int addressId);
	
}
