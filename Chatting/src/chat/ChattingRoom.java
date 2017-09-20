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
	/* 선언부 */
	/////////////////////////////////////////////////////
	JLabel jl_welcome = new JLabel(
			new ImageIcon("imo.png"));
	SimpleAttributeSet attr = new SimpleAttributeSet();
	/* 텍스트 라인 */
	/* style을 적용하기 위한 객체 추가 (글자크기, 글꼴, 글자색, 이모티콘 등등) */
	StyledDocument sd_chat = new DefaultStyledDocument(new StyleContext());
	/* 이미지 전송을 위한 오브젝트 선언 */
	JTextPane jtp_chat = new JTextPane(sd_chat);

	Border border = BorderFactory.createLineBorder(Color.DARK_GRAY, 1);
	Border border1 = BorderFactory.createLineBorder(Color.DARK_GRAY, 1);
	Border border2 = BorderFactory.createEmptyBorder(7, 7, 7, 7);
	JScrollPane jsp_chat = new JScrollPane(jtp_chat);
	/* 참여자 목록 */
	String header[] = { "참여 인원" };
	String join[][] = new String[0][1];
	DefaultTableModel dtm_join = new DefaultTableModel(join, header);
	JTable jt_join = new JTable(dtm_join);
	JScrollPane jsp_join = new JScrollPane(jt_join, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
			JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
	JTableHeader header_ = jt_join.getTableHeader();
	Font font = new Font("휴먼매직체", 0, 20);
	String nickName = null;
	WaitingRoom wr = null;
	/* 메세지 입력란 */
	JTextField jtf_message = new JTextField();
	String title = "";
	/* 전송버튼 */
	JButton jbtn_send = new JButton(
			new ImageIcon("sendbutton.png"));
	/* 이모티콘 */
	//JButton jbtn_imo = new JButton(
	//		new ImageIcon("C:\\Users\\minkh\\Desktop\\practice\\dev_java\\src\\com\\Final\\image\\imo.png"));
	/* 대화명변경 */
	JButton jbtn_change = new JButton(
			new ImageIcon("room_change.png"));
	/* 글씨색 변경 */
	JButton jbtn_text_color = new JButton(
			new ImageIcon("text_color.png"));

	/* 나가기버튼 */
	ImageIcon normal = new ImageIcon("normal.gif");
	ImageIcon wait = new ImageIcon("wait.gif");
	ImageIcon click = new ImageIcon("click.gif");

	JButton jbtn_exit = new JButton(normal);

	/* 배경이미지 */
	ImageIcon ig = new ImageIcon("Chattingmain.png");

	/* 텍스트 앞 이미지 */
	ImageIcon text_ig = new ImageIcon("malpungsun.png");
	String fontColor = "0";
	/////////////////////////////////////////////////////
	/* 생성자 */
	/////////////////////////////////////////////////////

	public ChattingRoom(WaitingRoom wr) throws Exception {
		this.wr = wr;
		title = wr.title;
		display();
		setContentPane(new Chattingpanal());

		/* 메세지출력 */
		jsp_chat.setBounds(25, 125, 822, 547);
		jsp_chat.setBorder(BorderFactory.createCompoundBorder(border, border2));
		this.add(jsp_chat);

		/////////// 버튼 라인 시작 ///////////////////////
		/* 메세지입력란 */
		jtf_message.setBounds(25, 680, 733, 40);
		this.add(jtf_message);

		/* 전송버튼 */
		//jbtn_send.setBounds(757, 680, 90, 39);
		jbtn_send.setBounds(758, 680, 90, 39);
		this.add(jbtn_send);

		/* 이모티콘버튼 */
		//jbtn_imo.setBounds(705, 680, 51, 39);
		//this.add(jbtn_imo);

		/* 대화명변경 */
		jbtn_change.setBounds(855, 530, 100, 40);
		this.add(jbtn_change);

		jbtn_text_color.setBounds(855, 575, 100, 40);
		this.add(jbtn_text_color);

		/* 나가기버튼 */
		jbtn_exit.setBounds(965, 550, 200, 180);
		jbtn_exit.setRolloverIcon(wait);
		jbtn_exit.setPressedIcon(click);
		jbtn_exit.setBackground(Color.WHITE);
		jbtn_exit.setToolTipText("나가기");
		jbtn_exit.setBorderPainted(false);
		this.add(jbtn_exit);
		/////////// 버튼 라인 끝 ///////////////////////

		// 헤더 사이즈 변경 금지
		header_.setReorderingAllowed(false);
		header_.setResizingAllowed(false);

		/* 대기자 목록 */
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

		// 테이블 글씨크기
		jt_join.setFont(new Font(null, 0, 14));
		jtf_message.requestFocus();
		// 가운데 정렬
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
	/* jpanal 오버라이드 */
	/////////////////////////////////////////////////////
	/* 배경이미지 */
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

	/* 배경이미지 */
	/////////////////////////////////////////////////////
	/* 화면처리 */
	/////////////////////////////////////////////////////
	public void display() {
		nickName = JOptionPane.showInputDialog("대화명을 입력하세요.");
		jbtn_send.addActionListener(this);
		jbtn_exit.addActionListener(this);
		jbtn_text_color.addActionListener(this);
		jbtn_change.addActionListener(this);
		jtf_message.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		/* 기능부분 선언 */
		Object obj = e.getSource();
		String msg = jtf_message.getText();
		/* 나가기 */
		if (obj == jbtn_exit) { // 방만들고 온 사람이 나가기 했을 때
			this.setVisible(false);
			try {
				wr.oos.writeObject(Separate.ROOM_OUT + "#" + nickName + "#" + title);
				wr.oos.writeObject(Separate.CURRENT_MINUS+"#"+title+"#"+wr.current+"#"+wr.max);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		/* 메세지 전송 */
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
			String afterName = JOptionPane.showInputDialog("변경할 대화명을 입력하세요.");
			if (afterName == null || afterName.trim().length() < 1) {
				JOptionPane.showMessageDialog(this, "변경할 대화명을 입력하세요.", "INFO", JOptionPane.INFORMATION_MESSAGE);
				return; // actionPerformed 메소드를 빠져나감
			}			
			for ( int i=0; i<dtm_join.getRowCount();i++){
				if ( afterName.equals(dtm_join.getValueAt(i, 0)) ){
					JOptionPane.showMessageDialog(this, "동일한 대화명이 존재합니다.", "경고", 2);
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