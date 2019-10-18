package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("signup")
public class SignupController {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping()
	public String signup(){
		return "auth.signup";
	}
	
}
