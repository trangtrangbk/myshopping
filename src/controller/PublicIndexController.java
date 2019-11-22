package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SlideDAO;
import define.PageDefine;
import java.util.ArrayList;
import model.Cart;
import model.Category;
import model.Customer;
import model.Product;
import model.Slide;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("")
public class PublicIndexController {

    @Autowired
    private CategoryDAO catDAO;
    @Autowired
    private ProductDAO proDAO;
    @Autowired
    private SlideDAO slideDAO;
    private List<Cart> cartItems;

    @ModelAttribute
    public void leftbar(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        modelMap.addAttribute("en", en);
        request.setAttribute("catDAO", catDAO);
        modelMap.addAttribute("proDAO", proDAO);
        List<Slide> listSlide = slideDAO.getItems();
        modelMap.addAttribute("listSlide", listSlide);
        Customer customer = (Customer) session.getAttribute("customer");
        modelMap.addAttribute("customer", customer);
    }

    @GetMapping({"", "{page}"})
    public String index(ModelMap modelMap, HttpSession session, @PathVariable(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }

        cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        int totalRow = proDAO.countItems();
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.PUBLIC_ROW_COUNT);
        if (page <= 0 || page > sumPage) {
            page = 1;
        }
        int offset = (page - 1) * PageDefine.PUBLIC_ROW_COUNT;
        List<Product> listPro = proDAO.getListSortProduct(offset, " id DESC");
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        List<Category> listCategory = catDAO.getCategory();
        modelMap.addAttribute("listCategory", listCategory);
        List<Product> listProPopular = proDAO.getListPopular();
        modelMap.addAttribute("listProPopular", listProPopular);
        int count = 0;
        for (Cart list : cartItems) {
            count += list.getQuatity();
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("count", count);
        session.setAttribute("myCartTotal", Utils.Process.totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "public.index";
    }

    @GetMapping({"search", "search/{page}"})
    public String search(@RequestParam("input-data") String data, ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }
        System.out.println(data);
        int totalRow = proDAO.countResultItems(data);
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
        int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
        List<Product> listPro = proDAO.getResultItemsPagination(offset, data);
        modelMap.addAttribute("data", data);
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        return "public.search";
    }

    @GetMapping("search/{data}/{page}")
    public String search2(@PathVariable("data") String data, ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }
        System.out.println(data);
        int totalRow = proDAO.countResultItems(data);
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
        int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
        List<Product> listPro = proDAO.getResultItemsPagination(offset, data);
        System.out.println(listPro.size());
        modelMap.addAttribute("data", data);
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        return "public.search";
    }

    @GetMapping({"sort", "sort/{page}"})
    public String sort(ModelMap modelMap, @RequestParam(value = "status", required = false) Integer status, HttpSession session, @PathVariable(value = "page", required = false) Integer page) {
        if (page == null) {
            page = 1;
        }
        if (status == null) {
            status = 0;
        }
        String orderBy = "";
        switch (status) {
            case 0:
                orderBy = "id DESC";
                break;
            case 1:
                orderBy = "id ASC";
                break;
            case 2:
                orderBy = "price DESC";
                break;
            case 3:
                orderBy = "price ASC";
                break;
            default:
                break;
        }

        modelMap.addAttribute("orderby", status);

        cartItems = (List<Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }
        int totalRow = proDAO.countItems();
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.PUBLIC_ROW_COUNT);
        if (page <= 0 || page > sumPage) {
            page = 1;
        }
        int offset = (page - 1) * PageDefine.PUBLIC_ROW_COUNT;
        List<Product> listPro = proDAO.getListSortProduct(offset, orderBy);
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        List<Category> listCategory = catDAO.getCategory();
        modelMap.addAttribute("listCategory", listCategory);
        List<Product> listProPopular = proDAO.getListPopular();
        modelMap.addAttribute("listProPopular", listProPopular);
        return "public.sort";
    }

}
