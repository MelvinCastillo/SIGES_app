<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00020.aspx.cs" Inherits="CAID.HCL00020" %>

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
                    <h3 runat="server" id="H1">
                        <i class="icon-edit"></i>Protocolo de Seguimiento</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">


                        <div class='form-horizontal form-striped'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbTipo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Especialidad</strong></label>
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
                            <%--<div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: red; font-size: small;">
                                    <strong>Objetivo</strong></label>
                                <div class="controls">
                                    <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>--%>
                            <div class="control-group">
                                <label for="txtObjetivosTrabajados" class="control-label" style="font-size: small;">
                                    <strong>Objetivos Trabajados</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtObjetivosTrabajados" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtObservaciones" class="control-label" style="font-size: small;">
                                    <strong>Observaciones</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtObservaciones" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtRecomendaciones" class="control-label" style="font-size: small;">
                                    <strong>Recomendaciones</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtRecomendaciones" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>


                            <%-- Forma de Comunicacion --%>
                            <div class="control-group">
                                <label for="cmbFormaComunicacion" class="control-label" style="font-size: small;">
                                    <strong>Forma de Comunicación</strong></label>
                                <div class="controls">
                                    <div class="row-fluid">
                                        <select runat="server" id="cmbFormaComunicacion" name="cmbFormaComunicacion" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Verbal">Verbal</option>
                                            <option value="No-verbal">No verbal</option>
                                            <option value="Sistema-de-comunicación">Sistema de comunicación</option>
                                            <option value="Pecs">Pecs</option>
                                            <option value="Señas">Señas</option>
                                        </select>
                                        &nbsp
                                    <select runat="server" id="cmbPecs" name="cmbPecs" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="I">I</option>
                                        <option value="II">II</option>
                                        <option value="III">III</option>
                                        <option value="IV">IV</option>
                                        <option value="V">V</option>
                                        <option value="N/A">N/A</option>
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <%-- Personas en Sesión --%>
                            <div class="control-group">
                                <label for="cmbPersonaSesion" class="control-label" style="font-size: small;">
                                    <strong>Personas en Sesión</strong></label>
                                <div class="controls">
                                    <select runat="server" id="cmbPersonaSesion" name="cmbPersonaSesion" class='select2-me input-block-level'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Madre">Madre</option>
                                        <option value="Padre">Padre</option>
                                        <option value="Tutor">Tutor</option>
                                        <option value="Ambos Padres">Ambos Padres</option>
                                    </select>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtParticipantes" class="control-label" style="font-size: small;">
                                    <strong>Participantes</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="75px" ValidationGroup="pnlData"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
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
            <div class="box  box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-table"></i>Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <table class="table table-nomargin table-bordered dataTable-scroll-x dataTable dataTable-tools">
                        <thead>
                            <tr>
                                <th>No.
                                </th>
                                <th class='hidden-1024'>Fecha
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
</asp:Content>
