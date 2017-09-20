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
	/* 선언부 */
	/////////////////////////////////////////////////////

	JLabel jl_hp = new JLabel("핸드폰 :");
	JLabel jl_search = new JLabel("친구 찾기");
	JLabel jl_top = new JLabel(new ImageIcon("search.png"));
	JLabel jl_bottom = new JLabel(new ImageIcon("bottom.png"));

	JTextField jtf_hp = new JTextField();

	Font font = new Font("휴먼매직체", Font.BOLD, 25);
	
	Font font2 = new Font("휴먼매직체", font.BOLD, 40);

	JButton jbtn_confirm = new JButton(new ImageIcon("ok.png"));
	JButton jbtn_cancle = new JButton(new ImageIcon("no.png"));

	/* 배경이미지 */
	ImageIcon ig = new ImageIcon("roomcreate.png");

	/////////////////////////////////////////////////////
	/* 생성자 */
	/////////////////////////////////////////////////////
	public Search() {
		action();
		setContentPane(new rommpanal());
		
		/* 버튼과 텍스트필드 구성 */
		/* 방만들기 */
		jl_hp.setBounds(50, 110, 100, 60);
		jl_hp.setFont(font);
		jtf_hp.setBounds(150, 120, 200, 40);
		this.add(jl_hp);
		this.add(jtf_hp);

		/* 확인과 취소 */
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
		
		/* 친구찾기 라벨 */
		jl_search.setBounds(160, 5, 200, 100);
		jl_search.setFont(font2);
		this.add(jl_search);
		
		/* 탑 이미지 */
		jl_top.setBounds(40, 0, 80, 75);
		this.add(jl_top);
		
		/* 바텀 이미지 */
		jl_bottom.setBounds(0, 220, 440, 100);
		this.add(jl_bottom);

		this.setLayout(null);
		this.setTitle("방 만들기");
		this.setBounds(750, 400, 450, 350);
		this.setVisible(true);
	}

	/////////////////////////////////////////////////////
	/* 배경화면 */
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
	/* 액션 관련 */
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
					JOptionPane.showMessageDialog(this, "없는 사용자 입니다.", "경고", 2);
					return;
				} else {
					JOptionPane.showMessageDialog(this, "찾으시는 사용자의 이름은 '"+ name + "' 입니다.");
					jtf_hp.setText("");
				}
			} catch (Exception ae) { 
				ae.printStackTrace();
			}
		}
	}
}
