package chat;

import java.awt.Color;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.swing.JOptionPane;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;

public class FinalClientThread extends Thread {
	WaitingRoom wr = null;
	ChattingRoom chattingroom = null;
	StringTokenizer st = null;
	FinalServer fs = null;

	/*
	 * public FinalClientThread(ChattingRoom chattingroom){
	 * this.chattingroom=chattingroom; }
	 */
	public FinalClientThread(WaitingRoom wr) {
		this.wr = wr;
	}

	public SimpleAttributeSet makeAttribute(String style) {
		SimpleAttributeSet sas = new SimpleAttributeSet();
		sas.addAttribute(StyleConstants.ColorConstants.Foreground, new Color(Integer.parseInt(style)));
		return sas;
	}

	public FinalClientThread(ChattingRoom chattingroom) {
		this.chattingroom = chattingroom;
	}

	@Override
	public synchronized void run() {
		String message = "";
		boolean isStop = false;
		while (!isStop) {
			try {
				message = (String) wr.ois.readObject();

				int separate = 0;
				if (message != null) {
					st = new StringTokenizer(message, "#");
					separate = Integer.parseInt(st.nextToken());
				}
				switch (separate) {
				case Separate.LOGIN:
					break;
				case Separate.EXIT: // 700
					break;
				case Separate.CREATE_ROOM: { // 600
					String title = st.nextToken();
					int max = Integer.parseInt(st.nextToken());
					int current = 1;
					Vector a = new Vector();
					a.add(title);
					a.add(current);
					a.add(max);
					wr.dtm_menu.addRow(a);
				}
					break;
				case Separate.WAIT_ROOM: {
					String title = st.nextToken();
					int current = Integer.parseInt(st.nextToken());
					int max = Integer.parseInt(st.nextToken());
					for (int i = 0; i < wr.dtm_menu.getRowCount(); i++) {
						if (title.equals(wr.dtm_menu.getValueAt(i, 0))) {
							wr.dtm_menu.removeRow(i);
						}
					}
					if (current != 0) {
						Vector a = new Vector();
						a.add(title);
						a.add(current);
						a.add(max);
						wr.dtm_menu.addRow(a);
					}
				}
					break;

				case Separate.ROOM_IN: {
					String nickName = st.nextToken();
					Vector a = new Vector();
					a.add(nickName);
					wr.cr.chattingroom.dtm_join.addRow(a);
					wr.cr.chattingroom.sd_chat.insertString(wr.cr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■■■■[알림] : '" + nickName + "' 입장■■■■■■■■■■\n", wr.cr.chattingroom.attr);
				}
					break;
				case Separate.ROOM_IN2: {
					String nickName = st.nextToken();
					Vector a = new Vector();
					a.add(nickName);
					wr.chattingroom.dtm_join.addRow(a);
					wr.chattingroom.sd_chat.insertString(wr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■■■■[알림] : '" + nickName + "' 입장■■■■■■■■■■\n", wr.chattingroom.attr);
				}
					break;
				case Separate.ROOM_OUT: {
					String nickName = st.nextToken();
					String title = st.nextToken();
					wr.cr.chattingroom.sd_chat.insertString(wr.cr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■■■■[알림] : '" + nickName + "' 퇴장■■■■■■■■■■\n", wr.cr.chattingroom.attr);
					for (int i = 0; i < wr.cr.chattingroom.dtm_join.getRowCount(); i++) {
						if (nickName.equals(wr.cr.chattingroom.dtm_join.getValueAt(i, 0))) {
							wr.cr.chattingroom.dtm_join.removeRow(i);
						}
					}
					wr.cr.chattingroom.jtp_chat.setCaretPosition(wr.cr.chattingroom.jtp_chat.getDocument().getLength());
					if (wr.cr.chattingroom.dtm_join.getRowCount() == 0) {
						for (int i = 0; i < wr.dtm_menu.getRowCount(); i++) {
							if (title.equals(wr.dtm_menu.getValueAt(i, 0))) {
								wr.dtm_menu.removeRow(i);
							}
						}
					}
				}
					break;
				case Separate.ROOM_OUT2: {
					String nickName = st.nextToken();
					String title = st.nextToken();
					wr.chattingroom.sd_chat.insertString(wr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■■■■[알림] : '" + nickName + "' 퇴장■■■■■■■■■■\n", wr.chattingroom.attr);
					for (int i = 0; i < wr.chattingroom.dtm_join.getRowCount(); i++) {
						if (nickName.equals(wr.chattingroom.dtm_join.getValueAt(i, 0))) {
							wr.chattingroom.dtm_join.removeRow(i);
						}
					}
					wr.chattingroom.jtp_chat.setCaretPosition(wr.chattingroom.jtp_chat.getDocument().getLength());
					if (wr.chattingroom.dtm_join.getRowCount() == 0) {
						for (int i = 0; i < wr.dtm_menu.getRowCount(); i++) {
							if (title.equals(wr.dtm_menu.getValueAt(i, 0))) {
								wr.dtm_menu.removeRow(i);
							}
						}
					}
				}
					break;
				case Separate.TALK: {
					String nickName = st.nextToken();
					String msg = st.nextToken();
					String color = st.nextToken();
					SimpleAttributeSet sas = makeAttribute(color);
					wr.cr.chattingroom.sd_chat.insertString(wr.cr.chattingroom.sd_chat.getLength(),
							"[" + nickName + "] : " + msg + "\n", sas);
					wr.cr.chattingroom.jtp_chat.setCaretPosition(wr.cr.chattingroom.jtp_chat.getDocument().getLength());
				}
					break;
				case Separate.TALK2: {
					String nickName = st.nextToken();
					String msg = st.nextToken();
					String color = st.nextToken();
					SimpleAttributeSet sas = makeAttribute(color);
					wr.chattingroom.sd_chat.insertString(wr.chattingroom.sd_chat.getLength(),
							"[" + nickName + "] : " + msg + "\n", sas);
					wr.chattingroom.jtp_chat.setCaretPosition(wr.chattingroom.jtp_chat.getDocument().getLength());
				}
					break;
				case Separate.CHANGE: {
					String nickName = st.nextToken();
					String afterName = st.nextToken();
					wr.cr.chattingroom.sd_chat.insertString(wr.cr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■[대화명변경] : '" + nickName + "' → '" + afterName + "' ■■■■■■■\n",
							wr.cr.chattingroom.attr);
					wr.cr.chattingroom.jtp_chat.setCaretPosition(wr.cr.chattingroom.jtp_chat.getDocument().getLength());
					for (int i = 0; i < wr.cr.chattingroom.dtm_join.getRowCount(); i++) {
						if (nickName.equals(wr.cr.chattingroom.dtm_join.getValueAt(i, 0))) {
							wr.cr.chattingroom.dtm_join.setValueAt(afterName, i, 0);
						}
					}
				}
					break;
				case Separate.CHANGE2: {
					String nickName = st.nextToken();
					String afterName = st.nextToken();
					wr.chattingroom.sd_chat.insertString(wr.chattingroom.sd_chat.getLength(),
							"\t\t\t■■■■■■■[대화명변경] : '" + nickName + "' → '" + afterName + "' ■■■■■■■\n",
							wr.chattingroom.attr);
					wr.chattingroom.jtp_chat.setCaretPosition(wr.chattingroom.jtp_chat.getDocument().getLength());
					for (int i = 0; i < wr.chattingroom.dtm_join.getRowCount(); i++) {
						if (nickName.equals(wr.chattingroom.dtm_join.getValueAt(i, 0))) {
							wr.chattingroom.dtm_join.setValueAt(afterName, i, 0);
						}
					}
				}
					break;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

}