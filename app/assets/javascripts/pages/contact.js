$document.on('ready page:load', function(){
    $('input[type=tel]').mask("+38 (999) 99 99")

    //var $form = $('form')
    //var $validatable_fields = $form.find('[data-validate]')
    //
    //$validatable_fields.on('change', function(){
    //
    //})

    //$validatable_fields.each(function(){
    //    var $field = $(this)
    //    var validate_options = $field.attr('data-validate').split(' ')
    //    if(validate_options.indexOf('presence') >= 0){
    //
    //    }
    //
    //})

    $('form').validate({
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true
            },
            message_text: {
                required: true//,
                //minlength: 2
            },
            onsubmit: true,
            onfocusout: true,
            onkeyup: true
        },
        messages: {
            name: {
                required: "Ваше ім'я не може бути порожнім",
                minlength: "Ваше ім'я: мынымум 2 символи"
            },
            email: {
                required: "Електронна скринька не може бути порожнею",
                email: "Неправильна електронна скринька"
            },
            phone: {
                required: "Телефон не може бути порожнім"
            },
            message_text: {
                required: "Повідомлення не може бути порожнім"
            }

        }
    })
})