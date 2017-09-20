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

 * 오라클 서버에게 작성한 sql문을 요청할 때 사용하는 메소드가 있다.
 * 입력, 수정, 삭제일 땐 executeUpdate():int
 * 조회일땐 executeQuerey():Resultset - db커서를 조작할 수 있다.
 
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
         //Vector에 저장된 AddressVO 주소번지를 객체 배열에
         //그대로 복제함
         v.copyInto(avos);
         System.out.println("벡터크기:"+v.size());
        } catch (SQLException se){
           System.out.println("[[query]]"+sql.toString());
        } catch (Exception e) {
         System.out.println(e.toString());
         e.printStackTrace();
      }
      return avos;
   }

}*/