<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00311.aspx.cs" Inherits="CAID.HCX00311" %>

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
                    
                        
                    <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                        <i class="icon-refresh"></i>&nbsp Mostrar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>ACTIVIDADES
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Objetivo
                                    </th>
                                    <th>
                                        Actividades
                                    </th>
                                    <%--<th style="width: 1%;">
                                        Acciones
                                    </th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("OBJETIVONOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>                                           
                                                <%# Eval("ACTIVIDADES")%>

                                            </td>
                                            <%--<td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
                                            </td>--%>
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
                    <%--<button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>--%>
                    <%--<button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>--%>
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
                            <i class="icon-edit"></i>Registro de Actividades de Objetivos</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Objetivo --%>
                                <%--<div class="control-group">
                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                        Objetivo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>--%>

                                 <%-- Objetivo --%>
                                <div class="control-group">
                                    <label for="txtObjetivo" class="control-label" style="color: Red">
                                        Objetivo</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <%-- Servicio --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                        Servicio</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEspecialidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                               
                                <%-- Actividades --%>
                                <div class="control-group">
                                    <label for="txtDetallesActividades" class="control-label" style="color: Red">
                                        Actividad</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDetallesActividades" id="txtDetallesActividades" type="text" class="input-xxlarge"
                                            data-rule-required="true">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp
                                        </button>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtDetallesActividades" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDetallesActividades" runat="server" SetFocusOnError="True" ValidationGroup="pnlDetalles" />
                                        <div class="box box-color box-bordered">
                                            <div class="box-title">
                                                <h3>
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
    <%--Actividades --%>
    <asp:Panel runat="server" ID="pnlActividad">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="Button1" runat="server" onserverclick="_Save2" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="Button2" runat="server" onserverclick="_Cancel2" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="Button3" runat="server" onserverclick="_Back2" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Actualización Actividades</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Activiadad --%>
                                <div class="control-group">
                                    <label for="cmbActividad" class="control-label" style="color: Red">
                                        Actividad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbActividad" name="cmbActividad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbActividad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbActividad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtCompletado" class="control-label" style="color: Red">
                                        % Avance
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtCompletado" id="txtCompletado" type="text" class='spinner input-mini'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ID="valtxtCompletado" ControlToValidate="txtCompletado" Display="Dynamic"
                                            ErrorMessage="Requerido!" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
