package chatDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
public class DeptDBConnection {
	//변하지 않는 값이므로 고정시킨다. static 은 공유의 의미
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";//OracleDriver 오라클드라이버
	public static final String _URL	= "jdbc:oracle:thin:@192.168.0.111:1521:orcl";
	public static final String _USER	= "scott";
	public static final String _PW		= "tiger";
	
	public static void main(String args[]){
		Connection con = null;	//오라클 서버와 연결 통로
		Statement  stmt = null;	//DML문장 가져갈때
		ResultSet rs = null;	//커서를 통해 각 로우에 접근할 수 있는데 그 때의 커서를 조작 하는 것
		try { // 예외처리
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL,_USER,_PW); 
			String sql = "SELECT deptno, dname, loc FROM dept";
			stmt = con.createStatement();//전령클래스 로딩
			rs = stmt.executeQuery(sql);
			
			
		} catch (Exception e) {
			System.out.println("에러발생 : "+e.toString());
		}
	}
}