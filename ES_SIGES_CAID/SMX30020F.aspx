<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX30020F.aspx.cs" Inherits="CAID.SMX30020F" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Diagnósticos Frecuentes
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                <i class="icon-refresh"></i>&nbsp Mostrar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>Frecuente
                                    </th>
                                    <th>Código
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
                                                <%# Eval("NOMBRE")%>
                                            </td>
                                            <td>
                                                <%# Eval("CODIGO1")%>
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
                            <i class="icon-edit"></i>Registro de Diagnósticos Frecuentes</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Frecuente --%>
                                <div class="control-group">
                                <label for="cmbObjetivo"  class="control-label" style="color:red; font-size:small;">
                                    Diagnóstico</label>
                                <div class="controls">
                                    <select runat="server" id="cmbFrecuente" name="cmbFrecuente" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbFrecuente" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbFrecuente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
