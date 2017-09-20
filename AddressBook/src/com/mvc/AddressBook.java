package com.mvc;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableColumnModel;

import com.db.DeptDBConnection;

public class AddressBook extends JFrame implements ActionListener {
	// 선언부
	int fontSize = 15;
	Font font = new Font("돋움", 20, 20);
	AddressUpdate aUpdate = new AddressUpdate();
	AddressDialog aDialog = new AddressDialog();
	AddressSelect aSelect = new AddressSelect();
	AddressVO avo = new AddressVO();
	AddressDelete deleteLogic = null;
	JButton jbtn_insert = new JButton("추가");
	JButton jbtn_update = new JButton("수정");
	JButton jbtn_delete = new JButton("삭제");
	JButton jbtn_select = new JButton("상세조회");
	JButton jbtn_search = new JButton("검색");
	JButton jbtn_view = new JButton("전체보기");
	JButton jbtn_exit = new JButton("종료");
	JPanel jp_add = new JPanel();
	JPanel jp_panel = new JPanel();
	JPanel jp_north = new JPanel();
	JPanel jp_first = new JPanel();
	JPanel jp_buttons = new JPanel();
	JTextField jtf_name = new JTextField(10);
	JLabel jlb_name = new JLabel("이름");
	JLabel jlb_add = new JLabel("전화번호부");
	
	JMenuBar jmb = new JMenuBar();
	JMenu jm_menu = new JMenu("테마");
	JMenuItem jmi_red = new JMenuItem("Red");
	JMenuItem jmi_mint = new JMenuItem("Mint");
	JMenuItem jmi_green = new JMenuItem("Green");
	JMenuItem jmi_pink = new JMenuItem("Pint");
	JMenuItem jmi_yellow = new JMenuItem("Yellow");
	
	JMenu jm_menu2 = new JMenu("글씨");
	JMenuItem jmi_up = new JMenuItem("크게");
	JMenuItem jmi_down = new JMenuItem("작게");
	boolean open = true;

	static String cols[] = { "이름", "핸드폰", "이메일", "생년월일", "주소", "집전화번호", "비고" };
	static String data[][] = new String[0][4];
	static DefaultTableModel dtm_address = new DefaultTableModel(data, cols);
	static JTable jt_address = new JTable(dtm_address);
	JScrollPane jsp_address = new JScrollPane(jt_address);

	JTableHeader header = jt_address.getTableHeader();

	// 생성자
	public AddressBook() {
		aDialog.initDisplay();
	}

	public void getAddressList(String name) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT name, tel, email, birthday, address, homenumber, hint FROM addressbook WHERE name LIKE "
				+ "\'" + name + "%\' ORDER BY name";

		try {
			Class.forName(DeptDBConnection._DRIVER);
			con = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER, DeptDBConnection._PW);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			AddressVO avo = null;
			AddressVO avos[] = null;

			int count = 0;

			Vector v = new Vector();
			while (rs.next()) {
				count += 1;
				avo = new AddressVO();
				avo.setName(rs.getString("name"));
				avo.setTel(rs.getString("tel"));
				avo.setEmail(rs.getString("email"));
				avo.setBirthday(rs.getString("birthday"));
				avo.setAddress(rs.getString("address"));
				avo.setHomenumber(rs.getString("homenumber"));
				avo.setHint(rs.getString("hint"));
				v.add(avo);
			}
			avos = new AddressVO[count];

			v.copyInto(avos);

