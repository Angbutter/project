package com.mvc;
/*package com.mvc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ch5.DeptDBConnection;

public class SearchLogic {
   Connection          con = null;
   PreparedStatement pstmt = null;
   ResultSet          rs   = null;
   public AddressVO searchAddress(AddressVO pvo) {
      // TODO Auto-generated method stub
      return null;
   }

   public AddressVO[] selectAll(AddressVO pvo) {
      StringBuilder sql = new StringBuilder();
      sql.append("SELECT num, name, hp, address");
        sql.append("  FROM address_tb            ");
        AddressVO avos[] = null;
        try {
           Class.forName(DeptDBConnection._DRIVER);
         con = DriverManager.
                        getConnection(DeptDBConnection._URL
                                  ,DeptDBConnection._USER
                                  ,DeptDBConnection._PW);
         
         pstmt = con.prepareStatement(sql.toString());

 * ����Ŭ �������� �ۼ��� sql���� ��û�� �� ����ϴ� �޼ҵ尡 �ִ�.
 * �Է�, ����, ������ �� executeUpdate():int
 * ��ȸ�϶� executeQuerey():Resultset - dbĿ���� ������ �� �ִ�.
 
         rs = pstmt.executeQuery();
         Vector v = new Vector();
         AddressVO avo = null;
         while(rs.next()){
            avo = new AddressVO();
            avo.setName(rs.getString("name"));
            avo.setTel(rs.getString("tel"));
            avo.setAddress(rs.getString("address"));
            avo.setHomenumber(rs.getInt("homenumber"));
            v.add(avo);
         }
         avos = new AddressVO[v.size()];
         //Vector�� ����� AddressVO �ּҹ����� ��ü �迭��
         //�״�� ������
         v.copyInto(avos);
         System.out.println("����ũ��:"+v.size());
        } catch (SQLException se){
           System.out.println("[[query]]"+sql.toString());
        } catch (Exception e) {
         System.out.println(e.toString());
         e.printStackTrace();
      }
      return avos;
   }

}*/