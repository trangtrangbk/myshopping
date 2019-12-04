package controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDAO;
import dao.ContactDAO;
import dao.ProductDAO;
import define.MessageDefine;
import model.Contact;
import model.Customer;

@Controller
@RequestMapping("contact")
public class PublicContactController {

    @Autowired
    private ContactDAO contactDAO;
    @Autowired
    private CategoryDAO catDAO;
    @Autowired
    private ProductDAO proDAO;

    @ModelAttribute
    public void leftbar(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        request.setAttribute("catDAO", catDAO);
        modelMap.addAttribute("proDAO", proDAO);
        Customer customer = (Customer) session.getAttribute("customer");
        modelMap.addAttribute("customer", customer);
    }

    @GetMapping()
    public String contact(ModelMap modelMap) {
        modelMap.addAttribute("id_current", "lienhe");
        return "public.contact";
    }

    @PostMapping()
    public String contact(@Valid @ModelAttribute("obj") Contact obj, BindingResult br, ModelMap modelMap, RedirectAttributes ra) {
        if (br.hasErrors()) {
            return "public.contact";
        } else {
            contactDAO.save(obj);
            ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS_CONTACT);
            return "redirect:/contact";
        }
    }
}
