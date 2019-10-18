package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import model.Product;

@Controller
@RequestMapping("")
public class PublicDetailController {
	
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private CategoryDAO catDAO;

	@ModelAttribute
	public void leftbar(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {		
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		request.setAttribute("catDAO", catDAO);	
		modelMap.addAttribute("proDAO", proDAO);
	}
	@GetMapping("detail/{name}-{id}")
	public String index(ModelMap modelMap,@PathVariable("id") int id) {
		proDAO.IncView(id);
		Product objPro = proDAO.getItem(id);
		List<Product> listRelated = proDAO.getListRelated(objPro.getCat().getCid(),objPro.getId());
		List<Product> listOther = proDAO.getListOther(objPro.getCat().getCid());
		String[] listName = objPro.getPicture().split(":");
		modelMap.addAttribute("listName", listName);
		modelMap.addAttribute("listOther", listOther);
		modelMap.addAttribute("objPro", objPro);
		modelMap.addAttribute("listRelated", listRelated);
		
		return "public.detail";
	}
	
	@PostMapping("detail/active")
	public void active(HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String picture = request.getParameter("name");
		System.out.println(picture);
		out.println("<img src='" +request.getContextPath()+"/fileUpload/"+picture+"' />");
	}
}
