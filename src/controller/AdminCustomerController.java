package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.Customer;
import model.User;

@Controller
@RequestMapping("admin/customer")
public class AdminCustomerController {
	
	@Autowired
	private CustomerDAO cusDAO;
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
		modelMap.addAttribute("id_current", 9);
	}
	@GetMapping({"index","index-{page}"})
	public String index(ModelMap modelMap, @PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		int totalRow = cusDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<Customer> listCus = cusDAO.getItemsPagination(offset);
		modelMap.addAttribute("listCus", listCus);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
	
		return "admin.customer.index";
	}
	@PostMapping("active")
	public void active(Principal principal,HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter(); 
		int active =Integer.parseInt( request.getParameter("active"));
		System.out.println(active+" "+id);
		Customer objCus = cusDAO.getItem(id);

		cusDAO.changeStatus(objCus);
		if(objCus.getActive() == 0) {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,0);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/ac.png'/></a>");
		}
		else {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,1);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/de.png'/></a>");
		}
		
	}
	@GetMapping("del/{id}")
	public String del(@PathVariable int id, RedirectAttributes ra) {
		
		if(cusDAO.delItem(id)>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/customer/index";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			
			return "redirect:/admin/customer/index";
		}
	}
}
