package db;

import java.sql.*;
import utils.BillingAddress;
import utils.CreditCardInfo;
import utils.PhoneNumber;
import utils.UserInfo;

/**
 *
 * @author Emily
 */
public class UserInfoDB {

    public static int insertIntoUserTable(String password, String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query
                = "INSERT INTO User (email, password) "
                + "VALUES (?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int insertIntoAddressTable(BillingAddress address, String email, String name) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query
                = "INSERT INTO Address (email, name, street, city, state, zip) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(2, name);
            ps.setString(1, email);
            ps.setString(3, address.getStreet());
            ps.setString(4, address.getCity());
            ps.setString(5, address.getState());
            ps.setString(6, address.getZip());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int insertIntoCreditCardTable(CreditCardInfo card, String email, String name) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query
                = "INSERT INTO CreditCard (email, month, year, number, name) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, card.getMonth());
            ps.setString(3, card.getYear());
            ps.setString(4, card.getNumber());
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

    public static int insertIntoPhoneNumberTable(PhoneNumber phone, String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query
                = "INSERT INTO PhoneNumber (email, areaCode, middleThree, lastFour) "
                + "VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, phone.getAreaCode());
            ps.setString(3, phone.getMiddleThree());
            ps.setString(4, phone.getLastFour());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updateUserTable(String password, String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE User SET "
                + "password = ? "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updateAddressTable(BillingAddress address, String name, String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE Address SET "
                + "name = ? ,"
                + "street = ? ,"
                + "city = ? ,"
                + "state = ? ,"
                + "zip = ? "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address.getStreet());
            ps.setString(3, address.getCity());
            ps.setString(4, address.getState());
            ps.setString(5, address.getZip());
            ps.setString(6, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updateCreditCardTable(String name, String email, CreditCardInfo card) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE CreditCard SET "
                + "month = ?, "
                + "year = ?, "
                + "number = ? ,"
                + "name = ? "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, card.getMonth());
            ps.setString(2, card.getYear());
            ps.setString(3, card.getNumber());
            ps.setString(4, name);
            ps.setString(5, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int updatePhoneNumberTable(String email, PhoneNumber phone) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE PhoneNumber SET "
                + "areaCode = ?, "
                + "middleThree = ?, "
                + "lastFour = ? ,"
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, phone.getAreaCode());
            ps.setString(2, phone.getMiddleThree());
            ps.setString(3, phone.getLastFour());
            ps.setString(4, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteUser(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM User "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteAddress(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM Address "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deletePhoneNumber(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM PhoneNumber "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteCreditCard(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM CreditCard "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean emailExists(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT Email FROM User "
                + "WHERE Email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static UserInfo selectUser(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement ps2 = null;
        ResultSet rs2 = null;
        PreparedStatement ps3 = null;
        ResultSet rs3 = null;
        PreparedStatement ps4 = null;
        ResultSet rs4 = null;
        String query = "SELECT * FROM User "
                + "WHERE email = ?";
        String query2 = "SELECT * FROM Address "
                + "WHERE email = ?";
        String query3 = "SELECT * FROM CreditCard "
                + "WHERE email = ?";
        String query4 = "SELECT * FROM PhoneNumber "
                + "WHERE email = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            ps2 = connection.prepareStatement(query2);
            ps2.setString(1, email);
            rs2 = ps2.executeQuery();
            ps3 = connection.prepareStatement(query3);
            ps3.setString(1, email);
            rs3 = ps3.executeQuery();
            ps4 = connection.prepareStatement(query4);
            ps4.setString(1, email);
            rs4 = ps4.executeQuery();
            UserInfo user = new UserInfo();
            if (rs.next()) {
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
            }
            if (rs2.next()) {
                BillingAddress address = new BillingAddress();
                address.setStreet(rs2.getString("street"));
                address.setCity(rs2.getString("city"));
                address.setState(rs2.getString("state"));
                address.setZip(rs2.getString("zip"));
                user.setAddress(address);
            }
            if (rs3.next()) {
                CreditCardInfo card = new CreditCardInfo();
                card.setMonth(rs3.getString("month"));
                card.setYear(rs3.getString("year"));
                card.setNumber(rs3.getString("number"));
                user.setCard(card);
            }
            if (rs4.next()) {
                PhoneNumber phone = new PhoneNumber();
                phone.setAreaCode(rs4.getString("areaCode"));
                phone.setMiddleThree(rs4.getString("middleThree"));
                phone.setLastFour(rs4.getString("lastFour"));
                user.setPhone(phone);
            }
            return user;
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
