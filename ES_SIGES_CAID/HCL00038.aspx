<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00038.aspx.cs" Inherits="CAID.HCL00038" %>

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
                        <i class="icon-edit"></i>Evaluación Servicio de Odontopediatría</h3>
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

                            <div class="box nopadding">
                                <div class="accordion" id="accordion2">
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Antecedentes Médicos
                                            </a>
                                        </div>
                                        <div id="collapseOne" class="accordion-body collapse in">
                                            <div class="accordion-inner">
                                                <div class="box-content nopadding">
                                                </div>
                                                <div class="box">
                                                    <div runat="server" class='form-horizontal'>
                                                        <%--Antecedentes Medicos--%>
                                                        <div class="control-group">
                                                            <label for="ckHabilidadesIntectuales" class="control-label"><strong>Antecedentes Médicos</strong></label>
                                                            <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                                                <asp:CheckBoxList ID="ckAnteMed" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="12" RepeatDirection="Horizontal" TextAlign="Right"
                                                                    runat="server">
                                                                </asp:CheckBoxList>

                                                            </div>
                                                        </div>
                                                        <div class="control-group">
                                                            <asp:TextBox ID="txtOtros" runat="server" TextMode="MultiLine" Height="75px"
                                                                Wrap="true" placeholder="Otros" CssClass="input-block-level"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Antecedentes Odontológicos
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>

                                                <%--Antecedentes Odontologicos--%>
                                                <div class="control-group">
                                                    <asp:TextBox ID="txtAnteOdo" runat="server" TextMode="MultiLine" Height="150px"
                                                        Wrap="true" placeholder="Otros" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Primer Año de Vida
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Primer Ano de Vida--%>
                                                <div class="control-group">
                                                    <asp:TextBox ID="txtPrimerAno" runat="server" TextMode="MultiLine" Height="150px"
                                                        Wrap="true" placeholder="Otros" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse4">Historia de la Dieta
                                            </a>
                                        </div>
                                        <div id="collapse4" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Historia de la Dieta Alimentacion Actual--%>
                                                <div class="control-group">
                                                    <label for="ckHastoriaDietaAli" class="control-label"><strong>Alimentacion Actual</strong></label>
                                                    <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                                        <asp:CheckBoxList ID="ckHastoriaDietaAli" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>
                                                    </div>
                                                </div>
                                                <%--Historia de la Dieta--%>
                                                <div class="control-group">
                                                    <asp:TextBox ID="txtHistDieta" runat="server" TextMode="MultiLine" Height="150px"
                                                        Wrap="true" placeholder="Otros" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse5">Higiene Bucal
                                            </a>
                                        </div>
                                        <div id="collapse5" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>

                                                <%--Higiene Bucal--%>
                                                <div class="control-group">
                                                    <asp:TextBox ID="txtHigBucal" runat="server" TextMode="MultiLine" Height="150px"
                                                        Wrap="true" placeholder="Otros" CssClass="input-block-level"></asp:TextBox>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse6">Hábitos
                                            </a>
                                        </div>
                                        <div id="collapse6" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Habitos--%>
                                                <div class="control-group">
                                                    <asp:TextBox ID="txtHabitos" runat="server" TextMode="MultiLine" Height="150px"
                                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse7">Comentarios
                                            </a>
                                        </div>
                                        <div id="collapse7" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">

                                                    <div class="control-group">
                                                        <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                                            Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <%-- Nivel lenguaje --%>
                            <%--<div class="control-group">
                                <label for="cmbNivelLenguaje" class="control-label">
                                    Nivel lenguaje</label>
                                <div class="controls">
                                    <select runat="server" id="cmbNivelLenguaje" name="cmbNivelLenguaje" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="No-verbal">No Verbal</option>
                                        <option value="VOCALIZACION">Vocalización</option>
                                        <option value="PALABRAS">Palabras</option>
                                        <option value="FRASES">Frases</option>
                                    </select>
                                </div>
                            </div>--%>










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
