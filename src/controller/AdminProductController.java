package controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import define.FileDefine;
import define.MessageDefine;
import define.PageDefine;
import model.Category;
import model.Product;
import model.User;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {

	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private CategoryDAO catDAO;
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
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		modelMap.addAttribute("id_current", 3);
	}
	@GetMapping({ "", "{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page) {
		if (page == null)
			page = 1;
		int totalRow = proDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		if (page <= 0 || page > sumPage)
			page = 1;
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Product> listPro = proDAO.getItemsPagination(offset);
		modelMap.addAttribute("proDAO", proDAO);
		modelMap.addAttribute("listPro", listPro);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.product";
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> listCat = catDAO.getItems();
		List<Integer> listParrent_id = catDAO.getListParrent_id();
		for (int t = 0; t < listCat.size(); t++) {
			for (int i = 0; i < listParrent_id.size(); i++) {
				if (listCat.get(t).getCid() == listParrent_id.get(i)) {
					listCat.remove(listCat.get(t));
					t--;
					break;
				}
			}
		}
		modelMap.addAttribute("listCat", listCat);
		return "admin.product.add";
	}

	@PostMapping("add")
	public String add(ModelMap modelMap,@Valid @ModelAttribute("objPro") Product objPro,BindingResult br, @RequestParam("cid") Integer cid,
			@RequestParam("picturePre") List<CommonsMultipartFile> listPicture, RedirectAttributes ra)	throws IllegalStateException, IOException {
		if(br.hasErrors()) {
			List<Category> listCat = catDAO.getItems();
			List<Integer> listParrent_id = catDAO.getListParrent_id();
			for (int t = 0; t < listCat.size(); t++) {
				for (int i = 0; i < listParrent_id.size(); i++) {
					if (listCat.get(t).getCid() == listParrent_id.get(i)) {
						listCat.remove(listCat.get(t));
						t--;
						break;
					}
				}
			}
			modelMap.addAttribute("listCat", listCat);
			return "admin.product.add";
		}
		System.out.println(objPro);
		if (cid == null) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/product";
		} else
			objPro.setCat(new Category(cid,"",0));
		System.out.println(listPicture.size());
		String listName = "";
		for (CommonsMultipartFile picture : listPicture) {
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
			return "redirect:/admin/product";
		}
		listName = listName  + fileName + ":";
		
		}
		System.out.println(listName);
		objPro.setPicture(listName);
		if (proDAO.addItem(objPro) > 0) {
			System.out.println(objPro);
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
			return "redirect:/admin/product";
		}
		
		ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
		return "redirect:/admin/product";
	}	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id,ModelMap modelMap) {
		List<Category> listCat = catDAO.getItems();
		List<Integer> listParrent_id = catDAO.getListParrent_id();
		Product objPro = proDAO.getItem(id);
		System.out.println(objPro.toString());
		Category cat = catDAO.getCat(id);
		objPro.setCat(cat);
		for (int t = 0; t < listCat.size(); t++) {
			for (int i = 0; i < listParrent_id.size(); i++) {
				if (listCat.get(t).getCid() == listParrent_id.get(i)) {
					listCat.remove(listCat.get(t));
					t--;
					break;
				}
			}
		}
		String[] listName = objPro.getPicture().split(":");
		modelMap.addAttribute("listName", listName);
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("objPro", objPro);
		return "admin.product.edit";
	}
	
	@PostMapping("edit/{id}")
	public String edit(@ModelAttribute("objPro") Product objPro,@RequestParam("cid") Integer cid,@PathVariable("id") int id,
			@RequestParam("picturePre") List<CommonsMultipartFile> listPicture,RedirectAttributes ra,ModelMap modelMap) throws IllegalStateException, IOException {
		if (cid==null) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "redirect:/admin/product";
			}		
		else objPro.setCat(new Category(cid, "",0));
		Product oldPro = proDAO.getItem(id);
		String listName = "";
		for (CommonsMultipartFile picture : listPicture) {
			String fileName = picture.getOriginalFilename();
			String tmp=FilenameUtils.getExtension(fileName);
			if(!"".equals(fileName)) 
			{	
			if (tmp.equalsIgnoreCase("jpg")||tmp.equalsIgnoreCase("png")||tmp.equalsIgnoreCase("jpeg")) {
				
					fileName = FilenameUtils.getBaseName(fileName) +"-"+ System.nanoTime() +"."+FilenameUtils.getExtension(fileName);
					String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
					File createDir = new File(dirPath);
					if(!createDir.exists()) {
						createDir.mkdirs();
					}
					fileName = FileDefine.rename(fileName);
					String filPath = dirPath+File.separator + fileName;
					String oldFilePath = dirPath + File.separator + oldPro.getPicture();
					File oldFile = new File(oldFilePath);
					if(oldFile.exists()) {
						oldFile.delete();
					}
					listName = listName  + fileName + ":";
					
					picture.transferTo(new File(filPath));
					System.out.println(dirPath + File.separator + fileName);
				}
			else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORFILE);
				return "redirect:/admin/product";
				}
			} else {
				listName = oldPro.getPicture();
			}
		}
			objPro.setPicture(listName);
			if (proDAO.editItem(objPro)>0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
				return "redirect:/admin/product";
			}
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/product";
		}
	
	@GetMapping("del/{id}")
	public String del(@PathVariable("id") int id,RedirectAttributes ra) {
		if(proDAO.delItem(id) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/product";
		}
		else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/product";
		}
	}
	
	@GetMapping({"search","search/{page}"})
	public String search(@RequestParam("input-data") String data,ModelMap modelMap, @PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		int totalRow = proDAO.countResultItems(data);
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<Product> listPro = proDAO.getResultItemsPagination(offset,data);
		
		modelMap.addAttribute("data", data);
		modelMap.addAttribute("listPro", listPro);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.product.result";
	}
	@GetMapping("search/{data}/{page}")
	public String search2(@PathVariable("data") String data,ModelMap modelMap, @PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		System.out.println(data);
		int totalRow = proDAO.countResultItems(data);
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<Product> listPro = proDAO.getResultItemsPagination(offset,data);
		System.out.println(listPro.size());
		modelMap.addAttribute("data", data);
		modelMap.addAttribute("listPro", listPro);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.product.result";
	}

}
