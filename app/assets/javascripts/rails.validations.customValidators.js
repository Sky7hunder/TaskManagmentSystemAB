$(document).ready(function (){
    window.ClientSideValidations.validators.local['future_date'] = function(element, options) {
        var now = new Date();
        var due_date = element.val().split(/[!"\[\]{}%^& *:@~#';/.<>\\|`]/g);
        var due_date_js_format = new Date(due_date[2], (due_date[1]-1), due_date[0], due_date[3], (due_date[4]), 0);

        if (due_date_js_format < now){
            return options.message;
        }
        return false;
    };
});
