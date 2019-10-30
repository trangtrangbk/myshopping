package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Category;
import model.Customer;
import model.User;

@Repository
public class CustomerDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int add(Customer cus) {
		String sql = "INSERT INTO customer(name,username,password,email,phone,address) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {cus.getName(),cus.getUsername(),cus.getPassword(),cus.getEmail(),cus.getPhone(),cus.getAddress()});
	}
	public List<Customer> getItemsPagination(int offset){
		String sql = "SELECT * FROM customer ORDER BY id DESC LIMIT ?,?";		
		return (List<Customer>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT},new BeanPropertyRowMapper<Customer>(Customer.class) );
	}

	public int edit(Customer cus) {
		String sql = "UPDATE customer SET name=?,username = ?,password=?,email=?,phone=?,address=? WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] {cus.getName(),cus.getUsername(),cus.getPassword(),cus.getEmail(),cus.getPhone(),cus.getAddress(),cus.getId()});
	}
	
	public int checkDup(String username) {
		String sql = "SELECT COUNT(*) FROM customer WHERE username=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username}, Integer.class);
	}
	
	public int checkLogin(String username,String password) {
		String sql = "SELECT COUNT(*) FROM customer WHERE username=? and password=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username,password}, Integer.class);
	}
	
	public Customer getItem(String username) {
		String sql ="SELECT * FROM customer WHERE username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username}, new BeanPropertyRowMapper<>(Customer.class));
	}
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM customer ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}
	public int delItem(int id) {
		String sql = "DELETE FROM customer WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int changeStatus(Customer objUser) {	
		String sql = "UPDATE customer SET active=? WHERE id =?";
		System.out.println(objUser.getActive() + " - "+ Math.abs(objUser.getActive()-1));
		return jdbcTemplate.update(sql, new Object[] {Math.abs(objUser.getActive()-1),objUser.getId()});
		
	}
	public Customer getItem(int id) {
		String sql ="SELECT * FROM customer WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<>(Customer.class));
	}
	
}
