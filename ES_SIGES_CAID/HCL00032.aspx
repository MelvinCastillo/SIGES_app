<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00032.aspx.cs" Inherits="CAID.HCL00032" %>

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
                        <i class="icon-edit"></i>Tabla ACC - Registro de Datos</h3>
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
                                <label for="cmbObjetivo" class="control-label">
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
                                <label for="cmbObjetivo" class="control-label">
                                    Actividad</label>
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

                            <%-- Hora--%>
                            <div class="control-group">
                                <label for="txtHora" class="control-label">
                                    <strong>Hora</strong>
                                </label>
                                <div class="controls">
                                    <div class="bootstrap-timepicker">
                                        <input type="text" name="txtHora" runat="server" id="txtHora" class="input-small timepick">
                                    </div>
                                </div>
                            </div>

                            <%-- Lugar--%>
                            <div class="control-group">
                                <label for="txtLugar" class="control-label">
                                    <strong>Lugar</strong>
                                </label>
                                <div class="controls">
                                    <input type="text" runat="server" name="txtLugar" id="txtLugar" placeholder="Lugar" class="input-block-level">
                                </div>
                            </div>

                            <%-- Antecedentes--%>
                            <div class="control-group">
                                <label for="txtAntecedentes" class="control-label">
                                    <strong>Antecedentes</strong>
                                    <br>
                                    Describir los factores desencadenados o lo que ocurrió justo antes de ...
                                </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAntecedentes" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Antecedentes" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Conducta--%>
                            <div class="control-group">
                                <label for="txtConducta" class="control-label">
                                    <strong>Conducta</strong>
                                    <br>
                                    Describir lo que pasó...
                                </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtConducta" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Conducta" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Consecuencias--%>
                            <div class="control-group">
                                <label for="txtConsecuencias" class="control-label">
                                    <strong>Consecuencias</strong>
                                    <br>
                                    ¿Qué evento positivo o negativo ocurrió inmediatamente?
                                </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtConsecuencias" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Consecuencias" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                             <%-- Posible Función--%>
                            <div class="control-group">
                                <label for="txtPosibleFuncion" class="control-label">
                                    <strong>Posible función</strong>
                                    <br>
                                    (Escape, atención, sensorial, tangible)
                                </label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPosibleFuncion" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Posible función" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>


                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
                                    Observaciones</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>
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

                    <table class="table table-hover table-nomargin table-striped dataTable dataTable-noheader dataTable-scroll-x" data-grouping="expandable">
                        <thead>
                            <tr>

                                <th style="width: 20%;">Fecha y Hora
                                </th>
                                <th>Detalles
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>

                                        <td style="width: 20%;">
                                            <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                        </td>
                                        <td>
                                            <%# Eval("DETALLES")%>
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
