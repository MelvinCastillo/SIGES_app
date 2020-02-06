<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00018.aspx.cs" Inherits="CAID.HCL00018" %>


<%--Acto Médico: Anamnesis--%>
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
                        <i class="icon-edit"></i>Plan Médico</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-striped'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbTipo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Especialidad</strong></label>
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
                                <label for="cmbObjetivo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Objetivo</strong></label>
                                <div class="controls">
                                    <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Proximo proceso de evaluacion dentro del CAID --%>
                            <div class="control-group">
                                <div class="span12" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">
                                        Próximo proceso de evaluación dentro del CAID
                                    </h5>
                                    <select runat="server" id="cmbProxProceso" name="cmbProxProceso" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <%--<option value="1">Servicio de evaluación y diagnóstico</option>
                                        <option value="2">Evaluación multidisciplinaria</option>
                                        <option value="3">Discusión de Caso</option>--%>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbProxProceso" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="valcmbProxProceso" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Cabeza --%>
                            <div class="control-group">
                                <div class="span12">
                                    <div style="text-align: left; margin: auto; padding-left: 1%;">
                                        <h5 class="control-list">
                                            Pruebas Complementarias
                                        </h5>
                                        <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                                            <asp:CheckBoxList ID="ckPruebas" CellPadding="5" Font-Size="XX-Small" CellSpacing="5"
                                                RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right" runat="server">
                                            </asp:CheckBoxList>
                                        </div>
                                        <input type="text" runat="server" name="txtOtrosPruebas" id="txtOtrosPruebas" placeholder="Otros"
                                            class="input-block-level">
                                    </div>
                                </div>
                            </div>
                            <%-- EQUIPOS MECANICOS AGREGADO POR MELVIN CASTILLO--%>
                            <%-- FUNCION LEE EL QUERYSTRING--%>
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
                                        <iframe id="frmEquiposmecanicos" class="embed-responsive-item" src="" style="width: 100%;
                                            height: 100%;" frameborder="0"></iframe>
                                        <script type="text/javascript">
                                            var x                   = getParameterByName('X');
                                            var XEspecialidad       = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                            var XObjetivo           = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                            var XTerapistaID        = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                            var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                            var XCURRENTUSR_SGXID   = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                            document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                        </script>
                                    </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px"
                                    ValidationGroup="pnlData" Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" />
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
</asp:Content>
