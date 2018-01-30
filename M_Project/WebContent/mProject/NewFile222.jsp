<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">

.wrapper {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  height: 100vh;
  width: 100%;
}

.jump {
  text-transform: uppercase;
  color: white;
  font-size: 6.25vw;
  text-shadow: 5px 5px 0 rgba(0, 0, 0, 0.1);
  margin: 0;
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  -webkit-align-self: center;
      -ms-flex-item-align: center;
          align-self: center;
}

.jump span {
  position: relative;
  top: 0;
  -webkit-transition: all .2s;
  transition: all .2s;
  cursor: crosshair;
}

.jump span.up, .jump span:hover {
  top: -50px;
}

</style>
</head>
<body>
<div class="wrapper">
  <h2 class="jump">중고세상</h2>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
    $(function() {
      var letters = $('.jump').text().split('');
      var spans = '<span>' + letters.join('</span><span>') + '</span>';
      $('.jump').html(spans);

      var currentSpan = $('.jump span:first');

      setInterval(function() {

        // check if we grabbed the wrong one
        if(currentSpan.length === 0) {
          currentSpan = $('.jump span:first');
        }

        currentSpan.addClass('up').on('transitionend',function(){
          $(this).removeClass('up');
        });

        currentSpan = currentSpan.next();

      }, 50);

    });
</script>
</body>
</html>