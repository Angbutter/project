package Mproject.util;

import java.util.HashMap;
import java.util.Iterator;

public class PageBar {
	private int totalRecord;       //전체 레코드 갯수
	private int numPerPage;   //페이지당 default 글수
	private int pagePerBlock=5; //블록당 default 페이지수
	private int totalPage;         //총페이지수
	private int totalBlock;        //총블록수
	private int nowPage;           //현재페이지
	private int nowBlock;          //현재 블럭

	private String pagePath;       //리스트페이지 경로
	private String tblBar;         //페이지바
	
	//페이지 네비게이션 초기화
	public PageBar(){}
	public PageBar(int numPerPage, int totalRecord, int nowPage, String pagePath){
		this.numPerPage = numPerPage;
		this.totalRecord = totalRecord;
		this.nowPage = nowPage;
		this.pagePath = pagePath;
		this.totalPage = (int)Math.ceil((double)this.totalRecord/this.numPerPage);
		this.totalBlock = (int)Math.ceil((double)this.totalPage/this.pagePerBlock);
		this.nowBlock =(int)((double)this.nowPage/this.pagePerBlock);
	}
	 
	//페이지 네비게이션 설정
	public void setPageBar(){
		StringBuffer pageLink = new StringBuffer();
		if(totalRecord > 0){
			if(nowBlock > 0){
				pageLink.append("<a href='"+pagePath+"?page="+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+"'>");			
				pageLink.append("<img border=0 src='/Mproject/images/bu_a.gif'>");
				pageLink.append("</a>&nbsp;&nbsp;");
			}
			for(int i=0;i<pagePerBlock;i++){
				//내가 현재 보고있는 페이지 블록이다.
				if(nowBlock*pagePerBlock+i == nowPage){
					pageLink.append("<b>"+(nowBlock*pagePerBlock+i+1)+"</b>&nbsp;");
				}else{
					pageLink.append("<a href='"+pagePath+"?page="+((nowBlock*pagePerBlock)+i)
							+"'>"+((nowBlock*pagePerBlock)+i+1)+"</a>&nbsp;");					
				}
				if((nowBlock*pagePerBlock)+i+1 == totalPage) break;
			}
			//현재 블록에서 다음 블록이 존재할 경우 이미지 추가하고 페이지 이동할 수 있도록 링크
			if(totalBlock > nowBlock+1){
				pageLink.append("&nbsp;&nbsp;<a href='"+pagePath+"?page="
				+((nowBlock+1)*pagePerBlock)+"'>");
				pageLink.append("<img border=0 src='/Final/images/bu_b.gif'>");
				pageLink.append("</a>");
			}
		}// if ended
		tblBar = pageLink.toString();
	}//setPageBar() ended
	//페이지네비게이션 리턴
	public String getPageBar(){
		this.setPageBar();
		return tblBar;
	}
}








