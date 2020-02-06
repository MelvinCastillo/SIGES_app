<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00500.aspx.cs" Inherits="CAID.HCX00500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xDetallesGUID" runat="server" />
    <asp:HiddenField ID="xidpaciente" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>DISCUSIÓN GENERAL DE CASOS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-hover table-nomargin table-bordered dataTable dataTable-scroll-x">
                            <thead>
                                <tr>

                                    <th>Fecha
                                    </th>
                                    <th>Record No.
                                    </th>
                                    <th>Pacientes
                                    </th>
                                   <%-- <th style="width: 1%;">Acciones</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>

                                        <tr>

                                            <td>
                                                <%# Eval("ROWCDTE")%>
                                            </td>
                                            <td>
                                                <%# Eval("RECORDID")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>

                                            </td>
                                            <%--<td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Discusión de Casos</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Record No.</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true" onchange="GetCurrentvalue();">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <%-- Impresión Diagnóstica --%>
                                <div class="control-group">
                                    <label for="txtImpresionDiagnostica" class="control-label" style="font-size: small;">
                                        <strong>Impresión Diagnóstica</strong></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtImpresionDiagnostica" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtImpresionDiagnostica" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtImpresionDiagnostica" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Intervenciones Prioritarias --%>
                                <div class="control-group">
                                    <label for="txtInterPrioritarias" class="control-label" style="font-size: small;">
                                        <strong>Intervenciones Prioritarias</strong></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtInterPrioritarias" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                                <%-- Intervenciones Posteriores --%>
                                <div class="control-group">
                                    <label for="txtInterPosteriores" class="control-label" style="font-size: small;">
                                        <strong>Intervenciones Posteriores</strong></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtInterPosteriores" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                                <%-- Intervenciones de Urgencia --%>
                                <div class="control-group">
                                    <label for="txtInterUrgencia" class="control-label" style="font-size: small;">
                                        <strong>Intervenciones de Urgencia</strong></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtInterUrgencia" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>Intervenciones Terapéuticas</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Detalles --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                        Detalles</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-large'>
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-medium'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">Prioritaria</option>
                                            <option value="2">Posterior</option>
                                            <option value="3">De Urgencia</option>
                                        </select>

                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlData">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="box-content nopadding">
                                    </div>
                                    <table class="table table-hover table-nomargin table-bordered dataTable-scroll-x dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">
                                        <thead>
                                            <tr>
                                                <th>Tipo
                                                </th>
                                                <th>Terapia
                                                </th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpDetalles" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("TIPOINTERVENCION")%>
                                                            
                                                        </td>
                                                        <td>
                                                            <%# Eval("ESPNOMBRE")%>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="btnDeleteDet" CssClass="btn btn-red" runat="server"
                                                                CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDet" OnClick="_Select2">
                                                                <i class="icon-remove"></i>
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>Profesionales presentes en la evaluación</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>

                                <%-- cmb Origen Tratamiento --%>
                                <div class="control-group">
                                    <label for="cmbServicioID" class="control-label">
                                        Servicio</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbServicioID" runat="server" CssClass="select2-me input-block-level"
                                            AutoPostBack="True" OnSelectedIndexChanged="cmbServicioID_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <%-- cmbTerapista --%>
                                <div class="control-group">
                                    <label for="cmbTerapista" class="control-label">
                                        Especialista</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <%-- Detalles de profesionales --%>
                                <div class="control-group">
                                    <div class="controls">

                                        <button type="button" id="Button1" runat="server" onserverclick="_SaveDetalles2"
                                            class="btn btn-green" validationgroup="pnlData">
                                            <i class="icon-arrow-down"></i>&nbsp Agregar
                                        </button>

                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="box-content nopadding">
                                    </div>
                                    <table class="table table-hover table-nomargin table-bordered dataTable-scroll-x dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">
                                        <thead>
                                            <tr>
                                                <th>Especialidad
                                                </th>
                                                <th>Profesional
                                                </th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpDetallesProfesionales" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Eval("NOMBREESPECIALIDAD")%>
                                                            
                                                        </td>
                                                        <td>
                                                            <%# Eval("NOMBREESPECIALISTA")%>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="btnDeleteDet" CssClass="btn btn-red" runat="server"
                                                                CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDetP" OnClick="_Select2">
                                                                <i class="icon-remove"></i>
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Diagnostico Definitivo --%>
            <div class="row-fluid">
                <div class="span12">
                    <div class="box box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Impresión Diagnostica</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <label for="txtdiagnostico" class="control-label" style="font-size: small;">
                                        <strong>Especifique los diagnosticos definitivos</strong></label>
                                    <div class="controls">
                                        <iframe id="frmDiscusionCasos" class="embed-responsive-item" src="http://caidsiges01:8082/forms/DiagnosticoDefinitivo.aspx?PACIENTE="
                                            style="width: 100%; height: 180px" frameborder="0"></iframe>
                                    </div>

                                    <script type="text/javascript">
                                        //function getParameterByName(name, url) {
                                        //    // alert(Site.Master.Session["CurrentUSR_TERID"].ToString());
                                        //    if (!url) url = window.location.href;
                                        //    name = name.replace(/[\[\]]/g, "\\$&");
                                        //    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
                                        //    if (!results) return null;
                                        //    if (!results[2]) return '';
                                        //    return decodeURIComponent(results[2].replace(/\+/g, " "));
                                        //}
                                    </script>
                                    <script type="text/javascript"> 
                                        function GetCurrentvalue() {
                                            //document.getElementById("xidpaciente").value = y;
                                        var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                        var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                        var xy = document.getElementById("ctl00_MainContent_cmbPaciente").value;
                                        //alert("EN EL CAMBIO " + xy);
                                        document.getElementById("frmDiscusionCasos").setAttribute("src", "http://caidsiges01:8082/forms/DiagnosticoDefinitivo.aspx?PACIENTE=" + xy + "&USUARIO=" + XCurrentUSR_ROWGUID + "&LOCALIDAD=" + XCURRENTUSR_SGXID)

                                        }
                                    </script>
                                    <script type="text/javascript"> 
                                        //var x = getParameterByName('X');
                                         <%--var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';--%>
                                         <%--var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';--%>
                                        var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                        var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                        var xy = document.getElementById("ctl00_MainContent_cmbPaciente").value;
                                        //alert(XCURRENTUSR_SGXID);
                                        //alert(XCurrentUSR_ROWGUID);
                                        //alert("PARA IFRAME " + xy);
                                        //document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/DiagnosticoDefinitivo.aspx?PACIENTE=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                        document.getElementById("frmDiscusionCasos").setAttribute("src", "http://caidsiges01:8082/forms/DiagnosticoDefinitivo.aspx?PACIENTE=" + xy + "&USUARIO=" + XCurrentUSR_ROWGUID + "&LOCALIDAD=" + XCURRENTUSR_SGXID) </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </asp:Panel>
</asp:Content>
