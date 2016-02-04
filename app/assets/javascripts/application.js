// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require formValidation.min
//= require bootstrap-datepicker.min
//= require_tree .

$(document).ready(function(){
    $('#check-all').click(function(event) {
        $('form :checkbox').each(function() {
            this.checked = true;
        });
    });

    $('#uncheck-all').click(function(event) {
        $('form :checkbox').each(function() {
            this.checked = false;
        });
    });

    var dt = new Date();

    $('#form1')
        .formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                "task[title]": {
                    validators: {
                        notEmpty: {
                            message: 'The title is required'
                        }
                    }
                },
                "task[priority]": {
                    validators: {
                        numeric: {
                            message: 'The priority is number'
                        }
                    }
                },
                "task[due_date]": {
                    validators: {
                        notEmpty: {
                            message: 'The start date is required'
                        },
                        date: {
                            format: 'DD/MM/YYYY',
                            min: dt.getDate() + "/" + (dt.getMonth() + 1) + "/" + dt.getFullYear(),
                            message: 'The start date is not valid'
                        }
                    }
                }
            }
        })
        .find('[name="task[due_date]"]')
            .datepicker({
                format: 'dd/mm/yyyy'
            })
            .on('changeDate', function(e) {
                // Revalidate the field when choosing it from the datepicker
                $('#form1').formValidation('revalidateField', 'task[due_date]');
            })
});
