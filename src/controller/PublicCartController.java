package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Cart;
import model.Customer;
import model.Product;

@Controller
@RequestMapping("cart")
public class PublicCartController {
	
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private  CategoryDAO catDAO;
	
	@ModelAttribute
	public void leftbar(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {		
		request.setAttribute("catDAO", catDAO);	
	}
	
	
	@PostMapping("add")
	public void add(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
		Customer customer =(Customer) session.getAttribute("customer");
		PrintWriter out = response.getWriter();
		if(customer == null) {
			
		}else {
		
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id " +id);
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		Product product = proDAO.getItem(id);
		if(product!=null) {
			if(cartItems.containsKey(id)) {
				Cart item = cartItems.get(id);
				item.setProduct(product);
				item.setQuatity(item.getQuatity()+1);
				
				cartItems.put(id, item);
			}else {
				Cart item = new Cart();
				item.setProduct(product);
				item.setQuatity(1);
				cartItems.put(id, item);
			}
		}
		int count = 0;
		for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getQuatity();
        }
		out.println(" <a href='"+request.getContextPath()+"/checkout'><input type='button' style=\"color: red;font-weight: bold\" value='    "+ count+"' class='button' /></a>");
		 session.setAttribute("myCartItems", cartItems);
		 session.setAttribute("count", count);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	 
		}
	     
	}
	
	@PostMapping("sub")
	public void sub(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id " +id);
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		
		Product product = proDAO.getItem(id);
		if(cartItems.get(id).getQuatity() >1)
		cartItems.get(id).setQuatity(cartItems.get(id).getQuatity() - 1);
		int count = 0;
		for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getQuatity();
        }
		out.println("<span>"+cartItems.get(id).getQuatity() +"</span>");
		 session.setAttribute("myCartItems", cartItems);
		 session.setAttribute("count", count);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	     
	}
	
	@PostMapping("addquatity")
	public void add2(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id " +id);
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		
		Product product = proDAO.getItem(id);
		cartItems.get(id).setQuatity(cartItems.get(id).getQuatity() + 1);
		int count = 0;
		for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getQuatity();
        }
		out.println("<span>"+cartItems.get(id).getQuatity() +"</span>");
		 session.setAttribute("myCartItems", cartItems);
		 session.setAttribute("count", count);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	     
	}
	
	@GetMapping("sub/{productId}")
	    public String viewUpdate(ModelMap modelMap, HttpSession session, @PathVariable("productId") Integer productId) {
	        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
	        if (cartItems == null) {
	            cartItems = new HashMap<>();
	        }
	        session.setAttribute("myCartItems", cartItems);
	        return "redirect:/checkout";
	    }

	@GetMapping("remove/{productId}")
	    public String viewRemove(ModelMap modelMap, HttpSession session, @PathVariable("productId") Integer productId) {
	        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
	        if (cartItems == null) {
	            cartItems = new HashMap<>();
	        }
	        if (cartItems.containsKey(productId)) {
	            cartItems.remove(productId);
	        }
	        int count = 0;
			for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
	            count += list.getValue().getQuatity();
	        }
	        session.setAttribute("count", count);
	        session.setAttribute("myCartItems", cartItems);
	        session.setAttribute("myCartTotal", totalPrice(cartItems));
	        session.setAttribute("myCartNum", cartItems.size());
	        return "redirect:/checkout";
	    }
	 public long totalPrice(HashMap<Integer, Cart> cartItems) {
	        int count = 0;
	        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
	            count += list.getValue().getProduct().getPrice() * list.getValue().getQuatity();
	        }
	        return count;
	    } 
}
