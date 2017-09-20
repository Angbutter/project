package chat;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumnModel;

import chat.ChattingRoom;

public class WaitingRoom extends JFrame implements ActionListener {

	/////////////////////////////////////////////////////
	/* ����� */
	/////////////////////////////////////////////////////
	JLabel jl_create = new JLabel(
			new ImageIcon("ready_create.png"));
	JLabel jl_search = new JLabel(
			new ImageIcon("ready_create.png"));
	JLabel jl_join = new JLabel(
			new ImageIcon("ready_create.png"));
	loginForm loginform = null;
	Socket mySocket = null;
	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;
	JLabel jlb_nickName = new JLabel("");
	String id = null;
	CreateRoom cr = null;
	String title = "";
	String current = "";
	String max = "";
	/* ����� ���̺� */
	static String header[] = { "��ȭ����", "�ο�", "�ѿ�" };
	static String room[][] = new String[0][3];
	static DefaultTableModel dtm_menu = new DefaultTableModel(room, header);
	JTable jt_menu = new JTable(dtm_menu);
	JScrollPane jsp_menu = new JScrollPane(jt_menu, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	JTableHeader header_ = jt_menu.getTableHeader();
	memberVO mvo = null;
	/* ��ư */
	JButton jbtn_create = new JButton("�游���");
	JButton jbtn_search = new JButton("ģ��ã��");
	JButton jbtn_join = new JButton("����");
	JButton jbtn_exit = new JButton("������");

	/* ��Ʈ�� �÷� */
	Font font = new Font("�޸ո���ü", Font.BOLD, 35);
	Font font2 = new Font("�޸ո���ü", 30, 25);
	Font font3 = new Font("�޸ո���ü", 30, 20);
	Color color = new Color(255, 255, 255);

	/* ����̹��� */
	ImageIcon ig = new ImageIcon("Chattingready.png");
	ImageIcon gif = new ImageIcon("welcom.gif");

	ChattingRoom chattingroom = null;
	// loginForm lfname = null;
	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////

	/*
	 * public WaitingRoom(String ip, int port) throws Exception { display();
	 * setContentPane(new Readypanal()); this.ip=ip; this.port = port; mySocket
	 * = new Socket(ip, port); oos = new
	 * ObjectOutputStream(mySocket.getOutputStream()); ois = new
	 * ObjectInputStream(mySocket.getInputStream());
	 * 
	 * oos.writeObject(Separate.LOGIN+"#"+nickName); FinalClientThread fct = new
	 * FinalClientThread(this); fct.start(); }
	 */
	/////////////////////////////////////////////////////
	/* jpanal �������̵� */
	/////////////////////////////////////////////////////

	// ������ ��ư ȣ��� ( â �ݱ� ����, â �ݱ� ��ư�� Ŭ�� )
	public void exitChat() {
		try {
			oos.writeObject(Separate.EXIT + "#" + id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public WaitingRoom(loginForm loginform) throws Exception {
		this.loginform = loginform;
		id = loginform.id;
		display();
		setContentPane(new Readypanal());
		mySocket = new Socket("192.168.0.111", 7779);
		oos = new ObjectOutputStream(mySocket.getOutputStream());
		ois = new ObjectInputStream(mySocket.getInputStream());

		jbtn_exit.addActionListener(this);
		jbtn_create.addActionListener(this);
		jbtn_search.addActionListener(this);
		jbtn_join.addActionListener(this);
		this.setLayout(null);
		this.setTitle(id + "�� �ڹ���");
		this.setSize(1200, 800);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setLocation(300, 150);

		/* ��ư�� �ؽ�Ʈ�ʵ� ���� */
		// �г���
		jlb_nickName.setBounds(210, 100, 450, 50);
		jlb_nickName.setFont(font2);
		jlb_nickName.setText("'" + id + "' �� ȯ���մϴ�.");
		this.add(jlb_nickName);

		// ��ư
		/* �游��� */
		jl_create.setBounds(50, 615, 200, 120);
		jbtn_create.setBounds(85, 620, 130, 100);
		jbtn_create.setFont(font2);
		jbtn_create.setForeground(color);
		jbtn_create.setBorderPainted(false);
		jbtn_create.setFocusPainted(false);
		jbtn_create.setContentAreaFilled(false);
		this.add(jbtn_create);
		this.add(jl_create);

		/* ģ��ã�� */
		jl_search.setBounds(270, 615, 200, 120);
		jbtn_search.setBounds(305, 620, 130, 100);
		jbtn_search.setFont(font2);
		jbtn_search.setForeground(color);
		jbtn_search.setBorderPainted(false);
		jbtn_search.setFocusPainted(false);
		jbtn_search.setContentAreaFilled(false);
		this.add(jbtn_search);
		this.add(jl_search);

		/* ������ */
		jl_join.setBounds(490, 615, 200, 120);
		jbtn_join.setBounds(525, 620, 130, 100);
		jbtn_join.setFont(font2);
		jbtn_join.setForeground(color);
		jbtn_join.setBorderPainted(false);
		jbtn_join.setFocusPainted(false);
		jbtn_join.setContentAreaFilled(false);
		this.add(jbtn_join);
		this.add(jl_join);

		/* ������ */
		jbtn_exit.setBounds(900, 365, 135, 75);
		jbtn_exit.setFont(font);
		jbtn_exit.setForeground(color);
		jbtn_exit.setBorderPainted(false);
		jbtn_exit.setFocusPainted(false);
		jbtn_exit.setContentAreaFilled(false);
		this.add(jbtn_exit);

		jt_menu.getColumnModel().getColumn(0).setPreferredWidth(500);
		jt_menu.getColumnModel().getColumn(1).setPreferredWidth(30);
		jt_menu.getColumnModel().getColumn(2).setPreferredWidth(30);
		jt_menu.repaint();

		// ������
		jsp_menu.setBounds(50, 150, 800, 450);
		header_.setBackground(Color.white);
		jsp_menu.getViewport().setBackground(Color.white);
		this.add(jsp_menu);
		header_.setReorderingAllowed(false);
		header_.setResizingAllowed(false);
		jt_menu.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		jt_menu.setSelectionBackground(Color.black);
		jt_menu.setSelectionForeground(Color.white);
		jt_menu.setFont(new Font(null, 0, 14));
		DefaultTableCellRenderer tScheduleCellRenderer = new DefaultTableCellRenderer();
		tScheduleCellRenderer.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcmSchedule = jt_menu.getColumnModel();

		for (int i = 0; i < tcmSchedule.getColumnCount(); i++) {

			tcmSchedule.getColumn(i).setCellRenderer(tScheduleCellRenderer);
		}
		oos.writeObject(Separate.LOGIN + "#" + loginform.id);
		FinalClientThread fct = new FinalClientThread(this);
		fct.start();
	}

	public void memberVO(memberVO mvo) {
		this.mvo = mvo;
	}

	/* ����̹��� */
	class Readypanal extends JPanel {
		public Readypanal() {
		}

		public void paintComponent(Graphics g) {
			g.drawImage(ig.getImage(), 0, 0, null);
			g.drawImage(gif.getImage(), -50, -70, 800, 300, this);
			setOpaque(false);
			super.paintComponents(g);

		}
	}

	/////////////////////////////////////////////////////
	/* ȭ��ó�� */
	/////////////////////////////////////////////////////
	public void display() {
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent we) {
				exitChat();
				System.exit(0);
			}
		});

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		////////////////////////////////////////////////////// ����
		if (obj == jbtn_exit) {
			try {
				oos.writeObject(Separate.EXIT + "#" + loginform.id);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			System.exit(0);
		}
		////////////////////////////////////////////////////// �游���
		else if (obj == jbtn_create) {
			cr = new CreateRoom(this);
		}

		////////////////////////////////////////////////////// ģ��ã��
		else if (obj == jbtn_search) {
			new Search();
		}

		////////////////////////////////////////////////////// �����ϱ�
		else if (obj == jbtn_join) {
			int row = jt_menu.getSelectedRow();
			if (row == -1) {
				JOptionPane.showMessageDialog(this, "������ ���� �������ּ���.", "���", 2);
				return;
			} else if ((jt_menu.getValueAt(row, 1)).equals(jt_menu.getValueAt(row, 2))) {
				JOptionPane.showMessageDialog(this, "�����ʰ� �Դϴ�.", "���", 2);
				return;
			} else {
				try {
					title = jt_menu.getValueAt(row, 0).toString();
					current = jt_menu.getValueAt(row, 1).toString();
					max = jt_menu.getValueAt(row,2).toString();
					chattingroom = new ChattingRoom(this);
					oos.writeObject(Separate.CURRENT_PLUS+"#"+title+"#"+current+"#"+max);
				} catch (Exception e2) {
				}
			}
		}
	}
}