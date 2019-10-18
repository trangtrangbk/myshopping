package controller;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.RevenueDAO;
import dao.SlideDAO;
import dao.UserDAO;
import define.PageDefine;
import model.Revenue;
import model.User;
@RequestMapping("admin/revenue")
@Controller
public class AdminRevenueController {
	@Autowired
	private ProductDAO proDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private RevenueDAO revDAO;
	
	@ModelAttribute
	public void getname(Principal principal,ModelMap modelMap){
		int newOrder = orderDAO.billUnchecked();
		modelMap.addAttribute("newOrder", newOrder);
		User user = userDAO.getItem(principal.getName());
		modelMap.addAttribute("name",user.getFullname());
		Locale localeEN = new Locale("en", "EN");
	    NumberFormat en = NumberFormat.getInstance(localeEN);
		modelMap.addAttribute("en", en);
		modelMap.addAttribute("id_current", 10);
	}
	
	@GetMapping({"","-{year}"})
	public String index(ModelMap modelMap,@PathVariable(value = "year",required=false) Integer year) {
		if(year == null  ) year = java.time.LocalDate.now().getYear();
		System.out.println(year);
		int minYear = orderDAO.minYear();
		int billOfYear = 0;
		if(orderDAO.billOfYear(year) != null) {
			billOfYear = orderDAO.billOfYear(year);
		}
		List<Integer> listBillOfYear = new ArrayList<>();
		for(int i= 0; i<12;i++) {
			if(orderDAO.billOfMonth(i+1,year) !=null) {
				listBillOfYear.add(orderDAO.billOfMonth(i+1, year));
			}
			else listBillOfYear.add(0);
		}
		List<Integer> listYear = new ArrayList<>();
		int a = orderDAO.maxYear();
		while (a >= minYear) {
			listYear.add(a);
			a-=1;
		}
		modelMap.addAttribute("year", year);
		modelMap.addAttribute("listYear", listYear);
		modelMap.addAttribute("billOfYear", billOfYear);
		modelMap.addAttribute("listBillOfYear", listBillOfYear);
		return "admin.revenue";
	}
	@PostMapping("year")
	public String year(ModelMap modelMap,@RequestParam("currentYear") Integer year) {
		if(year == null  ) year = java.time.LocalDate.now().getYear();
		System.out.println(year);
		int minYear = orderDAO.minYear();
		int billOfYear = 0;
		if(orderDAO.billOfYear(year) != null) {
			billOfYear = orderDAO.billOfYear(year);
		}
		List<Integer> listBillOfYear = new ArrayList<>();
		for(int i= 0; i<12;i++) {
			if(orderDAO.billOfMonth(i+1,year) !=null) {
				listBillOfYear.add(orderDAO.billOfMonth(i+1, year));
			}
			else listBillOfYear.add(0);
		}
		List<Integer> listYear = new ArrayList<>();
		int a = orderDAO.maxYear();
		while (a >= minYear) {
			listYear.add(a);
			a-=1;
		}
		modelMap.addAttribute("year", year);
		modelMap.addAttribute("listYear", listYear);
		modelMap.addAttribute("billOfYear", billOfYear);
		modelMap.addAttribute("listBillOfYear", listBillOfYear);
		return "admin.revenue";
	}
	
	@GetMapping({"{year}/detail-{month}","{year}/detail-{month}-page-{page}"})
	public String detail(ModelMap modelMap,@PathVariable("month") int month,@PathVariable(value="page",required = false) Integer page,
			@PathVariable("year") int year) {
		if (page == null)
			page = 1;
		int totalRow = orderDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Revenue> list = revDAO.getItemsPagination(offset, month, year);
		int billOfMonth = 0;
		if(orderDAO.billOfMonth(month, year) !=null)
		 billOfMonth = orderDAO.billOfMonth(month, year);
		modelMap.addAttribute("billOfMonth", billOfMonth);
		modelMap.addAttribute("month", month);
		modelMap.addAttribute("year", year);
		modelMap.addAttribute("list", list);
		return "admin.revenue.detail";
	}
}
