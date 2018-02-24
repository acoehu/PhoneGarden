<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
</head>
<body>
<input type="text" id='search' />
	<div class='vs'>
	<div id='header 1'>content 1 here </div>
	<div id='header 2'>another text  </div>
	<div id='header 3'>whatever </div>
	</div>   
	<script>
	$('#search').on('input', function(){
	    var text = $(this).val();
	    $('.vs div').show();    
	    $('.vs div:not(:contains(' + text + '))').hide();
	});</script>
</body>
</html>