$(document).ready(function(){
	$("table.list-table").on("click", "th", function(){
		if($(this).hasClass("0"))
			$("table.list-table").tablesorter({sortList:[[0,0]]});
		else if($(this).hasClass("1"))
			$("table.list-table").tablesorter({sortList:[[1,0]]});
		else if($(this).hasClass("2"))
			$("table.list-table").tablesorter({sortList:[[2,0]]});
		else if($(this).hasClass("3"))
			$("table.list-table").tablesorter({sortList:[[3,0]]});
		else if($(this).hasClass("4"))
			$("table.list-table").tablesorter({sortList:[[4,0]]});
	});
})