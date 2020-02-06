<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX10050.aspx.cs" Inherits="CAID.SMX10050" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>HORARIOS
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn">
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
                                                <%# Eval("HORADESCRIPCION")%>
                                                <%--  <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("HORADESCRIPCION")%>'
                                                    CommandArgument='<%# Eval("HORAID")%>' CommandName="Edit" OnClick="_Select"></asp:LinkButton>--%>
                                            </td>
                                            <%--<td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("HORAID")%>' CommandName="Delete" OnClick="_Select"
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
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Horarios</h3>
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
                                <div class="control-group">
                                    <label for="cmbHora" class="control-label" style="color: Red">
                                        Horario</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbHora" name="cmbHora" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <asp:RequiredFieldValidator ControlToValidate="cmbHora" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbHora1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="cmbIntervalo" class="control-label" style="color: Red">
                                        Duración</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbIntervalo" name="cmbIntervalo" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="15">15 Minutos</option>
                                            <option value="30">30 Minutos</option>
                                            <option value="45">45 Minutos</option>
                                            <option value="60">60 Minutos</option>
                                        </select>
                                        <asp:RequiredFieldValidator ControlToValidate="cmbIntervalo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbIntervalo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
