package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Order;

@Repository
public class OrderDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Order> getItemsPagination(int offset){
		String sql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT ?,?";
		try {
			return jdbcTemplate.query(sql, new Object[] {offset, PageDefine.ADMIN_ROW_COUNT},new BeanPropertyRowMapper<>(Order.class));
		} catch (Exception e) {
			return null;
		}
	}
	
	public void addItem(Order item) {
		System.out.println("add = " + item.toString());
		String sql = "INSERT INTO orders(name,phone,address,bill,payments,paid,giftcode,status) VALUES(?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {item.getName(),item.getPhone(),item.getAddress(),item.getBill(),
				item.getPayments(),item.getPaid(),item.getGiftcode(),item.getStatus()});
	}
	
	public Order getItemLastest() {
		String sql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Order.class));
	}

	public int countItems() {
		String sql = "SELECT COUNT(*) FROM orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public Order getItemById(int order_id) {
		String sql = "SELECT * FROM orders WHERE order_id=?";
		return jdbcTemplate.queryForObject(sql,new Object[] {order_id}, new BeanPropertyRowMapper<>(Order.class));
	}

	public int edit(int order_id, String status, String paid) {
		String sql = "UPDATE orders SET status =?, paid = ? WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {status,paid,order_id});
		
	}
	
	public void editChecked(int checked,int order_id ) {
		String sql = "UPDATE orders SET checked =? WHERE order_id=?";
		jdbcTemplate.update(sql, new Object[] {checked,order_id});
	}
	
	public int del(int order_id) {
		String sql = "DELETE FROM orders WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {order_id});
	}
	public Integer billOfYear(int year) {
		String sql = "SELECT SUM(bill) FROM orders WHERE YEAR(date) = ? and paid ='Đã thanh toán' and orders.status = 'Hoàn tất'";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {year}, Integer.class);
		} catch (Exception e) {
			return null;
		}
	}
	public Integer billOfMonth(int month,int year) {
		String sql = "SELECT SUM(bill) FROM orders WHERE MONTH(date) = ? AND YEAR(date) = ? and paid ='Đã thanh toán' and orders.status ='Hoàn tất'";
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {month,year}, Integer.class);
		} catch (Exception e) {
			return null;
		}
	}
	public int minYear() {
		String sql = "SELECT MIN(YEAR(date)) from orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int maxYear() {
		String sql = "SELECT MAX(YEAR(date)) from orders";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int billUnchecked() {
		String sql= "SELECT COUNT(*) FROM orders WHERE checked=0";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
