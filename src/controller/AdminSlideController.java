package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDAO;
import dao.ContactDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.SlideDAO;
import dao.UserDAO;
import define.FileDefine;
import define.MessageDefine;
import define.PageDefine;
import model.Contact;
import model.Customer;
import model.Slide;
import model.User;

@Controller
@RequestMapping("admin/slide")
public class AdminSlideController {
	@Autowired
	private SlideDAO slideDAO;
	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 5);
	}
	@GetMapping({ "", "{page}" })
	public String contact(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int totalRow = slideDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Slide> listSlide = slideDAO.getItemsPagination(offset);
		modelMap.addAttribute("listSlide", listSlide);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.slide";
	}
	
	@GetMapping("add")
	public String add() {
		return "admin.slide.add";
	}
	
	@PostMapping("add")
	public String add(@RequestParam("picture") CommonsMultipartFile picture,RedirectAttributes ra) throws IllegalStateException, IOException {
		String fileName = picture.getOriginalFilename();
		String tmp = FilenameUtils.getExtension(fileName);
		if (tmp.equalsIgnoreCase("jpg") || tmp.equalsIgnoreCase("png") || tmp.equalsIgnoreCase("jpeg")) {
			if (!"".equals(fileName)) {
				fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
						+ FilenameUtils.getExtension(fileName);
				String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir = new File(dirPath);
				if (!createDir.exists()) {
					createDir.mkdirs();
				}
				fileName = FileDefine.rename(fileName);
				String filPath = dirPath + File.separator + fileName;
				picture.transferTo(new File(filPath));
				System.out.println(dirPath + File.separator + fileName);
			}
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERRORFILE);
			return "redirect:/admin/slide";
		}
		if(slideDAO.addItem(new Slide(0, fileName,1)) > 0 ) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
			return "redirect:/admin/slide";
		}else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/slide";
		}
	}

	@GetMapping("del/{id}")
	public String del(ModelMap modelMap, @PathVariable int id, RedirectAttributes ra) {

		if (slideDAO.delItem(id) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/slide";
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/slide";
		}

	}
	@PostMapping("active")
	public void active(Principal principal,HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter(); 
		int status =Integer.parseInt( request.getParameter("status"));
		System.out.println(status+" "+id);
		Slide objSlide = slideDAO.getItems(id);
		slideDAO.changeStatus(objSlide);
		if(objSlide.getStatus()== 0) {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,0);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/ac.png'/></a>");
		}
		else {
			out.println("<a href='javascript:void(0)' onclick='active("+id+" ,1);'><img height='50px' width = '50px' src='"+request.getContextPath() +"/resources/admin/img/de.png'/></a>");
		}

	}

}
