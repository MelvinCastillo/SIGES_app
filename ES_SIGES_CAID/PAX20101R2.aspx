<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX20101R2.aspx.cs" Inherits="CAID.PAX20101R2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>HISTORICO DE VISITAS
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-circle-arrow-down"></i>&nbsp Mostrar Entradas</button>
                            <button type="button" id="btnShow2" runat="server" onserverclick="_Show2" class="btn">
                                <i class="icon-circle-arrow-up"></i>&nbsp Mostrar Salidas</button>
                            <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <!-- Fecha Inicio -->
                            <div class="control-group">
                                <label for="txtFecha1" class="control-label" style="color: Red">
                                    Período</label>
                                <div class="controls">
                                    <input runat="server" name="txtFecha1" id="txtFecha1" class="input-medium datepick"
                                        data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                    &nbsp
                                    <input runat="server" name="txtFecha2" id="txtFecha2" class="input-medium datepick"
                                        data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                    &nbsp
                                    <button type="button" id="Button1" runat="server" onserverclick="_Show3" class="btn btn-primary">
                                        <i class="icon-search"></i>&nbsp Buscar</button>
                                    <%--                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>--%>
                                </div>
                            </div>
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                    <thead>
                                        <tr>
                                            <th>
                                                Hora
                                            </th>
                                            <th>
                                                Carnet
                                            </th>
                                            <th>
                                                Paciente
                                            </th>
                                            <th>
                                                Record
                                            </th>
                                            <th>
                                                Tutor / Visitante
                                            </th>
                                            <th>
                                                Motivo
                                            </th>
                                            <th>
                                                Tipo de Documento
                                            </th>
                                            <th>
                                                No. Documento
                                            </th>
                                            <th>
                                                Entrada
                                            </th>
                                            <th style="width: 1%;">
                                                Acciones/Salidas
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpEntradas" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("HORAINI")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CARNET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("PACIENTEDET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RECORDID")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("NOMBRE")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("TIPOVISITADET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("DOCUMENTO")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CEDULAID")%>
                                                    </td>
                                                    <td>
                                                        <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yy") %>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Salida"
                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Exit" OnClick="_Select"
                                                            OnClientClick="return confirm('¿Está seguro que desea procesar la salida del/la visitante?');"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="rpSalidas" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                   <td>
                                                        <%# Eval("HORAINI")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CARNET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("PACIENTEDET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RECORDID")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("NOMBRE")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("TIPOVISITADET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("DOCUMENTO")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CEDULAID")%>
                                                    </td>
                                                    <td>
                                                        <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yy") %>
                                     
                                                    </td>
                                                    <td>
                                                        <%# Eval("HORAFIN")%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Repeater ID="rpTodas" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                   <td>
                                                        <%# Eval("HORAINI")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CARNET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("PACIENTEDET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RECORDID")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("NOMBRE")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("TIPOVISITADET")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("DOCUMENTO")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CEDULAID")%>
                                                    </td>
                                                    <td>
                                                        <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yy") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("ESTADOHORAFIN")%>
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
        </div>
    </asp:Panel>
</asp:Content>
