package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.CartOrder;

@Repository
public class CartOrderDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<CartOrder> getItemsByOrderId(int order_id){
		String sql = "SELECT * FROM cart WHERE order_id = ?";
		try {
			return jdbcTemplate.query(sql, new Object[] {order_id}, new BeanPropertyRowMapper(CartOrder.class));
		} catch (Exception e) {
			return null;
		}
	}
	
	public void addItem(CartOrder cart) {
		String sql ="INSERT INTO cart(pro_id,quatity,order_id,customer_id) VALUES(?,?,?,?) ";
		jdbcTemplate.update(sql, new Object[] {cart.getPro_id(),cart.getQuatity(),cart.getOrder_id(),cart.getCustomer_id()});
	}
	
	public int delItem(int order_id) {
		String sql = "DELETE FROM cart WHERE order_id=?";
		return jdbcTemplate.update(sql, new Object[] {order_id});
	}
	
	public List<CartOrder> getItemsByCustomer_Id(int customer_id){
		String sql = "SELECT * FROM cart WHERE customer_id = ?";
		try {
			return jdbcTemplate.query(sql, new Object[] {customer_id}, new BeanPropertyRowMapper(CartOrder.class));
		} catch (Exception e) {
			return null;
		}
	}
}
