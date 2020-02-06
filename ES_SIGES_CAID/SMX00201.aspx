<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00201.aspx.cs" Inherits="CAID.SMX00201" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--  Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>PLANES DE ARS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Descripción
                                    </th>
                                    <th class="hidden-480">
                                        ARS
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
                                                <%# Eval("ARSNOMBRE")%>
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
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green" validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro del Plan de ARS</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Descipción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Descripción</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-xlarge"
                                            data-rule-required="true" Style="text-transform: uppercase" MaxLength="100">
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Ars -->
                                <div class="control-group">
                                    <label for="cmbPais" class="control-label" style="color: Red">
                                        Ars</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbArs" name="cmbArs" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
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
