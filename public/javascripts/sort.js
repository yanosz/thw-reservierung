jQuery.noConflict();
jQuery(document).ready(function(){
	if(jQuery("#list-table").hasClass("rentals"))
		sortOrder = [[2,0][3,0][0,0]]
	else
		sortOrder = [[0,0]]

	jQuery("#list-table").tablesorter({ 
		sortList: sortOrder,
		dateFormat : "ddmmyyyy",
		widgets: ['zebra'],
		widgetOptions: {
			zebra : ["even", "odd"]
		}	
	});
})