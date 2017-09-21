package com.Member;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MemberDao2 {
	Logger logger = 
	         Logger.getLogger(MemberDao.class);
	   SqlSessionFactory sqlMapper = null;
	   //오라클 서버 커넥션 맺음- commit, rollback
	   SqlSession sqlSes = null;
	   String resource =
	         "Final/mybatis/MapperConfig.xml";
	   public List<Map<String, Object>> getMemberList(Map<String, Object> pMap) {
	      List<Map<String,Object>> memList = null;
	   try {
	      Reader reader = null;
	      reader = 
	            Resources.getResourceAsReader(resource);
	      sqlMapper =
	            new SqlSessionFactoryBuilder()
	                        .build(reader);
	      sqlSes = sqlMapper.openSession();
	      String deptm_name = (String)pMap.get("deptm_name");
	      //logger.info("부서명:"+deptm_name);
	      memList = sqlSes.selectList("angApprovalList",deptm_name);
	      logger.info("memList:"+memList.size());
	   } catch (Exception e) {
	      logger.info("Exception:"+e.getMessage());
	   }
	   return memList;
	   }

}
