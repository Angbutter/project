package chat;

import java.awt.Font;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class FinalServer extends JFrame {
	// �����
	ServerSocket server = null;
	Socket client = null;
	Vector<FinalServerThread> chatList = null; //������ ����� ����
	FinalServerThread fsThread = null;
	Vector<String> name = new Vector<String>();
	Room room = null;
	Vector<Room> roomvc = new Vector<Room>(); // ����� ����
	boolean isStop = false;
	JTextArea jta_log = new JTextArea();
	JScrollPane jsp_log = new JScrollPane(jta_log, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

	// ������
	public FinalServer(int port) {
		chatList = new Vector<FinalServerThread>();
		initDisplay();
		try {
			server = new ServerSocket(port);
		} catch (Exception e) {
			// ���� �޸𸮿� �������� �����ڵ� �޽��� ���
			e.printStackTrace();
			// �ڹ� ����ӽŰ� ������θ� ���´�.
			System.exit(0);
		}
		while (!isStop) {
			try {
				client = server.accept();
				if (client != null) {
					fsThread = new FinalServerThread(this);
					fsThread.start();
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Exception : " + e.getMessage());
			}
		}

	}

	void initDisplay() {
		this.setTitle("FinalServer");
		jta_log.append("���� ���� ����\n");
		this.add("Center", jsp_log);
		this.setSize(500, 400);
		this.setVisible(true);
		this.setLocation(500, 400);
		jta_log.setEditable(false);
		jta_log.setFont(new Font(null, 0, 15));
	}

	// ���θ޼ҵ�
	public static void main(String[] args) {
		new FinalServer(7779);
	}
}
