package chatDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
public class DeptDBConnection {
	//������ �ʴ� ���̹Ƿ� ������Ų��. static �� ������ �ǹ�
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";//OracleDriver ����Ŭ����̹�
	public static final String _URL	= "jdbc:oracle:thin:@192.168.0.111:1521:orcl";
	public static final String _USER	= "scott";
	public static final String _PW		= "tiger";
	
	public static void main(String args[]){
		Connection con = null;	//����Ŭ ������ ���� ���
		Statement  stmt = null;	//DML���� ��������
		ResultSet rs = null;	//Ŀ���� ���� �� �ο쿡 ������ �� �ִµ� �� ���� Ŀ���� ���� �ϴ� ��
		try { // ����ó��
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL,_USER,_PW); 
			String sql = "SELECT deptno, dname, loc FROM dept";
			stmt = con.createStatement();//����Ŭ���� �ε�
			rs = stmt.executeQuery(sql);
			
			
		} catch (Exception e) {
			System.out.println("�����߻� : "+e.toString());
		}
	}
}