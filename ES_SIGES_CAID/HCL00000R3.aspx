<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00000R3.aspx.cs" Inherits="CAID.HCL00000R3" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="xGUID" runat="server" />

    <asp:Panel runat="server" ID="pnlR1">
        <div class="box-content nopadding">
            <div class="row-fluid">
                <div class="span12">
                    <div class="box box-bordered">
                        <div class="box-title">
                            
                            <h3><i class="icon-bar-chart"></i>Total de Atenciones Por Servicio y Especialistas</h3>
                        </div>
                        <div class="row-fluid">
                            <div class="box-content nopadding">
                                <div class='form-horizontal form-bordered'>

                                    <%-- cmb Origen Tratamiento --%>
                                    <div class="control-group">
                                        <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                            Servicio</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="cmbEspecialidad" runat="server" CssClass="select2-me input-block-level"
                                                data-rule-required="true">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic"
                                                ErrorMessage="Requerido!" ID="valcmbEspecialidad" runat="server" SetFocusOnError="True"
                                                ValidationGroup="pnlR1" />
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

                                    <!-- Buscar -->
                                    <div class="control-group">

                                        <div class="controls">
                                            <button type="submit" id="btnPrint" runat="server" onserverclick="_ShowReport" class="btn btn-blue" validationgroup="pnlData">
                                                <i class="icon-search"></i>&nbsp Buscar</button>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label for="txtTotalAtenciones" class="control-label">
                                            <strong>Total de Atenciones:</strong></label>
                                        <div class="controls">
                                     <asp:Label ID="txtTotalAtenciones" runat="server"></asp:Label>


                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping" data-grouping="expandable">
                                                <thead>
                                                    <tr>
                                                        <th>Especialista
                                                        </th>
                                                        <th>Paciente
                                                        </th>
                                                        <th>Atenciones
                                                        </th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rpReport1" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%# Eval("ESPECIALISTANOMBRE")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("PAC")%> - <%# Eval("RECORDPAC")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("contador")%>
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
        </div>
    </asp:Panel>


</asp:Content>
