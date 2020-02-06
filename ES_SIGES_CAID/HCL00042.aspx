<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00042.aspx.cs" Inherits="CAID.HCL00042" %>

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
                        <i class="icon-edit"></i>Notas de Evolución - Terapia Familiar</h3>
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

                             <div class="control-group">
                                <label for="txtParticipantes"  class="control-label" style="font-size:small;">
                                    <strong>Participantes</strong></label>
                                <div class="controls">
                                   <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                    Wrap="true"  CssClass="input-block-level"></asp:TextBox>

                                     <asp:RequiredFieldValidator ControlToValidate="txtParticipantes" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtParticipantes" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtTemasTrbajados"  class="control-label" style="font-size:small;">
                                    <strong>Temas Trabajados</strong></label>
                                <div class="controls">
                                   <asp:TextBox ID="txtTemasTrbajados" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                    Wrap="true"  CssClass="input-block-level"></asp:TextBox>

                                    <asp:RequiredFieldValidator ControlToValidate="txtTemasTrbajados" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTemasTrbajados" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtTarea"  class="control-label" style="font-size:small;">
                                    <strong>Tarea</strong></label>
                                <div class="controls">
                                   <asp:TextBox ID="txtTarea" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                    Wrap="true"  CssClass="input-block-level"></asp:TextBox>

                                    <asp:RequiredFieldValidator ControlToValidate="txtTarea" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTarea" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
                                            <th>
                                                No.
                                            </th>
                                            <th class='hidden-1024'>
                                                Fecha
                                            </th>
                                            <th>
                                                Detalles
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
