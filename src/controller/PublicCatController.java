package controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CategoryDAO;
import dao.ProductDAO;
import define.PageDefine;
import model.Category;
import model.Product;

@Controller
@RequestMapping("cat")
public class PublicCatController {
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private ProductDAO proDAO;
	

	@ModelAttribute
	public void leftbar(ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {		
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		request.setAttribute("catDAO", catDAO);	
		modelMap.addAttribute("proDAO", proDAO);
	}
	@GetMapping({ "{cat}-{cid}", "{cat}-{cid}/{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page,@PathVariable("cid") int cid) {
		if (page == null)
			page = 1;
		int totalRow = proDAO.countItemsByCid(cid);
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.PUBLIC_ROW_COUNT);
		if (page <= 0 || page > sumPage)
			page = 1;
		int offset = (page - 1) * PageDefine.PUBLIC_ROW_COUNT;
		System.out.println("total: " + totalRow);
		List<Product> listPro = proDAO.getItemsPaginationByCat(offset, cid);
		System.out.println(listPro.size());
		modelMap.addAttribute("cid", cid);
                List<Category> listCategory = catDAO.getCategory();
                modelMap.addAttribute("listCategory", listCategory);
		modelMap.addAttribute("listPro", listPro);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);	
		modelMap.addAttribute("cname", catDAO.getItem(cid).getCname());
		return "public.cat";
	}

}
