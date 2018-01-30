package Mproject.util;

public class KoreanConversion {
	public static String toUTF(String en){
		if(en == null){
			return null;
		}
		try {
			return new String(en.getBytes("8859_1"),"utf-8");
		} catch (Exception e) {	
			// TODO: handle exception
			return en;
		}
	}
	public static String toKor(String en){
		if(en == null){
			return null;
		}
		try {
			return new String(en.getBytes("8859_1"),"euc-kr");
		} catch (Exception e) {	
			// TODO: handle exception
			return en;
		}
	}
}
