<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00043.aspx.cs" Inherits="CAID.HCL00043" %>

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
                        <i class="icon-edit"></i>Notas de Evolución - Servicio de Evaluación y Diagnóstico</h3>
                    <div class="actions">
                        <a href="#" class="btn content-slideUp"><i class="icon-angle-down"></i></a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
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


                            <%--Habilidades Intelectuales--%>
                            <div class="control-group">
                                <label for="ckHabilidadesIntectuales" class="control-label"><strong>Habilidades Intelectuales</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckHabilidadesIntectuales" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%--Desarrollo--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>Desarrollo</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckDesarrollo" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="13" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%--Conducta--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>Conducta</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckConducta" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%--Social--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>Social</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckSocial" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <%--Emocional--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>Emocional</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckEmocional" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                             <%--En sesión--%>
                            <div class="control-group">
                                <label for="textfield" class="control-label"><strong>En sesión</strong></label>
                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                    <asp:CheckBoxList ID="ckPrueba" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>

                                </div>
                            </div>

                            <div class="control-group">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                    Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

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

</asp:Content>
