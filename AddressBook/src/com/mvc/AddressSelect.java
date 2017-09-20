package com.mvc;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class AddressSelect extends JDialog implements ActionListener{
	JButton 	jbtn_exit 	 	= new JButton("³ª°¡±â");
	JLabel 		jlb_name 	 	= new JLabel("ÀÌ¸§");
	JTextField 	jtf_name 	 	= new JTextField();
	JLabel 		jlb_homenumber	= new JLabel("Áý ÀüÈ­¹øÈ£");
	JTextField 	jtf_homenumber  = new JTextField();
	JLabel 		jlb_tel  		= new JLabel("ÇÚµåÆù¹øÈ£");
	JTextField	jtf_tel  		= new JTextField();
	JLabel 		jlb_birthday 	= new JLabel("»ý³â¿ùÀÏ");
	JTextField  jtf_birthday	= new JTextField();
	JLabel 		jlb_email  		= new JLabel("ÀÌ¸ÞÀÏ");
	JTextField 	jtf_email  		= new JTextField();
	JLabel		jlb_address 	= new JLabel("ÁÖ¼Ò");
	JTextField  jtf_address 	= new JTextField();
	JLabel 		jlb_hint  		= new JLabel("ºñ°í");
	JTextArea 	jtf_hint  		= new JTextArea();
	JScrollPane jsp_hint  		= new JScrollPane(jtf_hint, JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
	
	Font font = new Font("¸¼Àº°íµñ",17,17);
	
	
	
	public void set(String title, boolean isView){
		this.setTitle(title);
		this.setVisible(isView);
	}
	public void AddressVO(AddressVO avo){
		jtf_name.setText(avo.getName());
		jtf_tel.setText(avo.getTel());
		jtf_homenumber.setText(avo.getHomenumber());
		jtf_hint.setText(avo.getHint());
		jtf_address.setText(avo.getAddress());
		jtf_birthday.setText(avo.getBirthday());
		jtf_email.setText(avo.getEmail());
		
		jlb_name.setForeground(avo.getColor());
		jlb_tel.setForeground(avo.getColor());
		jlb_homenumber.setForeground(avo.getColor());
		jlb_hint.setForeground(avo.getColor());
		jlb_address.setForeground(avo.getColor());
		jlb_birthday.setForeground(avo.getColor());
		jlb_email.setForeground(avo.getColor());
		
		jtf_name.setForeground(Color.black);
		jtf_tel.setForeground(Color.black);
		jtf_homenumber.setForeground(Color.black);
		jtf_hint.setForeground(Color.black);
		jtf_birthday.setForeground(Color.black);
		jtf_email.setForeground(Color.black);
		jtf_address.setForeground(Color.black);
		
		jbtn_exit.setForeground(avo.getColor());
		jbtn_exit.setBackground(Color.black);
	}
	public AddressSelect(){
		initDisplay();
	}
	public void initDisplay(){
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
		
		jbtn_exit.setBounds(140,350,100,55);
		
		//jtf_hint.setLineWrap(true);
		
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
		jbtn_exit.setFont(new Font("¸¼Àº°íµñ",Font.BOLD,17));
		
		///////////ÀÚµ¿ ÁÙ ¸ÂÃã, Åõ¸íÈ­, º¯°æx
		jtf_hint.setLineWrap(true);
		jtf_name.setOpaque(false);
		jtf_name.setEditable(false);
		jtf_email.setOpaque(false);
		jtf_email.setEditable(false);
		jtf_address.setOpaque(false);
		jtf_address.setEditable(false);
		jtf_homenumber.setOpaque(false);
		jtf_homenumber.setEditable(false);
		jtf_tel.setOpaque(false);
		jtf_tel.setEditable(false);
		jtf_birthday.setOpaque(false);
		jtf_birthday.setEditable(false);
		
		jtf_hint.setOpaque(false);
		jtf_hint.setEditable(false);
		jtf_hint.setWrapStyleWord(false);
	    
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
		this.add(jbtn_exit);
		jsp_hint.setSize(200,80);
		
		jlb_name.setForeground(Color.black);
		jlb_homenumber.setForeground(Color.black);
		jlb_tel.setForeground(Color.black);
		jlb_email.setForeground(Color.black);
		jlb_address.setForeground(Color.black);
		jlb_hint.setForeground(Color.black);
		jlb_birthday.setForeground(Color.black);
		
		jbtn_exit.addActionListener(this);
	}
	AddressBook addressBook = null;
	public void papa(AddressBook addressBook ){
		this.addressBook=addressBook;
	}
	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		if ( obj == jbtn_exit ){
			this.setVisible(false);
		}
	}
}
