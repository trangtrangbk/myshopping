package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Contact;


@Repository
public class ContactDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void save(Contact obj) {
		String sql = "INSERT INTO vnecontact(name,phone, email, subject, message) VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sql, obj.getName(),obj.getPhone(), obj.getEmail(), obj.getSubject(),obj.getMessage() );
		
	}

	public int countItems() {
		String sql = "SELECT COUNT(*) AS totalRow  "
				+ "FROM vnecontact ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}

	public List<Contact> getItemsPagination(int offset) {
		List<Contact> listContact = new ArrayList<>();
		String sql = "SELECT id, name,phone, email, subject, message FROM vnecontact ORDER BY id LIMIT ?,?";
		
		return (List<Contact>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT}, 
				new ResultSetExtractor<List<Contact>>() {

					@Override
					public List<Contact> extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							listContact.add(new Contact(rs.getInt("id"),
									rs.getString("name"), 
									rs.getString("phone"), 
									rs.getString("email"), 
									rs.getString("subject"), 
									rs.getString("message")));
							
						}
						return listContact;
					}
		});
	}


	public int delItem(int id) {
		String sql = "DELETE FROM vnecontact WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}

	public Contact getItem(int id) {
		String sql=" SELECT * FROM vnecontact WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	
	
	
}
