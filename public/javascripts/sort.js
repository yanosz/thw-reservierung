jQuery.noConflict();
jQuery(document).ready(function(){
	jQuery("table.list-table").on("click", "th", function(){
		if(jQuery(this).hasClass("0"))
			jQuery("table.list-table").tablesorter({sortList:[[0,0]]});
		else if(jQuery(this).hasClass("1"))
			jQuery("table.list-table").tablesorter({sortList:[[1,0]]});
		else if(jQuery(this).hasClass("2"))
			jQuery("table.list-table").tablesorter({sortList:[[2,0]]});
		else if(jQuery(this).hasClass("3"))
			jQuery("table.list-table").tablesorter({sortList:[[3,0]]});
		else if(jQuery(this).hasClass("4"))
			jQuery("table.list-table").tablesorter({sortList:[[4,0]]});
	});
})