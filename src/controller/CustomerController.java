package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CartOrderDAO;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import define.MessageDefine;
import model.Cart;
import model.CartOrder;
import model.Customer;
import model.Order;
import model.Product;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerDAO cusDAO;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private CartOrderDAO cartOrderDAO;
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private ProductDAO proDAO;
	@Autowired 
	private OrderDAO orderDAO;
	

	@ModelAttribute
	public void leftbar(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException {		
		request.setAttribute("catDAO", catDAO);	
		modelMap.addAttribute("proDAO", proDAO);
		Customer customer = (Customer)session.getAttribute("customer");
		modelMap.addAttribute("customer", customer);
	}
	@GetMapping("login")
	public String login() {
		return "auth.login-customer";
	}

	@PostMapping("login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes ra) {
		System.out.println(username + password);
		//password = passwordEncoder.encode(password);
		System.out.println(password);
		System.out.println(cusDAO.checkLogin(username, password));
		if (cusDAO.checkLogin(username, password) > 0) {
			Customer customer = cusDAO.getItem(username);
			if(customer.getActive() == 0) {
				ra.addFlashAttribute("msg", "Tài khoản đã bị khóa");
				return "redirect:/customer/login";
			}else {
			session.setAttribute("customer", customer);
			return "redirect:/";
			}
		} else {
			ra.addFlashAttribute("msg", "Tài khoản không tồn tại");
			return "redirect:/customer/login";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objCus") Customer objCus,BindingResult br, RedirectAttributes ra, HttpSession session) {
		if(br.hasErrors()) {
			return "auth.signup";
		}
		if (cusDAO.checkDup(objCus.getUsername()) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_DUPLICATE);
			return "redirect:/signup";
		} else {
			//objCus.setPassword(passwordEncoder.encode(objCus.getPassword()));
			if (cusDAO.add(objCus) > 0) {
				return "auth.signup-success";
			} else {
				ra.addAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/";
			}
		}
	}
	
	@GetMapping("profile")
	public String profile(HttpSession session,ModelMap modelMap) {
		Customer customer = (Customer ) session.getAttribute("customer");		
		modelMap.addAttribute("customer", customer);
		return "customer.profile";
	}
	
	@GetMapping("edit")
	public String edit(HttpSession session,ModelMap modelMap) {
		Customer customer = (Customer)session.getAttribute("customer");
		modelMap.addAttribute("customer", customer);
		return "customer.edit";
	}
	
	@PostMapping("edit")
	public String edit(HttpSession session,@ModelAttribute("objCus") Customer objCus,RedirectAttributes ra) {
		Customer customer = (Customer)session.getAttribute("customer");
		objCus.setId(customer.getId());
		System.out.println(objCus);
		if(objCus.getUsername()== null) objCus.setUsername(customer.getUsername());
		if(objCus.getPassword()== null) objCus.setPassword(customer.getPassword());
		if(cusDAO.edit(objCus) > 0) {
			session.setAttribute("customer", objCus);
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/customer/profile";
		}else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/customer/profile";
		}
	}
	@GetMapping("history")
	public String history(HttpSession session,ModelMap modelMap) {
		Customer customer = (Customer)session.getAttribute("customer");
		List<Integer> listOrderCustomer = orderDAO.getItemsByCustomer(customer.getId());
		System.out.println(listOrderCustomer.size());
		modelMap.addAttribute("listOrderCustomer", listOrderCustomer);
		modelMap.addAttribute("customer", customer);
		modelMap.addAttribute("cartOrderDAO", cartOrderDAO);
		modelMap.addAttribute("orderDAO", orderDAO);
		return "customer.history";
	}
}
