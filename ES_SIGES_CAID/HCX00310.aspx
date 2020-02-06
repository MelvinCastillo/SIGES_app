<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00310.aspx.cs" Inherits="CAID.HCX00310" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
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
                            <i class="icon-table"></i>OBJETIVOS Y ACTIVIDADES
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-tools">
                            <thead>
                                <tr>
                                    <th>Objetivos
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
                            <i class="icon-edit"></i>Registro de Objetivos y Actividades</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>

                                <%-- Especialidad --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label">
                                        Servicio</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEspecialidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%--Tipo--%>
                                <div class="control-group">
                                    <label for="cmbTipoOBJ" class="control-label">
                                        Área</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbTipoOBJ" runat="server" CssClass="select2-me input-block-level"
                                             AutoPostBack="false" data-rule-required="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipoOBJ" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbTipoOBJ" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                    </div>
                                </div>
                                <%-- Objetivo --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Objetivo</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <%-- Detalles --%>
                                <div class="control-group">
                                    <label for="txtDetalles" class="control-label">
                                        Actividad</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDetalles" id="txtDetalles" type="text" class="input-xxlarge"
                                            data-rule-required="true">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDetalles" runat="server" SetFocusOnError="True" ValidationGroup="pnlDetalles" />
                                        <div class="box  box-bordered">
                                            <div class="box-title">
                                                <h3></h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <tbody>
                                                        <asp:Repeater ID="rpDetalles" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("NOMBRE")%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnDeleteDet" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDet" OnClick="_Select2"></asp:LinkButton>
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
        </div>
    </asp:Panel>
</asp:Content>
