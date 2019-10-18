package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.User;


@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM users ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}

	public List<User> getItemsPagination(int offset) {
		List<User> listUser = new ArrayList<>();
		String sql = "SELECT id, username, fullname, password,roleId,active FROM users ORDER BY id LIMIT ?,?";
		
		return (List<User>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<User>>() {

					@Override
					public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listUser.add(new User(rs.getInt("id"),
									rs.getString("username"),
									rs.getString("fullname"),
									rs.getString("password"),rs.getInt("roleId"),rs.getInt("active")));
							
						}
						return listUser;
					}
		});
	}

	public int addItem(User objUser) {
		String sql = "INSERT INTO users(username,fullname,password,roleId) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {objUser.getUsername(), objUser.getFullname(), objUser.getPassword(),objUser.getRoleid()});
	}

	public int delItem(int id) {
		String sql = "DELETE FROM users WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public int editItem(User objUser) {
		String sql = " UPDATE users SET username=?, fullname=?, password=?,roleId=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {objUser.getUsername(), objUser.getFullname(), objUser.getPassword(),objUser.getRoleid(),objUser.getId()});
	}

	public int search(User objUser,int id) {
		String sql = "SELECT COUNT(*) FROM users WHERE username=? and id!=?";
		
		return jdbcTemplate.queryForObject(sql, new Object[] {objUser.getUsername(),id}, Integer.class);
	}

	public User getItem(int id) {
		String sql= "SELECT id, username, fullname, password,roleId,active FROM users WHERE id= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<User>(User.class));
	}

	public User checkLogin(User obj) {
		String sql = "SELECT id,username,fullname,password,roleId,active FROM users WHERE username=? AND password=?";	
		try {
		return jdbcTemplate.queryForObject(sql, new Object[] {obj.getUsername(), obj.getPassword()}, new BeanPropertyRowMapper<User>(User.class));
		}catch(Exception e) {
			return null;
		}
	}

	public User getItem(String name) {
		String sql= "SELECT id, username, fullname, password,roleId,active FROM users WHERE username= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {name}, new BeanPropertyRowMapper<User>(User.class));
	}

	public int changeStatus(User objUser) {	
		String sql = "UPDATE users SET active=? WHERE id =?";
		System.out.println(objUser.getActive() + " - "+ Math.abs(objUser.getActive()-1));
		return jdbcTemplate.update(sql, new Object[] {Math.abs(objUser.getActive()-1),objUser.getId()});
		
	}
	
	public int editItemPro(User objUser) {
		String sql = " UPDATE users SET username=?, fullname=?, password=? WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {objUser.getUsername(), objUser.getFullname(), objUser.getPassword(),objUser.getId()});
	}
	public int getNumberOfItem() {
		String sql = "SELECT COUNT(*) FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
