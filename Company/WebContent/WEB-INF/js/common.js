/**
 * 팝업창 처리를 위한 공통 코드
 * 함수를 정의할 때, 객체를 정의할 때 function 사용
 * @param 		  url - 내가 popup으로 띄울 페이지의 이름과 경로...(상대경로, 절대경로)
 * @param  popupwidth - 팝업으로 띄울 창의 폭 길이 px
 * @param popupheight - 팝업으로 띄울 창의 높이 px
 * @param   popupname - 팝업창의 이름(여러개 일 경우 식별하기 위해서)
 */

function cmm_window_popup(url
		 				, popupwidth
		 				, popupheight
		 				, popupname)
{
	/*
	 * 
	 */
	Top = (window.screen.height-popupheight)/3; // 윈도우 스크린의 해상도 높이
	Left = (window.screen.width-popupwidth)/2;
	if ( Top < 0 ) Top = 0;
	if ( Left < 0 ) Left = 0;
	options = "location=no, fullscreen=no, status=yes, left=" + Left + ", top=" + Top + 
	", width=" + popupwidth + ", height=" + popupheight;
	popupname = window.open(url, popupname, options);
	popupname.focus();
	
}