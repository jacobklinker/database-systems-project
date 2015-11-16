jQuery(document).ready(function($) {
	$(".clickable-row").click(function() {
		location.href = $(this).data("href");
	});
	
	$(".clickable-cell").click(function() {
		location.href = $(this).data("href");
	});
});