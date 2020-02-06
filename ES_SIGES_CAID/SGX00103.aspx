<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00103.aspx.cs" Inherits="CAID.SGX00103" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <%--<asp:Panel runat="server" ID="pnlConsulta">
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
                            <i class="icon-table"></i>Usuarios por Supervisores
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Supervisor
                                    </th>
                                    <th class="hidden-480">
                                        Usuario
                                    </th>
                                    <th class="hidden-480">
                                        País
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
                                            <td class="hidden-480">
                                                <%# Eval("CODIGOID")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("PAISNOMBRE")%>
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
    </asp:Panel>--%>
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <%--<button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green" validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>--%>
                    <%--<button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>--%>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Usuarios a Supervisores</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                
                                <%-- Plan de Servicios --%>
                                <div class="control-group">
                                    <label for="cmbSupervisor" class="control-label" style="color: Red">
                                        Supervisor</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbSupervisor" runat="server" CssClass="select2-me input-block-level"
                                            AutoPostBack="True" OnSelectedIndexChanged="cmbSupervisor_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbSupervisor" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbSupervisor" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Usuarios --%>
                                <div class="control-group">
                                    <label for="cmbUsuario" class="control-label" style="color: Red">
                                        Usuario</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbUsuario" name="cmbUsuario" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbUsuario" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbUsuario" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label for="txtDetalles" class="control-label" style="color: Red">
                                        Acciones
                                    </label>
                                    <div class="controls">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-ok"></i>&nbsp Vincular
                                        </button>
                                    </div>
                                </div>

                                <div class="control-group">
                                    
                                    <table class="table table-bordered dataTable-scroll-x">
                        <thead>
                            <tr>
                                <th>
                                    Usuario
                                </th>   
                                <th>
                                    Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpDetalles" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("USUARIO")%>
                                        </td>
                                        
                                        <td>
                                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"></asp:LinkButton>
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

        
    </asp:Panel>
</asp:Content>
