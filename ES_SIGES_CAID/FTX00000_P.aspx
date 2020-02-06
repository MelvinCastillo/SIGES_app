<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX00000_P.aspx.cs" Inherits="CAID.FTX00000_P" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary" style="visibility: hidden">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>

                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>RECIBO DE INGRESOS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>No.
                                    </th>
                                    <th>Factura
                                    </th>
                                    <th class="hidden-480">Paciente
                                    </th>
                                    <th class="hidden-480">Forma de Pago
                                    </th>
                                    <th style="width: 1%;">Aplicado al Paciente
                                    </th>
                                    <th style="width: 1%;">Aplicado al Seguro
                                    </th>
                                    <th style="width: 1%;">Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("RINUMERO")%>
                                            </td>
                                            <td>
                                                <%# Eval("NUMERO")%>
                                            </td>
                                            <td>
                                                <%# Eval("NOMBRE") %>
                                            </td>
                                            <td>
                                                <%# Eval("FORMAPAGO")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("FPAGOPACIENTE")).ToString("#,#.00#;(#,#.00#)")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("FPAGOSEGURO")).ToString("#,#.00#;(#,#.00#)")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
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
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Recibo de Ingresos</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- FACTURA ID --%>
                                <div class="control-group">
                                    <label for="cmbFactura" class="control-label" style="color: Red">
                                        Factura</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbFactura" name="cmbFactura" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbFactura" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbFactura" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Tipo de Formas de Pago --%>
                                <div class="control-group">
                                    <label for="cmbFPAGOID" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbFPAGOID" name="cmbFPAGOID" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbFPAGOID" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valcmbFPAGOID" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Detalles de Notas Contables--%>
                                <div class="control-group">
                                    <label for="txtFPAGODETALLES" class="control-label" style="color: Red">
                                        Detalles</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFPAGODETALLES" id="txtFPAGODETALLES" type="text"
                                            class="input-block-level" data-rule-required="true" style="text-transform: uppercase"
                                            maxlength="500" multiple="multiple">
                                    </div>
                                </div>
                                <%-- Monto Nota de Crédito--%>
                                <div class="control-group">
                                    <label for="txtFPAGOPACIENTE" class="control-label">
                                        Aplicado al Paciente</label>
                                    <div class="controls">
                                        <div class="input-append input-prepend">
                                            <span class="add-on">$</span>
                                            <input type="text" placeholder="0.00" class='input-small' runat="server" id="txtFPAGOPACIENTE"
                                                name="txtFPAGOPACIENTE">
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFPAGOPACIENTE" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtFPAGOPACIENTE" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Aplicado al Seguro--%>
                                <div class="control-group">
                                    <label for="txtFPAGOSEGURO" class="control-label">
                                        Aplicado al Seguro</label>
                                    <div class="controls">
                                        <div class="input-append input-prepend">
                                            <span class="add-on">$</span>
                                            <input type="text" placeholder="0.00" class='input-small' runat="server" id="txtFPAGOSEGURO"
                                                name="txtFPAGOSEGURO">
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFPAGOSEGURO" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtFPAGOSEGURO" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
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
