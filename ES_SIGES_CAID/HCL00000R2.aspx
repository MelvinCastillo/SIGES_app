<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00000R2.aspx.cs" Inherits="CAID.HCL00000R2" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <i class="icon-table"></i>Consultar Historial Clínico
            </h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <!-- Paciente -->
                <div class="control-group">
                    <label for="cmbPaciente" class="control-label" style="color: Red">
                        Paciente</label>
                    <div class="controls">
                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                            data-rule-required="true">
                            <option value="">-- TODAS --</option>
                        </select>
                    </div>
                </div>
                <!-- Especialidad -->
                <div class="control-group">
                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                        Especialidad</label>
                    <div class="controls">
                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                            data-rule-required="true">
                            <option value="">-- TODAS --</option>
                        </select>
                    </div>
                </div>
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
                    </div>
                </div>
                <div class="control-group">
                    <label for="txtFecha2" class="control-label" style="color: Red">
                        Acciones</label>
                    <div class="controls">
                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                            <i class="icon-search"></i>&nbsp Buscar</button>
                        <%--<button type="button" id="btnPrint" runat="server" onserverclick="_Show" disabled="true"
                            class="btn btn-primary">
                            <i class="icon-print"></i>&nbsp Imprimir</button>--%>
                    </div>
                </div>
                <div class="control-group">
                    <div class="box-content nopadding">
                        <%--Consulta Externa--%>
                        <div class="accordion accordion-widget" id="HistorialClinico">
                            <%--Ingresos--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ING">Consultas</a>
                                </div>
                                <div id="CE-ING" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Estado
                                                            </th>
                                                            <%--<th style="width: 45%;">Observaciones</th>--%>
                                                            <th>Imprimir
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ING" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("ESTADO")%>
                                                                    </td>
                                                                    <%--<td style="width: 45%;"><%# Eval("DATOSFIN")%></td>--%>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnPrint1" CssClass="btn btn-green" runat="server" Text="Resumen"
                                                                            CommandArgument='<%# Eval("ACTOGUID")%>' CommandName="Print_Resumen" OnClick="_Select"></asp:LinkButton>
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
                            <%--Notas de Evolución --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVO">Notas de Evolución</a>
                                </div>
                                <div id="CE-EVO" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVO" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Motivos de Consulta--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-MOTCONS">Motivos de Consulta</a>
                                </div>
                                <div id="CE-MOTCONS" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_MOTCONS" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Hisotria de la Enfermedad--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-HEN">Historia de la Enfermedad</a>
                                </div>
                                <div id="CE-HEN" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_HEN" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Antecedentes Perinatales--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ANTPERI">Antecedentes Perinatales</a>
                                </div>
                                <div id="CE-ANTPERI" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ANTPERI" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Alimentación--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ALI">Alimentación</a>
                                </div>
                                <div id="CE-ALI" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ALI" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Inmunizaciones--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#c6">Inmunizaciones</a>
                                </div>
                                <div id="c6" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th>Edad
                                                            </th>
                                                            <th>Vacunas
                                                            </th>
                                                            <th>Fecha Aplicación
                                                            </th>
                                                            <th>Lote
                                                            </th>
                                                            <th>Estado
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="_INM" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td>
                                                                        <%# Eval("EDADNOMBRE")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("VACUNANOMBRE")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("LOTE")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("ESTADO")%>
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
                            <%--Antecedenetes Personales--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ANTEPERS">Antecedentes Personales Patológicos</a>
                                </div>
                                <div id="CE-ANTEPERS" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ANTEPERS" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Antecedenetes Familiares--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ANTEFAM">Antecedentes Familiares Patológicos</a>
                                </div>
                                <div id="CE-ANTEFAM" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ANTEFAM" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Desarrollo Psicomotor--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-DESPSICO">Desarrollo Psicomotor</a>
                                </div>
                                <div id="CE-DESPSICO" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_DESPSICO" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%-- Notas de Evoluación Servicio Evaluacion y Diagnostico--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-NOTASEVD">Notas de Evolución - Servicio Evaluación y Diagnóstico</a>
                                </div>
                                <div id="CE-NOTASEVD" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_NOTASEVD" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%-- Evaluacion Inicial Servicio Evaluacion y Diagnostico--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVAINIED">Evaluación Inicial - Servicio Evaluación y Diagnóstico</a>
                                </div>
                                <div id="CE-EVAINIED" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVAINIED" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Evaluación Servicio de Odontopediatría --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVAODO">Evaluación Servicio de Odontopediatría</a>
                                </div>
                                <div id="CE-EVAODO" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVAODO" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Exámen Físico--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EXF">Exámenes Físicos</a>
                                </div>
                                <div id="CE-EXF" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-grouping dataTable-scroll-x ">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EXF" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Signos Vitales--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-FUNVITALES">Funciones Vitales</a>
                                </div>
                                <div id="CE-FUNVITALES" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_FUNVITALES" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Plan Medico--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-PLANMED">Plan Médico</a>
                                </div>
                                <div id="CE-PLANMED" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_PLANMED" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Tratamientos --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-TRX">Tratamientos</a>
                                </div>
                                <div id="CE-TRX" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_TRX" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Laboratorios --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-LAB">Laboratorios</a>
                                </div>
                                <div id="CE-LAB" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_LAB" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Exámenes Auxiliares --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EAX">Exámenes Auxiliares</a>
                                </div>
                                <div id="CE-EAX" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EAX" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Diagnósticos--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-DXS">Diagnósticos</a>
                                </div>
                                <div id="CE-DXS" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Diagnóstico
                                                            </th>
                                                            <th>Tipo
                                                            </th>
                                                            <th>Reincidencia
                                                            </th>
                                                            <th>Principal
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_DXS" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DIAGNOSTICONOMBRE")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TIPO")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("REINCIDENCIA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("PRINCIPAL")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Medidas Antropométricas--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-MEDANTRO">Medidas Antropométricas</a>
                                </div>
                                <div id="CE-MEDANTRO" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_MEDANTRO" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%--Evaluación Terapéutica --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-TER">Evaluación Terapéutica</a>
                                </div>
                                <div id="CE-TER" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_TER" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Evaluacion Inicial Terapia Conductual--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVAINITC">Evaluación Inicial - Intervención Conductual</a>
                                </div>
                                <div id="CE-EVAINITC" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVAINITC" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td style="width: 65%;">
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Protocolo de Seguimiento --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-PROTOSEGUI">Protocolo de Seguimiento</a>
                                </div>
                                <div id="CE-PROTOSEGUI" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable dataTable-noheader dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_PROTOSEGUI" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Desarrollo del Lenguaje--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-DESLENG">Desarrollo del Lenguaje</a>
                                </div>
                                <div id="CE-DESLENG" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_DESLENG" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%--Evaluación Terapia Complementaria--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVATERCOM">Evaluación Terapia Complementaria</a>
                                </div>
                                <div id="CE-EVATERCOM" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVATERCOM" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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


                            <%-- Evaluación de Seguimiento --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVASEG">Evaluación de Seguimiento</a>
                                </div>
                                <div id="CE-EVASEG" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVASEG" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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

                            <%-- Balance Articular y Muscular --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-BALARTIMUSCU">Terapia Fisica - Balance Articular y Muscular</a>
                                </div>
                                <div id="CE-BALARTIMUSCU" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_BALARTIMUSCU" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>

                                                                        <asp:LinkButton ID="btnPrintBAM" runat="server" CssClass="btn btn-primary" Text="Imprimir"
                                                                            CommandArgument='<%# Eval("DESCRIPCION")%>' CommandName="PrintBAM" OnClick="_Select"><i class="icon-print"></i> &nbsp Imprimir</asp:LinkButton>
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

                            <%-- Escala de Ashwhort Modificada--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-ESCASHWHORT">Terapia Fisica - Escala de Ashwhort Modificada</a>
                                </div>
                                <div id="CE-ESCASHWHORT" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Escala
                                                            </th>
                                                            <th>Valor
                                                            </th>
                                                            <th>Observaciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_ESCASHWHORT" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DETALLES1")%>
                                                                        <br />
                                                                        <%# Eval("DETALLES2")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DETALLES3")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DETALLES4")%>
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

                            <%-- Hoja de Data - Intervención Grupal--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-HOJADATA">Hoja de Data - Intervención Conductual</a>
                                </div>
                                <div id="CE-HOJADATA" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_HOJADATA" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>

                                                                        <asp:LinkButton ID="btnPrintHojaData" runat="server" CssClass="btn btn-primary" Text="Imprimir"
                                                                            CommandArgument='<%# Eval("DESCRIPCION")%>' CommandName="PrintHojaData" OnClick="_Select"><i class="icon-print"></i> &nbsp Imprimir</asp:LinkButton>
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

                            <%-- Intervención Terapéutica--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-INTERTERA">Intervención Terapéutica</a>
                                </div>
                                <div id="CE-INTERTERA" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_INTERTERA" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>

                                                                        <asp:LinkButton ID="btnPrintIT" runat="server" CssClass="btn btn-primary" Text="Imprimir"
                                                                            CommandArgument='<%# Eval("DESCRIPCION")%>' CommandName="PrintIT" OnClick="_Select"><i class="icon-print"></i> &nbsp Imprimir</asp:LinkButton>
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


                            <%-- Metodo de Intervención Terapia Ocipacional --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-INTERTEROCU">Método de Intervención Terapia Ocupacional</a>
                                </div>
                                <div id="CE-INTERTEROCU" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Detalles
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_INTERTEROCU" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("DESCRIPCION")%>
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
                            <%-- Evoluación Terappia Ocupacional--%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-EVOTEROCU">Evolución Terapia Ocupacional</a>
                                </div>
                                <div id="CE-EVOTEROCU" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th class='hidden-1024'>Fecha
                                                            </th>
                                                            <th>Especialista
                                                            </th>
                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_EVOTEROCU" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>

                                                                        <asp:LinkButton ID="btnPrintETO" runat="server" CssClass="btn btn-primary" Text="Imprimir"
                                                                            CommandArgument='<%# Eval("DESCRIPCION")%>' CommandName="PrintETO" OnClick="_Select"><i class="icon-print"></i> &nbsp Imprimir</asp:LinkButton>
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

                            <%--Multimedia --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#CE-DIG">Archivos Digitales</a>
                                </div>
                                <div id="CE-DIG" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box">
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <thead>
                                                        <tr>
                                                            <th>No.
                                                            </th>
                                                            <th>Fecha
                                                            </th>
                                                            <th>Profesional
                                                            </th>
                                                            <th>Descripción
                                                            </th>
                                                            <th>Acciones
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater ID="CE_DIG" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <th>
                                                                        <%# Eval("NUMERO")%>
                                                                    </th>
                                                                    <td class='hidden-1024'>
                                                                        <%# Eval("FECHA")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("TERAPEUTA")%>
                                                                        <br />
                                                                        <%# Eval("ESPECIALIDAD")%>
                                                                    </td>
                                                                    <td>
                                                                        <%# Eval("NOTAS")%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnFile" runat="server" CssClass="btn btn-primary" Text="Descargar"
                                                                            CommandArgument='<%# Eval("URL")%>' CommandName="View" OnClick="_Select"><i class="icon-circle-arrow-down"></i></asp:LinkButton>
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
                            <%--MULTIDISCIPLINARIA --%>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#MULTIDISCIPLINARIA">Evaluación Multidisciplinaria</a>
                                </div>

                                <div id="MULTIDISCIPLINARIA" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box-content nopadding">
                                            <iframe class="holds-the-iframe" id="frmMultiDisciplinaria" src="http://caidsiges01:8082/forms/ConsultaEvaluacionMultiDisciplinaria.aspx?PACIENTE="
                                                style="width: 100%; height: 800PX" frameborder="0"></iframe>
                                            <script type="text/javascript">
                                                    function getParameterByName(name, url) {
                                                         // alert(Site.Master.Session["CurrentUSR_TERID"].ToString());
                                                         if (!url) url = window.location.href;
                                                         name = name.replace(/[\[\]]/g, "\\$&");
                                                         var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
                                                         if (!results) return null;
                                                         if (!results[2]) return '';
                                                         return decodeURIComponent(results[2].replace(/\+/g, " "));
                                                     }
                                            </script>
                                            <script type="text/javascript">
                                                     var x = getParameterByName('X');
                                                     var PACIENTE = document.getElementById("ctl00_MainContent_cmbPaciente").value;
                                                     var ESPECIALIDAD = document.getElementById("ctl00_MainContent_cmbEspecialidad").value;
                                                     var FECHA1 = document.getElementById("ctl00_MainContent_txtFecha1").value;
                                                     var FECHA2 = document.getElementById("ctl00_MainContent_txtFecha2").value;
                                                    //alert('PACIENTE: ' + PACIENTE);
                                                    //alert('ESPECIALIDAD: ' + ESPECIALIDAD);
                                                    //alert('fecha 1: ' + FECHA1);
                                                    //alert('fecha 2: ' + FECHA2);
                                                    <%--var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';--%>
                                                    <%--var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';--%>
                                                     var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                                     document.getElementById("frmMultiDisciplinaria").setAttribute("src", "http://caidsiges01:8082/forms/ConsultaEvaluacionMultiDisciplinaria.aspx?PACIENTE=" + PACIENTE + "&ESPECIALIDAD=" + ESPECIALIDAD + "&FECHA1=" + FECHA1 + "&FECHA2=" + FECHA2)
                                            </script>
                                        </div>  
                                    </div>
                                </div>

                            </div> 
                            <%--INTERVENCION GRUPAL --%>
                              <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#HistorialClinico"
                                        href="#INTERVENCIONGRUPAL">Intervencion Grupal</a> 
                                   <div id="INTERVENCIONGRUPAL" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="box-content nopadding">
                                            <iframe class="holds-the-iframe" id="frmIntervencionGrupal" src="http://caidsiges01:8082/forms/ConsultaIntervencionGrupal.aspx?PACIENTE="
                                                style="width: 100%; height: 800PX" frameborder="0"></iframe>
                                            <style>
                                                .holds-the-iframe {
                                                    background: url(/img/giphy.gif) top center no-repeat;
                                                }
                                            </style>
                                            <script type="text/javascript">
                                                     function getParameterByName(name, url) {
                                                         if (!url) url = window.location.href;
                                                         name = name.replace(/[\[\]]/g, "\\$&");
                                                         var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
                                                         if (!results) return null;
                                                         if (!results[2]) return '';
                                                         return decodeURIComponent(results[2].replace(/\+/g, " "));
                                                     }
                                            </script>
                                            <script type="text/javascript">
                                                     var x = getParameterByName('X');
                                                     var PACIENTE = document.getElementById("ctl00_MainContent_cmbPaciente").value;
                                                     var ESPECIALIDAD = document.getElementById("ctl00_MainContent_cmbEspecialidad").value;
                                                     var FECHA1 = document.getElementById("ctl00_MainContent_txtFecha1").value;
                                                     var FECHA2 = document.getElementById("ctl00_MainContent_txtFecha2").value;
                                                     var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                                    document.getElementById("frmIntervencionGrupal").setAttribute("src", "http://caidsiges01:8082/forms/ConsultaIntervencionGrupal.aspx?PACIENTE=" + PACIENTE + "&ESPECIALIDAD=" + ESPECIALIDAD + "&FECHA1=" + FECHA1 + "&FECHA2=" + FECHA2)
                                            </script>
                                        </div> 
                                    </div>
                                </div> 
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
