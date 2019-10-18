package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("login")
public class AuthController {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping()
	public String login(){
		return "auth.login";
	}
	
	@GetMapping("test")
	@ResponseBody
	public String test() {
		return passwordEncoder.encode("123456");
	}
	@GetMapping("403")
	public String error403() {
		return "error.403";
	}
	@GetMapping("404")
	public String error404() {
		return "error.404";
	}
}
