<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20010.aspx.cs" Inherits="CAID.HC20010" %>

<%--Acto Médico: Diagnósticos--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="row-fluid">
            <asp:Repeater ID="rpPaxHeader" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    <div class="row-fluid">
        <div class="box">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Procedimientos</h3>
                    <div class="actions">
                        <a href="#modal-mnt-labs" data-toggle="modal" class="btn btn-mini"><i class="icon-plus-sign"
                            rel="tooltip" title="Añadir"></i>&nbsp Añadir Procedimiento</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="box-content nopadding">
                        <table class="table table-hover table-nomargin table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 1%">
                                        No.
                                    </th>
                                    <th style="width: 15%">
                                        Fecha
                                    </th>
                                    <th>
                                        Procedimiento
                                    </th>
                                    <th class='hidden-1024'>
                                        Und. Medida
                                    </th>
                                    <th class='hidden-1024'>
                                        Dosis
                                    </th>
                                    <th class='hidden-1024'>
                                        Duración
                                    </th>
                                    <th class='hidden-1024'>
                                        Comentarios
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="_DataBinder" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <th>
                                                <%# Eval("NUMERO")%>
                                            </th>
                                            <td>
                                                <%# Eval("FECHA")%>
                                            </td>
                                            <td>
                                                <%# Eval("PROCNOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("UNDNOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("DOSISNOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("DURACIONNOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("PROCCOMENTARIOS")%>
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
    <%------------------------------------------------------------------------------------------------------------------------%>
    <%--Modales: Diagnósticos--%>
    <div id="modal-mnt-labs" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×</button>
            <h3 id="H2">
                Diagnóstico</h3>
        </div>
        <div class="modal-body">
            <div class='form-horizontal form-bordered'>
                <div class="box-content nopadding">
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Principio Activo</label>
                        <div class="controls">
                            <select runat="server" id="txtPROCEDIMIENTO" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtPROCEDIMIENTO" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="txtPROCEDIMIENTO1" runat="server"
                                SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Unidad de Medida</label>
                        <div class="controls">
                            <select runat="server" id="txtUNDMEDIDA" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="NO ESPECIFICA">NO ESPECIFICA</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtUNDMEDIDA" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtUNDMEDIDA1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Dosis</label>
                        <div class="controls">
                            <select runat="server" id="txtDOSIS" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="NO ESPECIFICA">NO ESPECIFICA</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtDOSIS" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtDOSIS1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Duración</label>
                        <div class="controls">
                            <select runat="server" id="txtDURACION" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtDURACION" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtDURACION1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Comentarios</label>
                        <div class="controls">
                            <asp:TextBox ID="txtCOMENTARIOS" runat="server" TextMode="MultiLine" Height="100px"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtCOMENTARIOS" Display="Dynamic"
                                ErrorMessage="Requerido!" ForeColor="Red" ID="txtCOMENTARIOS1" runat="server"
                                SetFocusOnError="True" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="btnSaveNotas" runat="server" onserverclick="_Save" validationgroup="pnlData"
                class="btn btn-primary" data-dismiss="modal">
                <i class="icon-save"></i>&nbsp Guardar</button>
        </div>
    </div>

</asp:Content>
