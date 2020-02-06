<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX00000R2.aspx.cs" Inherits="CAID.FTX00000R2" %>

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
                                <i class="icon-edit"></i>Reporte de Facturas</h3>
                            <div class="actions">
                                <button type="button" id="btnExport" runat="server" onserverclick="_Export" class="btn">
                                    <i class="icon-search"></i>&nbsp Buscar</button>
                                <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                    <i class="icon-print"></i>&nbsp Generar</button>
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
                                                <option value="">-- TODOS --</option>
                                            </select>
                                        </div>
                                    </div>

                                     <%-- Tipo --%>
                                    <div class="control-group">
                                        <label for="cmbTipo" class="control-label" style="color: Red">
                                            Tipo
                                        </label>
                                        <div class="controls">
                                            <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                                data-rule-required="true">
                                                <option value="1">-- SELECCIONE --</option>
                                                <option value="1">Detallado</option>
                                                <option value="2">Resumido</option>
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

                                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>
                                            # Factura
                                        </th>
                                        <th>
                                            Fecha
                                        </th>
                                         <th>
                                            Record
                                        </th>
                                        <th>
                                            Paciente
                                        </th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th>
                                                    <%# Eval("FTNUMERO")%>
                                                </th>
                                                <td>
                                                    <%# Eval("FTFECHA")%>
                                                </td>
                                                 <td>
                                                    <%# Eval("PACIENTERECORD")%>
                                                </td>
                                                 <td>
                                                    <%# Eval("FTPACIENTENOMBRE")%>
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
</asp:Content>
