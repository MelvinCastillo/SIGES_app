<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00015.aspx.cs" Inherits="CAID.HCL00015" %>

<%--Acto Médico: Notas de Evolución--%>
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
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Notas de Evolución</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
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
                            <div class="control-group">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px"
                                    ValidationGroup="pnlData" Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" />
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                    validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="box  box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-table"></i>Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
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
                                <th>Objetivo
                                </th>
                                <th>Notas de Evolución
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# Eval("NUMERO")%>
                                        </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                        <td>
                                            <%# Eval("OBJNOMBRE")%>
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
</asp:Content>
