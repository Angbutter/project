package chat;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import chatDB.DeptDBConnection;

public class Search extends JDialog implements ActionListener {
	/////////////////////////////////////////////////////
	/* ����� */
	/////////////////////////////////////////////////////

	JLabel jl_hp = new JLabel("�ڵ��� :");
	JLabel jl_search = new JLabel("ģ�� ã��");
	JLabel jl_top = new JLabel(new ImageIcon("search.png"));
	JLabel jl_bottom = new JLabel(new ImageIcon("bottom.png"));

	JTextField jtf_hp = new JTextField();

	Font font = new Font("�޸ո���ü", Font.BOLD, 25);
	
	Font font2 = new Font("�޸ո���ü", font.BOLD, 40);

	JButton jbtn_confirm = new JButton(new ImageIcon("ok.png"));
	JButton jbtn_cancle = new JButton(new ImageIcon("no.png"));

	/* ����̹��� */
	ImageIcon ig = new ImageIcon("roomcreate.png");

	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////
	public Search() {
		action();
		setContentPane(new rommpanal());
		
		/* ��ư�� �ؽ�Ʈ�ʵ� ���� */
		/* �游��� */
		jl_hp.setBounds(50, 110, 100, 60);
		jl_hp.setFont(font);
		jtf_hp.setBounds(150, 120, 200, 40);
		this.add(jl_hp);
		this.add(jtf_hp);

		/* Ȯ�ΰ� ��� */
		jbtn_confirm.setBounds(100, 235, 100, 50);
		// jbtn_confirm.setBorderPainted(false);
		// jbtn_confirm.setFocusPainted(false);
		// jbtn_confirm.setContentAreaFilled(false);
		this.add(jbtn_confirm);
		jbtn_cancle.setBounds(240, 235, 100, 50);
		// jbtn_cancle.setBorderPainted(false);
		// jbtn_cancle.setFocusPainted(false);
		// jbtn_cancle.setContentAreaFilled(false);
		this.add(jbtn_cancle);
		
		/* ģ��ã�� �� */
		jl_search.setBounds(160, 5, 200, 100);
		jl_search.setFont(font2);
		this.add(jl_search);
		
		/* ž �̹��� */
		jl_top.setBounds(40, 0, 80, 75);
		this.add(jl_top);
		
		/* ���� �̹��� */
		jl_bottom.setBounds(0, 220, 440, 100);
		this.add(jl_bottom);

		this.setLayout(null);
		this.setTitle("�� �����");
		this.setBounds(750, 400, 450, 350);
		this.setVisible(true);
	}

	/////////////////////////////////////////////////////
	/* ���ȭ�� */
	/////////////////////////////////////////////////////
	class rommpanal extends JPanel {
		public void paintComponent(Graphics g) {
			setLayout(null);
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);

		}
	}

	/////////////////////////////////////////////////////
	/* �׼� ���� */
	/////////////////////////////////////////////////////
	public void action() {
		jbtn_confirm.addActionListener(this);
		jbtn_cancle.addActionListener(this);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
	
		if (e.getSource() == jbtn_cancle){
			this.setVisible(false);
		}
		else if ( e.getSource() == jbtn_confirm ){
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT name FROM mem WHERE tel='"+jtf_hp.getText()+"'";
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
					name = mvo.getName();
				}
				if (count == 0) {
					JOptionPane.showMessageDialog(this, "���� ����� �Դϴ�.", "���", 2);
					return;
				} else {
					JOptionPane.showMessageDialog(this, "ã���ô� ������� �̸��� '"+ name + "' �Դϴ�.");
					jtf_hp.setText("");
				}
			} catch (Exception ae) { 
				ae.printStackTrace();
			}
		}
	}
}
