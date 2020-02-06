<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00033.aspx.cs" Inherits="CAID.HCL00033" %>

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
                        <i class="icon-edit"></i>Plan de Intervención Conductual</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">

                            <div class="nopadding">
                                <div class='form-horizontal'>
                                    <%-- Tipo de Evaluación --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
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
                                    <%-- Objetivo --%>
                                    <%-- <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Objetivo</label>
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

                                    <%-- Intervencion --%>
                                    <div class="control-group">
                                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                                            Intervención</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtDATOS1" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="txtDATOS1" Display="Dynamic" ErrorMessage="Requerido!"
                                                ForeColor="Red" ID="txtDATOS1val" runat="server" SetFocusOnError="True" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label for="cmbPersonaResponsable" class="control-label">
                                            Persona Responsable</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbPersonaResponsable" name="cmbPersonaResponsable" class='select2-me input-xlarge'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="Terapeuta">Terapeuta</option>
                                                <option value="Padres">Padres</option>
                                                <option value="Maestra">Maestra</option>
                                                <option value="Otro">Otro</option>

                                            </select>
                                            <input type="text" runat="server" name="txtOtro" id="txtOtro" placeholder="Otro" class="input-xxlarge">

                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbPersonaResponsable" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbPersonaResponsable" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbProgreso" class="control-label">
                                            Método de Medir Progreso</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbProgreso" name="cmbProgreso" class='select2-me input-xlarge'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>

                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbProgreso" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbProgreso" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="cmbRevisión" class="control-label">
                                            Revisión</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbRevisión" name="cmbRevisión" class='select2-me input-xlarge'
                                                data-rule-required="true">
                                                <option value="">-- SELECCIONE --</option>
                                                <option value="MC = Metas Cumplidas">MC = Metas Cumplidas</option>
                                                <option value="C = Continuar">C = Continuar</option>
                                                <option value="DC = Discontinuar">DC = Discontinuar</option>

                                            </select>
                                            <br />
                                            <asp:RequiredFieldValidator ControlToValidate="cmbRevisión" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbRevisión" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                            validationgroup="pnlData" style="width: 128px; height: 48px">
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
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H1">
                        <i class="icon-list"></i>Historico</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="nopadding">
                                <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                    <thead>
                                        <tr>
                                            <th>No.
                                            </th>
                                            <th>Fecha y Hora
                                            </th>
                                            <th>Intervención
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpHistorico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <th>
                                                        <%# Eval("NUMERO")%>
                                                    </td>
                                                        <td>
                                                            <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                                        </td>
                                                    <td>
                                                        <%# Eval("INTERVENCION")%>
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
