package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Role;

@Repository
public class RoleDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Role> getItems(){
		String sql = "SELECT * FROM roles ORDER BY roleId DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Role.class));
	}
	public Role getItem(int id){
		String sql = "SELECT * FROM roles WHERE roleId = ?";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Role>(Role.class));
		}catch(Exception e) {
			return null;
		}
	}
}
