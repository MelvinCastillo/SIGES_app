<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="INDEX.aspx.cs" Inherits="CAID.index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function getLocalidad() {

            return '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
        }
    </script>
    <asp:HiddenField ID="data_genero" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_em" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="data_pa" runat="server" ClientIDMode="Static" />
    <%--<div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Género
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="GENERO-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Edades
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="EDADES-pie-chart" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <%--    Graficos--%>
    <div id="idgraficos">
    <div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Distribución Pacientes por Género
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-genero" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Rango Edad Pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-rangoedad" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Diagnóstico Pacientes Recibidos
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-diagnosticos" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Status Pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-statuspacientes" class='flot'>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-bar-chart"></i>Clasificación Socioeconómica pacientes
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div id="dashboard-grph-categorias" class='flot'>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--Calendario--%>
    <%--<div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-calendar"></i>Programacion Mensual</h3>
                </div>
                <div class="box-content nopadding">
                    <div class="calendar">
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    </div>
     
    <div id="INT_GRUPAL" >
        <div class="accordion-inner">
            <div class="box-content nopadding">
                <iframe class="holds-the-iframe margintop80" id="frmINT_GRUPAL" src="http://caidsiges01:8000/index.aspx" style="width: 100%; height: 800PX;" frameborder="0"></iframe>
                <script type="text/javascript"> 
                    var XCurrentUSR_ROLGUID = '<%=@Session["CurrentUSR_ROLGUID"].ToString()%>';
                    var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                    var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                    //alert('ROL: ' + XCurrentUSR_ROLGUID);
                    document.getElementById("frmINT_GRUPAL").setAttribute("src", "http://caidsiges01:8082/forms/AlertasPacientes.aspx?CURRENTUSR_SGXID=" + XCURRENTUSR_SGXID + "&CURRENTUSR_ROWGUID=" + XCurrentUSR_ROWGUID +"&SCREEN=FRONT")
                    //document.getElementById("frmINT_GRUPAL").setAttribute("src", "www.google.com" )
                    if (XCurrentUSR_ROLGUID == "CE0CB491-3E3F-4DCC-9962-409BD51A01C7") //INTERVENCION GRUPAL
                    {
                        var x = document.getElementById("idgraficos");
                        if (x.style.display === "none") {
                            x.style.display = "block";
                        } else {
                            x.style.display = "none";
                        }

                    }
                    else
                    {
                        var x = document.getElementById("INT_GRUPAL");
                        if (x.style.display === "none") {
                            x.style.display = "block";
                        } else {
                            x.style.display = "none";
                        }
                        

                    }
                    </script>
            </div>
        </div>
    </div>

</asp:Content>
