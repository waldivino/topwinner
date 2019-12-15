package topwinner.model.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {
	Connection con;
	PreparedStatement stmt;
	ResultSet rs;

	
	private final String URL = "jdbc:mysql://localhost:3306/topwi_prod";
	private final String USER = "topwi_prod";
	private final String PASS = "lanita10@";
	
//	private final String URL = "jdbc:mysql://localhost:3306/winner";
//	private final String USER = "root";
//	private final String PASS = "informal";
	
//	 private final String URL = "jdbc:mysql://localhost:3306/winner";
//	 private final String USER = "root";
//	 private final String PASS = "100988";

	public Connection openRelatorio() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASS);
		return con;
	}
	
	protected void open() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASS);
	}

	protected void close() throws Exception {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	
	
	public Connection abrirRelatorio() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(URL, USER, PASS);
		return con;
	}
	
	public void fecharRealatorio() throws Exception {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	}
	
}
