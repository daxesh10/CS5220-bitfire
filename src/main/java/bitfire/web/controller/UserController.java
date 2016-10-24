package bitfire.web.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import bitfire.model.Address;
import bitfire.model.Transaction;
import bitfire.model.User;
import bitfire.model.Wallet;
import bitfire.model.dao.AddressDao;
import bitfire.model.dao.TransactionDao;
import bitfire.model.dao.UserDao;
import bitfire.model.dao.WalletDao;
import bitfire.security.SecurityUtils;

@Controller
@SessionAttributes(names={"userRegister","address"})
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private WalletDao walletDao;
	
	@Autowired
	private AddressDao addressDao;
	
	@Autowired
	private TransactionDao transDao;
	
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
	
	@RequestMapping(value ={"/user/wallet.html"}, method = RequestMethod.GET)
	public String wallet(ModelMap maps)
	{
		maps.put("addresses",addressDao.getAddresses(SecurityUtils.getUser().getWallet()) );
		return "/user/wallet";
	}
	
	@RequestMapping(value ={"/user/editaddress.html"}, method = RequestMethod.GET)
	public String address(@RequestParam int id, ModelMap maps)
	{
		maps.put("address", addressDao.getAddress(id));
		return "/user/address";
	}
	
	@RequestMapping(value ={"/user/editaddress.html"}, method = RequestMethod.POST)
	public String editaddress(  @ModelAttribute Address address, HttpServletRequest request, SessionStatus status )
	{
		if(request.getParameter("primary") != null){
			System.out.println("check box value"+ request.getParameter("primary"));
			address.setPrimary(true);
			
		}
		System.out.println("label is set to: " + address.getLabel());
		addressDao.setPrimary(address, SecurityUtils.getUser().getWallet());
		
		status.isComplete();
		return "redirect:/user/wallet.html";
	}
	
	@RequestMapping(value ={"/user/send.html"}, method = RequestMethod.GET)
	public String send(){
		return "/user/send";
	}
	
	@RequestMapping(value ={"/user/send.html"}, method = RequestMethod.POST)
	public String send(@RequestParam String email, @RequestParam Double btc){
		User receiverUser=userDao.getUserByUsername(email);
		Address receiverAddress=addressDao.getPrimaryAddress(receiverUser.getWallet());
		Address senderAddress=addressDao.getPrimaryAddress(SecurityUtils.getUser().getWallet());
		tranfer(senderAddress, receiverAddress, btc);
		return "redirect:/user/transactions.html";
	}

	@RequestMapping(value ={"/user/transactions.html"}, method = RequestMethod.GET)
	public String transactoins(ModelMap map){
		map.put("transactions", transDao.getAllTransactions(SecurityUtils.getUser()));
		map.put("user", SecurityUtils.getUser());
		return "/user/transactions";
	}

	@RequestMapping(value ={"/user/addaddress.html"}, method = RequestMethod.GET)
	public String addaddress(){
		Address address = new Address();
		address.setAddress(SecurityUtils.getUser().getName().toLowerCase()+ "Address" + new Random().nextInt(10000) + 1000);
		address.setWallet(SecurityUtils.getUser().getWallet());
		addressDao.saveAddress(address);
		return "redirect:/user/wallet.html";
	}
	
	
	@RequestMapping(value ={"/user/archiveaddress.html"}, method = RequestMethod.GET)
	public String archiveAddress(@RequestParam int id, ModelMap map)
	{
		Address address = addressDao.getAddress(id);
		if(address.isPrimary() || address.getBitcoinsActual() > 0 )
		{
			map.put("message", "Can't archieve primary address or address have balance");
		}
		else
		{
			address.setArchived(true);
			addressDao.saveAddress(address);
		}
		map.put("addresses",addressDao.getAddresses(SecurityUtils.getUser().getWallet()) );

		return "/user/wallet";
		
	}
	
	@RequestMapping(value ={"/user/selftransfer.html"}, method = RequestMethod.GET)
	public String selftransfer(ModelMap map)
	{	
		map.put("addresses", addressDao.getAddresses(SecurityUtils.getUser().getWallet()));
		return "/user/selftransfer";
	}
	
	@RequestMapping(value ={"/user/selftransfer.html"}, method = RequestMethod.POST)
	public String selftransfer(@RequestParam int from, @RequestParam int to, @RequestParam double amount, ModelMap map)
	{	
		System.out.println("From: " + from + " TO: " + to + " AMOUNT: " + amount);
		
		if(from == to){
			map.put("message", "From address can not be the same as TO address");
		}
		else{
			Address senderAddress=addressDao.getAddress(from);
			Address receiverAddress=addressDao.getAddress(to);
			tranfer(senderAddress,receiverAddress, amount);
			map.put("message", "Successfully tranferred " + amount + " BTC from " + addressDao.getAddress(from).getAddress() + 
					" to " + addressDao.getAddress(to).getAddress());
			map.put("addresses", addressDao.getAddresses(SecurityUtils.getUser().getWallet()));
		}
		return "/user/wallet";
	}
	
	private void tranfer(Address senderAddress, Address receiverAddress, double btc ){
		
		
		
		senderAddress.setBitcoins(senderAddress.getBitcoinsActual()-(int)(btc*100000000));
		senderAddress.setUSD(senderAddress.getUSDActual()-(int)(650*btc*100));
		addressDao.saveAddress(senderAddress);
		
		
		
		receiverAddress.setBitcoins(receiverAddress.getBitcoinsActual()+(int)(btc*100000000));
		receiverAddress.setUSD(receiverAddress.getUSDActual()+(int)(650*btc*100));
		addressDao.saveAddress(receiverAddress);
		
		Transaction transaction= new Transaction();
		transaction.setSenderAddress(senderAddress);
		transaction.setReceiverAddress(receiverAddress);
		transaction.setBitcoin((int) (btc*100000000));
		transaction.setUSD((int)(650*btc*100));
		transaction.setSenderUser(SecurityUtils.getUser());
		transaction.setReceiverUser(receiverAddress.getWallet().getUser());
		transaction.setTxId("trans"+Math.random());
		transDao.saveTransaction(transaction);
	}
	

}
