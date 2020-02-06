<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00029.aspx.cs" Inherits="CAID.HCL00029" %>

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
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Método de Intervención</h3>
                    <div class="actions">
                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
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
                            <%-- Motivo de Consulta --%>
                            <div class="control-group">
                                <label for="ckMetodo" class="control-label">
                                    Método</label>
                                <div class="controls" style="text-align: center;">
                                    <asp:CheckBoxList ID="ckMetodo" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </div>

                            <%-- Comentarios --%>
                            <div class="control-group">
                                <label for="txtEVALUACION" class="control-label">
                                    Comentarios</label>
                                <div class="controls" style="text-align: center;">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                    ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
