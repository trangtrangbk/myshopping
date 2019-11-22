package controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;
import model.User;

@Controller
@RequestMapping("admin")
public class AdminIndexController {

	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap,HttpSession session){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		session.setAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 1);
	}
	@GetMapping()	
	public String index(ModelMap modelMap) {
		int numberOfCat = catDAO.getNumberOfItem();
		int numberOfUser = userDAO.getNumberOfItem();
		int numberOfPro = proDAO.getNumberOfItem();
		modelMap.addAttribute("numberOfCat", numberOfCat);
		modelMap.addAttribute("numberOfUser", numberOfUser);
		modelMap.addAttribute("numberOfPro", numberOfPro);
		return "admin.index";
	}
}
