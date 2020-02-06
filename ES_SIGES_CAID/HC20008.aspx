<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20008.aspx.cs" Inherits="CAID.HC20008" %>

<%--Acto Médico: Laboratorios--%>
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
                        <i class="icon-edit"></i>Laboratorios</h3>
                    <div class="actions">
                        <a href="#modal-mnt-labs" data-toggle="modal" class="btn btn-mini"><i class="icon-plus-sign"
                            rel="tooltip" title="Añadir"></i>&nbsp Añadir Exámen</a>
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
                                        Examenes
                                    </th>
                                    <th class='hidden-1024'>
                                        Resultados
                                    </th>
                                    <th class='hidden-1024'>
                                        Observaciones
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
                                                <%# Eval("EXANOMBRE")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("EXARESULTADOS")%>
                                            </td>
                                            <td class='hidden-1024'>
                                                <%# Eval("EXAOBSERVACIONES")%>
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
    <%--Modales: Laboratorios--%>
    <div id="modal-mnt-labs" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                ×</button>
            <h3 id="H2">
                Pruebas y Analíticas</h3>
        </div>
        <div class="modal-body">
            <div class='form-horizontal form-bordered'>
                <div class="box-content nopadding">
                    <div class="control-group">
                        <select runat="server" id="txtEXAMEN" class='select2-me input-block-level'>
                            <option value="">-- SELECCIONE --</option>
                        </select>
                        &nbsp
                        <asp:RequiredFieldValidator ControlToValidate="txtEXAMEN" Display="Dynamic" ErrorMessage="Requerido!"
                            ForeColor="Red" ID="txtEXAMEN1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
