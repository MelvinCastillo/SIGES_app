<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ERR00404.aspx.cs" Inherits="CAID.ERR00404" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title>SIGES</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap responsive -->
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Color CSS -->
    <link rel="stylesheet" href="css/themes.css">
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Nice Scroll -->
    <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
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
<body class='error'>
    <div class="wrapper">
        <div class="code">
            <span>404</span><i class="icon-warning-sign"></i></div>
        <div class="desc">
            El sistema no ha encontrado la función solicitada.</div>
        <div class="buttons">
            <div class="pull-left">
                <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                    Volver</a></div>
            <!--	<div class="pull-left"><a href="default.aspx" class="btn"><i class="icon-arrow-left"></i>&nbsp Volver</a></div> -->
        </div>
    </div>
</body>
</html>
