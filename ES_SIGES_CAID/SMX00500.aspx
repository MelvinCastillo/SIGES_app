﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00500.aspx.cs" Inherits="CAID.SMX00500" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <asp:HiddenField ID="txtEnfID" runat="server" Value="0" />
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <%--  Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Programación de Citas
                        </h3>
                        <div class="actions">
                            <button id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Cita No.
                                    </th>
                                    <th>
                                        Paciente / Terapeuta
                                    </th>
                                    <th class="hidden-480">
                                        Fecha
                                    </th>
                                    <th class="hidden-480">
                                        Horario
                                    </th>
                                    <th style="width: 1%;">
                                        Estatus
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("ROWIDX")%>
                                            </td>
                                            <td>
                                                <%# Eval("FULLNAME")%>
                                                <br />
                                                <%# Eval("TERAPISTANOMBRE")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%></td>
                                            <td>
                                                <%# Eval("CITAICONO")%>
                                                &nbsp<%# Eval("CITAESTADO")%></td>
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
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="row-fluid">
                <asp:Repeater ID="rpPaxHeader" runat="server">
                    <ItemTemplate>
                        <%# Eval("HTML")%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Registro de Citas</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-undo"></i>&nbsp Limpiar</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
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
                                    <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <!-- Fecha Inicio -->
                            <div class="control-group">
                                <label for="txtFechaIni" class="control-label" style="color: Red">
                                    Fecha</label>
                                <div class="controls">
                                    <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                        data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                    <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- cmb Origen Tratamiento --%>
                            <div class="control-group">
                                <label for="cmbOrigenTratamiento" class="control-label" style="color: Red">
                                    Servicio</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbOrigenTratamiento" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbOrigenTratamiento_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- cmbTerapista --%>
                            <div class="control-group">
                                <label for="cmbTerapista" class="control-label" style="color: Red">
                                    Especialista</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbTerapista_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--Hora--%>
                            <div class="control-group">
                                <label for="cmbHorario" class="control-label" style="color: Red">
                                    Horario</label>
                                <div class="controls">
                                    <select runat="server" id="cmbHorario" name="cmbHorario" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbHorario" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbHorario1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbHorario" class="control-label" style="color: Red">
                                    Condición</label>
                                <div class="controls">
                                    <select runat="server" id="cmbCondicion" name="cmbCondicion" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="0">PROGRAMADA</option>
                                        <%--<option value="1">CONFIRMADA</option>--%>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtParticipantes" class="control-label" style="color: Red">
                                    Participantes</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <%-- Observación --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label" style="color: Red">
                                    Observación</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <%--Agregar citas EVALUACIONES CONJUNTAS Y MULTIDISCIPLINARIA--%>
                            <%--<div class="control-group" id="CitasConjuntayMulti1">
                                <label for="btnagregarconjuntaymulti" class="control-label" style="color: Red">
                                    Agregar Citas</label>
                                <div class="controls">
                                    <button type="button" id="btnNucleoFamiliar" runat="server" class="btn btn-primary"
                                        onclick="javascript:openModal();">
                                        <i class="icon-plus-sign"></i>&nbsp Agregar CONJUNTA Y MULTIDISCIPLINARIA</button>
                                </div>
                                <div id="containmodal" class="container">
                                    <%--<asp:Panel CssClass="modal" ID="CitasConjuntayMulti" runat="server" Visible="False"> --%>
                                  <%--  <div class="modal fade" id="CitasConjuntayMulti" role="dialog" visible="false">
                                        <div class="modal-header">
                                            <div class="box">
                                                <div class="box-title">
                                                    <h3>
                                                        <i class="icon-reorder"></i>Citas Conjuntas y Multidisciplinarias
                                                    </h3>
                                                </div>
                                            </div>
                                        </div>
                                        <%--  Modal para agregar Citas Conjuntivas y Multidisciplinaria--%>
                                        <%--<div class="modal-body">
                                            <div class='form-horizontal'>
                                                <div class="embed-responsive embed-responsive-16by9">
                                                    <iframe id="frmEquiposmecanicos" class="embed-responsive-item" src="" style="width: 100%;
                                                        height: 100%;" frameborder="0"></iframe>
                                                    <script type="text/javascript">
                                                        //                                            var x = getParameterByName('X');
                                                        //                                            var XEspecialidad = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                                        //                                            var XObjetivo = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                                        //                                            var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                                        //                                            var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                                        //                                            var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                                        //                                            document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                                        document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://localhost:8080/LOGIN.aspx")
                                                    </script>
                                                </div>
                                            </div>
                                        </div>--%>
                                       <%-- <div class="modal-footer">
                                            <button id="Button4" runat="server" class="btn">
                                                <i class="icon-undo"></i>&nbsp Cerrar</button>
                                        </div>
                                    </div> 
                                </div>--%>
                                <%--<script type="text/javascript">
                                    function openModal() {
                                        $('#CitasConjuntayMulti').modal('show');
                                    }
                                </script>--%>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>
</asp:Content>
