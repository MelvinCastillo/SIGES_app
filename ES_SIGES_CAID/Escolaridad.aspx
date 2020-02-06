<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Escolaridad.aspx.cs" Inherits="CAID_V2.forms.Escolaridad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <!-- Apple devices fullscreen -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- Apple devices fullscreen -->
    <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <title>Actividades por Pacientes</title>
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/style2.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/themes2.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <!-- select2 -->
    <link rel="stylesheet" href="../css/plugins/select2/select2.css">
    <link href="../css/select2-bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../css/select2-bootstrap.min.css" rel="stylesheet"
        type="text/css" />
<%--    <!-- chosen -->
    <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">--%>
    <script src="../js/jquery2.min.js" type="text/javascript"></script>
    <script src="../js/notify.js" type="text/javascript"></script>
    <script src="../js/notify.min.js" type="text/javascript"></script>
<%--    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>--%>
    <!-- select2 -->
    <script src="../js/plugins/select2/select2.min.js" type="text/javascript"></script>
    <%--Toast Message--%>
    <%--<script type="text/javascript">
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

    </script>--%>
    <script language="javascript" type="text/javascript">
    <script type="text/javascript" src="../js/notify-metro.js"></script>
    <![CDATA[ function btnPrint_onclick() { } ]]> </script>
    <script type="text/javascript" >
        $("#dpdistritoescolar").select2({
            theme: "bootstrap"
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel runat="server" ID="pnlData">
        <div class="box box-color box-bordered">
            <div class="box-title">
                <h3>
                    Datos Escolaridad</h3>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="span6">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- paciente --%>
                                <div class="control-group">
                                    <label for="Txtpaciente" class="control-label" style="color: black">
                                        Paciente</label>
                                    <div class="controls">
                                        <input runat="server" name="txtpaciente" id="txtpaciente" type="text" class="input-block-level"
                                            data-rule-required="true" disabled="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtpaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%--centro educativo--%>
                                <div class="control-group">
                                    <label for="cmbCentro" class="control-label" style="color: black">
                                        Centro Educativo</label>
                                    <div class="controls">
                                        <input runat="server" name="txtCentro" id="txtCentro" type="text" class="input-block-level"
                                            data-rule-required="true" style="text-transform: uppercase">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtCentro" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- direccion --%>
                                <div class="control-group">
                                    <label for="txtdireccion" class="control-label" style="color: black">
                                        Direccion</label>
                                    <div class="controls">
                                        <input runat="server" name="txtdireccion" id="txtdireccion" type="text" class="input-block-level"
                                            data-rule-required="true" style="text-transform: uppercase">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtdireccion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- DISTRITO ESCOLAR --%>
                                <div class="control-group">
                                    <label for="lbldistrito" class="control-label" style="color: black">
                                        Distrito Escolar</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dpdistritoescolar" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" OnSelectedIndexChanged="dpdistritoescolar_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                        <script type="text/javascript" >
                                            $("#dpdistritoescolar").select2({
                                                theme: "bootstrap"
                                            });
    </script>
                                </div>
                                <%-- Responsable Distrito --%>
                                <div class="control-group">
                                    <label for="lblresponsabledistrito" class="control-label" style="color: black">
                                        Responsable Distrito</label>
                                    <div class="controls">
                                        <input runat="server" name="txtresponsabledistrito" id="txtresponsabledistrito" type="text"
                                            class="input-block-level" data-rule-required="true" style="text-transform: uppercase"
                                            cssclass="select2-me input-block-level">
                                        <br />
                                    </div>
                                </div>
                                <%-- telefono --%>
                                <div class="control-group">
                                    <label for="txtelefono" class="control-label" style="color: black">
                                        Telefono</label>
                                    <div class="controls">
                                        <input runat="server" name="txtelefono" id="txtelefono" type="text" class="input-block-level"
                                            data-rule-required="true" style="text-transform: uppercase">
                                        <br />
                                    </div>
                                </div>
                                <%-- GRADO --%>
                                <div class="control-group">
                                    <label for="TXTGRADO" class="control-label" style="color: black">
                                        Grado</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dpgrado" runat="server" class='select2-me input-block-level'>
                                            <asp:ListItem Value="SELECCIONE">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem>NIDO</asp:ListItem>
                                            <asp:ListItem>MATERNAL</asp:ListItem>
                                            <asp:ListItem>PRE-KINDER</asp:ListItem>
                                            <asp:ListItem>KINDER</asp:ListItem>
                                            <asp:ListItem>PRE-PRIMARIA</asp:ListItem>
                                            <asp:ListItem>1RO</asp:ListItem>
                                            <asp:ListItem>2DO</asp:ListItem>
                                            <asp:ListItem>3ERO</asp:ListItem>
                                            <asp:ListItem>4TO</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- CATEGORIA--%>
                                <div class="control-group">
                                    <label for="lblCategoria" class="control-label" style="color: black">
                                        Categoria</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dpcategoria" runat="server" class='select2-me input-block-level'>
                                            <asp:ListItem Value="SELECCIONE">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem>PUBLICO</asp:ListItem>
                                            <asp:ListItem>PRIVADO</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%-- TIPO DE CATEGORIA --%>
                                <div class="control-group">
                                    <label for="TIPOCATEGORIA" class="control-label" style="color: black">
                                        Tipo de Categoria</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dptipocategoria" runat="server" class='select2-me input-block-level'>
                                            <asp:ListItem Value="SELECCIONE">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem>Centro de Educacion especial</asp:ListItem>
                                            <asp:ListItem>Aula de recursos</asp:ListItem>
                                            <asp:ListItem>Educacion Regular con adaptaciones</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%-- DIRECTOR --%>
                                <div class="control-group">
                                    <label for="TxtDirector" class="control-label" style="color: black">
                                        Director(a)</label>
                                    <div class="controls">
                                        <input runat="server" name="txtdirector" id="txtdirector" type="text" class="input-block-level"
                                            data-rule-required="true" style="text-transform: uppercase">
                                        <br />
                                    </div>
                                </div>
                                <%-- MAESTRO --%>
                                <div class="control-group">
                                    <label for="lblmaestro" class="control-label" style="color: black">
                                        Maestro(a)</label>
                                    <div class="controls">
                                        <input runat="server" name="txtmaestro" id="txtmaestro" type="text" class="input-block-level"
                                            data-rule-required="true" style="text-transform: uppercase">
                                        <br />
                                    </div>
                                </div>
                                <%-- estatus --%>
                                <div class="control-group">
                                    <label for="Estatus" class="control-label" style="color: black">
                                        Estatus</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="dpEstatus" runat="server" class='select2-me input-block-level'>
                                            <asp:ListItem Value="SELECCIONE">-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem>En proceso de Escolarizacion</asp:ListItem>
                                            <asp:ListItem>Escolarizado</asp:ListItem>
                                            <asp:ListItem>No Escolarizado</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="lblacciones" class="control-label" style="color: Red">
                                        Acciones</label>
                                    <div class="controls">
                                        <%--<div class="form-actions">--%>
                                        <script type="text/javascript">
                                            function notify(MSG, tipo) {
                                                $.notify(MSG, tipo);
                                            }
                                            
                                        </script>
                                        <script type="text/javascript">
                                            function Back() {
                                                <a href='javascript:history.go(-1)'></a>;
                                            }
                                        </script>
                                        <button type="submit" id="btnPrint" runat="server" class="btn btn-blue" onserverclick="_Save">
                                            <i class="icon-ok"></i>&nbsp Aceptar</button>
                                        <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                                            Cancelar</a>
                                        <%-- </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box box-color box-bordered">
                <div class="box-title">
                    <h3>
                        <asp:Label ID="lblubicaciondistrito" runat="server" Text="Ubicacion Distrito Escolar"></asp:Label>
                    </h3>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <iframe id="mapagoogle" class="show" allowfullscreen="" frameborder="0" width="100%"
                            height="650" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyADvUGYP5rvDFzaewS4w-Qi2P5t6qJ7NKc+&amp;q=Dominican+republic%2C+distrito+nacional%2C+ensanche+miramar%2C+los+corales&amp;zoom=17&amp;maptype=satellite">
                        </iframe>
                        <script type="text/javascript">

                            function DireccionGoogle(direccion) {
                                // direccion = "q=san cristobal republica dominica";
                                var strdireccion = "https://www.google.com/maps/embed/v1/place?key=AIzaSyADvUGYP5rvDFzaewS4w-Qi2P5t6qJ7NKc&q=" + direccion + "&zoom=20&maptype=satellite";
                                //$document.getElementById("googlemap").setAttribute("src", strdireccion);
                                //$('#googlemap').attr("src", strdireccion)
                                //alert(direccion)
                                document.getElementById("mapagoogle").setAttribute("src", strdireccion);
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    </form>
</body>
</html>
