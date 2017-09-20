package com.mvc;

import java.awt.Color;

public class AddressVO {
	private int no = 0;
	private String name = null;
	private String homenumber = null;
	private String tel = null;
	private String email = null;
	private String birthday = null;
	private String address = null;
	private String hint = null; // 업무처리를 위해 필요한 변수를 추가
	private Color color = null;
	private String command = null; //사용자가 누른 버튼에 따라 업무를 구별

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHomenumber() {
		return homenumber;
	}

	public void setHomenumber(String homenumber) {
		this.homenumber = homenumber;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHint() {
		return hint;
	}

	public void setHint(String hint) {
		this.hint = hint;
	}

	public String getCommand() {
		return command;
	}

	public void setCommand(String command) {
		this.command = command;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setColor(Color background) {
		this.color = background;
	}
	public Color getColor() {
		return color;
	}
}
