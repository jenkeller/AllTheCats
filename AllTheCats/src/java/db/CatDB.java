package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Cat;
import utils.Cats;

/**
 *
 * @author Emily
 */
public class CatDB {

    public static int insertIntoCatTable(String name, double age, String description, boolean kitten, String imageSrc) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query
                = "INSERT INTO Cat (name, description, imageSrc, fee, age) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, imageSrc);
            if (kitten) {
                ps.setInt(4, 90);
            } else {
                ps.setInt(4, 50);
            }
            ps.setDouble(5, age);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updateCatTable(String name, double age, String description, boolean kitten, String imageSrc) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE Cat SET "
                + "description = ? ,"
                + "imageSrc = ? ,"
                + "fee = ? ,"
                + "age = ? "
                + "WHERE name = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setDouble(1, age);
            ps.setString(2, description);
            ps.setString(3, imageSrc);
            if (kitten) {
                ps.setInt(4, 90);
            } else {
                ps.setInt(4, 50);
            }
            ps.setString(5, name);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static int deleteCat(String name, String description) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM Cat "
                + "WHERE name = ?"
                + "AND description = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static Cat selectCat(String name, String description) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Cat "
                + "WHERE name = ?"
                + "AND description = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            rs = ps.executeQuery();
            Cat cat = new Cat();
            if (rs.next()) {
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                cat.setImageSrc(rs.getString("imageSrc"));
                cat.setAge(rs.getDouble("age"));
                int fee = rs.getInt("fee");
                if(fee == 90){
                    cat.setKitten(true);
                }
            }
            return cat;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static Cats selectAllCats() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM Cat";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Cats cats = new Cats();
            while (rs.next()) {
                Cat cat = new Cat();
                cat.setName(rs.getString("name"));
                cat.setDescription(rs.getString("description"));
                cat.setImageSrc(rs.getString("imageSrc"));
                cat.setAge(rs.getDouble("age"));
                int fee = rs.getInt("fee");
                if(fee == 90){
                    cat.setKitten(true);
                }
                cats.getCats().add(cat); 
            }
            return cats;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
}
