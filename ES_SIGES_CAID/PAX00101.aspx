<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00101.aspx.cs" Inherits="CAID.PAX00101" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Entrevista Social --%>
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Clasificación Dígital Escala Socioeconómica</h3>
                    <div class="actions">
                        <button id="btnSave" runat="server" onserverclick="_Save" class="btn" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Paciente</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Subsidio Gubernamental</label>
                                <div class="controls">
                                    <select runat="server" id="txtP1" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Ingresos</label>
                                <div class="controls">
                                    <select runat="server" id="txtP2" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Lugar de Residencia</label>
                                <div class="controls">
                                    <select runat="server" id="txtP3" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Vivienda</label>
                                <div class="controls">
                                    <select runat="server" id="txtP4" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Costo de traslado al Centro</label>
                                <div class="controls">
                                    <select runat="server" id="txtP5" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Vehículo</label>
                                <div class="controls">
                                    <select runat="server" id="txtP6" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Númedo de dependientes</label>
                                <div class="controls">
                                    <select runat="server" id="txtP7" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Otros dependientes con discapacidad o enfermedad</label>
                                <div class="controls">
                                    <select runat="server" id="txtP8" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Clasificación de la Vivienda</label>
                                <div class="controls">
                                    <select runat="server" id="txtP9" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Tipo de Trabajo</label>
                                <div class="controls">
                                    <select runat="server" id="txtP10" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Histórico</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Fecha
                                    </th>
                                       <th>
                                        Hora
                                    </th>
                                    <th>
                                        Puntuación
                                    </th>
                                    <th>
                                        Categoría
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("hh:mm tt") %>
                                            </td>
                                            <td>
                                                <%# Eval("TOTAL")%>
                                            </td>
                                            </td>
                                            <td>
                                                <%# Eval("CATEGORIA")%>
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
    <%--   Alerta --%>
    <asp:Panel CssClass="modal" ID="pnlClaseSocial" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>
                        Puntuación
                    </h3>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="txtRNC" class="control-label" style="color: Red">
                            TOTAL</label>
                        <div class="controls">
                            <input runat="server" name="txtTotal" id="txtTotal" type="text" class="input-block-level"
                                data-rule-required="true">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="cmbTipoNCF" class="control-label" style="color: Red">
                            CATEGORIA</label>
                        <div class="controls">
                            <select runat="server" id="txtCategoria" class='select2-me input-block-level' data-rule-required="true">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveNCF" runat="server" class="btn btn-primary" onserverclick="_CloseModal"
                        data-dismiss="modal">
                        <i class="icon-ok"></i>&nbsp Aceptar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
