package com.mvc;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.db.DeptDBConnection;

public class AddressDialog extends JDialog implements ActionListener{
	//¼±¾ðÀÚ
	JButton 	jbtn_confirm 	 = new JButton("È®ÀÎ");
	JButton 	jbtn_exit 	 = new JButton("´Ý±â");
	JLabel 		jlb_name 	 = new JLabel("ÀÌ¸§");
	JTextField 	jtf_name 	 = new JTextField();
	JLabel 		jlb_homenumber 		 = new JLabel("Áý ÀüÈ­¹øÈ£");
	JTextField 	jtf_homenumber 		 = new JTextField();
	JLabel 		jlb_tel  = new JLabel("ÇÚµåÆù¹øÈ£");
	JTextField	jtf_tel  = new JTextField();
	JLabel 		jlb_birthday 	 = new JLabel("»ý³â¿ùÀÏ");
	JTextField  jtf_birthday	 = new JTextField();
	JLabel 		jlb_email  = new JLabel("ÀÌ¸ÞÀÏ");
	JTextField 	jtf_email  = new JTextField();
	JLabel		jlb_address = new JLabel("ÁÖ¼Ò");
	JTextField  jtf_address = new JTextField();
	//JScrollPane jsp_address  = new JScrollPane(jtf_email);
	JLabel 		jlb_hint  = new JLabel("ºñ°í");
	JTextArea 	jtf_hint  = new JTextArea(4,20);
	JScrollPane jsp_hint  = new JScrollPane(jtf_hint);
	Font font = new Font("¸¼Àº°íµñ",17,17);

	//»ý¼ºÀÚ
	public AddressDialog(){
		initDisplay();
	}
	
	public void AddressVO(AddressVO avo){
		jlb_name.setForeground(avo.getColor());
		jlb_tel.setForeground(avo.getColor());
		jlb_homenumber.setForeground(avo.getColor());
		jlb_hint.setForeground(avo.getColor());
		jlb_address.setForeground(avo.getColor());
		jlb_birthday.setForeground(avo.getColor());
		jlb_email.setForeground(avo.getColor());
		
		
		jbtn_confirm.setForeground(avo.getColor());
		jbtn_confirm.setBackground(Color.black);
		jbtn_exit.setForeground(avo.getColor());
		jbtn_exit.setBackground(Color.black);
		jtf_name.requestFocus();
	}

