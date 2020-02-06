<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00039R3.aspx.cs" Inherits="CAID.HCL00039R3" %>

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
                                <i class="icon-edit"></i>Evolución Hoja de Data (Gráfica)</h3>
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
                                            <asp:DropDownList ID="cmbEspecialidad" runat="server" CssClass="select2-me input-block-level"
                                                AutoPostBack="True" OnSelectedIndexChanged="cmbEspecialidad_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbEspecialidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>

                                    <%-- Objetivo en Hoja de Data --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Objetivo</label>
                                        <div class="controls">                                            
                                            <asp:DropDownList ID="cmbObjetivo" runat="server" CssClass="select2-me input-block-level"
                                                AutoPostBack="True" OnSelectedIndexChanged="cmbObjetivo_SelectedIndexChanged">
                                                <asp:ListItem Value="">-- SELECCIONE --</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>

                                 <%-- Tareas --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Tarea</label>
                                        <div class="controls">                                            
                                            <asp:DropDownList ID="cmbTareas" runat="server" CssClass="select2-me input-block-level"
                                                AutoPostBack="false">
                                            <asp:ListItem Value="TODAS">-- TODAS --</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbTareas" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbTareas" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-green" validationgroup="pnlConsulta">
                                            <i class="icon-bar-chart"></i>&nbsp Ver Gráfica</button>
                                        <button type="button" id="btnCancel" runat="server" onserverclick="_Clean" class="btn">
                                            <i class="icon-undo"></i>&nbsp Limpiar</button>
                                    </div>

                                    <div class="control-group">

                                        <div class="box-content nopadding">
                                            <%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
                                                Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
                                            <asp:Chart ID="Chart1" runat="server" Width="1000px" Height="500px"></asp:Chart>
                                        </div>

                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>
</asp:Content>
