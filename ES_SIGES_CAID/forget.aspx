<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="CAID.forget" %>

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
    <script src="js/eakroko.js"></script>
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
<body class='locked theme-satblue' runat="server">
    <form runat="server" id="forgetForm">
    <asp:Panel ID="pnl1" runat="server">
        <div class="wrapper">
            <div class="right">
                <div class="upper">
                    <h2>
                        Olvidó su contraseña</h2>
                    <span></span>
                    <p>
                    </p>
                </div>
                <select runat="server" id="cmbEmpresa" class='input-block-level' data-rule-required="true">
                </select>
                <input type="text" runat="server" id="txtUsuario" placeholder="Usuario" class="input-xlarge">
                <div>
                    <button type="button" id="btnLogin" runat="server" onserverclick="btnLogin_Click"
                        class="btn btn-inverse">
                        Enviar
                    </button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnl2" Visible="false" runat="server">
        <div class="wrapper">
            <div class="box box-color box-bordered red">
                <div class="box-title">
                    <h3>
                        <i class="icon-bell"></i>Notificación
                    </h3>
                </div>
                <div class="box-content">
                    <br />
                    <p>
                        <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
                    </p>
                    <br />
                    <br />
                    <p>
                        <button type="button" id="btn1" runat="server" onserverclick="_Reset" class="btn btn-grey">
                            Reintentar</button>
                        <button type="button" id="btn2" runat="server" onserverclick="_Exit" class="btn btn-grey">
                            Volver al inicio</button>
                    </p>
                </div>
            </div>
        </div>
    </asp:Panel>
    </form>
</body>
</html>
