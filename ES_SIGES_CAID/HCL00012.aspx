﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00012.aspx.cs" Inherits="CAID.HCL00012" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Exámenes Auxiliares
                    </h3>
                    <div class="actions">
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn btn-mini" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Exámene</button>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                        <thead>
                            <tr>
                                <th>No.
                                </th>
                                <th>Fecha y Hora
                                </th>
                                <th>Especialista
                                </th>
                                <th>Descripción
                                </th>
                                <th>Condición
                                </th>
                                <th>Comentarios
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# Eval("NUMERO")%>
                                        </th>
                                        <td>
                                            <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                        </td>
                                        <td>
                                            <%# Eval("TERAPEUTA")%>
                                            <br />
                                            <%# Eval("ESPECIALIDAD")%>
                                        </td>
                                        <td>
                                            <%# Eval("EAXNOMBRE")%>
                                        </td>
                                        <td>
                                            <%# Eval("ESTADO")%>
                                        </td>
                                        <td>
                                            <%# Eval("DATOS")%>
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
    <%--Modal: Mantenimiento--%>
    <asp:Panel CssClass="modal" ID="MNTAUXILIAR" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Exámenes
                    </h3>
                    <div class="actions">
                        <button id="btnCloseMSG" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <%-- Tipo de Evaluación --%>
                    <div class="control-group">
                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                            Especialidad</label>
                        <div class="controls">
                            <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <%-- Objetivo --%>
                    <div class="control-group">
                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                            Objetivo</label>
                        <div class="controls">
                            <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <%-- Prueba --%>
                    <div class="control-group">
                        <label for="cmbDetalles" class="control-label">
                            Prueba</label>
                        <div class="controls">
                            <select runat="server" id="cmbDetalles" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                       
                            <asp:RequiredFieldValidator ControlToValidate="cmbDetalles" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="cmbDiagnostico1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <%-- Estado --%>
                    <div class="control-group">
                        <label for="cmbCondicion" class="control-label">
                            Condición</label>
                        <div class="controls">
                            <select runat="server" id="cmbCondicion" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="NO APLICA">NO APLICA</option>
                                <option value="NORMAL">NORMAL</option>
                                <option value="PATOLOGÓGICA">PATOLOGÓGICA</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="cmbCondicion" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="valcmbCondicion" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtEVALUACION" class="control-label">
                            Comentarios</label>
                        <div class="controls">
                            <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="100px"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveNotas" runat="server" onserverclick="_Save" validationgroup="pnlData"
                        class="btn btn-primary" data-dismiss="modal">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Sombra--%>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
