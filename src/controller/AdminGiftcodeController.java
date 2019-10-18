package controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.GiftCodeDAO;
import dao.OrderDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.Category;
import model.GiftCode;
import model.User;

@Controller
@RequestMapping("admin/giftcode")
public class AdminGiftcodeController {
	@Autowired
	private GiftCodeDAO gifDAO;
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
		modelMap.addAttribute("id_current", 6);
	}
	@GetMapping({"","{page}"})
	public String index(ModelMap modelMap,@PathVariable(value="page" ,required=false) Integer page) {
		if(page== null) page = 1;
		int totalRow = gifDAO.countItems();
		System.out.println(totalRow);
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<GiftCode> listGif = gifDAO.getItemsPagination(offset);		
		modelMap.addAttribute("listGif", listGif);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		
		return "admin.giftcode";
	}
	
	@GetMapping("add")
	public String add() {		
		return "admin.giftcode.add";
	}
	
	@PostMapping("add")
	public String add(@ModelAttribute("objGif") GiftCode objGif,ModelMap modelMap,RedirectAttributes ra) {
		if(gifDAO.checkDuplicate(objGif.getGname(),0) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/giftcode";
		}else {
			if(gifDAO.addItem(objGif) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
				return "redirect:/admin/giftcode";
			}else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/giftcode";
			}
		}
		
	}
	
	@GetMapping("edit/{gid}")
	public String edit(ModelMap modelMap, @PathVariable("gid") int gid) {
		GiftCode gif = gifDAO.getItem(gid);		
		modelMap.addAttribute("gif", gif);
		return "admin.giftcode.edit";
	}
	
	@PostMapping("edit/{gid}")
	public String edit(@ModelAttribute("objGif") GiftCode objGif,ModelMap modelMap,RedirectAttributes ra) {
		System.out.println(objGif.toString());
		if(gifDAO.checkDuplicate(objGif.getGname(),objGif.getGid()) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_DUPLICATE);
			return "redirect:/admin/giftcode";
		}else {
			if(gifDAO.editItem(objGif) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
				return "redirect:/admin/giftcode";
			}else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/giftcode";
			}
		}
		
	}
	
	@GetMapping("del/{gid}")
	public String del(@PathVariable("gid") int gid,RedirectAttributes ra) {
		if(gifDAO.delItem(gid) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/giftcode";
		}
		else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/giftcode";
		}
	}
}
