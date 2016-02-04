//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-sprockets
//= require formValidation.min
//= require bootstrap-datepicker.min
//= require_tree .


var ready;
ready = function () {
    $(function() {
        $('#actions-form').on('submit', function() {
            $('form tr input:checkbox:checked').each(function () {
                $(this).closest('tr').fadeOut();
            });
        });

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
};

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:change', ready);