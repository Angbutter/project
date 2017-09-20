package chat;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CreateRoom extends JDialog implements ActionListener {
	/////////////////////////////////////////////////////
	/* 선언부 */
	/////////////////////////////////////////////////////
	WaitingRoom wr = null;
	ChattingRoom chattingroom = null;
	JLabel jlb_name = new JLabel("방제목 :");
	JLabel jlb_man = new JLabel("인원수 :");
	JLabel jl_top = new JLabel(
			new ImageIcon("top.png"));
	JLabel jl_bottom = new JLabel(
			new ImageIcon("bottom.png"));
	String man[] = { "2", "3", "4", "5" };
	JComboBox jcb_man = new JComboBox(man);

	JTextField jtf_name = new JTextField();
	JTextField jtf_pass = new JTextField();

	Font font = new Font("휴먼매직체", Font.BOLD, 25);

	JButton jbtn_confirm = new JButton(
			new ImageIcon("ok.png"));
	JButton jbtn_cancel = new JButton(
			new ImageIcon("no.png"));

	/* 배경이미지 */
	ImageIcon ig = new ImageIcon("roomcreate.png");

	/////////////////////////////////////////////////////
	/* 생성자 */
	/////////////////////////////////////////////////////
	public CreateRoom(WaitingRoom wr) {
		this.wr = wr;
		display();
		setContentPane(new rommpanal());
		/* 버튼과 텍스트필드 구성 */

		/* 방만들기 */
		jlb_name.setBounds(30, 120, 100, 20);
		jlb_name.setFont(font);
		jtf_name.setBounds(130, 110, 200, 40);
		this.add(jlb_name);
		this.add(jtf_name);

		/* 인원수 콤보 */
		jlb_man.setBounds(30, 200, 100, 20);
		jlb_man.setFont(font);
		jcb_man.setBounds(130, 190, 100, 40);
		this.add(jlb_man);
		this.add(jcb_man);

		/* 확인과 취소 */
		jbtn_confirm.setBounds(100, 290, 100, 50);
		jbtn_confirm.setBorderPainted(false);
		// jbtn_confirm.setFocusPainted(false);
		// jbtn_confirm.setContentAreaFilled(false);
		this.add(jbtn_confirm);
		jbtn_cancel.setBounds(240, 290, 100, 50);
		jbtn_cancel.setBorderPainted(false);
		// jbtn_cancel.setFocusPainted(false);
		// jbtn_cancel.setContentAreaFilled(false);
		this.add(jbtn_cancel);

		/* 탑 이미지 */
		jl_top.setBounds(0, 0, 450, 75);
		this.add(jl_top);

		/* 바텀 이미지 */
		jl_bottom.setBounds(0, 275, 440, 100);
		this.add(jl_bottom);

		this.setLayout(null);
		this.setTitle("방 만들기");
		this.setBounds(750, 400, 450, 400);
		this.setVisible(true);
	}

	/* 배경이미지 */
	class rommpanal extends JPanel {
		public void paintComponent(Graphics g) {
			setLayout(null);
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);
		}
	}

	/////////////////////////////////////////////////////
	/* 화면처리 */
	/////////////////////////////////////////////////////
	public void display() {
		jtf_name.requestFocus();
		jbtn_cancel.addActionListener(this);
		jbtn_confirm.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		
		////////////////////////////////////////////////////// 방만들기 취소
		if (obj == jbtn_cancel) {
			this.setVisible(false);
			dispose();
		} 
		
		////////////////////////////////////////////////////// 방만들기 확인
		else if (obj == jbtn_confirm) {
			wr.title = jtf_name.getText();
			
			
			////////////////////////////////////////////////////// 방 이름이 없을 때
			if ("".equals(wr.title)) {
				JOptionPane.showMessageDialog(this, "방 이름을 입력하세요.");
				return;
			}
			
			////////////////////////////////////////////////////// 현재 진행중인 대화방 목록에서 같은 대화방 이름이 있을 때
			for (int i = 0; i < wr.dtm_menu.getRowCount(); i++) {
				if (wr.title.equals(wr.dtm_menu.getValueAt(i, 0))) {
					JOptionPane.showMessageDialog(this, "동일한 대화방이 존재합니다.", "경고", 2);
					return;
				}
			}
			int max = Integer.parseInt((String) jcb_man.getSelectedItem());
			this.setVisible(false);
			try {
				wr.oos.writeObject(Separate.CREATE_ROOM + "#" + wr.title + "#" + max);
				chattingroom = new ChattingRoom(wr);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}