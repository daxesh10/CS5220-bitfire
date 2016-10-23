package bitfire.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import bitfire.model.dao.UserDao;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/register.html")
	public String abc(ModelMap maps){
		
		maps.put("user", "Sevak");
		return "register";
	}
}
