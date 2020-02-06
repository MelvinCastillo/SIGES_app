<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00000_A.aspx.cs" Inherits="CAID.PAX00000_A" %>

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
                        <i class="icon-edit"></i>Registro de Alertas 
                    </h3>
                    <div class="actions">
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Alerta</button>
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
                                <th>Detalles
                                </th>
                                <%--<th>Acciones
                                </th>--%>
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
                                            <%# Eval("ALERTA")%>
                                        </td>
                                        <%--<td>
                                           
                                        </td>--%>
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
                    <h3>Alertas
                    </h3>
                    <div class="actions">
                        <button id="btnCloseMSG" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="txtEVALUACION" class="control-label">
                            Detalles</label>
                        <div class="controls">
                            <asp:TextBox ID="txtAlertas" runat="server" TextMode="MultiLine" Height="100px"
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
