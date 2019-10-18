package controller;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CartOrderDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import define.MessageDefine;
import define.PageDefine;
import model.CartOrder;
import model.Order;
import model.User;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private CartOrderDAO cartOrderDAO;
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private UserDAO userDAO;
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 4);
	
	}
	@GetMapping({ "", "{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null)
			page = 1;
		int totalRow = orderDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Order> listOrder = orderDAO.getItemsPagination(offset);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.order";
	}

	@GetMapping("view/{order_id}")
	public String view(@PathVariable("order_id") int order_id, ModelMap modelMap) {
		int total = 0;
		Order order = orderDAO.getItemById(order_id);
		orderDAO.editChecked(1,order_id);
		List<CartOrder> listCartOrder = cartOrderDAO.getItemsByOrderId(order_id);
		System.out.println(listCartOrder.size());
		if (listCartOrder != null) {
			modelMap.addAttribute("listCartOrder", listCartOrder);
			for (CartOrder cartOrder : listCartOrder) {
				total += proDAO.getItem(cartOrder.getPro_id()).getPrice() * cartOrder.getQuatity();
			}
		}
		int total2 = total -total*order.getGiftcode()/100;
		System.out.println(total2);
		modelMap.addAttribute("proDAO", proDAO);
		modelMap.addAttribute("total", total);
		modelMap.addAttribute("total2", total2);
		modelMap.addAttribute("order", order);
		return "admin.order.view";
	}

	@PostMapping("view/{order_id}")
	public String edit(@PathVariable("order_id") int order_id, RedirectAttributes ra,
			@RequestParam("status") String status, @RequestParam("paid") String paid) {
		if (orderDAO.edit(order_id, status, paid) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/order";
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/order";
		}

	}

	@GetMapping("del/{order_id}")
	public String del(@PathVariable("order_id") int order_id, RedirectAttributes ra) {
		if (orderDAO.del(order_id) > 0) {
			if (cartOrderDAO.delItem(order_id) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
				return "redirect:/admin/order";
			} else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/order";
			}
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/order";
		}
	}
}
