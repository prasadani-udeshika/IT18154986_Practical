package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class register {
	
	private Connection connect()
	 {
	 Connection con = null;
	 try
	 {
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");
	 }
	 catch (Exception e)
	 {
	 e.printStackTrace();
	 }
	 return con;
	 }
	public String readRe()
	 {
	 String output = "";
	 try
	 {
	 Connection con = connect();
	 if (con == null)
	 {
	 return "Error while connecting to the database for reading Patient Data ";
	 }
	 // Prepare the html table to be displayed
	 output = "<table border='2'><tr><th>  User Name  </th> "
	 		+ "<th>User NIC</th><th>User Phone Number  </th>"
			 +"<th> user Email </th> <th> Password </th><th> Confirm password</th>"
	 				+ "<th>Update</th><th>Remove</th></tr>"; 
	 String query = "select * from regist";
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(query);
			 // iterate through the rows in the result set
			 while (rs.next())
			 {
			 String UCode = Integer.toString(rs.getInt("UCode"));
			 String UName = rs.getString("UName");
			 String NIC = rs.getString("NIC");
			 String userPhon = rs.getString("userPhon");
			  String email = rs.getString("email");
			 String passw = rs.getString("passw");
			 String cpass = rs.getString("cpass");
			 // Add into the html table
			 output += "<tr><td><input id='hidItemIDUpdate'"
			 		+ "name='hidItemIDUpdate'"
			 		+ "type='hidden' value='" + UCode
			 + "'>" + UName + "</td>";
			 output += "<td>" + NIC + "</td>";
			 output += "<td>" + userPhon + "</td>";
			 output += "<td>" + email + "</td>";
			 output += "<td>" + passw + "</td>";
			 output += "<td>" + cpass + "</td>";
			 // buttons
			output += "<td><input name='btnUpdate' "
					+ "type='button' value='Update'"
					+ "class='btnUpdate btn btn-secondary'></td>"
			 + "<td><input name='btnRemove'"
			 + "type='button' value='Remove' "
			 + "class='btnRemove btn btn-danger' "
			 + "data-itemid='" 
			 + UCode + "'>" + "</td></tr>";
			 }
			 con.close();
			 // Complete the html table
			 output += "</table>";
			 }
			 catch (Exception e)
			 {
			 output = "Error while reading the items.";
			 System.err.println(e.getMessage());
			 }
			 return output;
			 } 
	// Insert method start =========
	
	public String insertItem(String name, String nic, String phone, String email,String pa, String cp)
			 {
			 String output = "";
			 try
			 {
			 Connection con = connect();
			 if (con == null)
			 {
			 return "Error while connecting to the database for inserting.";
			 }
			 // create a prepared statement
			 String query = " insert into regist(`UCode`,`UName`,`NIC`,`userPhon`,`email`,`passw`,`cpass`)"
			 + " values (?, ?, ?, ?, ?,?,?)";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 preparedStmt.setInt(1, 0);
			 preparedStmt.setString(2, name);
			 preparedStmt.setString(3, nic);
			 preparedStmt.setString(4, phone);
			 preparedStmt.setString(5, email);
			 preparedStmt.setString(6, pa);
			 preparedStmt.setString(7, cp);
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newItems = readRe();
			 output = "{\"status\":\"success\", \"data\": \"" +
			 newItems + "\"}";
			 }
			 catch (Exception e)
			 {
			 output = "{\"status\":\"error\", \"data\":\"Error while inserting the details.\"}";
			 System.err.println(e.getMessage());
			 }
			 return output;
			 } 
	// Update method  start =================
	public String updateItem(String ucode, String name, String nic, String phone, String email ,String pa, String cp)
			 {
			 String output = "";
			 try
			 {
			 Connection con = connect();
			 if (con == null)
			 {
			 return "Error while connecting to the database for updating.";
			 }
			 // create a prepared statement
			 String query = "UPDATE regist SET UName=?,NIC=?,userphon=?,email=?,passw=?,cpass=? WHERE UCode=?";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 preparedStmt.setString(1, name);
			 preparedStmt.setString(2, nic);
			 preparedStmt.setString(3, phone);
			 preparedStmt.setString(4, email);
			 preparedStmt.setString(5, pa);
			 preparedStmt.setString(6, cp);
			 
			 preparedStmt.setInt(7, Integer.parseInt(ucode));
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newItems = readRe();
			 output = "{\"status\":\"success\", \"data\": \"" +
			 newItems + "\"}";
			 }
			 catch (Exception e)
			 {
			 output = "{\"status\":\"error\", \"data\": \"Error while updating the details.\"}";
			 System.err.println(e.getMessage());
			 }
			 return output;
			 }
	// Update method End======================================== 
	// Delete Method Start ========================================
	
			public String deleteItem(String UCode)
			 {
			 String output = "";
			 try
			 {
			 Connection con = connect();
			 if (con == null)
			 {
			 return "Error while connecting to the database for deleting.";
			 } 
			// create a prepared statement
			 String query = "delete from regist where UCode=?";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 preparedStmt.setInt(1, Integer.parseInt(UCode));
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newItems = readRe();
			 output = "{\"status\":\"success\", \"data\": \"" +newItems + "\"}";
			 }
			 //   output = "{\"status\":\"success\", \"data\": \"" + newRegister + "\"}";   
			 catch (Exception e)
			 {
			 output = "{\"status\":\"error\", \"data\"\"Error while deleting the details.\"}";
			 System.err.println(e.getMessage());
			 }
			 return output;
			 }
// Delete Method End ================================
	
	
}
