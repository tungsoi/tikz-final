<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-TileImage" content="" />
    <meta name="msapplication-TileColor" content="#B4DFF6" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui">
    <meta property="og:title" content="Tikz.vn" />
    <title>Tạp chí Tikz</title>

    @include('admin.tikz.frontend.layouts.style')
    @yield('style')
</head>

<body>
    <div class="wrapper">
        <div class="container">
            @include('admin.tikz.frontend.layouts.banner')
            <div class="nav">
                @include('admin.tikz.frontend.layouts.menu')
            </div>

            <div class="main">
                <div class="row">
                    <div class="col-md-8 col-sm-7">
                        <div class="mainLeft">
                            <div class="homePg">
                                @yield('content')
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-5">
                        @include('admin.tikz.frontend.layouts.mainRight')
                    </div>
                </div>
            </div>
            @include('admin.tikz.frontend.layouts.footer')
        </div>

    </div>

    @include('admin.tikz.frontend.layouts.script')

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=1106189999752866&autoLogAppEvents=1"></script>

    @yield('script');
</body>

</html>
