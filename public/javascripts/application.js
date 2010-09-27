$(document).ready(function() {
	
	// $('#paintbox li').click(function(e){		
	// 
	// 	// e.preventDefault();
	// 
	// 	var color 	= $.trim($(this).text()),
	// 			picker 	= $('#swatch_colors_value');
	// 			
	// 	picker.focus()
	// 	picker.val(color);						
	// 
	// });

	// a fake change
	
	$('#new_swatch').submit(function() {
		
	  $.ajax({
      url: $(this).attr("action") + '.js', 
			type: 'POST',
			data: $(this).serialize(),
			dataType: 'html',
      success: function(item) {

				// var value = $(item).text();
				// $(item).attr('background', '#fff');				
				// $(item).css('opacity', 0)
				// console.log($(item));

				$('#paintbox').prepend(item);
      }
		});
		
		return false;	

	});
	
});