package chat;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import chatDB.DeptDBConnection;

public class memberJoin extends JFrame implements ActionListener {

	/////////////////////////////////////////////////////
	/* ����� */
	/////////////////////////////////////////////////////
	String id = "";
	String name = "";
	memberVO mvo = null;
	JLabel jl_welcome = new JLabel(
			new ImageIcon("welcome.png"));

	JLabel jlb_id = new JLabel("���̵� :");
	JLabel jlb_pw = new JLabel("��� :");
	JLabel jlb_pwo = new JLabel("���Ȯ�� :");
	JLabel jlb_name = new JLabel("�̸� :");
	JLabel jlb_tel = new JLabel("�ڵ��� :");
	JLabel jlb_email = new JLabel("���� :");
	// JLabel jl_comments = new JLabel("�ϰ������ :");

	Font jl_font = new Font("�޸ո���ü", Font.BOLD, 17);

	JTextField jtf_id = new JTextField();
	JPasswordField jtf_pw = new JPasswordField();
	JPasswordField jtf_pwo = new JPasswordField();
	JTextField jtf_name = new JTextField();
	JTextField jtf_tel = new JTextField();
	JTextField jtf_email = new JTextField();

	JButton jbtn_yes = new JButton(new ImageIcon("confirm.png"));
	JButton jbtn_no = new JButton(new ImageIcon("cancle.png"));
	// JPanel�� ���� �̹���������
	ImageIcon ig = new ImageIcon("accountmain.png");

	/////////////////////////////////////////////////////
	/* jpanal �������̵� */
	/////////////////////////////////////////////////////
	/* ����̹��� */
	class mypanal extends JPanel {
		public void paintComponent(Graphics g) {
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);

			/* ���� ǥ�� */
			jl_welcome.setBounds(-150, -345, 800, 800);
			this.add(jl_welcome);

			/* ���̵� */
			jlb_id.setBounds(100, 125, 120, 30);
			jlb_id.setFont(jl_font);
			jtf_id.setBounds(200, 125, 170, 30);
			this.add(jlb_id);
			this.add(jtf_id);

			/* 1�� ��й�ȣ */
			jlb_pw.setBounds(100, 170, 120, 30);
			jlb_pw.setFont(jl_font);
			jtf_pw.setBounds(200, 170, 170, 30);
			this.add(jlb_pw);
			this.add(jtf_pw);

			/* ��й�ȣ Ȯ�� */
			jlb_pwo.setBounds(100, 215, 120, 30);
			jlb_pwo.setFont(jl_font);
			jtf_pwo.setBounds(200, 215, 170, 30);
			this.add(jlb_pwo);
			this.add(jtf_pwo);

			/* �̸� */
			jlb_name.setBounds(100, 260, 120, 30);
			jlb_name.setFont(jl_font);
			jtf_name.setBounds(200, 260, 170, 30);
			this.add(jlb_name);
			this.add(jtf_name);

			/* �޴��� ��ȣ */
			jlb_tel.setBounds(100, 305, 120, 30);
			jlb_tel.setFont(jl_font);
			jtf_tel.setBounds(200, 305, 170, 30);
			this.add(jlb_tel);
			this.add(jtf_tel);

			/* ���� */
			jlb_email.setBounds(100, 350, 120, 30);
			jlb_email.setFont(jl_font);
			jtf_email.setBounds(200, 350, 220, 30);
			this.add(jlb_email);
			this.add(jtf_email);

			/* �����ϱ�, ��� */
			jbtn_yes.setBounds(90, 395, 150, 45);
			this.add(jbtn_yes);

			jbtn_no.setBounds(260, 395, 150, 45);
			this.add(jbtn_no);

		}
	}

	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////
	public memberJoin() {
		display();
		setContentPane(new mypanal());
	}

	/////////////////////////////////////////////////////
	/* ȭ��ó�� */
	/////////////////////////////////////////////////////
	public void display() {
		jbtn_yes.addActionListener(this);
		jbtn_no.addActionListener(this);

		/* ȭ�� ��� */
		this.setLayout(null);
		this.setTitle("Welcome to Java Talk~");
		this.setSize(500, 800);
		this.setVisible(true);
		this.setLocation(700, 150);
	}
	

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		if (obj == jbtn_no) {
			jtf_name.setText("");
			jtf_id.setText("");
			jtf_pw.setText("");
			jtf_pwo.setText("");
			jtf_tel.setText("");
			jtf_name.setText("");
			this.setVisible(false);
			dispose();
		} else if (obj == jbtn_yes) {
			if ("".equals(jtf_id.getText()) || "".equals(jtf_pw.getText()) || "".equals(jtf_tel.getText())
					|| "".equals(jtf_name.getText()) || "".equals(jtf_name.getText())) {
				JOptionPane.showMessageDialog(this, "��� ������ �Է��ϼ���.", "���", 2);
				return;
			}
			if (jtf_pw.getText().equals(jtf_pwo.getText())) {
				Connection con = null;
				Statement stmt = null;
				String sql2 = "INSERT INTO mem values('" + jtf_id.getText() + "','" + jtf_pw.getText() + "','"
						+ jtf_name.getText() + "','" + jtf_tel.getText() + "','" + jtf_email.getText() + "')";
				try {
					Class.forName(DeptDBConnection._DRIVER);
					con = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER,
							DeptDBConnection._PW);
					stmt = con.createStatement();
					stmt.executeUpdate(sql2);
					JOptionPane.showMessageDialog(this, "���� ����!");
					this.setVisible(false);
					dispose();
				} catch (Exception e) {
					JOptionPane.showMessageDialog(this, "�ߺ��� ���̵� �Դϴ�.","���", 2);
					return;
				}
			} else {
				JOptionPane.showMessageDialog(this, "��й�ȣ�� ��ġ���� �ʽ��ϴ�.","���", 2);
			}
		}
	}
	/*
	 * public static void main(String[] args) { 
	 * 		new memberJoin(); 
	 * }
	 */
}
