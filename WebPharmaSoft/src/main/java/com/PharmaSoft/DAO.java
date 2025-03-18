package com.PharmaSoft;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class DAO 
{
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/WebPharmaSoft","root","root");
		return con;
	}

	public static int addMedicine(Medicine m) throws ClassNotFoundException, SQLException 
	{
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("insert into medicine(med_name,med_price,med_qty) values(?,?,?)");
		pst.setString(1, m.getMedName());
		pst.setInt(2, m.getMedPrice());
		pst.setInt(3, m.getMedQty());
		int status=pst.executeUpdate();
		return status;
	}
	public static int addnewUser(User u)throws ClassNotFoundException, SQLException
	{
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("insert into user(username,password) values(?,?)");
		pst.setString(1, u.getUserName());
		pst.setString(2, u.getPassword());
		int status=pst.executeUpdate();
		return status;
	}
	public static List<Medicine> getAllMedicine() throws ClassNotFoundException, SQLException
	{
		ArrayList<Medicine> list=new ArrayList<Medicine>();
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from medicine");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			Medicine m=new Medicine();
			m.setId(rs.getInt("id"));
			m.setMedName(rs.getString("med_name"));
			m.setMedPrice(rs.getInt("med_price"));
			m.setMedQty(rs.getInt("med_qty"));
			list.add(m);
		}
		return list;
	}
	public static int deleteMedicine(int id) throws ClassNotFoundException, SQLException
	{
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("delete from medicine where id=?");
		pst.setInt(1, id);
		int status=pst.executeUpdate();
		return status;
	}
	public static Medicine getMedicineById(int id) throws ClassNotFoundException, SQLException
	{
		Medicine e=null;
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from medicine where id=?");
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			e=new Medicine();
			e.setId(rs.getInt("id"));
			e.setMedName(rs.getString("med_name"));
			e.setMedPrice(rs.getInt("med_price"));
			e.setMedQty(rs.getInt("med_qty"));
		}
		return e;
	}
	public static int UpdateMed(Medicine m) throws ClassNotFoundException, SQLException
	{
		int status=0;
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("Update medicine set med_name=?,med_price=?,med_qty=? where id=?");
		pst.setString(1, m.getMedName());
		pst.setInt(2, m.getMedPrice());
		pst.setInt(3, m.getMedQty());
		pst.setInt(4, m.getId());
		status=pst.executeUpdate();
		return status;
	}
	public static List<Medicine>searchMedicine(String med_name) throws ClassNotFoundException, SQLException
	{
		Medicine m=null;
		ArrayList<Medicine> list=new ArrayList<>();
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from medicine where med_name LIKE ?");
		pst.setString(1, "%"+med_name+"%");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			m=new Medicine();
			m.setId(rs.getInt("id"));
			m.setMedName(rs.getString("med_name"));
			m.setMedPrice(rs.getInt("med_price"));
			m.setMedQty(rs.getInt("med_qty"));
			list.add(m);
		}
		return list;
	}
	public static Medicine getData(int id) throws ClassNotFoundException, SQLException
	{
		Connection con=DAO.getConnection();
		Medicine m1=null;
		PreparedStatement pst=con.prepareStatement("select * from medicine where id=?");
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			m1=new Medicine();
			m1.setId(rs.getInt("id"));
			m1.setMedName(rs.getString("med_name"));
			m1.setMedPrice(rs.getInt("med_price"));
			m1.setMedQty(rs.getInt("med_qty"));
		}
		return m1;
	}
	public static int checkOut(Medicine m) throws ClassNotFoundException, SQLException {
	    int status = 0;
	    Connection con = null;
	    PreparedStatement pst = null;
	    try {
	        con = DAO.getConnection();
	        pst = con.prepareStatement("UPDATE medicine SET med_qty = med_qty - ? WHERE id = ? AND med_qty >= ?");
	        pst.setInt(1, m.getSellQty());
	        pst.setInt(2, m.getId());
	        pst.setInt(3, m.getSellQty());
	        status = pst.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	public static int addSellMedOrder(Medicine m) throws ClassNotFoundException, SQLException
	{
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("insert into soldMed(med_name,med_price,med_qty,med_id,customer_name) values(?,?,?,?,?)");
		pst.setString(1, m.getMedName());
		pst.setInt(2, m.getMedPrice());
		pst.setInt(3, m.getSellQty());
		pst.setInt(4, m.getId());
		pst.setString(5, m.getCust_name());
		int status=pst.executeUpdate();
		return status;
	}
	public static List<Medicine> getSellMedOrder() throws ClassNotFoundException, SQLException
	{	
		ArrayList<Medicine> list=new ArrayList<Medicine>();
		Connection con=DAO.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from soldMed");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			Medicine m=new Medicine();
			m.setId(rs.getInt("id"));
			m.setMedName(rs.getString("med_name"));
			m.setCust_name(rs.getString("customer_name"));
			m.setMedPrice(rs.getInt("med_price"));
			m.setMedQty(rs.getInt("med_qty"));
			m.setSoldDate(rs.getDate("sold_date"));
			list.add(m);
		}
		return list;
	}
}
