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
	/* ����� */
	/////////////////////////////////////////////////////
	WaitingRoom wr = null;
	ChattingRoom chattingroom = null;
	JLabel jlb_name = new JLabel("������ :");
	JLabel jlb_man = new JLabel("�ο��� :");
	JLabel jl_top = new JLabel(
			new ImageIcon("top.png"));
	JLabel jl_bottom = new JLabel(
			new ImageIcon("bottom.png"));
	String man[] = { "2", "3", "4", "5" };
	JComboBox jcb_man = new JComboBox(man);

	JTextField jtf_name = new JTextField();
	JTextField jtf_pass = new JTextField();

	Font font = new Font("�޸ո���ü", Font.BOLD, 25);

	JButton jbtn_confirm = new JButton(
			new ImageIcon("ok.png"));
	JButton jbtn_cancel = new JButton(
			new ImageIcon("no.png"));

	/* ����̹��� */
	ImageIcon ig = new ImageIcon("roomcreate.png");

	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////
	public CreateRoom(WaitingRoom wr) {
		this.wr = wr;
		display();
		setContentPane(new rommpanal());
		/* ��ư�� �ؽ�Ʈ�ʵ� ���� */

		/* �游��� */
		jlb_name.setBounds(30, 120, 100, 20);
		jlb_name.setFont(font);
		jtf_name.setBounds(130, 110, 200, 40);
		this.add(jlb_name);
		this.add(jtf_name);

		/* �ο��� �޺� */
		jlb_man.setBounds(30, 200, 100, 20);
		jlb_man.setFont(font);
		jcb_man.setBounds(130, 190, 100, 40);
		this.add(jlb_man);
		this.add(jcb_man);

		/* Ȯ�ΰ� ��� */
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

		/* ž �̹��� */
		jl_top.setBounds(0, 0, 450, 75);
		this.add(jl_top);

		/* ���� �̹��� */
		jl_bottom.setBounds(0, 275, 440, 100);
		this.add(jl_bottom);

		this.setLayout(null);
		this.setTitle("�� �����");
		this.setBounds(750, 400, 450, 400);
		this.setVisible(true);
	}

	/* ����̹��� */
	class rommpanal extends JPanel {
		public void paintComponent(Graphics g) {
			setLayout(null);
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);
		}
	}

	/////////////////////////////////////////////////////
	/* ȭ��ó�� */
	/////////////////////////////////////////////////////
	public void display() {
		jtf_name.requestFocus();
		jbtn_cancel.addActionListener(this);
		jbtn_confirm.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		Object obj = ae.getSource();
		
		////////////////////////////////////////////////////// �游��� ���
		if (obj == jbtn_cancel) {
			this.setVisible(false);
			dispose();
		} 
		
		////////////////////////////////////////////////////// �游��� Ȯ��
		else if (obj == jbtn_confirm) {
			wr.title = jtf_name.getText();
			
			
			////////////////////////////////////////////////////// �� �̸��� ���� ��
			if ("".equals(wr.title)) {
				JOptionPane.showMessageDialog(this, "�� �̸��� �Է��ϼ���.");
				return;
			}
			
			////////////////////////////////////////////////////// ���� �������� ��ȭ�� ��Ͽ��� ���� ��ȭ�� �̸��� ���� ��
			for (int i = 0; i < wr.dtm_menu.getRowCount(); i++) {
				if (wr.title.equals(wr.dtm_menu.getValueAt(i, 0))) {
					JOptionPane.showMessageDialog(this, "������ ��ȭ���� �����մϴ�.", "���", 2);
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