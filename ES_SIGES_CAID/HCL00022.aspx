<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00022.aspx.cs" Inherits="CAID.HCL00022" %>

<%--Acto Médico: Notas de Evolución--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Servicio de Terapia Familiar</h3>
                    <ul class="tabs">
                        <li class="active"><a href="#t1" data-toggle="tab">Entrevista</a> </li>
                        <li><a href="#t2" data-toggle="tab">Histórico</a> </li>
                    </ul>
                </div>
                <div class="box-content">
                    <div class="tab-content">
                        <div class="tab-pane active" id="t1">
                            <div class="nopadding">
                                <div class='form-horizontal'>
                                    <%-- Tipo de Evaluación --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Especialidad</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <%-- Objetivo --%>
                                    <%--<div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Objetivo</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>--%>
                                    <div class="control-group">
                                        <div class="box box-bordered">
                                            <div class="box-title">
                                                <ul class="tabs tabs-left">
                                                    <li class="active"><a href="#t10" data-toggle="tab">Datos Generales</a> </li>
                                                    <li><a href="#t11" data-toggle="tab">Dinámica Familiar</a> </li>
                                                    <li><a href="#t12" data-toggle="tab">Plan de Intervención</a> </li>
                                                    <li><a href="#t13" data-toggle="tab">Observación durante la sesión</a> </li>
                                                    <li><a href="#t14" data-toggle="tab">Resultados de Pruebas</a> </li>
                                                </ul>
                                            </div>
                                            <div class="box-content">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="t10">
                                                        <asp:TextBox ID="txtDATOS1" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtDATOS1" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ForeColor="Red" ID="txtDATOS1val" runat="server" SetFocusOnError="True" />
                                                    </div>
                                                    <div class="tab-pane" id="t11">
                                                        <asp:TextBox ID="txtDATOS2" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtDATOS2" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ForeColor="Red" ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" />
                                                    </div>
                                                    <div class="tab-pane" id="t12">
                                                        <asp:TextBox ID="txtDATOS3" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtDATOS3" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ForeColor="Red" ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" />
                                                    </div>
                                                    <div class="tab-pane" id="t13">
                                                        <asp:TextBox ID="txtDATOS4" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtDATOS4" Display="Dynamic" ErrorMessage="Requerido!"
                                                            ForeColor="Red" ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" />
                                                    </div>
                                                    <div class="tab-pane" id="t14">
                                                        <iframe id="frmEvaluacionConductualFuncionalParte2" class="embed-responsive-item"
                                                            src="http://caidsiges01:8082/forms/ResultadoPruebas.aspx" style="width: 100%; height: 600px;"
                                                            frameborder="0"></iframe>
                                                        <script type="text/javascript">
                                                            function getParameterByName(name, url) {
                                                                // alert(Site.Master.Session["CurrentUSR_TERID"].ToString());
                                                                if (!url) url = window.location.href;
                                                                name = name.replace(/[\[\]]/g, "\\$&");
                                                                var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
                                                                if (!results) return null;
                                                                if (!results[2]) return '';
                                                                return decodeURIComponent(results[2].replace(/\+/g, " "));
                                                            }
                                                        </script>
                                                        <script type="text/javascript">
                                                            var x = getParameterByName('X');
                                                            var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                                            var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                                            var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';                                                                    
                                                            document.getElementById("frmEvaluacionConductualFuncionalParte2").setAttribute("src", "http://caidsiges01:8082/forms/ResultadoPruebas.aspx?rowguidpaciente=" + x + "&XTerapistaID=" + XTerapistaID + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                            validationgroup="pnlData" style="width: 128px; height: 48px">
                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="t2">
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                    <thead>
                                        <tr>
                                            <th class="hidden-480">No.
                                            </th>
                                            <th class="hidden-480">Fecha y Hora
                                            </th>
                                            <th>Datos Generales
                                            </th>
                                            <th class="hidden-480">Dinámica Familiar
                                            </th>
                                            <th class="hidden-480">Plan de Intervención
                                            </th>
                                            <th class="hidden-480">Observación durante la sesión
                                            </th>
                                            <th class="hidden-480">Resultados de Pruebas
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpHistorico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="hidden-480">
                                                        <%# Eval("NUMERO")%>
                                                    </td>
                                                    <td class="hidden-480">
                                                        <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                                    </td>
                                                    <td class="hidden-480">
                                                        <%# Eval("DATOS1")%> 
                                                    </td>
                                                    <td class="hidden-480">
                                                        <%# Eval("DATOS2")%> 
                                                    </td>
                                                    <td class="hidden-480">
                                                        <%# Eval("DATOS3")%> 
                                                    </td>
                                                    <td class="hidden-480">
                                                        <%# Eval("DATOS4")%>  
                                                    </td>
                                                    <td class="hidden-480"></td>

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
    </div>
</asp:Content>
