package bitfire.model.dao;

import java.util.List;

import bitfire.model.Address;
import bitfire.model.Wallet;

public interface AddressDao {

	Address getAddress(int addressId);
	
	List<Address> getAddresses(Wallet wallet);

	Address saveAddress(Address address);
	
	Address setPrimary(Address address,Wallet wallet);
	
	Address getPrimaryAddress(Wallet wallet);
	
	
	
}
