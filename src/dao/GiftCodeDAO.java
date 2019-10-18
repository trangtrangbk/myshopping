package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import define.PageDefine;
import model.Category;
import model.GiftCode;

@Repository
public class GiftCodeDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<GiftCode> getItemsPagination(int offset){
		String sql = "SELECT gid,gname,amount,value FROM giftcode ORDER BY gid DESC LIMIT ?,?";		
		return (List<GiftCode>) jdbcTemplate.query(sql, new Object[] {offset ,PageDefine.ADMIN_ROW_COUNT},new BeanPropertyRowMapper<GiftCode>(GiftCode.class) );
	}
	
	public GiftCode getItem(int gid){
		String sql = "SELECT gid,gname,amount,value FROM giftcode WHERE gid=?";		
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {gid},new BeanPropertyRowMapper<GiftCode>(GiftCode.class) );
		} catch (Exception e) {
			return null;
		}
	}
	public GiftCode getItem(String gname){
		String sql = "SELECT gid,gname,amount,value FROM giftcode WHERE gname=?";		
		try {
			return jdbcTemplate.queryForObject(sql, new Object[] {gname},new BeanPropertyRowMapper<GiftCode>(GiftCode.class) );
		} catch (Exception e) {
			return null;
		}
	}
	
	public int countItems() {
		String sql = "SELECT COUNT(*) FROM giftcode";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public int checkDuplicate(String gname,int gid) {
		String sql = "SELECT COUNT(*) FROM giftcode WHERE gname=? AND gid !=? ";
		return jdbcTemplate.queryForObject(sql, new Object[] {gname,gid}, Integer.class);
	}
	
	public int addItem(GiftCode objGif) {
		String sql = "INSERT INTO giftcode(gname,amount,value) VALUES(?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {objGif.getGname(),objGif.getAmount(),objGif.getValue()});
	}
	public int editItem(GiftCode objGif) {
		String sql = "UPDATE giftcode SET gname=?, amount=?,value=? WHERE gid=?";
		return jdbcTemplate.update(sql, new Object[] {objGif.getGname(),objGif.getAmount(),objGif.getValue(),objGif.getGid()});
	}

	public int delItem(int gid) {
		String sql = "DELETE FROM giftcode WHERE gid=?";
		return jdbcTemplate.update(sql, new Object[] {gid});
	}
}
