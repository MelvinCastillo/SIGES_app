<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00001.aspx.cs" Inherits="CAID.SGX00001" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--  Consulta General --%>
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
                            <i class="icon-table"></i>OPCIONES
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
                                        Descripción
                                    </th>
                                    <th class="hidden-480">
                                        URL
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
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("OPCIONORDEN")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("NOMBRE1")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("OPCIONURL")%>
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
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green">
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
                            <i class="icon-edit"></i>Registro de Opciones</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Descripción</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-xlarge"
                                            data-rule-required="true">
                                    </div>
                                </div>
                                <%-- Origen combo --%>
                                <div class="control-group">
                                    <label for="cmbOrigen" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbOrigen" runat="server" AutoPostBack="true" CssClass="select2-me input-xlarge"
                                            OnSelectedIndexChanged="cmbOrigen_SelectedIndexChanged">
                                            <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                            <asp:ListItem>NODO</asp:ListItem>
                                            <asp:ListItem Value="No">OPCION</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbOrigen" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbOrigen" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Nodo cmbNodoId--%>
                                <div class="control-group">
                                    <label for="cmbNodoId" class="control-label" style="color: Red">
                                        Nodo
                                    </label>
                                    <div class="controls">
                                        <select runat="server" id="cmbNodoId" name="cmbNodoId" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ID="valcmbNodoId" ControlToValidate="cmbNodoId" Display="Dynamic"
                                            ErrorMessage="Requerido!" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Formularios --%>
                                <div class="control-group">
                                    <label for="cmbFormularios" class="control-label" style="color: Red">
                                        URL</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbFormularios" name="cmbFormularios" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                    </div>
                                </div>
                                <%-- txtArgumento --%>
                                <div class="control-group">
                                    <label for="txtArgumento" class="control-label" style="color: Red">
                                        Argumentos</label>
                                    <div class="controls">
                                        <input runat="server" name="txtArgumento" id="txtArgumento" type="text" class="input-xlarge"
                                            data-rule-required="true">
                                    </div>
                                </div>
                                <%-- Orden --%>
                                <div class="control-group">
                                    <label for="txtOrden" class="control-label" style="color: Red">
                                        Orden
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtOrden" id="txtOrden" type="text" class='spinner input-mini'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ID="valtxtOrden" ControlToValidate="txtOrden" Display="Dynamic"
                                            ErrorMessage="Requerido!" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- ACTIVO combo --%>
                                <div class="control-group">
                                    <label for="cmbActivo" class="control-label" style="color: Red">
                                        Estado</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbActivo" name="cmbActivo" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="S">ACTIVO</option>
                                            <option value="N">INACTIVO</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbActivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbActivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
