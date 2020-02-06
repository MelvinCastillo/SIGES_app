<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00027.aspx.cs" Inherits="CAID.HCL00027" %>

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
                        <i class="icon-edit"></i>Evolución - Terapia Ocupacional</h3>
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
                            <%--Objetivo--%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
                                    Objetivo</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbObjetivo" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbObj_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>

                            <%--Actividad/Estrategias--%>
                            <div class="control-group">
                                <label for="cmbActividad" class="control-label">
                                    Actividad/Estrategia</label>
                                <div class="controls">
                                    <select runat="server" id="cmbActividad" name="cmbActividad" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>

                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbActividad" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbActividad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>


                            <%-- Evolución --%>
                            <div class="control-group">
                                <label for="cmbEvaluacion" class="control-label">
                                    Evolución</label>
                                <div class="controls">
                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Asistencia</strong>
                                        </div>
                                        <select runat="server" id="cmbAsistencia" name="cmbAsistencia" class='select2-me input-block-level'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Asistencia Total"></option>
                                            <option value="Máxima Asistencia"></option>
                                            <option value="Asistencia Moderada"></option>
                                            <option value="Minima Asistencia"></option>
                                            <option value="Independiente"></option>
                                        </select>
                                    </div>

                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Tipo de ayuda</strong>
                                        </div>
                                        <select runat="server" id="cmbTipoAyuda" name="cmbTipoAyuda" class='select2-me input-block-level'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Asistido"></option>
                                            <option value="Comando gestuales"></option>
                                            <option value="Comando verbal"></option>
                                            <option value="No requerido"></option>
                                        </select>
                                    </div>


                                    <div class="span4">
                                        <div class="control-list">
                                            <strong>Progreso</strong>
                                        </div>
                                        <select runat="server" id="cmbProgreso" name="cmbProgreso" class='select2-me input-block-level'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Poco"></option>
                                            <option value="Regular/Suficiente"></option>
                                            <option value="Satisfactoria"></option>
                                            <option value="Buena"></option>
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
                                    Comentarios</label>
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
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-reorder"></i>
                        Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="accordion" id="accordion2">
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Actividades de la Vida Diaria
                                </a>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse in">
                                <div class="accordion-inner">
                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>Actividad
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evolución
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpActividades" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Promover Actividades de Juego Esparcimiento
                                </a>
                            </div>
                            <div id="collapseTwo" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpactividadesjuegoesparcimiento" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Interpretación de estímulos Sensoriales
                                </a>
                            </div>
                            <div id="collapseThree" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpInterpretaciónEstimulosSensoriales" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse4">Desarrollar Destrezas Perceptuales
                                </a>
                            </div>
                            <div id="collapse4" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDesarrollarPerceptuales" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse5">Desarrollar Componentes Neuromusculares
                                </a>
                            </div>
                            <div id="collapse5" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDesarrollarNeuromusculares" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse6">Desarrollar Componentes Motores
                                </a>
                            </div>
                            <div id="collapse6" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDesarrollarMotores" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse7">Favorecer la Integración Cognitiva y Componentes Cognitivos
                                </a>
                            </div>
                            <div id="collapse7" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpIntegracionCognitiva" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse8">Desarrollar Factores Psicológicos
                                </a>
                            </div>
                            <div id="collapse8" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDesarrollarFactoresPsicologicos" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse9">Desarrollar Habilidades Sociales
                                </a>
                            </div>
                            <div id="collapse9" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpDesarrollarHabilidadesSociales" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse10">Entrenar en Manejo de Sí Mismo
                                </a>
                            </div>
                            <div id="collapse10" class="accordion-body collapse">
                                <div class="accordion-inner">

                                    <div class="box-content nopadding">
                                        <table class="table table-hover table-nomargin table-striped dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">

                                            <thead>

                                                <tr>
                                                    <th>No.
                                                    </th>
                                                    <th>Fecha y Hora
                                                    </th>
                                                    <th>Evaluación
                                                    </th>
                                                    <th>Comentarios
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpManejoSiMismo" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <th>
                                                                <%# Eval("ACTIVIDAD")%>
                                                            </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                                            <td>
                                                                <%# Eval("DESCRIPCION")%>
                                                            </td>
                                                            <td>
                                                                <%# Eval("DATOS")%>
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
            </div>
        </div>
    </div>

</asp:Content>
