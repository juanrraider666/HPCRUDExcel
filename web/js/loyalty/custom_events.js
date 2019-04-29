$(function () {
    $(".registration-new-company").on('change',function(){
        if($(this).is(":checked")){
            $("#registration-new-company-container").removeClass("hide");
            $("#registration-select-company-container").addClass("hide");
        }else{
            $("#registration-new-company-container").addClass("hide");
            $("#registration-select-company-container").removeClass("hide");
        }
    });

    $(document).ready(function(){
        $(".registration-new-company").trigger("change");
    })
});