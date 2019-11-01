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
import model.Category;
import model.Product;

@Repository
public class ProductDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Product> getItemsPagination(int offset) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,picture,detail,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid ORDER BY price DESC LIMIT ?,?";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{offset, PageDefine.PUBLIC_ROW_COUNT},
                new ResultSetExtractor<List<Product>>() {
            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public List<Product> getItemsPaginationByCat(int offset, int cid) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid WHERE category.cid=? ORDER BY id DESC LIMIT ?,?";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{cid, offset, PageDefine.PUBLIC_ROW_COUNT},
                new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public List<Product> getSortItemsPaginationByCat(int offset, int cid,String status) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid WHERE category.cid=? ORDER BY price "+status+" LIMIT ?,?";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{cid, offset, PageDefine.PUBLIC_ROW_COUNT},
                new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public int countItems() {
        String sql = "SELECT COUNT(*) FROM product";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public int countItemsByCid(int cid) {
        String sql = "SELECT COUNT(*) FROM product WHERE cid = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{cid}, Integer.class);
    }

    public int addItem(Product objPro) {
        String sql = "INSERT INTO product(view,name,cid,price,description,detail,"
                + "color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,picture) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{0, objPro.getName(), objPro.getCat().getCid(), objPro.getPrice(),
            objPro.getDescription(), objPro.getDetail(), objPro.getColor(), objPro.getLcd(), objPro.getRam(), objPro.getHdd(),
            objPro.getSsd(), objPro.getVga(), objPro.getPin(), objPro.getOs(), objPro.getCpu(), objPro.getWeight(), objPro.getOther(), objPro.getPicture2()});
    }

    public Product getItem(int id) {
        Product obj = null;
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid WHERE id=?";
        try {
            return jdbcTemplate.query(sql, new Object[]{id}, new ResultSetExtractor<Product>() {

                @Override
                public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                    Product pro = null;
                    if (rs.next()) {
                        pro = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                                rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                                rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                                rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                                rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                                rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status"));
                    }
                    return pro;
                }
            });
        } catch (Exception e) {
            return null;
        }
    }

    public int editItem(Product objPro) {
        String sql = "UPDATE product SET name=?,price=?,cid=?,description=?,detail=?,picture=?,status=?,"
                + "color=?,lcd=?,ram=?,hdd=?,ssd=?,vga=?,pin=?,os=?,cpu=?,weight=?,other=? WHERE id=?";
        return jdbcTemplate.update(sql, new Object[]{objPro.getName(), objPro.getPrice(), objPro.getCat().getCid(),
            objPro.getDescription(), objPro.getDetail(), objPro.getPicture2(), objPro.getStatus(),
            objPro.getColor(), objPro.getLcd(), objPro.getRam(), objPro.getHdd(), objPro.getSsd(),
            objPro.getVga(), objPro.getPin(), objPro.getOs(), objPro.getCpu(), objPro.getWeight(), objPro.getOther(), objPro.getId()});
    }

    public int delItem(int id) {
        String sql = "DELETE FROM product WHERE id = ?";
        return jdbcTemplate.update(sql, new Object[]{id});
    }

    public int countResultItems(String data) {
        String sql = "SELECT COUNT(*) AS totalRow  "
                + "FROM category AS c INNER JOIN product AS p ON c.cid = p.cid WHERE name LIKE ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{'%' + data + '%'}, Integer.class);
    }

    public int countResultItemsCat(int data) {
        String sql = "SELECT COUNT(*) AS totalRow  "
                + "FROM product WHERE cid LIKE ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{'%' + data + '%'}, Integer.class);
    }

    public List<Product> getResultItemsPagination(int offset, String data) {
        List<Product> listPro = new ArrayList<Product>();
        String sql = "SELECT id, name, c.cid, description,detail, picture, price,color,lcd,"
                + "ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "date, picture,view, c.cid , cname,parrent_id,status "
                + " FROM category AS c INNER JOIN product AS p ON c.cid = p.cid WHERE name LIKE ? ORDER BY id DESC LIMIT ?,?";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{'%' + data + '%', offset, PageDefine.ADMIN_ROW_COUNT},
                new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public int getNumberOfItem() {
        String sql = "SELECT COUNT(*) FROM product";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<Product> getListPopular() {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid ORDER BY view DESC LIMIT 8";
        return (List<Product>) jdbcTemplate.query(sql, new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public List<Product> getListRelated(int cid, int id) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid WHERE category.cid=? AND id!= ? ORDER BY view DESC LIMIT 4";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{cid, id}, new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public List<Product> getListOther(int cid) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,detail,picture,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid WHERE category.cid!=?  ORDER BY view DESC LIMIT 8";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{cid}, new ResultSetExtractor<List<Product>>() {

            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }

    public String getFistPicture(Product product) {
        String[] picture = product.getPicture();
        return picture[0];
    }

    public void IncView(int id) {
        String sql = "UPDATE product SET view =(view+1) WHERE id = ?";
        jdbcTemplate.update(sql, new Object[]{id});
    }

    public List<Product> getListSortProduct(int offset, String Status) {
        List<Product> listPro = new ArrayList<>();
        String sql = "SELECT id,name,price,color,lcd,ram,hdd,ssd,vga,pin,os,cpu,weight,other,"
                + "product.cid,description,picture,detail,view,date,status,category.cname,parrent_id FROM product"
                + " INNER JOIN category ON category.cid = product.cid ORDER BY price " + Status + " LIMIT ?,?";
        return (List<Product>) jdbcTemplate.query(sql, new Object[]{offset, PageDefine.PUBLIC_ROW_COUNT},
                new ResultSetExtractor<List<Product>>() {
            @Override
            public List<Product> extractData(ResultSet rs) throws SQLException, DataAccessException {
                while (rs.next()) {
                    listPro.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("description"),
                            rs.getString("detail"), rs.getString("picture"), rs.getString("color"), rs.getString("lcd"),
                            rs.getString("ram"), rs.getString("hdd"), rs.getString("ssd"),
                            rs.getString("vga"), rs.getString("pin"), rs.getString("os"), rs.getString("cpu"),
                            rs.getString("weight"), rs.getString("other"), rs.getInt("view"), rs.getTimestamp("date"), new Category(rs.getInt("cid"),
                            rs.getString("cname"), rs.getInt("parrent_id")), rs.getInt("status")));
                }
                return listPro;
            }
        });
    }
}
