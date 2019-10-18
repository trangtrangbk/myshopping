package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Slide;
import model.User;

@Repository
public class SlideDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Slide> getItemsPagination(int offset){
		String sql = "SELECT id,picture,status FROM slide ORDER BY id DESC LIMIT ?,?";		
		return (List<Slide>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT},new BeanPropertyRowMapper<Slide>(Slide.class) );
	}
	
	public int countItems() {
		String sql = "SELECT COUNT(*) FROM slide ";
		return jdbcTemplate.queryForObject(sql,Integer.class );
	}
	
	public int delItem(int id) {
		String sql = "DELETE FROM slide WHERE id=?";
		return jdbcTemplate.update(sql, new Object[] {id});
	}
	
	public int addItem(Slide slide) {
		String sql = "INSERT INTO slide(picture) VALUES(?)";
		return jdbcTemplate.update(sql, slide.getPicture());
	}
	public int changeStatus(Slide objSlide) {	
		String sql = "UPDATE slide SET status=? WHERE id =?";
		System.out.println(objSlide.getStatus() + " - "+ Math.abs(objSlide.getStatus()-1));
		return jdbcTemplate.update(sql, new Object[] {Math.abs(objSlide.getStatus()-1),objSlide.getId()});
		
	}

	public List<Slide> getItems(){
		String sql = "SELECT id,picture,status FROM slide WHERE status =1 ORDER BY id DESC";		
		return (List<Slide>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slide>(Slide.class) );
	}

	public Slide getItems(int id) {
		String sql = "SELECT id,picture,status FROM slide WHERE id =?";		
		return  jdbcTemplate.queryForObject(sql,new Object[] {id}, new BeanPropertyRowMapper<Slide>(Slide.class) );
	}
}
