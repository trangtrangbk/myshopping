package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ContactDAO;
import dao.OrderDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.Contact;
import model.User;

@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 8);
	}
	@GetMapping({ "", "{page}" })
	public String contact(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int totalRow = contactDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Contact> listContact = contactDAO.getItemsPagination(offset);
		modelMap.addAttribute("listContact", listContact);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.contact";
	}

	@GetMapping("del/{id}")
	public String del(ModelMap modelMap, @PathVariable int id, RedirectAttributes ra) {

		if (contactDAO.delItem(id) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/contact";
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "admin.contact";
		}

	}

}
