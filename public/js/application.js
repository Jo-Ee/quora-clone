$(document).ready(function(){
	$('vote_buttons').click(function(){
		$(document).on('click','vote_buttons', function(){
			$(this).remove()
		});
	});
});


// $(document).ready(function(){
//     $('#button').click(function(){
//         var toAdd = $('input[name=checkListItem]').val();
//         $('.list').append('<p>' +toAdd +'</p>')
//         });
//     $(document).on('click','.item', function(){
//         $(this).remove();
//         });
//     });