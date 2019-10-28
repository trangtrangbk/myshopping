package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import Utils.StringUtils;
import define.PageDefine;
import model.Category;

@Repository
public class CategoryDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private CategoryDAO catDAO;

    public List<Category> getItemsPagination(int offset) {
        String sql = "SELECT cid,cname,parrent_id FROM category LIMIT ?,?";
        return (List<Category>) jdbcTemplate.query(sql, new Object[]{offset, PageDefine.ADMIN_ROW_COUNT}, new BeanPropertyRowMapper<Category>(Category.class));
    }

    public List<Category> getCategory() {
        String sql = "SELECT cid,cname,parrent_id FROM category ";
        return (List<Category>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
    }

    public Category getItem(int cid) {
        String sql = "SELECT cid,cname,parrent_id FROM category WHERE cid=?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{cid}, new BeanPropertyRowMapper<Category>(Category.class));
        } catch (Exception e) {
            return null;
        }
    }

    public List<Category> getItemsByParrent_id(int parrent_id) {
        String sql = "SELECT cid,cname,parrent_id FROM category WHERE parrent_id=?";
        try {
            return (List<Category>) jdbcTemplate.query(sql, new Object[]{parrent_id}, new BeanPropertyRowMapper<Category>(Category.class));
        } catch (Exception e) {
            return null;
        }
    }

    public int countItems() {
        System.out.println("cout");
        String sql = "SELECT COUNT(*) FROM category";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int checkDuplicate(String cname, int cid, int parrent_id) {
        String sql = "SELECT COUNT(*) FROM category WHERE cname=? AND cid !=? AND parrent_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{cname, cid, parrent_id}, Integer.class);
    }

    public int addItem(Category objCat) {
        String sql = "INSERT INTO category(cname,parrent_id) VALUES(?,?)";
        return jdbcTemplate.update(sql, new Object[]{objCat.getCname(), objCat.getParrent_id()});
    }

    public List<Category> getItems() {

        String sql = "SELECT cid,cname,parrent_id FROM category";
        return (List<Category>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));

    }

    public int editItem(Category objCat) {
        String sql = "UPDATE category SET cname=?, parrent_id=? WHERE cid=?";
        return jdbcTemplate.update(sql, new Object[]{objCat.getCname(), objCat.getParrent_id(), objCat.getCid()});
    }

    public int delItem(int cid) {
        String sql = "DELETE FROM category WHERE cid=?";
        return jdbcTemplate.update(sql, new Object[]{cid});
    }

    public List<Integer> getListParrent_id() {
        String sql = "SELECT parrent_id FROM category GROUP BY parrent_id";
        return jdbcTemplate.queryForList(sql, Integer.class);
    }

    public Category getCat(int id) {
        String sql = "SELECT cname, c.cid "
                + "FROM category AS c INNER JOIN product AS p ON p.cid = c.cid WHERE id= ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id},
                new BeanPropertyRowMapper<Category>(Category.class));
    }

    public int getNumberOfItem() {
        String sql = "SELECT COUNT(*) FROM category";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<Category> getParItems() {
        String sql = "SELECT cid,cname,parrent_id FROM category  WHERE parrent_id=0";
        return (List<Category>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
    }

    public void ShowCategory(List<Category> listcat, int parrent_id, HttpServletResponse response, HttpServletRequest request, JspWriter out) throws IOException {
        List<Category> list = catDAO.getItemsByParrent_id(parrent_id);
        if (list != null) {
            if (list.size() > 0) {
                out.println("<ul>");
                for (Category item : list) {
                    listcat.remove(item);
                    out.println("<li>" + item.getCname());
                    out.println("<a href='" + request.getContextPath() + "/admin/cat/edit/" + item.getCid() + "' title='Sửa' <span class='glyphicon glyphicon-pencil'></span> Sửa</a>");
                    out.println("<a href='" + request.getContextPath() + "/admin/cat/del/" + item.getCid() + "' title='Xóa'  onclick=\"return confirm('Xác nhận xóa danh mục?')\" ><span class='glyphicon glyphicon-trash'></span> Xóa</a>");
                    ShowCategory(listcat, item.getCid(), response, request, out);
                    out.println("</li>");
                }
                out.println("</ul>");
            }
        }
    }

    public void ShowCategoryPublic(List<Category> listcat, int parrent_id, HttpServletResponse response, HttpServletRequest request, javax.servlet.jsp.JspWriter out) throws IOException {
        //PrintWriter out = response.getWriter();
        System.out.println(parrent_id);
        List<Category> list = catDAO.getItemsByParrent_id(parrent_id);
        if (list != null) {
            if (list.size() > 0) {
                out.println("<ul>");
                for (Category item : list) {
                    listcat.remove(item);
                    if (catDAO.getItemsByParrent_id(item.getCid()).size() > 0) {
                        out.println("<li class='dropdown mega-dropdown active'>");
                        out.println("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>" + item.getCname() + "<span class='caret'></span></a>");
                        out.println("<div class=\"dropdown-menu mega-dropdown-menu w3ls_vegetables_menu\">\r\n"
                                + "								<div class=\"w3ls_vegetables\">");
                        ShowCategoryPublic(listcat, item.getCid(), response, request, out);
                        out.println("</div> </div></li>");
                    } else {
                        out.println("<li><a href='" + request.getContextPath() + "/cat/" + StringUtils.makeSlug(item.getCname()) + "-" + item.getCid() + "'>" + item.getCname() + "</a>");
                    }
                    out.println("</li>");
                }
                out.println("</ul>");
            }
        }
    }
}
