<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00500.aspx.cs" Inherits="CAID.PAX00500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>PACIENTES
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
                                        Nombres y Apellidos
                                    </th>
                                    <th>
                                        No. Record
                                    </th>
                                    <th class="hidden-480">
                                        Centro
                                    </th>
                                    <th style="width: 1%;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpDataPacientes" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <%# Eval("RECORDIDSTR")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("ROWSGXID")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnSelect" CssClass="btn btn-blue" runat="server" Text="Consultar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Edit" OnClick="_Select"></asp:LinkButton>
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
    </asp:Panel>
    <%-- Detalles Historia Clínica --%>
    <asp:Panel runat="server" ID="pnlData" Visible="false">
        <div class="row-fluid">
            <asp:Repeater ID="rpPaxHeader" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="span6">
                    <div class="box  box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-table"></i>RESUMEN DEL PLAN DE TRATAMIENTO
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
                                            Objetivos
                                        </th>
                                        <th style="width: 1%;">
                                            Actividades
                                        </th>
                                        <th style="width: 1%;">
                                            Avance
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpPaxPlan" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# Eval("OBJ_NOMBRE")%>
                                                </td>
                                                <td>
                                                    <%# Eval("OBJ_ACTIVIDADES")%>
                                                </td>
                                                <td>
                                                    <%# Eval("INDICARDO_GRAFICO")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="box  box-bordered">
                        <div class="box-title">
                            <h3>
                                <i class="icon-table"></i>ACTIVIDADES DEL PLAN DE TRATAMIENTO
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
                                            Actividades
                                        </th>
                                        <th style="width: 1%;">
                                            Avance
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpPaxAct" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# Eval("OBJ_NOMBRE")%>
                                                </td>
                                                <td>
                                                    <%# Eval("INDICARDO_GRAFICO")%>
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
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-reorder"></i>HISTORIAL
                        </h3>
                        <div class="actions">
                            <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <asp:Repeater ID="rpPaxHC" runat="server">
                            <ItemTemplate>
                                <%# Eval("HTML")%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
