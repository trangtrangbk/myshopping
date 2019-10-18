package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.Category;
import model.User;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap,HttpServletRequest request){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current",2 );
		request.setAttribute("catDAO", catDAO);
		
	}
	@GetMapping({"","{page}"})
	public String index(ModelMap modelMap,@PathVariable(value="page" ,required=false) Integer page,HttpServletRequest request) {
		if(page== null) page = 1;
		int totalRow = catDAO.getListParrent_id().size();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;		
		request.setAttribute("offset",offset);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.cat";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> listCat = catDAO.getItems();
		modelMap.addAttribute("listCat", listCat);
		return "admin.cat.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objCat") Category objCat,BindingResult br,ModelMap modelMap,RedirectAttributes ra) {
		if(br.hasErrors()) {
			List<Category> listCat = catDAO.getItems();
			modelMap.addAttribute("listCat", listCat);
			return "admin.cat.add";
		}
		if(catDAO.checkDuplicate(objCat.getCname(),0,objCat.getParrent_id()) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/cat";
		}else {
			if(catDAO.addItem(objCat) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
				return "redirect:/admin/cat";
			}else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/cat";
			}
		}
		
	}
	
	@GetMapping("edit/{cid}")
	public String edit(ModelMap modelMap, @PathVariable("cid") int cid) {
		Category cat = catDAO.getItem(cid);
		List<Category> listCat = catDAO.getItems();
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("cat", cat);
		return "admin.cat.edit";
	}
	
	@PostMapping("edit/{cid}")
	public String edit(@ModelAttribute("objCat") Category objCat,ModelMap modelMap,RedirectAttributes ra) {
		System.out.println(objCat.toString());
		if(catDAO.checkDuplicate(objCat.getCname(),objCat.getCid(),objCat.getParrent_id()) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/cat";
		}else {
			if(catDAO.editItem(objCat) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
				return "redirect:/admin/cat";
			}else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/cat";
			}
		}
		
	}
	
	@GetMapping("del/{cid}")
	public String del(@PathVariable("cid") int cid,RedirectAttributes ra) {
		if(catDAO.delItem(cid) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/cat";
		}
		else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/cat";
		}
	}
}
