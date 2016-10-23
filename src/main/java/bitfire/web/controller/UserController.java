package bitfire.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import bitfire.model.Address;
import bitfire.model.User;
import bitfire.model.Wallet;
import bitfire.model.dao.AddressDao;
import bitfire.model.dao.UserDao;
import bitfire.model.dao.WalletDao;
import bitfire.security.SecurityUtils;

@Controller
@SessionAttributes("userRegister")
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private WalletDao walletDao;
	
	@Autowired
	private AddressDao addressDao;
	
	@RequestMapping("/index.html")
	public String index(ModelMap maps)
	{
		maps.put("user", SecurityUtils.getUser());
		return "index";
	}
	
	@RequestMapping(value={"/register.html"}, method=RequestMethod.GET)
	public String register(ModelMap maps){
		maps.put("userRegister", new User());
		return "register";
	}
	
	@RequestMapping(value={"/register.html"}, method=RequestMethod.POST)
	public String register(@ModelAttribute User user,SessionStatus status){
		
		//Add wallet
		Wallet wallet=new Wallet();
		wallet.setWalletId(user.getName()+"123wallet");
		walletDao.saveWallet(wallet);
		
		//Add Address
		Address address=new Address();
		address.setAddress(user.getName()+"Address123");
		address.setLabel("default");
		address.setPrimary(true);
		address.setWallet(wallet);
		addressDao.saveAddress(address);
		
		//Add User
		user.setWallet(wallet);
		userDao.saveUser(user);
		status.setComplete();
		return "redirect:login.html";
	}
	
	@RequestMapping("/user/wallet.html")
	public String wallet(ModelMap maps)
	{
		maps.put("addresses",addressDao.getAddresses(SecurityUtils.getUser().getWallet()) );
		return "/user/wallet";
	}
}
