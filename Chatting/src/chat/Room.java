package chat;

import java.util.Vector;

public class Room {
	Vector<FinalServerThread> userVC = new Vector<FinalServerThread>(); //�濡 �����ϴ� �ο��鿡 ���� ����
	String title = null;	// �� ����
	String state = null;	// ����
	String password = null; // ���
	int max = 0; //�ִ�����
	int current = 0; // �����ο�
	public Room(){}
	public Room(String title, int max){
		this.title = title;
		//this.state = state;
		//this.password = password;
		this.max = max;
		current = 1;
	}
	public Vector<FinalServerThread> getUserVC() {
		return userVC;
	}
	public void setUserVC(Vector<FinalServerThread> userVC) {
		this.userVC = userVC;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
}