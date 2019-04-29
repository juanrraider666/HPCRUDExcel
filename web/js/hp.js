$(document).ready(function() { 

$("select").wrap( "<div class='select_generico_tabla'></div>" );

$("#appbundle_deal_attributes_generada_por_toshiba_value input:radio").click(function() {
	$('#appbundle_deal_attributes_generada_por_toshiba_value .radio label').css('background-position','0 -225px');
	$(this).parent("label").css('background-position','0 -317px');
});

$("#appbundle_deal_project_reason input:radio").click(function() {
	$('#appbundle_deal_project_reason .radio label').css('background-position','0 -225px');
	$(this).parent("label").css('background-position','0 -317px');
});

$( document ).on('click', ".dropdown .btn-sm", function() {
	$(".action_dropdown_menu").remove();
	$(".dropdown-menu").prepend(  "<div class='action_dropdown_menu'></div>"  );	
});


});