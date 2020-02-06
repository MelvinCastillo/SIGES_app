<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20006.aspx.cs" Inherits="CAID.HC20006" %>

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
                        <i class="icon-edit"></i>Diagnósticos</h3>
                    <div class="actions">
                        <a href="#modal-mnt-labs" data-toggle="modal" class="btn btn-mini"><i class="icon-plus-sign"
                            rel="tooltip" title="Añadir"></i>&nbsp Añadir Diagnóstico</a>
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
                                        Descripción
                                    </th>
                                    <th class='hidden-1024'>
                                        Código
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
                                                <%# Eval("DIAGNOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("DIAGCODIGO")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("DIAGCOMENTARIOS")%>
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
                            Diagnóstico</label>
                        <div class="controls">
                            <select runat="server" id="txtDIAGNOSTICO" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtDIAGNOSTICO" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtDIAGNOSTICO1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Tipo</label>
                        <div class="controls">
                            <select runat="server" id="txtTIPO" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="NO ESPECIFICA">NO ESPECIFICA</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtTIPO" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtTIPO1" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Reincidencia</label>
                        <div class="controls">
                            <select runat="server" id="txtREINCIDENCIA" class='select2-me input-block-level'>
                             <option value="">-- SELECCIONE --</option>
                                <option value="NO ESPECIFICA">NO ESPECIFICA</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtREINCIDENCIA" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtREINCIDENCIA1" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Principal</label>
                        <div class="controls">
                            <select runat="server" id="txtPRINCIPAL" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtPRINCIPAL" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtPRINCIPAL1" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="textfield" class="control-label">
                            Comentarios</label>
                        <div class="controls">
                            <asp:TextBox ID="txtCOMENTARIOS" runat="server" TextMode="MultiLine" Height="100px"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtCOMENTARIOS" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtCOMENTARIOS1" runat="server" SetFocusOnError="True" />
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
