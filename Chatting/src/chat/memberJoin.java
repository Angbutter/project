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
	/* 선언부 */
	/////////////////////////////////////////////////////
	String id = "";
	String name = "";
	memberVO mvo = null;
	JLabel jl_welcome = new JLabel(
			new ImageIcon("welcome.png"));

	JLabel jlb_id = new JLabel("아이디 :");
	JLabel jlb_pw = new JLabel("비번 :");
	JLabel jlb_pwo = new JLabel("비번확인 :");
	JLabel jlb_name = new JLabel("이름 :");
	JLabel jlb_tel = new JLabel("핸드폰 :");
	JLabel jlb_email = new JLabel("메일 :");
	// JLabel jl_comments = new JLabel("하고싶은말 :");

	Font jl_font = new Font("휴먼매직체", Font.BOLD, 17);

	JTextField jtf_id = new JTextField();
	JPasswordField jtf_pw = new JPasswordField();
	JPasswordField jtf_pwo = new JPasswordField();
	JTextField jtf_name = new JTextField();
	JTextField jtf_tel = new JTextField();
	JTextField jtf_email = new JTextField();

	JButton jbtn_yes = new JButton(new ImageIcon("confirm.png"));
	JButton jbtn_no = new JButton(new ImageIcon("cancle.png"));
	// JPanel에 쓰일 이미지아이콘
	ImageIcon ig = new ImageIcon("accountmain.png");

	/////////////////////////////////////////////////////
	/* jpanal 오버라이드 */
	/////////////////////////////////////////////////////
	/* 배경이미지 */
	class mypanal extends JPanel {
		public void paintComponent(Graphics g) {
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);

			/* 웰컴 표지 */
			jl_welcome.setBounds(-150, -345, 800, 800);
			this.add(jl_welcome);

			/* 아이디 */
			jlb_id.setBounds(100, 125, 120, 30);
			jlb_id.setFont(jl_font);
			jtf_id.setBounds(200, 125, 170, 30);
			this.add(jlb_id);
			this.add(jtf_id);

			/* 1차 비밀번호 */
			jlb_pw.setBounds(100, 170, 120, 30);
			jlb_pw.setFont(jl_font);
			jtf_pw.setBounds(200, 170, 170, 30);
			this.add(jlb_pw);
			this.add(jtf_pw);

			/* 비밀번호 확인 */
			jlb_pwo.setBounds(100, 215, 120, 30);
			jlb_pwo.setFont(jl_font);
			jtf_pwo.setBounds(200, 215, 170, 30);
			this.add(jlb_pwo);
			this.add(jtf_pwo);

			/* 이름 */
			jlb_name.setBounds(100, 260, 120, 30);
			jlb_name.setFont(jl_font);
			jtf_name.setBounds(200, 260, 170, 30);
			this.add(jlb_name);
			this.add(jtf_name);

			/* 휴대폰 번호 */
			jlb_tel.setBounds(100, 305, 120, 30);
			jlb_tel.setFont(jl_font);
			jtf_tel.setBounds(200, 305, 170, 30);
			this.add(jlb_tel);
			this.add(jtf_tel);

			/* 메일 */
			jlb_email.setBounds(100, 350, 120, 30);
			jlb_email.setFont(jl_font);
			jtf_email.setBounds(200, 350, 220, 30);
			this.add(jlb_email);
			this.add(jtf_email);

			/* 가입하기, 취소 */
			jbtn_yes.setBounds(90, 395, 150, 45);
			this.add(jbtn_yes);

			jbtn_no.setBounds(260, 395, 150, 45);
			this.add(jbtn_no);

		}
	}

	/////////////////////////////////////////////////////
	/* 생성자 */
	/////////////////////////////////////////////////////
	public memberJoin() {
		display();
		setContentPane(new mypanal());
	}

	/////////////////////////////////////////////////////
	/* 화면처리 */
	/////////////////////////////////////////////////////
	public void display() {
		jbtn_yes.addActionListener(this);
		jbtn_no.addActionListener(this);

		/* 화면 띄움 */
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
				JOptionPane.showMessageDialog(this, "모든 정보를 입력하세요.", "경고", 2);
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
					JOptionPane.showMessageDialog(this, "가입 성공!");
					this.setVisible(false);
					dispose();
				} catch (Exception e) {
					JOptionPane.showMessageDialog(this, "중복된 아이디 입니다.","경고", 2);
					return;
				}
			} else {
				JOptionPane.showMessageDialog(this, "비밀번호가 일치하지 않습니다.","경고", 2);
			}
		}
	}
	/*
	 * public static void main(String[] args) { 
	 * 		new memberJoin(); 
	 * }
	 */
}
