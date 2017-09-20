package chat;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.SwingConstants;
import javax.swing.border.Border;
import javax.swing.colorchooser.ColorSelectionModel;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumnModel;
import javax.swing.text.DefaultStyledDocument;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleContext;
import javax.swing.text.StyledDocument;


public class ChattingRoom extends JFrame implements ActionListener {

	/////////////////////////////////////////////////////
	/* ����� */
	/////////////////////////////////////////////////////
	JLabel jl_welcome = new JLabel(
			new ImageIcon("imo.png"));
	SimpleAttributeSet attr = new SimpleAttributeSet();
	/* �ؽ�Ʈ ���� */
	/* style�� �����ϱ� ���� ��ü �߰� (����ũ��, �۲�, ���ڻ�, �̸�Ƽ�� ���) */
	StyledDocument sd_chat = new DefaultStyledDocument(new StyleContext());
	/* �̹��� ������ ���� ������Ʈ ���� */
	JTextPane jtp_chat = new JTextPane(sd_chat);

	Border border = BorderFactory.createLineBorder(Color.DARK_GRAY, 1);
	Border border1 = BorderFactory.createLineBorder(Color.DARK_GRAY, 1);
	Border border2 = BorderFactory.createEmptyBorder(7, 7, 7, 7);
	JScrollPane jsp_chat = new JScrollPane(jtp_chat);
	/* ������ ��� */
	String header[] = { "���� �ο�" };
	String join[][] = new String[0][1];
	DefaultTableModel dtm_join = new DefaultTableModel(join, header);
	JTable jt_join = new JTable(dtm_join);
	JScrollPane jsp_join = new JScrollPane(jt_join, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	JTableHeader header_ = jt_join.getTableHeader();
	Font font = new Font("�޸ո���ü", 0, 20);
	String nickName = null;
	WaitingRoom wr = null;
	/* �޼��� �Է¶� */
	JTextField jtf_message = new JTextField();
	String title = "";
	/* ���۹�ư */
	JButton jbtn_send = new JButton(
			new ImageIcon("sendbutton.png"));
	/* �̸�Ƽ�� */
	//JButton jbtn_imo = new JButton(
	//		new ImageIcon("C:\\Users\\minkh\\Desktop\\practice\\dev_java\\src\\com\\Final\\image\\imo.png"));
	/* ��ȭ���� */
	JButton jbtn_change = new JButton(
			new ImageIcon("room_change.png"));
	/* �۾��� ���� */
	JButton jbtn_text_color = new JButton(
			new ImageIcon("text_color.png"));

	/* �������ư */
	ImageIcon normal = new ImageIcon("normal.gif");
	ImageIcon wait = new ImageIcon("wait.gif");
	ImageIcon click = new ImageIcon("click.gif");

	JButton jbtn_exit = new JButton(normal);

	/* ����̹��� */
	ImageIcon ig = new ImageIcon("Chattingmain.png");

	/* �ؽ�Ʈ �� �̹��� */
	ImageIcon text_ig = new ImageIcon("malpungsun.png");
	String fontColor = "0";
	/////////////////////////////////////////////////////
	/* ������ */
	/////////////////////////////////////////////////////

	public ChattingRoom(WaitingRoom wr) throws Exception {
		this.wr = wr;
		title = wr.title;
		display();
		setContentPane(new Chattingpanal());

		/* �޼������ */
		jsp_chat.setBounds(25, 125, 822, 547);
		jsp_chat.setBorder(BorderFactory.createCompoundBorder(border, border2));
		this.add(jsp_chat);

		/////////// ��ư ���� ���� ///////////////////////
		/* �޼����Է¶� */
		jtf_message.setBounds(25, 680, 733, 40);
		this.add(jtf_message);

		/* ���۹�ư */
		//jbtn_send.setBounds(757, 680, 90, 39);
		jbtn_send.setBounds(758, 680, 90, 39);
		this.add(jbtn_send);

		/* �̸�Ƽ�ܹ�ư */
		//jbtn_imo.setBounds(705, 680, 51, 39);
		//this.add(jbtn_imo);

		/* ��ȭ���� */
		jbtn_change.setBounds(855, 530, 100, 40);
		this.add(jbtn_change);

		jbtn_text_color.setBounds(855, 575, 100, 40);
		this.add(jbtn_text_color);

		/* �������ư */
		jbtn_exit.setBounds(965, 550, 200, 180);
		jbtn_exit.setRolloverIcon(wait);
		jbtn_exit.setPressedIcon(click);
		jbtn_exit.setBackground(Color.WHITE);
		jbtn_exit.setToolTipText("������");
		jbtn_exit.setBorderPainted(false);
		this.add(jbtn_exit);
		/////////// ��ư ���� �� ///////////////////////

		// ��� ������ ���� ����
		header_.setReorderingAllowed(false);
		header_.setResizingAllowed(false);

		/* ����� ��� */
		jsp_join.setBounds(855, 125, 300, 400);
		header_.setBackground(Color.WHITE);
		jsp_join.setBorder(border);
		header_.setFont(font);
		jsp_join.getViewport().setBackground(Color.WHITE);
		this.add(jsp_join);
		this.setLayout(null);
		this.setTitle(wr.title);
		this.setSize(1200, 800);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setLocation(600, 20);
		jtp_chat.setEditable(false);
		jtp_chat.setFont(new Font(null, 0, 15));

		jtf_message.setFont(new Font(null, 0, 15));

		// ���̺� �۾�ũ��
		jt_join.setFont(new Font(null, 0, 14));
		jtf_message.requestFocus();
		// ��� ����
		DefaultTableCellRenderer tScheduleCellRenderer = new DefaultTableCellRenderer();
		tScheduleCellRenderer.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcmSchedule = jt_join.getColumnModel();
		for (int i = 0; i < tcmSchedule.getColumnCount(); i++) {
			tcmSchedule.getColumn(i).setCellRenderer(tScheduleCellRenderer);
		}
		wr.oos.writeObject(Separate.ROOM_IN + "#" + nickName + "#" + wr.title);
		FinalClientThread fct = new FinalClientThread(this);
		fct.start();
	}

	/////////////////////////////////////////////////////
	/* jpanal �������̵� */
	/////////////////////////////////////////////////////
	/* ����̹��� */
	class Chattingpanal extends JPanel {
		public Chattingpanal() {

		}

		public void paintComponent(Graphics g) {
			setLayout(null);
			g.drawImage(ig.getImage(), 0, 0, null);
			setOpaque(false);
			super.paintComponents(g);
		}
	}

	/* ����̹��� */
	/////////////////////////////////////////////////////
	/* ȭ��ó�� */
	/////////////////////////////////////////////////////
	public void display() {
		nickName = JOptionPane.showInputDialog("��ȭ���� �Է��ϼ���.");
		jbtn_send.addActionListener(this);
		jbtn_exit.addActionListener(this);
		jbtn_text_color.addActionListener(this);
		jbtn_change.addActionListener(this);
		jtf_message.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		/* ��ɺκ� ���� */
		Object obj = e.getSource();
		String msg = jtf_message.getText();
		/* ������ */
		if (obj == jbtn_exit) { // �游��� �� ����� ������ ���� ��
			this.setVisible(false);
			try {
				wr.oos.writeObject(Separate.ROOM_OUT + "#" + nickName + "#" + title);
				wr.oos.writeObject(Separate.CURRENT_MINUS+"#"+title+"#"+wr.current+"#"+wr.max);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		/* �޼��� ���� */
		else if (obj == jbtn_send || obj == jtf_message) {
			try {
				wr.oos.writeObject(Separate.TALK + "#" + nickName + "#" + msg + "#" + wr.title+"#"+fontColor);
			} catch (Exception e2) {

			}
			jtp_chat.setCaretPosition(jtp_chat.getDocument().getLength());
			jtf_message.setText("");
			jtf_message.requestFocus();
		}
		else if ( obj == jbtn_text_color ) {
			JFrame jf_fontColor = new JFrame();
			jf_fontColor.setSize(600, 500);
			JColorChooser jc_chooser = new JColorChooser();
			ColorSelectionModel model = jc_chooser.getSelectionModel();
			ChangeListener listener = new ChangeListener(){
				@Override
				public void stateChanged(ChangeEvent ce) {
					Color newFColor = jc_chooser.getColor();
					fontColor = String.valueOf(newFColor.getRGB());
				}
			};
			model.addChangeListener(listener);
			jf_fontColor.add(jc_chooser);
			jf_fontColor.setVisible(true);
		}
		else if ( obj == jbtn_change ) {
			String afterName = JOptionPane.showInputDialog("������ ��ȭ���� �Է��ϼ���.");
			if (afterName == null || afterName.trim().length() < 1) {
				JOptionPane.showMessageDialog(this, "������ ��ȭ���� �Է��ϼ���.", "INFO", JOptionPane.INFORMATION_MESSAGE);
				return; // actionPerformed �޼ҵ带 ��������
			}			
			for ( int i=0; i<dtm_join.getRowCount();i++){
				if ( afterName.equals(dtm_join.getValueAt(i, 0)) ){
					JOptionPane.showMessageDialog(this, "������ ��ȭ���� �����մϴ�.", "���", 2);
					return;
				}
			}
			try {
				wr.oos.writeObject(Separate.CHANGE + "#" + nickName + "#" + afterName+"#"+title);
				nickName = afterName;
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			jtp_chat.setCaretPosition(jtp_chat.getDocument().getLength());
			jtf_message.setText("");
			jtf_message.requestFocus();
		}
	}
}