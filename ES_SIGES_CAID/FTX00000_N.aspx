<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX00000_N.aspx.cs" Inherits="CAID.FTX00000_N" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>               
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>NOTAS CONTABLES
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        No.
                                    </th>
                                    <th>
                                        Factura
                                    </th>
                                    <th class="hidden-480">
                                        Paciente
                                    </th>
                                    <th style="width: 1%;">
                                        Aplicado al Paciente
                                    </th>
                                    <th style="width: 1%;">
                                        Aplicado al Seguro
                                    </th>
                                    <th style="width: 1%;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("NCNUMERO")%>
                                            </td>
                                            <td>
                                                <%# Eval("NUMERO")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("NOMBRE")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("TIPONCPACIENTE")).ToString("#,#.00#;(#,#.00#)")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("TIPONCSEGURO")).ToString("#,#.00#;(#,#.00#)")%>
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
                            <i class="icon-edit"></i>Registro de Notas Contables</h3>
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
                                <%-- Tipo de Notas Contables --%>
                                <div class="control-group">
                                    <label for="cmbTNotasContables" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTNotasContables" name="cmbTNotasContables" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTNotasContables" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valcmbTNotasContables" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Detalles de Notas Contables--%>
                                <div class="control-group">
                                    <label for="txtTIPONCDETALLES" class="control-label" style="color: Red">
                                        Detalles</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTIPONCDETALLES" id="txtTIPONCDETALLES" type="text"
                                            class="input-block-level" data-rule-required="true" style="text-transform: uppercase"
                                            maxlength="500" multiple="multiple">
                                    </div>
                                </div>
                                <%-- Monto Nota de Crédito--%>
                                <div class="control-group">
                                    <label for="txtTIPONCPACIENTE" class="control-label">
                                        Aplicado al Paciente</label>
                                    <div class="controls">
                                        <div class="input-append input-prepend">
                                            <span class="add-on">$</span>
                                            <input type="text" placeholder="0.00" class='input-small' runat="server" id="txtTIPONCPACIENTE"
                                                name="txtTIPONCPACIENTE">
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTIPONCPACIENTE" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtTIPONCPACIENTE" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Monto Nota de Crédito--%>
                                <div class="control-group">
                                    <label for="txtTIPONCSEGURO" class="control-label">
                                        Aplicado al Seguro</label>
                                    <div class="controls">
                                        <div class="input-append input-prepend">
                                            <span class="add-on">$</span>
                                            <input type="text" placeholder="0.00" class='input-small' runat="server" id="txtTIPONCSEGURO"
                                                name="txtTIPONCSEGURO">
                                        </div>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTIPONCSEGURO" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtTIPONCSEGURO" runat="server" SetFocusOnError="True"
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
