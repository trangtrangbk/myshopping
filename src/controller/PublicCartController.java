package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import model.Cart;
import model.Customer;
import model.Product;

@Controller
@RequestMapping("cart")
public class PublicCartController {

    @Autowired
    private ProductDAO proDAO;
    @Autowired
    private CategoryDAO catDAO;
    private int example;

    @ModelAttribute
    public void leftbar(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("catDAO", catDAO);
    }

    @PostMapping("add")
    public void add(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	 Locale localeEN = new Locale("en", "EN");
         NumberFormat en = NumberFormat.getInstance(localeEN);
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id " + id);
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        Product product = proDAO.getItem(id);
        if (product != null) {
            int index = Utils.Process.CheckProduct(id, cartItems);
            if (index >= 0) {
                cartItems.get(index).setQuatity(cartItems.get(index).getQuatity() + 1);
            } else {
                Cart item = new Cart();
                item.setId(++example);
                item.setProduct(product);
                item.setQuatity(1);
                cartItems.add(item);
            }
        }
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }
        out.print(" <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"true\">\r\n" + 
        		"                                        <i class=\"fa fa-shopping-cart\"></i>\r\n" + 
        		"                                        <span>Giỏ hàng</span>\r\n" + 
        		"                                        <div class=\"qty\">"+count +"</div>\r\n" + 
        		"                                    </a>");
        out.print("  <div class=\"cart-dropdown\">\r\n" + 
        		"                                        <div class=\"cart-list\">");
        for(Cart cart:cartItems) {
        	String picture = cart.getProduct().getPicture()[0];
        	out.print(" <div class=\"product-widget\">\r\n" + 
        			"                                                    <div class=\"product-img\">\r\n" +"<img src=\'"+ request.getContextPath()+ "/fileUpload/"+picture+"'alt=\"\">\r\n" + 
        			"                                                    </div>\r\n" + 
        			"                                                    <div class=\"product-body\">\r\n" + 
        			"                                                        <h3 class=\"product-name\"><a href=\"#\">"+cart.getProduct().getName()+"</a></h3>\r\n" + 
        			"                                                        <h4 class=\"product-price\"><span class=\"qty\">"+cart.getQuatity()+"</span>"+en.format(cart.getQuatity() * cart.getProduct().getPrice())+"</h4>\r\n" + 
        			"                                                    </div></div>");
        }
        out.print(" <div class=\"cart-summary\">\r\n" + 
        		"                                            <h5>TỔNG:"+ en.format(totalPrice(cartItems))+" VND</h5>\r\n" + 
        		"                                        </div>\r\n" + 
        		"                                        <div class=\"cart-btns\">\r\n" + 
        		"                                            <a href='javascript:void(0)' onclick=\"cart("+ count+" )\"> <i class=\"fa fa-arrow-circle-right\">Xem giỏ hàng</i></a>\r\n" + 
        		"                                            <a href='javascript:void(0)' onclick=\"checkcart("+ count+" )\">  <i class=\"fa fa-arrow-circle-right\">Thanh toán</i></a>\r\n" + 
        		"                                        </div>\r\n" + 
        		"                                    </div>\r\n" + 
        		"                                </div>");
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("count", count);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());

    }

    @GetMapping("sub")
    public String sub(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        System.out.println("id ++++" + id);

        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        int index = CheckProduct(id, cartItems);
        cartItems.get(index).setQuatity(qty);
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }
        // out.println(" <input type= 'number' value= '" + cartItems.get(index).getQuatity() + "'>\n<span class=\"qty-up\">+</span>\n" + "<span class=\"qty-down\">-</span>");
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("count", count);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        System.out.println("id ++++" + qty);
        return "redirect:/checkout1";
    }

    @PostMapping("addquatity")
    public void add2(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id ---" + id);
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        int index = CheckProduct(id, cartItems);
        cartItems.get(index).setQuatity(cartItems.get(index).getQuatity() + 1);
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }
        out.println(" <input type= 'number' value= '" + cartItems.get(index).getQuatity() + "'>\n<span class=\"qty-up\">+</span>\n" + "<span class=\"qty-down\">-</span>");
        out.println("<input value=" + cartItems.get(index).getQuatity() + ">");
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("count", count);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());

    }

    @GetMapping("sub/{productId}")
    public String viewUpdate(ModelMap modelMap, HttpSession session, @PathVariable("productId") Integer productId) {
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        session.setAttribute("myCartItems", cartItems);
        return "redirect:/checkout";
    }

    @GetMapping("remove/{productId}")
    public String viewRemove(ModelMap modelMap, HttpSession session, @PathVariable("productId") Integer productId) {
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        int index = Utils.Process.CheckProduct(productId, cartItems);
        if (cartItems.get(index) != null) {
            cartItems.remove(index);
        }
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }
        session.setAttribute("count", count);
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/checkout1";
    }

    public long totalPrice(List<Cart> cartItems) {
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getProduct().getPrice() * list.getQuatity();
        }
        return count;
    }

    private int CheckProduct(int id, List<Cart> carts) {
        int index = -1;
        for (int i = 0; i < carts.size(); i++) {

            if (carts.get(i).getProduct().getId() == id) {
                index = i;
            }
        }
        return index;
    }
}
