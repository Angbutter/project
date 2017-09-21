package com.Member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class MemberLogic2 {

	public List<Map<String, Object>> getMemberList(Map<String, Object> pMap) {
		List<Map<String,Object>> memList = null;
		MemberDao2 memDao2 = new MemberDao2();
		memList=memDao2.getMemberList(pMap); 
		return memList;
	}

}
