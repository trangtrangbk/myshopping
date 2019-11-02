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
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartOrder;
import model.Customer;
import model.GiftCode;
import model.Order;
import model.Product;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @Autowired
    private JavaMailSender mailSender;

    @ModelAttribute
    public void leftbar(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        modelMap.addAttribute("en", en);
        request.setAttribute("catDAO", catDAO);
    }

    @GetMapping("checkout-step2")
    public String checkout2(ModelMap modelMap, HttpSession session) {
        Customer customer = (Customer) session.getAttribute("customer");
        List<Cart> myCartItems = (ArrayList<Cart>) session.getAttribute("myCartItems");
        Long myCartTotal = (Long) session.getAttribute("myCartTotal");
        modelMap.addAttribute("proDAO", proDAO);
        modelMap.addAttribute("customer", customer);
        modelMap.addAttribute("order", new Customer());
        modelMap.addAttribute("myCartItems", myCartItems);
        modelMap.addAttribute("myCartTotal", myCartTotal);

        return "public.checkout-step2";
    }

    @RequestMapping("checkout1")
    public String checkout1(ModelMap modelMap, HttpSession session) {
        modelMap.addAttribute("proDAO", proDAO);
        return "public.checkout";
    }

    @PostMapping("checkout-step2")
    public String checkout2(@RequestParam("giftcodes") String giftcode, @Valid @ModelAttribute("objOrder") Order objOrder, @ModelAttribute("order") Customer orderCustomer, RedirectAttributes ra, HttpSession session, ModelMap modelMap) {
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            ra.addFlashAttribute("msg", MessageDefine.NULL_CART);
            return "redirect:/checkout";
        }
        GiftCode objGift = giftDAO.getItem(giftcode);
        if (objGift == null) {
            System.out.println("giflcode null");
            objOrder.setGiftcode(0);
        } else {
            objOrder.setGiftcode(objGift.getValue());
        }
        objOrder.setStatus("Đang chờ");
        objOrder.setPayments("Thanh toán sau khi nhận hàng");
        objOrder.setPaid("Chưa thanh toán");
        objOrder.setBill((long) session.getAttribute("myCartTotal"));
        System.out.println(objOrder.toString());
        long total = (long) session.getAttribute("myCartTotal");
        total -= total * objOrder.getGiftcode() / 100;
        session.setAttribute("myCartTotal", total);
        session.setAttribute("objOrder", objOrder);
        session.setAttribute("myCartItems", cartItems);
        if(orderCustomer != null){
            session.setAttribute("orderCustomer", orderCustomer);
        }
        System.out.println("----------------" + orderCustomer.getEmail());
        System.out.println("----------------" + orderCustomer.getName());
        System.out.println("----------------" + orderCustomer.getPhone());
        System.out.println("----------------" + orderCustomer.getAddress());

        return "public.confirm";
    }

    @PostMapping("confirm")
    public String confirm(HttpSession session) {
        Order order = (Order) session.getAttribute("objOrder");
        Customer customer = (Customer) session.getAttribute("customer");
        int customerId = 0;
        if (customer != null) {
            customerId = customer.getId();
        }
        Customer orderCustomer = (Customer) session.getAttribute("orderCustomer");
        if (orderCustomer == null) {
            System.out.println("customer null");
        }
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        orderDAO.addItem(order);
        order = orderDAO.getItemLastest();
        if (cartItems != null) {
            for (Cart cart : cartItems) {
                CartOrder item = new CartOrder();
                item.setPro_id(cart.getProduct().getId());
                item.setQuatity(cart.getQuatity());
                item.setOrder_id(order.getOrder_id());
                item.setCustomer_id(customerId);
                cartOrdDAO.addItem(item);
            }
        }
        System.out.println("----------------" + orderCustomer.getEmail());
        System.out.println("----------------" + orderCustomer.getName());
        System.out.println("----------------" + orderCustomer.getPhone());
        System.out.println("----------------" + orderCustomer.getAddress());
        String recipientAddress = orderCustomer.getEmail();
        String subject = "Ban da dat hang thanh cong!";
        String message = "Thông tin khách hàng:\n ";
        message = message + "Ho va Ten: " + orderCustomer.getName() + "\nDia chi:     "
                + orderCustomer.getAddress() + "\nDien Thoai:  "
                + orderCustomer.getPhone() + "\nNgay order:  "
                + java.time.LocalDateTime.now() + " \n\n\n";
        message = message + "Name                                           Price               Quantity       \n\n";

        for (int j = 0; j < cartItems.size(); j++) {
            message += cartItems.get(j).getProduct().getName() + "                     "
                    + cartItems.get(j).getProduct().getPrice() + "                     "
                    + cartItems.get(j).getQuatity() + "\n";
        }
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message);
        // sends the e-mail
        mailSender.send(email);
        session.removeAttribute("myCartItems");
        session.removeAttribute("count");
        session.removeAttribute("myCartTotal");
        session.removeAttribute("myCartNum");
        session.removeAttribute("orderCustomer");
        return "order-success";
    }

    @GetMapping("checkout")
    public String checkout(ModelMap modelMap, @RequestParam(value = "id") int id, HttpSession session, HttpServletRequest request) {
        modelMap.addAttribute("proDAO", proDAO);
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        Product product = proDAO.getItem(id);
        if (product != null) {
            int index = CheckProduct(id, cartItems);
            if (index >= 0) {
                cartItems.get(index).setQuatity(cartItems.get(index).getQuatity() + 1);
            } else {
                Cart item = new Cart();
                item.setProduct(product);
                item.setQuatity(1);
                cartItems.add(item);
                System.out.println("--" + item.getProduct().getPrice());
            }
        }
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }

        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("count", count);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/checkout1";
    }

    @GetMapping("update-form")
    public String updateCart(ModelMap modelMap, @RequestParam(value = "productId") int id, @RequestParam(value = "quantity") int quantity, HttpSession session, HttpServletRequest request) {
        List<Cart> cartItems = (List<Cart>) session.getAttribute("myCartItems");
        int index = CheckProduct(id, cartItems);
        cartItems.get(index).setQuatity(quantity);
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
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
                System.out.println("");
            }
        }
        return index;
    }

    @PostMapping("checkout/deliver")
    public String checkout(@Valid @ModelAttribute("objOrder") Order objOrder, BindingResult br, @RequestParam("giftcodes") String giftcode, RedirectAttributes ra, HttpSession session, ModelMap modelMap) {
        if (br.hasErrors()) {
            System.out.println("error");
            modelMap.addAttribute("proDAO", proDAO);
            return "public.checkout";
        }
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            ra.addFlashAttribute("msg", MessageDefine.NULL_CART);
            return "redirect:/checkout";
        }

        return "redirect:/checkout-step2";
    }
}