	//È­¸éÀÇ Å¸ÀÌÆ²°ú È­¸é È°¼ºÈ­ ¿©ºÎ¸¦ ¼ÂÆÃÇÏ´Â  ¸Þ¼Òµå ¼±¾ð
	public void set(String title, boolean isView){
		this.setTitle(title);
		this.setVisible(isView);
	}
	//È­¸éÃ³¸®ºÎ
	public void initDisplay(){
		jtf_name.requestFocus();
		this.setLayout(null);
		this.setSize(400,480);
		this.setLocation(750,250);
		this.setVisible(false);
		jlb_name.setBounds(30,20,100,30);
		jtf_name.setBounds(130,20,200,30);
		jlb_homenumber.setBounds(30,55,100,30);
		jtf_homenumber.setBounds(130,55,200,30);
		jlb_tel.setBounds(30,90,100,30);
		jtf_tel.setBounds(130,90,200,30);
		jlb_birthday.setBounds(30,125,100,30);
		jtf_birthday.setBounds(130,125,200,30);
		jlb_email.setBounds(30,160,100,30);
		jtf_email.setBounds(130,160,200,30);
		jlb_address.setBounds(30,195,100,30);
		jtf_address.setBounds(130,195,200,30);
		jlb_hint.setBounds(30,230,100,30);
		jsp_hint.setBounds(130,230,200,80);
		
		jbtn_confirm.setBounds(100,350,70,55);
		jbtn_exit.setBounds(200,350,70,55);
		jbtn_confirm.setBackground(Color.red);
		jbtn_confirm.setForeground(Color.white);
		jbtn_exit.setBackground(Color.red);
		jbtn_exit.setForeground(Color.white);
		
		jtf_hint.setLineWrap(true);
		
		jlb_name.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_name.setFont(font);
		jlb_homenumber.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_homenumber.setFont(font);
		jlb_tel.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_tel.setFont(font);
		jlb_birthday.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_birthday.setFont(font);
		jlb_email.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_email.setFont(new Font("¸¼Àº°íµñ",15,15));
		jlb_address.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_address.setFont(new Font("¸¼Àº°íµñ",15,15));
		jlb_hint.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jtf_hint.setFont(new Font("¸¼Àº°íµñ",15,15));
		jbtn_confirm.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		jbtn_exit.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));

		this.add(jlb_name);
		this.add(jtf_name);
		this.add(jlb_homenumber);
		this.add(jtf_homenumber);
		this.add(jlb_tel);
		this.add(jtf_tel);
		this.add(jlb_birthday);
		this.add(jtf_birthday);
		this.add(jlb_email);
		this.add(jtf_email);
		this.add(jlb_address);
		this.add(jtf_address);
		this.add(jlb_hint);
		this.add(jsp_hint);
		this.add(jbtn_confirm);
		this.add(jbtn_exit);
		
		jlb_name.setForeground(Color.black);
		jlb_homenumber.setForeground(Color.black);
		jlb_tel.setForeground(Color.black);
		jlb_email.setForeground(Color.black);
		jlb_address.setForeground(Color.black);
		jlb_hint.setForeground(Color.black);
		jlb_birthday.setForeground(Color.black);
		
		jbtn_exit.addActionListener(this);
		jbtn_confirm.addActionListener(this);
		

	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		if ( obj == jbtn_exit) {
			this.setVisible(false);
			jtf_name.setText("");
			jtf_homenumber.setText("");
			jtf_tel.setText("");
			jtf_birthday.setText("");
			jtf_email.setText("");
			jtf_address.setText("");
			jtf_hint.setText("");
		}
		else if ( obj == jbtn_confirm){
			Connection con = null;
			Statement stmt = null;
			String sql = "INSERT INTO addressbook values (" + "\'" + jtf_name.getText() 		+ "\'" + "," 
															+ "\'" + jtf_homenumber.getText() 	+ "\'" + "," 
															+ "\'" + jtf_tel.getText()  		+ "\'" + "," 
															+ "\'" + jtf_birthday.getText() 	+ "\'" + "," 
															+ "\'" + jtf_email.getText() 		+ "\'" + "," 
															+ "\'" + jtf_address.getText()		+ "\'" + ","
															+ "\'" + jtf_hint.getText() 		+ "\'" + ")";
			
			/*
			 * StringBuilder sql = new StringBuilder();
			 * sql.append("INSERT INTO addressbook(name,homenumber");
			 * sql.append(", tel, birthday,address,hint ");
			 * sql.append("VALUES ( seq_address.nextval, ?");
			 * sql.append("?,?,?,?)";
			 * int result=0;
			 * try{
			 * 		Class.forname(DeptDBConnection._DRIVER);
			 * 		con.DriverManager.getConnection(DeptDBConnection._URL,
			 * 										DeptDBConnection._USER,
			 * 										DeptDBConnection._PW);
			 * pstmt = con.prepareStatement(sql.toString());
			 * pstmt.setString(1, pvo.getName());
			 * pstmt.setString(2, pvo.getAddress());
			 * pstmt.setString(3, pvo.getHp());
			 * pstmt.setString(4, pvo.getGender());
			 * pstmt.setString(5, pvo.getComments());
			 * result = pstmt.executeUpdate();
			 * } catch ( ClassNotFoundException e){
			 * 		System.out.println("µå¶óÀÌ¹ö Å¬·¡½º¸¦ ¸øÃ£¾Æ¿ä");
			 * } catch(SQLException se) { // import ½ÃÄÑÁÖ±â
			 * 		System.out.println("[[query]]"+sql.toString());
			 * } catch(Exception e){
			 * 		e.printStackTrace();
			 * }
			 */
			
			try {
				Class.forName(DeptDBConnection._DRIVER);
				con = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER, DeptDBConnection._PW);
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
			} catch (Exception e) {
				//System.out.println(e.toString());
			}
			
			//AddressBook.dtm_address.fireTableDataChanged();
			AddressBook.dtm_address.setNumRows(0);
			addressBook.select();
			
			this.setVisible(false);
			jtf_name.setText("");
			jtf_homenumber.setText("");
			jtf_tel.setText("");
			jtf_email.setText("");
			jtf_address.setText("");
			jtf_hint.setText("");
			jtf_birthday.setText("");
		}
	}
	
	AddressBook addressBook = null;
	public void papa(AddressBook addressBook ){
		this.addressBook=addressBook;
	}
}



