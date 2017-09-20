package chat;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.swing.JOptionPane;

public class FinalServerThread extends Thread {
	String title = "";
	int max = 0;
	int current = 0;
	FinalServer fs = null;
	// FinalServer에서 필요한 클래스를 멤버로 선언하기
	Socket socket = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	CreateRoom cr = null;
	StringTokenizer st = null;
	FinalClientThread fct = null;
	String id = "";
	WaitingRoom wr = null;

	// 생성자 정의
	public FinalServerThread() {

	}

	public FinalServerThread(CreateRoom cr) {
		this.cr = cr;
	}

	public FinalServerThread(FinalServer fs) {
		this.fs = fs;
		socket = fs.client;
		try {
			oos = new ObjectOutputStream(socket.getOutputStream());
			ois = new ObjectInputStream(socket.getInputStream());
			String msg = (String) ois.readObject();
			StringTokenizer st = new StringTokenizer(msg, "#");
			st.nextToken();
			id = st.nextToken();
			fs.chatList.add(this);
			fs.jta_log.append("************\t" + id + "님 입장\t" + "************\n");

			for (int i = 0; i < fs.roomvc.size(); i++) {
				this.send(Separate.WAIT_ROOM + "#" + fs.roomvc.get(i).title + "#" + fs.roomvc.get(i).current + "#"
						+ fs.roomvc.get(i).max);
			}
		} catch (Exception e) {

		}
	}

	// 전체 사람들이 접속했을때 방 목록을 보여주기 위함
	public void broadCasting(String message) {
		for (FinalServerThread fst : fs.chatList) {
			fst.send(message);
		}
	}

	public void broadCast(String message) {
		for (int i = 0; i < fs.room.userVC.size(); i++) {
			this.send(Separate.ROOM_IN2 + "#" + fs.name.elementAt(i));
		}
	}

