package dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Revenue;

@Repository
public class RevenueDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Revenue> getItemsPagination(int offset,int month,int year) {
		List<Revenue> list = new ArrayList<>();
		String sql = "select product.name,cart.quatity from product inner join cart  on product.id = cart.pro_id inner join orders"
				+ " on cart.order_id= orders.order_id where MONTH(orders.date) =? and YEAR(orders.date) =? and paid ='Đã thanh toán'"
				+ " and orders.status = 'Hoàn tất' group by product.id "
				+ " ORDER BY cart.quatity DESC LIMIT ?,?";
		
		try {
			return (List<Revenue>) jdbcTemplate.query(sql, new Object[] {month,year,offset ,PageDefine.ADMIN_ROW_COUNT}, 
					new ResultSetExtractor<List<Revenue>>() {
						@Override
						public List<Revenue> extractData(ResultSet rs) throws SQLException, DataAccessException {
							while (rs.next()) {
								list.add(new Revenue(rs.getString("name"), rs.getInt("quatity")));							
							}
							return list;
						}
			});
		} catch (Exception e) {
			return null;
		}
	}
	
}
