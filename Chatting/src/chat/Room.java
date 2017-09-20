package chat;

import java.util.Vector;

public class Room {
	Vector<FinalServerThread> userVC = new Vector<FinalServerThread>(); //방에 참여하는 인원들에 대한 벡터
	String title = null;	// 방 제목
	String state = null;	// 상태
	String password = null; // 비번
	int max = 0; //최대정원
	int current = 0; // 현재인원
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