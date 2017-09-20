package chat;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import chatDB.DeptDBConnection;

public class loginForm extends JFrame implements ActionListener {
	/////////////////////////////////////////////////////
	/* ����� */
	/////////////////////////////////////////////////////
	String id="";
	memberVO mvo = null;
	JLabel jlb_id = new JLabel("���̵�");
	JLabel jlb_pw = new JLabel("�н�����");

	Font jl_font = new Font("�޸ո���ü", Font.BOLD, 17);
	JTextField jtf_id = new JTextField();
	JPasswordField jpf_pw = new JPasswordField();

	JButton jbtn_login = new JButton(
			new ImageIcon("login.png"));
			//new ImageIcon("C:\\Users\\minkh\\Desktop\\practice\\dev_java\\src\\com\\Final\\image\\login.png"));
	JButton jbtn_join = new JButton(
			new ImageIcon("confirm.png"));
			//new ImageIcon("C:\\Users\\minkh\\Desktop\\practice\\dev_java\\src\\com\\Final\\image\\co   nfirm.png"));

	// JPanel�� ���� �̹���������
	//ImageIcon ig = new ImageIcon("C:\\Users\\minkh\\Desktop\\practice\\dev_java\\src\\com\\Final\\image\\main.png");
	ImageIcon ig = new ImageIcon("main.png");

	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////
	/*public loginForm() {
		display();
		setContentPane(new mypanal());
	}*/
	public loginForm() throws Exception{
		setContentPane(new mypanal());
		
		/* ��ư�� �ؽ�Ʈ�ʵ� ���� */
		jbtn_join.addActionListener(this);
		jbtn_login.addActionListener(this);
		this.setLayout(null);
		this.setTitle("�ڹ�ä�� ver.1");
		this.setSize(350, 600);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setLocation(800, 250);
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		// id ����
		jlb_id.setBounds(45, 200, 80, 40);
		jlb_id.setFont(jl_font);
		jtf_id.setBounds(110, 200, 185, 40);
		this.add(jlb_id);
		this.add(jtf_id);

		// pw ����
		jlb_pw.setBounds(45, 240, 80, 40);
		jlb_pw.setFont(jl_font);
		jpf_pw.setBounds(110, 240, 185, 40);
		this.add(jlb_pw);
		this.add(jpf_pw);

		// �α��� ��ư ����
		jbtn_login.setBounds(175, 285, 120, 40);
		this.add(jbtn_login);

		// ȸ������ ��ư ����
		jbtn_join.setBounds(45, 285, 120, 40);
		this.add(jbtn_join);
	}

	/////////////////////////////////////////////////////
	/* jpanal �������̵� */
	/////////////////////////////////////////////////////

	/* ����̹��� */
	class mypanal extends JPanel {
		public void paintComponent(Graphics g) {
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);
		}
	}

	/////////////////////////////////////////////////////
	/* ȭ��ó�� */
	/////////////////////////////////////////////////////
	public void display() {


	}

	public static void main(String[] args) throws Exception {
		//new loginForm("192.168.0.13",7779);
		new loginForm();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if (obj == jbtn_join) {
			new memberJoin();
		} 
		else if (obj == jbtn_login) {
			if ( "".equals(jtf_id.getText()) || "".equals(jpf_pw.getText()) ){
				JOptionPane.showMessageDialog(this, "���̵�� ��й�ȣ�� Ȯ���ϼ���.", "���", 2);
				return;
			}
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "SELECT name, id  FROM mem where id='" + jtf_id.getText() + "'and pw='" + jpf_pw.getText() + "'";
			try {
				Class.forName(DeptDBConnection._DRIVER);
				con = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER, DeptDBConnection._PW);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				memberVO mvo = null;
				String name = null;
				int count = 0;

				while (rs.next()) {
					count += 1;
					mvo = new memberVO();
					mvo.setName(rs.getString("name"));
					mvo.setId(rs.getString("id"));
					name = mvo.getId();
				}
				if (count == 0) {
					JOptionPane.showMessageDialog(this, "���̵�� ��й�ȣ�� Ȯ���ϼ���.", "���", 2);
					return;
				} else {
					JOptionPane.showMessageDialog(this, name + "���� ������ ȯ���մϴ�.");
					this.setVisible(false);
					id = name;
					jtf_id.setText("");
					jpf_pw.setText("");
					new WaitingRoom(this);
				}
			} catch (Exception ae) { 
				ae.printStackTrace();
			}
		}
	}
}
