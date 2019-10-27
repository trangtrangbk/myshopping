package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.OrderDAO;
import dao.RoleDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.Role;
import model.User;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private OrderDAO orderDAO;
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 7);
	}
	
	@GetMapping({"","{page}"})
	public String index(Principal principal,ModelMap modelMap, @PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		System.out.println(principal.getName());
		int totalRow = userDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<User> listUser = userDAO.getItemsPagination(offset);
		modelMap.addAttribute("listUser", listUser);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("roleDAO", roleDAO);
	
		return "admin.user.index";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Role> listRole = roleDAO.getItems();
		modelMap.addAttribute("listRole", listRole);
		modelMap.addAttribute("id_current", 4);
 		return "admin.user.add";
	}
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objUser") User objUser, BindingResult br, ModelMap modelMap,RedirectAttributes ra, @RequestParam("password") String password) {
		
		if(br.hasErrors()) {
			List<Role> listRole = roleDAO.getItems();
			modelMap.addAttribute("listRole", listRole);
			modelMap.addAttribute("id_current", 4);
			return "admin.user.add";
		}
		objUser.setPassword(passwordEncoder.encode(objUser.getPassword()));
		if(userDAO.search(objUser,0)==0) {
			if(userDAO.addItem(objUser) >0) {
			
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESS);
			return "redirect:/admin/user";
			}
			else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "redirect:/admin/user";
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/user";
		}
		
	}
	
	@GetMapping("del/{id}")
	public String del(@PathVariable int id, RedirectAttributes ra) {
		
		if(userDAO.delItem(id)>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/user";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "redirect:/admin/user";
		}
	}
	@GetMapping("edit/{id}")
	public String edit(@PathVariable int id, RedirectAttributes ra, Model model) {
		List<Role> listRole = roleDAO.getItems();		
		User objUser = userDAO.getItem(id);
		model.addAttribute("id", id);
		model.addAttribute("objUser", objUser);
		model.addAttribute("listRole", listRole);
		model.addAttribute("id_current", 4);
		return "admin.user.edit";
	}
	@PostMapping("edit/{id}")
	public String edit(@PathVariable int id,@Valid @ModelAttribute("objUser") User objUser,BindingResult br,RedirectAttributes ra) {
		
		if(br.hasErrors()) {
			return "admin.user.edit";
		}
		
		objUser.setPassword(passwordEncoder.encode(objUser.getPassword()));
		
		if(userDAO.search(objUser,id)==0 ) {
			if(userDAO.editItem(objUser) >0)
			{
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/user";
			}
			else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "redirect:/admin/user";
		}
		}
		else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/user";
		}
	}
	
	@GetMapping("edit-profile")
	public String editPro(Principal principal,ModelMap modelMap) {
		User objUser = userDAO.getItem(principal.getName());
		List<Role> listRole = roleDAO.getItems();
		modelMap.addAttribute("listRole", listRole);
		modelMap.addAttribute("objUser", objUser);
		modelMap.addAttribute("id_current", 4);
		return "admin.user.edit-profile";
		
	}
	@PostMapping("edit-profile")
	public String editPro(Principal principal,ModelMap modelMap,@Valid @ModelAttribute("objUser") User objUser,BindingResult br,RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "admin.user.edit-profile";
		}
		User user = userDAO.getItem(principal.getName());
		int id = user.getId();
		objUser.setId(id);
		objUser.setPassword(passwordEncoder.encode(objUser.getPassword()));
		if(userDAO.search(objUser,id)==0 ) {
			if(userDAO.editItemPro(objUser) >0)
			{
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin";
			}
			else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "redirect:/admin";
		}
		}
		else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin";
		}
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
		User objUser = userDAO.getItem(id);
		if("ADMIN".equals(roleDAO.getItem(objUser.getRoleid()).getName())) {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,0);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/ac.png'/></a>");
		}
		else {
		userDAO.changeStatus(objUser);
		if(objUser.getActive() == 0) {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,0);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/ac.png'/></a>");
		}
		else {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,1);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/de.png'/></a>");
		}
		}
	}
}
