<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00026.aspx.cs" Inherits="CAID.HCL00026" %>

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
                        <i class="icon-edit"></i>Balance Articular y Muscular</h3>
                </div>
                <div class="box-content">
                    <div class="nopadding">
                        <div class='form-horizontal'>
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
                            <div class="nopadding">
                                <table class="table table-bordered dataTable-scroll-x dataTable-tools">
                                    <thead>
                                        <tr>
                                            <th>
                                                Articulación
                                            </th>
                                            <th>
                                                Movimiento
                                            </th>
                                            <th>
                                                Derecho
                                            </th>
                                            <th>
                                                Izquierdo
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpArticulaciones" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("ARTICULACION")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("MOVIMIENTO")%>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDER" CssClass="input-mini" runat="server" ToolTip='<%# Eval("ARTICULACION")%>'
                                                            ValidationGroup='<%# Eval("MOVIMIENTO")%>' Text='<%# Eval("D1")%>'></asp:TextBox>

                                                        <asp:DropDownList ID="cmbDER" ValidationGroup='<%# Eval("D2")%>'
                                                          runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">Pobre</asp:ListItem>
                                                            <asp:ListItem Value="1">Inicia</asp:ListItem>
                                                            <asp:ListItem Value="2">Malo</asp:ListItem>
                                                            <asp:ListItem Value="3">Regular</asp:ListItem>
                                                            <asp:ListItem Value="+3">+Regular</asp:ListItem>
                                                            <asp:ListItem Value="4">Bueno</asp:ListItem>
                                                            <asp:ListItem Value="+4">+Bueno</asp:ListItem>
                                                            <asp:ListItem Value="5">Normal</asp:ListItem>
                                                            
                                                        </asp:DropDownList>
                                                        <span class="help-block">
                                                            <%# Eval("MOVESCALA")%>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtIZQ" CssClass="input-mini" runat="server" ToolTip='<%# Eval("ARTICULACION")%>'
                                                            ValidationGroup='<%# Eval("MOVIMIENTO")%>' Text='<%# Eval("I1")%>'></asp:TextBox>
                                                        <asp:DropDownList ID="cmbIZQ" ValidationGroup='<%# Eval("I2")%>'
                                                            runat="server">
                                                            <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                            <asp:ListItem Value="0">Pobre</asp:ListItem>
                                                            <asp:ListItem Value="1">Inicia</asp:ListItem>
                                                            <asp:ListItem Value="2">Malo</asp:ListItem>
                                                            <asp:ListItem Value="3">Regular</asp:ListItem>
                                                            <asp:ListItem Value="+3">+Regular</asp:ListItem>
                                                            <asp:ListItem Value="4">Bueno</asp:ListItem>
                                                            <asp:ListItem Value="+4">+Bueno</asp:ListItem>
                                                            <asp:ListItem Value="5">Normal</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="help-block">
                                                            <%# Eval("MOVESCALA")%>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                    validationgroup="pnlData" style="width: 128px; height: 48px">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
