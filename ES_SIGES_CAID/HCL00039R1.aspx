<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00039R1.aspx.cs" Inherits="CAID.HCL00039R1" %>

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
                                <i class="icon-edit"></i>Histórico Hoja de Data</h3>
                            <div class="actions">
                                
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
                                        data-rule-required="true" AutoPostBack="false">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlConsulta" />
                                </div>
                            </div>

                                     <%-- Especialidad --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                        Especialidad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEspecialidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlConsulta" />
                                    </div>
                                </div>

                                    <div class="form-actions">
                                <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-green" validationgroup="pnlConsulta">
                                    <i class="icon-print"></i>&nbsp Generar</button>
                                <button type="button" id="btnCancel" runat="server" onserverclick="_Clean" class="btn">
                                    <i class="icon-undo"></i>&nbsp Limpiar</button>
                            </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>
</asp:Content>
