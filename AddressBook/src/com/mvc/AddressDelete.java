package com.mvc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.swing.JOptionPane;

import com.db.DeptDBConnection;

public class AddressDelete {

	public AddressVO deleteAddress(AddressVO pvo) {
		return null;
	}
	
	public void Delete(){
		int row = AddressBook.jt_address.getSelectedRow();
		if ( row== -1 ){
			JOptionPane.showMessageDialog(addressBook, "선택된 행이 없습니다.");
			return;
		}
		String value = AddressBook.jt_address.getValueAt(row, 1).toString();
		String sql2 = "DELETE FROM addressbook WHERE tel = " + "\'" + value + "\'";
		Connection con2 = null;
		Statement stmt2 = null;
		try {
			Class.forName(DeptDBConnection._DRIVER);
			con2 = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER, DeptDBConnection._PW);
			stmt2 = con2.createStatement();
			stmt2.executeUpdate(sql2);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		AddressBook.dtm_address.removeRow(row);

	}
	AddressBook addressBook = null;
	public void papa(AddressBook addressBook ){
		this.addressBook=addressBook;
	}
	AddressDelete(){		
		Delete();
	}
}
