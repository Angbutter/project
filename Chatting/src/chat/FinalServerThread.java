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
	// FinalServer���� �ʿ��� Ŭ������ ����� �����ϱ�
	Socket socket = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	CreateRoom cr = null;
	StringTokenizer st = null;
	FinalClientThread fct = null;
	String id = "";
	WaitingRoom wr = null;

	// ������ ����
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
			fs.jta_log.append("************\t" + id + "�� ����\t" + "************\n");

			for (int i = 0; i < fs.roomvc.size(); i++) {
				this.send(Separate.WAIT_ROOM + "#" + fs.roomvc.get(i).title + "#" + fs.roomvc.get(i).current + "#"
						+ fs.roomvc.get(i).max);
			}
		} catch (Exception e) {

		}
	}

	// ��ü ������� ���������� �� ����� �����ֱ� ����
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

	// ��ȭ�濡 ������ ģ���鿡�� ������ ���ϴ� �ڵ���.
	// �ӼӸ��� ���� 1:1��ȭ���� ����Ͽ� send�޼ҵ带 �и���
	public void send(String message) {
		try {
			oos.writeObject(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// run �޼ҵ�� EchoServerThread.start()ȣ������ ��
	@Override
	public synchronized void run() { // ���ع��� ���� �� �ִ�.
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
					fs.jta_log.append("************\t" + id + "�� ����\t" + "************\n");
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

				///////////////////////////////////////////////// �� ����� ����
				case Separate.ROOM_IN: {
					String nickName = st.nextToken();
					String title = st.nextToken();
					for (int i = 0; i < fs.roomvc.size(); i++) {
						Room room = fs.roomvc.elementAt(i);
						if (title.equals(room.title)) {
							for (int j = 0; j < fs.room.userVC.size(); j++) {
								FinalServerThread fst = room.userVC.elementAt(j);
								try {
									// �̹� �������ִ� ����鿡�� ���ο� ������� ������ �˸�
									fst.send(msg); // msg==eparate.ROOM_IN + "#"
													// + nickName + "#" + title;
								} catch (Exception e) {
									fs.room.userVC.removeElement(j--);
								}
							}
							fs.room.userVC.add(this);
							fs.name.add(nickName);
							// ���� ������ ���
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
									// �濡�ִ� ��ü ������� ������
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
									// ������ ������� ������
									fst.send(Separate.CHANGE2 + "#" + nickName + "#" + afterName);
									// �������� ������ ���ִ� ��ü ������� ������
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