			for (int i = 0; i < avos.length; i++) {
				Vector oneRow = new Vector();
				oneRow.add(avos[i].getName());
				oneRow.add(avos[i].getTel());
				oneRow.add(avos[i].getEmail());
				oneRow.add(avos[i].getBirthday());
				oneRow.add(avos[i].getAddress());
				oneRow.add(avos[i].getHomenumber());
				oneRow.add(avos[i].getHint());
				dtm_address.addRow(oneRow);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	public void select() {
		// 가운데 정렬
		DefaultTableCellRenderer tScheduleCellRenderer = new DefaultTableCellRenderer();
		tScheduleCellRenderer.setHorizontalAlignment(SwingConstants.CENTER);
		TableColumnModel tcmSchedule = jt_address.getColumnModel();

		for (int i = 0; i < tcmSchedule.getColumnCount(); i++) {

			tcmSchedule.getColumn(i).setCellRenderer(tScheduleCellRenderer);
		}

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT name, tel, email, birthday, address, homenumber, hint FROM addressbook ORDER BY name";
		try {
			Class.forName(DeptDBConnection._DRIVER);
			con = DriverManager.getConnection(DeptDBConnection._URL, DeptDBConnection._USER, DeptDBConnection._PW);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			AddressVO avo = null;
			AddressVO avos[] = null;

			int count = 0;

			Vector v = new Vector();
			while (rs.next()) {
				count += 1;
				avo = new AddressVO();
				avo.setName(rs.getString("name"));
				avo.setTel(rs.getString("tel"));
				avo.setEmail(rs.getString("email"));
				avo.setBirthday(rs.getString("birthday"));
				avo.setAddress(rs.getString("address"));
				avo.setHomenumber(rs.getString("homenumber"));
				avo.setHint(rs.getString("hint"));
				v.add(avo);
			}
			avos = new AddressVO[count];

			v.copyInto(avos);

			for (int i = 0; i < avos.length; i++) {
				Vector oneRow = new Vector();
				oneRow.add(avos[i].getName());
				oneRow.add(avos[i].getTel());
				oneRow.add(avos[i].getEmail());
				oneRow.add(avos[i].getBirthday());
				oneRow.add(avos[i].getAddress());
				oneRow.add(avos[i].getHomenumber());
				oneRow.add(avos[i].getHint());
				dtm_address.addRow(oneRow);
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	// 화면처리
	public void initDisplay() {
		
		jm_menu.add(jmi_red);
		jm_menu.add(jmi_mint);
		jm_menu.add(jmi_green);
		jm_menu.add(jmi_pink);
		jm_menu.add(jmi_yellow);
		jmb.add(jm_menu);
		
		jm_menu2.add(jmi_up);
		jm_menu2.add(jmi_down);
		jmb.add(jm_menu2);
		
		this.setJMenuBar(jmb);
		jbtn_insert.addActionListener(this);
		jbtn_update.addActionListener(this);
		jbtn_select.addActionListener(this);
		jbtn_delete.addActionListener(this);
		jbtn_search.addActionListener(this);
		jbtn_view.addActionListener(this);
		jbtn_exit.addActionListener(this);
		jmi_red.addActionListener(this);
		jmi_mint.addActionListener(this);
		jmi_green.addActionListener(this);
		jmi_pink.addActionListener(this);
		jmi_yellow.addActionListener(this);
		jmi_up.addActionListener(this);
		jmi_down.addActionListener(this);

		this.setSize(1000, 750);
		this.setLocation(500, 150);
		this.setTitle("MVC패턴을 이용한 주소록");
		this.setVisible(true);
		jp_north.setLayout(new GridLayout(3, 1));
		jp_add.add(jlb_add);
		jp_north.add(jp_add);
		jp_first.add(jlb_name);
		jp_first.add(jtf_name);
		jp_first.add(jbtn_search);
		jp_first.add(jbtn_view);
		jp_north.add(jp_first);
		jp_buttons.add(jbtn_insert);
		jp_buttons.add(jbtn_update);
		jp_buttons.add(jbtn_delete);
		jp_buttons.add(jbtn_select);
		jp_buttons.add(jbtn_exit);
		jp_north.add(jp_buttons);
		this.add("North", jp_north);
		this.add("Center", jsp_address);
		jbtn_insert.setFont(new Font("맑은고딕", 15, 17));
		jbtn_delete.setFont(new Font("맑은고딕", 15, 17));
		jbtn_search.setFont(new Font("맑은고딕", 15, 17));
		jbtn_view.setFont(new Font("맑은고딕", 15, 17));
		jbtn_select.setFont(new Font("맑은고딕", 15, 17));
		jbtn_exit.setFont(new Font("맑은고딕", 15, 17));
		jbtn_update.setFont(new Font("맑은고딕", 15, 17));
		jlb_name.setFont(new Font("맑은고딕", 15, 17));
		jtf_name.setFont(new Font("맑은고딕", 15, 17));
		jp_first.setBackground(new Color(245,245,245));
		jp_buttons.setBackground(new Color(245,245,245));
		jsp_address.setBackground(new Color(245,245,245));
		jlb_name.setForeground(new Color(255,90,90));
		jbtn_insert.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(255,90,90));
		jbtn_delete.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(255,90,90));
		jbtn_select.setForeground(Color.white);
		jbtn_select.setBackground(new Color(255,90,90));
		jbtn_exit.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(255,90,90));
		jbtn_search.setForeground(Color.white);
		jbtn_search.setBackground(new Color(255,90,90));
		jbtn_view.setForeground(Color.white);
		jbtn_view.setBackground(new Color(255,90,90));
		jbtn_update.setForeground(Color.white);
		jbtn_update.setBackground(new Color(255,90,90));
		jt_address.setFont(new Font("맑은고딕", 15, 15));
		jt_address.setRowHeight(25);
		jt_address.setBackground(new Color(245,245,245));
		jt_address.setForeground(new Color(255,90,90));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setSelectionBackground(new Color(255,90,90));
		jt_address.setGridColor(new Color(255,255,255));
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		//jp_add.setBackground(new Color(245,245,245));
		jp_add.setBackground(new Color(245,245,245));
		//jsp_address.setBackground(new Color(245,245,245));
		jsp_address.setBackground(new Color(245,245,245));
		jlb_add.setForeground(new Color(255,90,90));
		jlb_add.setFont(new Font("고딕",40,40));
		header.setBackground(new Color(255,90,90));
		header.setForeground(Color.white);
		header.setFont(new Font("맑은고딕", Font.BOLD, 15));
		//header.getTable().setBackground(new Color(245,245,245));

		/////////////// 컬럼 너비 조정하기
		jt_address.getColumnModel().getColumn(0).setPreferredWidth(30);
		jt_address.getColumnModel().getColumn(1).setPreferredWidth(60);
		jt_address.getColumnModel().getColumn(2).setPreferredWidth(100);
		jt_address.getColumnModel().getColumn(3).setPreferredWidth(30);
		jt_address.repaint();

		// jt_address.setEnabled(false);
		header.setReorderingAllowed(false);
		header.setResizingAllowed(false);
		select();
		jt_address.getColumn("비고").setWidth(0);
		jt_address.getColumn("비고").setMinWidth(0);
		jt_address.getColumn("비고").setMaxWidth(0);
		jt_address.getColumn("집전화번호").setWidth(0);
		jt_address.getColumn("집전화번호").setMinWidth(0);
		jt_address.getColumn("집전화번호").setMaxWidth(0);

		jsp_address.getViewport().setBackground(new Color(245,245,245));
        
		this.addWindowListener(new WindowAdapter(){
            public void windowClosing(WindowEvent e) { 
                    System.exit(0);
            }
    });

	}
	
	public void red(){
		//테이블 위
		jlb_name.setForeground(new Color(255,90,90));
		jbtn_search.setBackground(new Color(255,90,90));
		jbtn_search.setForeground(Color.white);
		jbtn_view.setBackground(new Color(255,90,90));
		jbtn_view.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(255,90,90));
		jbtn_exit.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(255,90,90));
		jbtn_insert.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(255,90,90));
		jbtn_delete.setForeground(Color.white);
		jbtn_update.setBackground(new Color(255,90,90));
		jbtn_update.setForeground(Color.white);
		jbtn_select.setBackground(new Color(255,90,90));
		jbtn_select.setForeground(Color.white);
		jlb_add.setForeground(new Color(255,90,90));
		
		//테이블
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		header.setBackground(new Color(255,90,90));
		header.setForeground(Color.white);
		jt_address.setForeground(new Color(255,90,90));
		jt_address.setSelectionBackground(new Color(255,90,90));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setGridColor(new Color(255,255,255));
	}
	
	public void green(){
		//테이블 위
		jlb_name.setForeground(new Color(116,211,109));
		jbtn_search.setBackground(new Color(152,247,145));
		jbtn_search.setForeground(Color.white);
		jbtn_view.setBackground(new Color(152,247,145));
		jbtn_view.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(152,247,145));
		jbtn_exit.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(152,247,145));
		jbtn_insert.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(152,247,145));
		jbtn_delete.setForeground(Color.white);
		jbtn_update.setBackground(new Color(152,247,145));
		jbtn_update.setForeground(Color.white);
		jbtn_select.setBackground(new Color(152,247,145));
		jbtn_select.setForeground(Color.white);
		jlb_add.setForeground(new Color(116,211,109));
		
		//테이블
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		header.setBackground(new Color(152,247,145));
		header.setForeground(Color.white);
		jt_address.setForeground(new Color(116,211,109));
		jt_address.setSelectionBackground(new Color(152,247,145));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setGridColor(new Color(255,255,255));
	}
	
	public void mint(){
		//테이블 위
		jlb_name.setForeground(new Color(0,216,255));
		jbtn_search.setBackground(new Color(126,255,255));
		jbtn_search.setForeground(Color.white);
		jbtn_view.setBackground(new Color(126,255,255));
		jbtn_view.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(126,255,255));
		jbtn_exit.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(126,255,255));
		jbtn_insert.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(126,255,255));
		jbtn_delete.setForeground(Color.white);
		jbtn_update.setBackground(new Color(126,255,255));
		jbtn_update.setForeground(Color.white);
		jbtn_select.setBackground(new Color(126,255,255));
		jbtn_select.setForeground(Color.white);
		jlb_add.setForeground(new Color(0,216,255));
		
		//테이블
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		header.setBackground(new Color(126,255,255));
		header.setForeground(Color.white);
		jt_address.setForeground(new Color(0,216,255));
		jt_address.setSelectionBackground(new Color(126,255,255));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setGridColor(new Color(255,255,255));
	}
	
	public void pink(){
		//테이블 위
		jlb_name.setForeground(new Color(237,160,227));
		jbtn_search.setBackground(new Color(255,196,255));
		jbtn_search.setForeground(Color.white);
		jbtn_view.setBackground(new Color(255,196,255));
		jbtn_view.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(255,196,255));
		jbtn_exit.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(255,196,255));
		jbtn_insert.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(255,196,255));
		jbtn_delete.setForeground(Color.white);
		jbtn_update.setBackground(new Color(255,196,255));
		jbtn_update.setForeground(Color.white);
		jbtn_select.setBackground(new Color(255,196,255));
		jbtn_select.setForeground(Color.white);
		jlb_add.setForeground(new Color(237,160,227));
		
		//테이블
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		header.setBackground(new Color(255,196,255));
		header.setForeground(Color.white);
		jt_address.setForeground(new Color(237,160,227));
		jt_address.setSelectionBackground(new Color(255,196,255));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setGridColor(new Color(255,255,255));
	}

	public void yellow() {
		// 테이블 위
		jlb_name.setForeground(new Color(255,228,0));
		jbtn_search.setBackground(new Color(255,228,0));
		jbtn_search.setForeground(Color.white);
		jbtn_view.setBackground(new Color(255,228,0));
		jbtn_view.setForeground(Color.white);
		jbtn_exit.setBackground(new Color(255,228,0));
		jbtn_exit.setForeground(Color.white);
		jbtn_insert.setBackground(new Color(255,228,0));
		jbtn_insert.setForeground(Color.white);
		jbtn_delete.setBackground(new Color(255,228,0));
		jbtn_delete.setForeground(Color.white);
		jbtn_update.setBackground(new Color(255,228,0));
		jbtn_update.setForeground(Color.white);
		jbtn_select.setBackground(new Color(255,228,0));
		jbtn_select.setForeground(Color.white);
		jlb_add.setForeground(new Color(255,228,0));

		// 테이블
		jt_address.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		header.setBackground(new Color(255,228,0));
		header.setForeground(Color.white);
		jt_address.setForeground(new Color(255,228,0));
		jt_address.setSelectionBackground(new Color(255,228,0));
		jt_address.setSelectionForeground(Color.white);
		jt_address.setGridColor(new Color(255, 255, 255));
	}
	
	public void up(){
		fontSize += 2;
		jt_address.setFont(new Font("맑은고딕",15, fontSize));
	}
	
	public void down(){
		fontSize -= 2;
		jt_address.setFont(new Font("맑은고딕",15,fontSize));
	}

	// 메인메소드
	public static void main(String[] args) {
		AddressBook addressbook = new AddressBook();
		addressbook.initDisplay();
	}

	@Override
	public void actionPerformed(ActionEvent ae) {

		Object obj = ae.getSource();
		//////////////////////// 추가
		if (obj == jbtn_insert) {
			aDialog.set(jbtn_insert.getText(), open);
			aDialog.papa(this);
			avo.setColor(jlb_name.getForeground());
			aDialog.AddressVO(avo);
			jtf_name.setText("");
		}

		//////////////////////// 수정
		else if (obj == jbtn_update) {
			int row = jt_address.getSelectedRow();

			if (row == -1) {
				JOptionPane.showMessageDialog(this, "선택된 행이 없습니다.");
				return;
			}
			avo.setName(jt_address.getValueAt(row, 0).toString());
			avo.setTel(jt_address.getValueAt(row, 1).toString());
			avo.setEmail(jt_address.getValueAt(row, 2).toString());
			avo.setBirthday(jt_address.getValueAt(row, 3).toString());
			avo.setAddress(jt_address.getValueAt(row, 4).toString());
			avo.setHomenumber(jt_address.getValueAt(row, 5).toString());
			avo.setHint(jt_address.getValueAt(row, 6).toString());
			avo.setColor(jlb_name.getForeground());
			aUpdate.AddressVO(avo);
			aUpdate.papa(this);
			aUpdate.set(jbtn_update.getText(), open);
		}
		//////////////////////// 삭제
		else if (obj == jbtn_delete) {
			int row = jt_address.getSelectedRow();
			if ( row == -1 ){
				JOptionPane.showMessageDialog(this, "선택된 행이 없습니다.");
				return;
			}
			int confirm = JOptionPane.showConfirmDialog(this, "정말 삭제하시겠습니까?","확인",JOptionPane.YES_NO_OPTION,2);
			if ( confirm == JOptionPane.YES_OPTION ){
				deleteLogic = new AddressDelete();
				deleteLogic.papa(this);
			}
		}

		/////////////////////// 상세보기
		else if (obj == jbtn_select) {
			int row = jt_address.getSelectedRow();

			if (row == -1) {
				JOptionPane.showMessageDialog(this, "선택된 행이 없습니다.");
				return;
			}

			avo.setName(jt_address.getValueAt(row, 0).toString());
			avo.setTel(jt_address.getValueAt(row, 1).toString());
			avo.setEmail(jt_address.getValueAt(row, 2).toString());
			avo.setBirthday(jt_address.getValueAt(row, 3).toString());
			avo.setAddress(jt_address.getValueAt(row, 4).toString());
			avo.setHomenumber(jt_address.getValueAt(row, 5).toString());
			avo.setHint(jt_address.getValueAt(row, 6).toString());
			avo.setColor(jlb_name.getForeground());
			aSelect.AddressVO(avo);
			aSelect.papa(this);
			aSelect.set(jbtn_select.getText(), open);

		}
		/////////////////////// 검색
		else if (obj == jbtn_search) {
			if (jtf_name.getText() != null) {
				dtm_address.setNumRows(0);
				getAddressList(jtf_name.getText());
			}
			if (dtm_address.getRowCount() == 0) {
				JOptionPane.showMessageDialog(this, "없는 이름 입니다.");
				select();
			}
		}
		//////////////////////// 종료
		else if (obj == jbtn_exit) {
			System.exit(0);
		}
		//////////////////////// 전체보기
		else if (obj == jbtn_view) {
			dtm_address.setNumRows(0);
			// initDisplay();
			select();
			jtf_name.setText("");
		}
		else if ( obj == jmi_red) {
			red();
		}
		else if ( obj == jmi_mint){
			mint();			
		}
		else if ( obj == jmi_green){
			green();
		}
		else if ( obj == jmi_pink ) {
			pink();
		}
		else if ( obj == jmi_yellow ) {
			yellow();
		}
		else if ( obj == jmi_up){
			up();
		}
		else if ( obj == jmi_down){
			down();
		}
	}
}