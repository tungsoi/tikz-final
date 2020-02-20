{{-- <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script> --}}
<script type="text/javascript">
    var BASE_URL = 'http://Tikz.edu.vn/';

    var PRICE_MAGAZINE = '25000 - 30000';
    var PRICE_READ_ONLINE = '25000';
    var discount = [{
        "range_time": "12",
        "year": "2019",
        "discount": "50000"
    }];
</script>
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js"></script> --}}
<script src="{{ asset('tikz/js/jquery.js') }}"></script>
<script src="{{ asset('tikz/js/jquery.validate.min.js') }}"></script>
<script src="{{ asset('tikz/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('tikz/js/bootstrap-datepicker.min.js') }}"></script>
<script src="{{ asset('tikz/js/slide/jquery.bxslider.js') }}"></script>
<script src="{{ asset('tikz/js/scriptNav.js') }}"></script>
<script src="{{ asset('tikz/js/custom.js') }}"></script>
<script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.17.1/build/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script src="https://unpkg.com/clipboard@2/dist/clipboard.min.js"></script>
<script src="{{ asset('tikz/js/zoom.js') }}"></script>

<script language="JavaScript">
    $(document).ready(function() {
        $('.bxslider').bxSlider({
            auto: true,
            autoControls: true
        });
    });
    $(".hw-date").datepicker({
        format: 'mm-yyyy',
        changeMonth: true,
        changeYear: true,
        yearRange: '2017:2019',
        startView: "months",
        minViewMode: "months",
        language: 'vi'
    }).keydown(false);

    let path = window.location.pathname;
    let href = "";

    if (path.split('/')[1] == 'pics' || path.split('/')[1] == '') {
        href = '/pics';
    } else if (path.split('/')[1] == 'categories') {
        href = '/categories';
    } else if (path.split('/')[1] == 'posts') {
        href = '/posts';
    }
    else {
        href = '/page/'+path.split('/')[2];
    }

    $('#cssmenu li').removeClass('active');
    $('#cssmenu a[href="'+href+'"]').parent().addClass('active');

    $('#menu-button img').click(function () {
        $('.div-nmenu').toggle();
    });
</script>
