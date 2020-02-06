<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="INDEX_R.aspx.cs" Inherits="CAID.SMX00530" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <div class="box  box-bordered green">
        <div class="box-title">
            <h3>
                <i class="icon-calendar"></i>Citas Registradas</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <!-- Fecha Inicio -->
                <div class="control-group">
                    <label for="txtFecha1" class="control-label" style="color: Red">
                        Fecha</label>
                    <div class="controls">
                        <input runat="server" name="txtFecha1" id="txtFecha1" class="input-medium datepick"
                            data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                            <i class="icon-search"></i>&nbsp Buscar</button>
                    </div>
                </div>
                <div class="control-group">
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">
                                        Cita No.
                                    </th>
                                    <th>
                                        Record #
                                    </th>
                                    <th>
                                        Nombre del Paciente
                                    </th>
                                    <th>
                                        Especialista / Terapeuta
                                    </th>
                                    <th>
                                        Servicio
                                    </th>
                                    <th class="hidden-480">
                                        Fecha
                                    </th>
                                    <th class="hidden-480">
                                        Horario
                                    </th>
                                    <th style="width: 1%;">
                                        Estatus
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <th>
                                                <%# Eval("NUMERO")%>
                                            </th>
                                            <td>
                                                <%# Eval("RECORDID")%>
                                            </td>
                                            <td>
                                                <%# Eval("FULLNAME")%>
                                            </td>
                                            <td>
                                                <%# Eval("TERAPISTANOMBRE")%>
                                            </td>
                                            <td>
                                                <%# Eval("ESPECIALIDAD")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime( Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt")%>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                            </td>
                                            <td>
                                                <%# Eval("CITAICONO")%>
                                                &nbsp<%# Eval("CITAESTADO")%>
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
</asp:Content>
