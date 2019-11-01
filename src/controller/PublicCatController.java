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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("cat")
public class PublicCatController {

    @Autowired
    private CategoryDAO catDAO;
    @Autowired
    private ProductDAO proDAO;

    @ModelAttribute
    public void leftbar(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        modelMap.addAttribute("en", en);
        request.setAttribute("catDAO", catDAO);
        modelMap.addAttribute("proDAO", proDAO);
    }

    @GetMapping({"{cat}-{cid}", "{cat}-{cid}/{page}"})
    public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page, @PathVariable("cid") int cid) {
        if (page == null) {
            page = 1;
        }
        int totalRow = proDAO.countItemsByCid(cid);
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.PUBLIC_ROW_COUNT);
        if (page <= 0 || page > sumPage) {
            page = 1;
        }
        int offset = (page - 1) * PageDefine.PUBLIC_ROW_COUNT;
        List<Product> listPro = proDAO.getItemsPaginationByCat(offset, cid);
        List<Category> listCategory = catDAO.getCategory();
        modelMap.addAttribute("listCategory", listCategory);

        List<Product> listProPopular = proDAO.getListPopular();
        modelMap.addAttribute("listProPopular", listProPopular);
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        modelMap.addAttribute("idCategory", cid);
        modelMap.addAttribute("cname", catDAO.getItem(cid).getCname());
        return "public.cat";
    }

    @GetMapping({"sortcat","sortcat/{page}"})
    public String sortCat(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page, @RequestParam("cid") Integer cid, @RequestParam("status") Integer status) {
        if (page == null) {
            page = 1;
        }
        System.out.println("sort cat");
        System.out.println(status);
        if(status ==null) status = 0;
        String orderBy = "";
        switch (status) {
		case 0:
			orderBy = " id DESC";
			break;
		case 1:
			orderBy = " id ASC";
			break;
		case 2:
			orderBy = " price DESC";
			break;
		case 3:
			orderBy = " price ASC";
			break;

		default:
			break;
		}
        int totalRow = proDAO.countItemsByCid(cid);
        int sumPage = (int) Math.ceil((float) totalRow / PageDefine.PUBLIC_ROW_COUNT);
        if (page <= 0 || page > sumPage) {
            page = 1;
        }
        int offset = (page - 1) * PageDefine.PUBLIC_ROW_COUNT;
        System.out.println("total: " + totalRow);
        List<Product> listPro = proDAO.getSortItemsPaginationByCat(offset,cid, orderBy);        
        System.out.println(listPro.size());
        List<Category> listCategory = catDAO.getCategory();
        modelMap.addAttribute("listCategory", listCategory);

        List<Product> listProPopular = proDAO.getListPopular();
        modelMap.addAttribute("listProPopular", listProPopular);
        modelMap.addAttribute("listPro", listPro);
        modelMap.addAttribute("sumPage", sumPage);
        modelMap.addAttribute("page", page);
        modelMap.addAttribute("idCategory", cid);
        modelMap.addAttribute("cname", catDAO.getItem(cid).getCname());
        modelMap.addAttribute("messenge", "cat");
        return "public.sortcat";
    }
}