	// 대화방에 참여한 친구들에게 실제로 말하는 코드임.
	// 귓속말과 같은 1:1대화등을 고려하여 send메소드를 분리함
	public void send(String message) {
		try {
			oos.writeObject(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// run 메소드는 EchoServerThread.start()호출했을 때
	@Override
	public synchronized void run() { // 방해받지 않을 수 있다.
		boolean isStop = false;
		try {
			run_start: while (!isStop) {
				String msg = (String) ois.readObject();
				fs.jta_log.setCaretPosition(fs.jta_log.getDocument().getLength());
				StringTokenizer st = null;
				int separate = 0;
				if (msg != null) {
					st = new StringTokenizer(msg, "#");
					separate = Integer.parseInt(st.nextToken());
				}
				switch (separate) {
				case Separate.EXIT: {
					String id = st.nextToken();
					fs.jta_log.append("************\t" + id + "님 퇴장\t" + "************\n");
					broadCasting(Separate.EXIT + "#" + id);
					fs.chatList.remove(this);
				}
					break run_start;

				case Separate.ROOM_OUT: {
					String nickName = st.nextToken();
					String title = st.nextToken();
					for (int i = 0; i < fs.roomvc.size(); i++) {
						if (title.equals(fs.room.title)) {
							fs.room.userVC.remove(this);
							fs.name.remove(nickName);
							for (int j = 0; j < fs.room.userVC.size(); j++) {
								FinalServerThread fst = fs.room.userVC.elementAt(j);
								try {
									fst.send(Separate.ROOM_OUT + "#" + nickName + "#" + title);
									fst.send(Separate.ROOM_OUT2 + "#" + nickName + "#" + title);
								} catch (Exception e) {
									fs.room.userVC.removeElement(j--);
								}
							}
						}
					}
				}
					break;
				case Separate.CURRENT_PLUS: {
					String title = st.nextToken();
					int current = Integer.parseInt(st.nextToken());
					int max = Integer.parseInt(st.nextToken());

					for (int i = 0; i < fs.roomvc.size(); i++) {
						if (title.equals(fs.room.title)) {
							fs.room.current += 1;
						}
					}
					for (int i = 0; i < fs.roomvc.size(); i++) {
						broadCasting(Separate.WAIT_ROOM + "#" + fs.roomvc.get(i).title + "#" + fs.roomvc.get(i).current
								+ "#" + fs.roomvc.get(i).max);
					}
				}
					break;
				case Separate.CURRENT_MINUS: {
					String title = st.nextToken();

					for (int i = 0; i < fs.roomvc.size(); i++) {
						if (title.equals(fs.room.title)) {
							fs.room.current -= 1;
						}
					}
					for (int i = 0; i < fs.roomvc.size(); i++) {
						broadCasting(Separate.WAIT_ROOM + "#" + fs.roomvc.get(i).title + "#" + fs.roomvc.get(i).current
								+ "#" + fs.roomvc.get(i).max);
					}
				}
					break;
				case Separate.CREATE_ROOM: {
					title = st.nextToken();
					max = Integer.parseInt(st.nextToken());
					broadCasting(Separate.CREATE_ROOM + "#" + title + "#" + max);
					fs.room = new Room(title, max);
					fs.roomvc.add(fs.room);
				}
					break;

				///////////////////////////////////////////////// 방 만들고 입장
				case Separate.ROOM_IN: {
					String nickName = st.nextToken();
					String title = st.nextToken();
					for (int i = 0; i < fs.roomvc.size(); i++) {
						Room room = fs.roomvc.elementAt(i);
						if (title.equals(room.title)) {
							for (int j = 0; j < fs.room.userVC.size(); j++) {
								FinalServerThread fst = room.userVC.elementAt(j);
								try {
									// 이미 접속해있는 사람들에게 새로운 사용자의 접속을 알림
									fst.send(msg); // msg==eparate.ROOM_IN + "#"
													// + nickName + "#" + title;
								} catch (Exception e) {
									fs.room.userVC.removeElement(j--);
								}
							}
							fs.room.userVC.add(this);
							fs.name.add(nickName);
							// 새로 접속한 사람
							this.send(Separate.ROOM_IN + "#" + nickName);
							this.broadCast(Separate.ROOM_IN2 + "#" + nickName);
							// this.send(Separate.ROOM_IN2 + "#" + nickName);
						}
					}
				}
					break;
				case Separate.TALK: {
					String nickName = st.nextToken();
					String message = st.nextToken();
					String title = st.nextToken();
					String fontColor = st.nextToken();
					for (int i = 0; i < fs.roomvc.size(); i++) {
						Room room = fs.roomvc.elementAt(i);
						if (title.equals(room.title)) {
							for (int j = 0; j < fs.room.userVC.size(); j++) {
								FinalServerThread fst = room.userVC.elementAt(j);
								try {
									// 방에있는 전체 사람한테 보내기
									fst.send(Separate.TALK2 + "#" + nickName + "#" + message + "#" + fontColor);
									fst.send(Separate.TALK + "#" + nickName + "#" + message + "#" + fontColor);
								} catch (Exception e) {
									fs.room.userVC.removeElement(j--);
								}
							}
						}
					}
				}
					break;
				case Separate.CHANGE: {
					String nickName = st.nextToken();
					String afterName = st.nextToken();
					String title = st.nextToken();
					this.id = afterName;
					for (int i = 0; i < fs.roomvc.size(); i++) {
						Room room = fs.roomvc.elementAt(i);
						if (title.equals(room.title)) {
							for (int j = 0; j < fs.room.userVC.size(); j++) {
								FinalServerThread fst = room.userVC.elementAt(j);
								try {
									// 접속한 사람한테 보내기
									fst.send(Separate.CHANGE2 + "#" + nickName + "#" + afterName);
									// 방장한테 보내기 에있는 전체 사람한테 보내기
									fst.send(Separate.CHANGE + "#" + nickName + "#" + afterName);
								} catch (Exception e) {
									fs.room.userVC.removeElement(j--);
								}
							}
						}
					}
				}
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}