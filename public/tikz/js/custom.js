/* ===== All custom functions here ===== */
var Global = {
    init: function() {
        $(".hw-date").datepicker('setDate', new Date());
        //var arrDiscount = [];
        //Object.keys(discount).map(function (key) { return arrDiscount[key] = discount[key]; });

        if($('select[name=range_time]').length && $('input[name=quantity]').length) {
            var $label = $('.total-amout');
            $('select[name=range_time]').on('change',function() {
                var $range_time = $(this).val();
                    $number = $('input[name=quantity]').val();
                    time_from = $('input[name=time_from]').val();
                $total = Global.caculatePrice($range_time, $number, arrDiscount);
                $label.html($total+' VND');
            });
            $('input[name=quantity]').on('change',function() {
                var $range_time = $('select[name=range_time]').val();
                    $number = $(this).val();
                time_from = $('input[name=time_from]').val();
                $total = Global.caculatePrice($range_time, $number, arrDiscount);
                $label.html($total+' VND');
            });
            $(".hw-date").datepicker().on('changeDate',
                function (e) {
                    var $range_time = $('select[name=range_time]').val();
                    $number = $('input[name=quantity]').val();
                    $total = Global.caculatePrice($range_time, $number, arrDiscount);
                    $label.html($total+' VND');
                }
            );
        }
    },

    caculatePrice: function ($range_time, $number, arrDiscount) {
        month = new Date($(".hw-date").datepicker('getDate')).getMonth() + 1;
        year = new Date($(".hw-date").datepicker('getDate')).getFullYear();
        total = $range_time * PRICE_MAGAZINE * $number;

        if (arrDiscount) {
            amount = 0;
            arrDiscount.forEach(function (val) {
                if ($range_time == val.range_time && year == val.year) {
                    amount = val.discount;
                }
            });
            total = $range_time * PRICE_MAGAZINE * $number - $number * amount;
            if (month !== 1 && year < (new Date()).getFullYear()) {
                total = $range_time * PRICE_MAGAZINE * $number;
            }
        }
        return total;
    },
}

