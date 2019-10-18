package controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CartOrderDAO;
import dao.CategoryDAO;
import dao.GiftCodeDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import define.MessageDefine;
import model.Cart;
import model.CartOrder;
import model.Customer;
import model.GiftCode;
import model.Order;

@Controller
public class PublicCheckoutController {
	
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private CartOrderDAO cartOrdDAO;
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private GiftCodeDAO giftDAO;
	
	@ModelAttribute
	public void leftbar(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {		
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		request.setAttribute("catDAO", catDAO);	
	}
	@GetMapping("checkout-step2")
	public String checkout2(ModelMap modelMap,HttpSession session) {  
		modelMap.addAttribute("proDAO", proDAO);
		return "public.checkout-step2";
	}
	@PostMapping("checkout-step2")
	public String checkout2(@RequestParam("payments") String payments,@RequestParam("paid") int paid, RedirectAttributes ra,HttpSession session,ModelMap modelMap) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			ra.addFlashAttribute("msg", MessageDefine.NULL_CART);
			return "redirect:/checkout";
		}
		if(paid== 0 && !"Thanh toán sau khi nhận hàng".equals(payments) ) {
			ra.addFlashAttribute("msg", MessageDefine.CANCEL_PAID);
			return "redirect:/checkout-step2";
		}
		Order objOrder = (Order)session.getAttribute("objOrder");
		if(paid == 1) {
			objOrder.setPayments("Thanh toán với paypal ");
		}
		else {
			objOrder.setPayments(payments);
		}
		
		if("Thanh toán sau khi nhận hàng".equals(objOrder.getPayments())) {
			objOrder.setPaid("Chưa thanh toán");
		}else objOrder.setPaid("Đã thanh toán");
		Customer customer = (Customer) session.getAttribute("customer");
		objOrder.setBill((long)session.getAttribute("myCartTotal"));
		System.out.println(objOrder.toString());
		orderDAO.addItem(objOrder);
		
		objOrder = orderDAO.getItemLastest();
		if(cartItems !=null) {
			for (Cart cart : cartItems.values()) {
				CartOrder item = new CartOrder();
				item.setPro_id(cart.getProduct().getId());
				item.setQuatity(cart.getQuatity());
				item.setOrder_id(objOrder.getOrder_id());
				item.setCustomer_id(customer.getId());
				cartOrdDAO.addItem(item);
			}
		}
	     session.removeAttribute("myCartItems");
	     session.removeAttribute("count");
	     session.removeAttribute("myCartTotal");
	     session.removeAttribute("myCartNum");
	     session.removeAttribute("objOrder");
		return "order-success";
	}
	@GetMapping("checkout")
	public String checkout(ModelMap modelMap) {  
		modelMap.addAttribute("proDAO", proDAO);
		return "public.checkout";
	}
	
	@PostMapping("checkout/deliver")
	public String checkout(@Valid @ModelAttribute("objOrder") Order objOrder,BindingResult br,@RequestParam("giftcodes") String giftcode,RedirectAttributes ra,HttpSession session,ModelMap modelMap) {
		if(br.hasErrors()) {
			System.out.println("error");
			modelMap.addAttribute("proDAO", proDAO);
			return "public.checkout";
		}
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			ra.addFlashAttribute("msg", MessageDefine.NULL_CART);
			return "redirect:/checkout";
		}
		System.out.println(giftcode);
		GiftCode objGift = giftDAO.getItem(giftcode);
		
		if(objGift ==null) {
			System.out.println("giflcode null");
			objOrder.setGiftcode(0);
		}
		else objOrder.setGiftcode(objGift.getValue());
		objOrder.setStatus("Đang chờ");
		long total = (long)session.getAttribute("myCartTotal");
		total -= total*objOrder.getGiftcode()/100;
		session.setAttribute("objOrder", objOrder);
		session.setAttribute("myCartTotal", total);
		return "redirect:/checkout-step2";
	}
}
