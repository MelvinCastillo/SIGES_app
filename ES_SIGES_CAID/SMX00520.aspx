<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00520.aspx.cs" Inherits="CAID.SMX00520" %>

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
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-edit"></i>Consulta Agenda de Citas</h3>
                            <div class="actions">
                                <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                    <i class="icon-search"></i>&nbsp Buscar</button>
                                <button type="button" id="btnCancel" runat="server" onserverclick="_Clean" class="btn">
                                    <i class="icon-undo"></i>&nbsp Limpiar</button>
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>
                                    <%-- Paciente --%>
                                    <div class="control-group">
                                        <label for="cmbFiltroPaciente" class="control-label" style="color: Red">
                                            Paciente
                                        </label>
                                        <div class="controls">
                                            <select runat="server" id="cmbFiltroPaciente" name="cmbFiltroPaciente" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- Fecha Inicio -->
                                    <div class="control-group">
                                        <label for="txtFecha1" class="control-label" style="color: Red">
                                            Período</label>
                                        <div class="controls">
                                            <input runat="server" name="txtFecha1" id="txtFecha1" class="input-medium datepick"
                                                data-date-autoclose="True" data-rule-required="true" placeholder="Desde">
                                            &nbsp
                                            <input runat="server" name="txtFecha2" id="txtFecha2" class="input-medium datepick"
                                                data-date-autoclose="True" data-rule-required="true" placeholder="Hasta">
                                        </div>
                                    </div>
                                   <%-- cmb Origen Tratamiento --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                        Especialidad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                    </div>
                                </div>
                                    <%-- cmbMedico Filtro--%>
                                    <div class="control-group">
                                        <label for="cmbMedicoFiltro" class="control-label" style="color: Red">
                                            Especialista
                                        </label>
                                        <div class="controls">
                                            <select runat="server" id="cmbMedicoFiltro" name="cmbMedicoFiltro" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbEstatus" class="control-label" style="color: Red">
                                            Estado</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbEstatus" name="cmbEstatus" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="-1">-- TODAS --</option>
                                                <option value="0">PROGRAMADAS</option>
                                                <option value="1">CONFIRMADAS</option>
                                                <option value="2">CANCELADAS</option>
                                                <option value="3">AUSENTES</option>
                                                <option value="4">ATENDIDAS</option>
                                                <option value="5">POSPUESTA</option>
                                                <option value="6">DE ALTA</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 1%;">
                                                            Cita No.
                                                        </th>
                                                        <th>
                                                            Record #
                                                        </th>
                                                        <th>
                                                            Nombre
                                                        </th>
                                                        <th>
                                                            Terapeuta
                                                        </th>
                                                        <th class="hidden-480">
                                                            Fecha
                                                        </th>
                                                        <th class="hidden-480">
                                                            Horario
                                                        </th>
                                                        <th style="width: 1%;">
                                                            Observación
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
                                                                <th>
                                                                    <%# Eval("NUMERO")%>
                                                                </th>
                                                                <td>
                                                                    <%# Eval("RECORDID")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("FULLNAME")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("TERAPISTANOMBRE")%><br /><%# Eval("ESPECIALIDAD")%>
                                                                </td>
                                                                <td class="hidden-480">
                                                                    <%# Convert.ToDateTime( Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                                                </td>
                                                                <td class="hidden-480">
                                                                    <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt")%>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("observacion1")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("MODALPARTICIPANTES")%>
                                                                    &nbsp<%# Eval("CITAICONO")%>
                                                                    &nbsp<%# Eval("CITAESTADO")%>
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
                </div>
            </div>
    </asp:Panel>
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <%--                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>--%>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Consulta de Citas</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente disabled="disabled"--%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Inicio -->
                                <div class="control-group">
                                    <label for="txtFechaIni" class="control-label" style="color: Red">
                                        Fecha Inicio</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                            data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa"
                                            disabled="disabled">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- cmb Origen Tratamiento --%>
                                <div class="control-group">
                                    <label for="cmbOrigenTratamiento" class="control-label" style="color: Red">
                                        Origen Tratamiento</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbOrigenTratamiento" name="cmbOrigenTratamiento" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- cmbTerapista --%>
                                <div class="control-group">
                                    <label for="cmbTerapista" class="control-label" style="color: Red">
                                        Terapista</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTerapista" name="cmbTerapista" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- cmbMedico --%>
                                <div class="control-group">
                                    <label for="cmbMedico" class="control-label" style="color: Red">
                                        Médico</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbMedico" name="cmbMedico" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                    </div>
                                </div>
                                <%-- cmbEnfermera --%>
                                <div class="control-group">
                                    <label for="cmbEnfermera" class="control-label" style="color: Red">
                                        Enfermera</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEnfermera" name="cmbEnfermera" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                    </div>
                                </div>
                                <%--Hora--%>
                                <div class="control-group">
                                    <label for="cmbHorario" class="control-label" style="color: Red">
                                        Horario</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbHorario" name="cmbHorario" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbHorario" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbHorario1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Observación --%>
                                <div class="control-group">
                                    <label for="txtObservacion" class="control-label" style="color: Red">
                                        Observación</label>
                                    <div class="controls">
                                        <input runat="server" name="txtObservacion" id="txtObservacion" type="text" class="input-xlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="500" multiple="multiple"
                                            disabled="disabled">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>
</asp:Content>
