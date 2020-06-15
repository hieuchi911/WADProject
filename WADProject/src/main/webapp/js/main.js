$(document).ready(function(){
	
    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });
    
    /*-------------------
        Quantity change
    --------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        if (isNaN(newVal)) {
        	newVal = 0;
        }
        $button.parent().find('input').val(newVal);
    });

    /*-------------------
    	Edit basic info
	--------------------- */
    var basic_tog = 0;
    $("#edit-basic-confirm").hide();
    $("#edit-basic").click(function() {
    	$("#edit-basic-confirm").toggle();	basic_tog ^= 1;
    	if (basic_tog == 1)
    		$("#patientForm input").prop("disabled", false);
    	else 
    		$("#patientForm input").prop("disabled", true);
    });
    
    /*-------------------
		Edit password
	--------------------- */
	$("#passwordSection").hide();
    $("#edit-password").click(function() {
    	$("#passwordSection").slideToggle("fast");
    });
    
    /*-------------------
		Edit patient report
	--------------------- */
    var report_tog = 0;
    $("#edit-report-confirm").hide();
    $("#edit-report").click(function() {
    	$("#edit-report-confirm").toggle();	report_tog ^= 1;
    	if (report_tog == 1)
    		$("#report textarea").prop("disabled", false);
    	else 
    		$("#report textarea").prop("disabled", true);
    });
    
    /*-------------------
		Form input
	--------------------- */	
    $('.numbers').on('keyup keydown input focusout', function () { 
        this.value = this.value.replace(/[^0-9]/g,'');
    });
    $('.characters').on('keyup keydown input focusout', function () { 
        this.value = this.value.replace(/[^a-zA-Z0-9\.]/g,'');
    });
    $('.letters').on('keyup keydown input focusout', function () { 
        this.value = this.value.replace(/[^a-zA-Z \.]/g,'');
    });
    $('.ln').on('keyup keydown input focusout', function () { 
        this.value = this.value.replace(/[^a-zA-Z0-9 \.]/g,'');
    });
})(jQuery);