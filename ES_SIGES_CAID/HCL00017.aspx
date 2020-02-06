<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00017.aspx.cs" Inherits="CAID.HCL00017" %>

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
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Funciones Vitales</h3>
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
                            <%-- IMC --%>
                            <div class="control-group">
                                <label for="txtIMC" class="control-label" style="color: Red">
                                    IMC</label>
                                <div class="controls">
                                    <input runat="server" name="txtIMC" id="txtIMC" disabled="true" type="text" class="input-medium"
                                        data-rule-required="true">
                                </div>
                            </div>
                            <%-- TALLA --%>
                            <div class="control-group">
                                <label for="txtTalla1" class="control-label" style="color: Red">
                                    Talla</label>
                                <div class="controls">
                                    <input runat="server" name="txtTalla1" id="txtTalla1" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Pies">
                                    <input runat="server" name="txtTalla2" id="txtTalla2" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Pulgadas">
                                </div>
                            </div>
                            <%-- PESO --%>
                            <div class="control-group">
                                <label for="txtPeso1" class="control-label" style="color: Red">
                                    Peso</label>
                                <div class="controls">
                                    <input runat="server" name="txtPeso1" id="txtPeso1" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Libras">
                                    <input runat="server" name="txtPeso2" id="txtPeso2" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Onzas">
                                </div>
                            </div>
                            <%-- Frecuencia Cardíaca --%>
                            <div class="control-group">
                                <label for="txtFC" class="control-label" style="color: Red">
                                    Frecuencia Cardíaca
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtFC" id="txtFC" type="text" class="input-medium" data-rule-required="true">
                                </div>
                            </div>
                            <%-- Tensión Arterial --%>
                            <div class="control-group">
                                <label for="txtTA1" class="control-label" style="color: Red">
                                    Tensión Arterial</label>
                                <div class="controls">
                                    <input runat="server" name="txtTA1" id="txtTA1" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Sistólico">
                                    <input runat="server" name="txtTA2" id="txtTA2" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Diastólico">
                                </div>
                            </div>
                            <%-- Frecuencia Respiratoria --%>
                            <div class="control-group">
                                <label for="txtFC" class="control-label" style="color: Red">
                                    Frecuencia Respiratoria
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtFR" id="txtFR" type="text" class="input-medium" data-rule-required="true">
                                </div>
                            </div>
                            <%-- Temperatura --%>
                            <div class="control-group">
                                <label for="txtIMC" class="control-label" style="color: Red">
                                    Temperatura
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtTem" id="txtTem" type="text" class="input-medium"
                                        data-rule-required="true">
                                </div>
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
                                <th>
                                    No.
                                </th>
                                <th>
                                    Fecha y Hora
                                </th>
                                <th>
                                    Evaluación
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
