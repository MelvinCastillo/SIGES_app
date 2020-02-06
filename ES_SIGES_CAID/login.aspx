<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CAID.login" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title></title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <!-- icheck -->
    <link rel="stylesheet" href="css/plugins/icheck/all.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="css/themes.css">
	<link rel="stylesheet" href="css/background.css">
		
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Nice Scroll -->
    <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- Validation -->
    <script src="js/plugins/validation/jquery.validate.min.js"></script>
    <script src="js/plugins/validation/additional-methods.min.js"></script>
    <!-- icheck -->
    <script src="js/plugins/icheck/jquery.icheck.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/eakroko.js"></script>



        <%--Toast Message--%>
    <script>
        function toast(options) {
            var data = [
              '<div style="color:white;font-size: 18px;left:50%;position:absolute;min-width:50px;background:rgb(88,88,88);padding:15px;font-family:arial;border:solid 1px #555;display:none;box-shadow:0px 0px 2px green;" class="toast">',
                '<div style="color:white;" class="toast-body">',
                '</div>',
              '<div>'
            ];

            var $toast = $(data.join(''));
            $toast.find(".toast-body").text(options.message);

            $toast.appendTo("body");
            $toast.fadeIn('fast', function () {
                setTimeout(function () {
                    $toast.fadeOut(function () {
                        $toast.remove();
                    });
                }, options.duration | 2000);
            }).css({
                marginLeft: (($toast.width() / 2) * -1) + "px",
                top: "10%",
                zIndex: "1000"
            });

        };

    </script>

    <!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" />
    <!-- Apple devices Homescreen icon -->
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
</head>
<div id="fullscreen_bg" class="fullscreen_bg"/>  
<body class='login theme-satblue' runat="server">
    <div class="wrapper">
        <h1>
            <a href="login.aspx" style="color:rgba(17, 61, 103, 0.79);">
                <img src="img/logo-big.png1" alt="" class='retina-ready' width="59" height="49"><strong>SIGES</strong></a></h1>
        <div class="login-body" style="background-color:rgba(31, 112, 190, 0.81);">
            <h2 style="color:white;">
                Log In</h2>
            <form runat="server" id="loginForm">
            <div class="control-group">
                <div class="controls">
                    <select runat="server" id="cmbEmpresa" class='input-block-level' data-rule-required="true" datavaluefield="1" datatextfield="1" >
                    </select>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input runat="server" id="txtUsuario" type="text" placeholder="Usuario" class='input-block-level' value="m.castillo"
                        data-rule-required="true" onkeydown="if (event.keyCode == 13) document.getElementById('btnLogin').click()" />
                </div>
            </div>
            <div class="control-group">
                <div class="pw controls">
                    <input runat="server" id="txtClave" type="password" placeholder="Password" class='input-block-level' value="123456"
                        data-rule-required="true" onkeydown="if (event.keyCode == 13) document.getElementById('btnLogin').click()" />
                </div>
            </div>
        
            <div class="submit">
                <button type="button" id="btnLogin" runat="server" onserverclick="btnLogin_Click"
                    class="btn btn-primary">
                    <i class="icon-check"></i>&nbsp Acceder</button>
            </div>
            <br />
                <div class="control-group">
                <label id="lblSrvr" runat="server" style="color:white;">
                </label>
            </div>

            </form>
            <div class="forget" >
                <a href="forget.aspx" style="background-color:rgba(31, 112, 190, 0.81);"><span> <p style="color:white;">¿Olvidó su contraseña? </p></span></a>
            </div>
        </div>
    </div>
</body>
</html>
