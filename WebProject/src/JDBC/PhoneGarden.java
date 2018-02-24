package JDBC;

import java.sql.*;


public class PhoneGarden {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/PhoneGarden";
	// Database credentials
	static final String USER = "root";
	static final String PASS = "password";

	

	public Phone phone(String phoneName) {
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Phone " + "WHERE " + "PhoneName = '" + phoneName + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) { 	
				String brand = rs.getString("PhoneBrand");
				String picture = rs.getString("picture");
				String description = rs.getString("PhoneBrand");
				int quantity = rs.getInt("quantity");
				int price = rs.getInt("price");
				return new Phone(phoneName, brand, picture, description, price, quantity);
				
			} 
				

		} catch (Exception e) {
		} finally {
		}
		return null;
		
		
	}

	// INSERT NEW RECORD
	public void insertUser(String username, String password, String email, String name, String DOB,
			String hashedUsername) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "INSERT INTO Account " + "VALUES ( '" + username + "', '" + password + "', '" + email + "', '"
					+ name + "', '" + DOB + "', " + false + " , '" + hashedUsername + "')";
			stmt.executeUpdate(sql);
		} catch (Exception e) {
		} finally {
		}
	}

	// INSERT NEW RECORD
	public void insertPhone(String phoneName, String brandName, String picture, String description, int price,
			int quantity) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "INSERT INTO Phone " + "VALUES ( '" + phoneName + "', '" + brandName + "', '" + picture
					+ "', '" + description + "'," + price + ", " + quantity + ")";
			stmt.executeUpdate(sql);
		} catch (Exception e) {
		} finally {
		}
	}

	// User Exist
	public boolean existUser(String username) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account " + "WHERE " + "Username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	public boolean existPhone(String phoneName) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Phone " + "WHERE " + "PhoneName = '" + phoneName + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	public boolean existEmail(String email) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;

			sql = "SELECT * FROM Account " + "WHERE " + "Email = '" + email + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	public boolean existHash(String username) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account " + "WHERE " + "HashedUsername = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	// Login
	public boolean login(String username, String password, String table) {
		Connection conn = null;
		Statement stmt = null;
		boolean exist = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM " + table + " WHERE " + "Username = '" + username + "' AND Pass = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.absolute(1)) {
				exist = true;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
		return exist;
	}

	public String getEmail(String username) {
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account" + " WHERE " + "Username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			return rs.getString("Email");
		} catch (Exception e) {
		} finally {
		}
		return null;
	}

	public ResultSet get(String username) {
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Account " + "WHERE " + "Username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);
			return rs;

		} catch (Exception e) {
		} finally {
		}
		return null;
	}

	public ResultSet getPhone(String phoneName) {
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Phone " + "WHERE " + "PhoneName = '" + phoneName + "'";
			ResultSet rs = stmt.executeQuery(sql);
			return rs;

		} catch (Exception e) {
		} finally {
		}
		return null;
	}

	public ResultSet getAllPhone() {
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM Phone ";
			ResultSet rs = stmt.executeQuery(sql);
			return rs;

		} catch (Exception e) {
		} finally {
		}
		return null;
	}

	public void edit(String username, String name, String email, String DOB) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "UPDATE Account " + "SET " + "RealName = '" + name + "', DOB = '" + DOB + "', Email = '" + email
					+ "' " + " WHERE Username = '" + username + "';";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
	}

	public void activate(String HashedUsername) {
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "UPDATE Account " + "SET " + "Activated = " + true + " WHERE HashedUsername = '" + HashedUsername
					+ "';";
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (Exception e) {
		} finally {
		}
	}

	public byte checkActivate(String username) {
		Connection conn = null;
		Statement stmt = null;
		System.out.println("OK");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql;
			sql = "SELECT Activated FROM Account " + "WHERE " + "Username = '" + username + "'";

			ResultSet rs = stmt.executeQuery(sql);
			rs.next();

			return rs.getByte("Activated");
		} catch (Exception e) {
		} finally {
		}
		return 0;
	}

	public static byte[] encrypt(String x) throws Exception {
		java.security.MessageDigest d = null;
		d = java.security.MessageDigest.getInstance("SHA-1");
		d.reset();
		d.update(x.getBytes());
		return d.digest();
	}

	public static String byteArrayToHexString(byte[] b) {
		String result = "";
		for (int i = 0; i < b.length; i++) {
			result += Integer.toString((b[i] & 0xff) + 0x100, 16).substring(1);
		}
		return result;
	}
}
