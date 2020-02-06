<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00028.aspx.cs" Inherits="CAID.HCL00028" %>

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
                        <i class="icon-edit"></i>Escala de Ashwhort Modificada
                    </h3>
                    <div class="actions"> 
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn btn-mini" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Escala</button>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-tools">
                        <thead>
                            <tr>
                                <th>
                                    Fecha
                                </th>
                                <th>
                                    Escala
                                </th>
                                <th>
                                    Descripción
                                </th>
                                <th>
                                    Valor
                                </th>
                                <th>
                                    Comentarios
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                            <td>
                                                <%# Eval("FECHA")%>
                                            </td>
                                        <td>
                                            <%# Eval("ESCALAID")%>
                                        </td>
                                            <td>
                                                <%# Eval("ESCALA")%>
                                            </td> 
                                                                                   <td>
                                                <%# Eval("VALOR")%>
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
                    <h3>
                        Evaluación
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
                                ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>--%>
                    <%-- Diagnostico --%>
                    <div class="control-group">
                        <label for="cmbDetalles" class="control-label">
                            Escala</label>
                        <div class="controls">
                            <select runat="server" id="cmbDetalles" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="cmbDetalles" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="cmbDiagnostico1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtEVALUACION" class="control-label">
                            Comentarios</label>
                        <div class="controls">
                            <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="50px"
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
