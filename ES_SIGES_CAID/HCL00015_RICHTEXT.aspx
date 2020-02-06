<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00015.aspx.cs" Inherits="CAID.HCL00015" %>

<%--Acto Médico: Notas de Evolución--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="pnlData" class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Notas de Evolución</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
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
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Objetivo</label>
                                <div class="controls">
                                    <select runat="server" id="cmbObjetivo" name="cmbObjetivo"
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <%--<asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                </div>
                            </div>
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
                            <script language="javascript" type="text/javascript" src="http://caidsiges01:8000/js/jquery-latest.js"></script>

                            <div>
                                <div class="control-group">
                                    <%--<div class="container">--%>
                                    <div class="embed-responsive embed-responsive-16by9">
                                        <iframe id="frmseleccionobjectivo" class="embed-responsive-item" src="" style="width: 100%; height: 100%;"
                                            frameborder="0"></iframe>
                                        <script type="text/javascript">
                                            var x = getParameterByName('X');
                                            var XEspecialidad = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                            var XObjetivo = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                            var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                            var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                            var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                            document.getElementById("frmseleccionobjectivo").setAttribute("src", "http://caidsiges01:8082/forms/ObjectivosPorPacienteNotaEv.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                        </script>
                                    </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                            <div class="control-group">
                                <p>
                                    <strong>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                            ControlToValidate="txtEVALUACION" ErrorMessage="Error: Carácter comilla simple prohibida, elimínelo y vuelva a guadar." ValidationExpression="[^'\x22]*"></asp:RegularExpressionValidator>
                                    </strong>
                                </p>
                                   <p id="EVALUACION">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px" 
                                    ValidationGroup="pnlData" Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" />
                                 </p>
                                <%--INICIO  FORMATO WORD CAMPO EVALUACION--%>

                                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                                <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
                                <script>
                                            $('#EVALUACION').summernote({
                                                placeholder: 'Digite aquí 1',
                                                tabsize: 2,
                                                height: 300
                                            });
                                            var xEVALUACION = document.getElementById("txtEVALUACION").innerText;
                                            ctl00_MainContent_txtEVALUACION.value = xEVALUACION;
                                            alert(ctl00_MainContent_txtEVALUACION.innerText);
                                </script>
                                <%-- <script>
                                            $(document).ready(function () {
                                                $('#txtEVALUACION').summernote();
                                            });
                                </script>--%>
                                <%--FIN FORMATO WORD CAMPO EVALUACION--%>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                    validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-table"></i>Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-tools">

                        <thead>
                            <tr>
                                <th>No.
                                </th>
                                <th>Fecha y Hora
                                </th>
                                <th>Objetivo
                                </th>
                                <th style="width: 1%;">Notas de Evolución
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# Eval("NUMERO")%>
                                        </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                        <td style="width: 25%;">
                                            <%# Eval("OBJNOMBRE")%>
                                        </td>
                                        <td style="width: 58%;">
                                            <%# Eval("DATOS")%>
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

</asp:Content>
