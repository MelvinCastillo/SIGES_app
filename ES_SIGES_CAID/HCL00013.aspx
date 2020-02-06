<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00013.aspx.cs" Inherits="CAID.HCL00013" %>

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
                        <i class="icon-edit"></i>Diagnósticos
                    </h3>
                    <div class="actions">
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn btn-mini" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Diagnóstico</button>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                        <thead>
                            <tr>
                                <th>
                                    No.
                                </th>
                                <th>
                                    Fecha y Hora
                                </th>
                                <th>
                                    Especialista
                                </th>
                                <th>
                                    Diagnóstico
                                </th>
                                <th>
                                    Tipo
                                </th>
                                <th>
                                    Reincidencia
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
                                            <%# Eval("DIAGNOMBRE")%>
                                        </td>
                                        <td>
                                            <%# Eval("TIPONOMBRE")%>
                                        </td>
                                        <td>
                                            <%# Eval("DIAGREINCIDENCIA")%>
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
                        Diagnóstico
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
                    <%-- Diagnostico --%>
                    <div class="control-group">
                        <label for="cmbDiagnostico" class="control-label">
                            Diagnóstico</label>
                        <div class="controls">
                            <select runat="server" id="cmbDiagnostico" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="cmbDiagnostico" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="cmbDiagnostico1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="cmbTipoDiagnostico" class="control-label">
                            Tipo</label>
                        <div class="controls">
                            <select runat="server" id="cmbTipoDiagnostico" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="PRESUNTIVO">PRESUNTIVO</option>
                                <option value="PATOGENETICO">PATOGENETICO</option>
                                <option value="SINTOMATICO">SINTOMATICO</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="cmbTipoDiagnostico" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="cmbTipoDiagnostico1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="cmbReinicidenciaDiagnostico" class="control-label">
                            Reincidencia</label>
                        <div class="controls">
                            <select runat="server" id="cmbReinicidenciaDiagnostico" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="PRIMERA VEZ">PRIMERA VEZ</option>
                                <option value="SEGUNDA VEZ">SEGUNDA VEZ VEZ</option>
                                <option value="REINCIDENTE">REINCIDENTE</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="cmbReinicidenciaDiagnostico" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="cmbReinicidenciaDiagnostico1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="cmbPrincipal" class="control-label">
                            Principal</label>
                        <div class="controls">
                            <select runat="server" id="cmbPrincipal" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="cmbPrincipal" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="cmbPrincipal1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
