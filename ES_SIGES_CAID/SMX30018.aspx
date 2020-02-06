<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX30018.aspx.cs" Inherits="CAID.SMX30018" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>TIPOS DE VISTAS
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Descripción
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
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("NOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
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
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Contactos</h3>
                        <div class="actions">
                            <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                                validationgroup="pnlData">
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
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Descripción</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="txtNombre1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="txtTipo" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                        <select runat="server" id="txtTipo" name="txtTipo" class='select2-me input-block-level' data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="V">VISITA</option>
                                            <option value="C">CITA</option>
                                        </select>
                                        <asp:RequiredFieldValidator ControlToValidate="txtTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="txtTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
