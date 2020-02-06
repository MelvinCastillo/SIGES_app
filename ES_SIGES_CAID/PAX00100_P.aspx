<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00100_P.aspx.cs" Inherits="CAID.PAX00100_P" %>

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
                            <i class="icon-table"></i>PREGUNTAS
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
                                        Orden
                                    </th>
                                    <th class="hidden-480">
                                        Grupo
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
                                                <%# Eval("ORDEN")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("GRUPONAME")%>
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
                            <i class="icon-edit"></i>Registro de Preguntas</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Grupo de Preguntas -->
                                <div class="control-group">
                                    <label for="cmbGrupo" class="control-label" style="color: Red">
                                        Grupo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbGrupo" name="cmbGrupo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbGrupo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbGrupo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Descripción</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Orden --%>
                                <div class="control-group">
                                    <label for="txtOrden" class="control-label" style="color: Red">
                                        Orden
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtOrden" id="txtOrden" type="text" class='input-small'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ID="valtxtOrden" ControlToValidate="txtOrden" Display="Dynamic"
                                            ErrorMessage="Requerido!" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Respuestas --%>
                                <div class="control-group">
                                    <label for="txtRespuesta" class="control-label" style="color: Red">
                                        Respuestas</label>
                                    <div class="controls">
                                        <input runat="server" name="txtRespuesta" id="txtRespuesta" placeholder="Alternativa"
                                            type="text" class="input-xlarge" data-rule-required="true">
                                        <input runat="server" name="txtRespuestaValor" id="txtRespuestaValor" placeholder="Puntos"
                                            type="text" class="input-mini" data-rule-required="true">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtRespuesta" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtRespuesta" runat="server" SetFocusOnError="True" ValidationGroup="pnlDetalles" />
                                        <div class="box  box-bordered">
                                            <div class="box-title">
                                                <h3>
                                                    </i>
                                                </h3>
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
                                                                        <%# Eval("VALOR")%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnAdd" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDet" OnClick="_Select"></asp:LinkButton>
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