/*js for follow*/
$(document).ready(function () {
    Global.init();
    $(document).on('click','#submit-follow', function (){
        var data = $('#follow').val();
        $.ajax({
            url: BASE_URL + '/pages/follow',
            type: 'POST',
            data: { email: data },
            dataType: 'JSON',
            success: function (data) {
                $('#message-follow').html(data.message);
                $('#message-follow').show();
                if(data.check) {
                    $('#message-follow').addClass('error');
                } else {
                    $('#message-follow').addClass('success');
                }

                setTimeout(function(){
                    $('#message-follow').hide();
                }, 5000);
            },
        })
        return false;
    });

/*Js for read online button read file*/
    $(document).on('click','#btn-read-online', function () {
        var files_id = document.getElementById("files_id").innerHTML;
        var files_slug = document.getElementById("files_slug").innerHTML;
        var magazine_id = document.getElementById("magazine_id").innerHTML;
        $.ajax({
            url: BASE_URL+'pages/read_file',
            type: 'POST',
            data: { magazine_id:magazine_id },
            dataType: 'JSON',
            success: function (data) {
                if(data.check === 1) {
                    window.location = BASE_URL+'magazines/file/'+ files_slug+'-'+files_id+'.html';
                    target = '_blank';
                    done=1
                } else if(data.check === 0) {
                    document.getElementById("cssmenu").style.zIndex = "1";
                    $('#popup-read-file').modal('show');
                } else if(data.check === 2){
                    document.getElementById("cssmenu").style.zIndex = "1";
                    $('#popup-please-wait').modal('show');
                }

            },
        })
        return false;

    });
/* Js for read online button at Side-bar*/
    $(document).on('click','#read-online-single', function () {
        $.ajax({
            url: BASE_URL+'pages/read_online_ajax',
            type: 'POST',
            dataType: 'JSON',
            success: function (data) {
                if(data.check === 0) {
                    document.getElementById("cssmenu").style.zIndex = "1";
                    $('.popup-read-online-pending').modal('show');
                } else if(data.check === 1) {
                    document.getElementById("cssmenu").style.zIndex = "1";
                    $('.popup-read-online-default').modal('show');
                }else if(data.check ===2) {
                    document.getElementById("cssmenu").style.zIndex = "1";
                    $('.popup-read-online-active').modal('show');
                }
                setTimeout(function(){
                    $('.modal').modal('hide');
                }, 5000);
            },
        })
        return false;

    });
/*JS for contact us*/
    /*Validate for contact us*/
    $(document).ready(function () {
        if ($('#form-contact').length) {
            $('#form-contact').validate({ // initialize the plugin
                rules: {
                    email: {
                        required: true,
                        email:true,
                    },
                    phone: {
                        required: true,
                        number: true,
                        rangelength: [8, 11]
                    },
                    content: {
                        required: true,
                        maxlength: 3000
                    }
                },
                submitHandler: function(form) {
                    var data_email = $('#email-contact').val();
                    var data_phone = $('#phone-contact').val();
                    var data_content = $('#content-contact').val();
                    $.ajax({
                        url: BASE_URL + 'contact-us',
                        type : 'POST',
                        data: {
                            email:data_email,
                            phone:data_phone,
                            content:data_content,
                        },
                        dataType:'JSON',
                        success:function(data){
                            if(data.check){
                                document.getElementById("cssmenu").style.zIndex = "1";
                                $('.send-contact-complete').modal('show');
                            }else{
                                document.getElementById("cssmenu").style.zIndex = "1";
                                $('.send-contact-error').modal('show');
                                setTimeout(function(){
                                    $('.message-contact').modal('hide');
                                }, 5000);
                            }
                        }

                    })
                    return false;
                }
            });

            $('.btn-submit-contact').click(function() {
                $("#form-contact").valid();
            });
        }


    });



/*JS for book magazine*/
    /*Validate for book magazine*/
    $("#select_range_time").change(function(){
        var range_time = $(".form-book-magazine select option:selected").val();
        if(range_time){
            var total = range_time * $('#price_per_month').val();
            document.getElementById("pay_total").innerHTML = total;
            $(".pay_total").show()
        }
    });



/* JS for comment*/
    $(document).ready(function () {
        if ($('#form-comment').length) {
            $('#form-comment').validate({ // initialize the plugin
                rules: {
                    content: {
                        required: true,
                        maxlength: 3000
                    }
                },
                submitHandler: function (form) {

                    var data_content = $('#content_comment').val();
                    var data_member_id = $('#member_id').val();
                    var data_news_id = $('#news_id').val();
                    var data_magazine_id = $('#mag_id').val();
                    if(data_member_id === '') {
                        document.getElementById("cssmenu").style.zIndex = "1";
                        $('.modal').modal('hide');
                        $('.comment-login').modal('show');
                    }else{
                        $.ajax({
                            url: BASE_URL + '/pages/comment',
                            type: 'POST',
                            data: {
                                content: data_content,
                                member_id: data_member_id,
                                news_id: data_news_id,
                                magazine_id: data_magazine_id,
                            },
                            dataType: 'JSON',
                            success: function (data) {
                                if (data.check) {
                                    document.getElementById("cssmenu").style.zIndex = "1";
                                    $('.comments').modal('hide');
                                    document.getElementById("comment-success").innerHTML = data.message;
                                } else {
                                    document.getElementById("cssmenu").style.zIndex = "1";
                                    $('.comments').modal('hide');
                                    $('#content_comment').val("");
                                    document.getElementById("comment-success").innerHTML = data.message;
                                }
                                setTimeout(function () {
                                    $('#comment-success').hide();
                                }, 5000);
                            },
                        })
                        return false;
                    }
                }
            })

            $('#submit-comment').click(function() {
                $("#form-comment").valid();
            });
        }

    });




});
/* Redirect to Page*/
function redirectToPage(){
    window.location.href = BASE_URL;
}

