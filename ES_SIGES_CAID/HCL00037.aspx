<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00037.aspx.cs" Inherits="CAID.HCL00037" %>

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
                        <i class="icon-edit"></i>Evaluación Inicial - Servicio de Evaluación y Diagnóstico</h3>
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

                               <%-- Informantes Presentes--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Informantes presentes</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPERSONASSESION" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                               <%-- Relacion con el paciente--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Relación con el paciente</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtRELACIONCONPACIENTE" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Evaluaciones psicologicas previas --%>
                            <div class="control-group">
                                <label for="cmbNivelLenguaje" class="control-label">
                                    Evaluaciones psicológicas previas</label>
                                <div class="controls">
                                    <select runat="server" id="cmbEVALUACIONESPREVIAS" name="cmbEVALUACIONESPREVIAS" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Si">Si</option>
                                        <option value="No">No</option>
                                    </select>
                                    &nbsp
                                    <input runat="server" name="txtFECHAEVAPREVIA" placeholder="Año" id="txtFECHAEVAPREVIA" type="text" class="input-xlarge">

                                </div>
                            </div>

                               <%-- Profesional y/o institución evaluadora--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Profesional y/o institución evaluadora</label>
                                <div class="controls">
                                    <input runat="server" name="txtINSTITUCIONEVALUADORA" id="txtINSTITUCIONEVALUADORA" type="text" class="input-xlarge">
                                </div>
                            </div>

                               <%-- Resultado--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Resultado</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtResultado" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                              <%-- Personas con las que vive el niño--%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Personas con las que vive el niño</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPERSONASVIVIENDA" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>


                            <%-- Antecedentes de salud mental en la familia --%>
                            <div class="control-group">
                                <label for="txtAntecFam" class="control-label">
                                    Antecedentes de salud mental en la familia</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAntecFam" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                          

                            <%-- Nivel lenguaje --%>
                            <div class="control-group">
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
                            </div>

                            <%-- Características peculiares --%>
                            <div class="control-group">
                                <label for="cmbCaracPeculiares" class="control-label">
                                    Características peculiares</label>
                                <div class="controls">
                                    <select runat="server" id="cmbCaracPeculiares" name="cmbCaracPeculiares" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Tono">Tono</option>
                                        <option value="Estereotipia">Estereotipia</option>
                                        <option value="Volúmen">Volúmen</option>
                                        <option value="Ecolalia">Ecolalia</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Otro --%>
                            <div class="control-group">
                                <label for="txtOtro" class="control-label">
                                    Otro</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtOtro" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Audición --%>
                            <div class="control-group">
                                <label for="cmbAudicion" class="control-label">
                                    Audición</label>
                                <div class="controls">
                                    <select runat="server" id="cmbAudicion" name="cmbAudicion" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Escucha">Escucha</option>
                                        <option value="No-escucha">No escucha</option>
                                        <option value="No-valorado">No valorado</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Visión --%>
                            <div class="control-group">
                                <label for="cmbVision" class="control-label">
                                    Visión</label>
                                <div class="controls">
                                    <select runat="server" id="cmbVision" name="cmbVision" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Vidente">Vidente</option>
                                        <option value="No-vidente">No vidente</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Movilidad --%>
                            <div class="control-group">
                                <label for="cmbMovilidad" class="control-label">
                                    Movilidad</label>
                                <div class="controls">
                                    <select runat="server" id="cmbMovilidad" name="cmbMovilidad" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Silla">Silla</option>
                                        <option value="Cargado">Cargado</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Motricidad Gruesa --%>
                            <div class="control-group">
                                <label for="cmbMotrocidadGruesa" class="control-label">
                                    Motricidad gruesa</label>
                                <div class="controls">
                                    <select runat="server" id="cmbMotrocidadGruesa" name="cmbMotrocidadGruesa" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Camina">Camina</option>
                                        <option value="No-camina">No camina</option>
                                        <option value="Camina-con-ayuda">Camina con ayuda</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Motricidad Fina  --%>
                            <div class="control-group">
                                <label for="txtMotrocidadFina" class="control-label">
                                    Motricidad fina (agarre, escritura, movimiento o ausencia del mismo)</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtMotrocidadFina" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Convulsiones --%>
                            <div class="control-group">
                                <label for="cmbConvulsiones" class="control-label">
                                    Convulsiones</label>
                                <div class="controls">
                                    <select runat="server" id="cmbConvulsiones" name="cmbConvulsiones" class='select2-me input-xxlarge'
                                        validationgroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Controladas">Controladas</option>
                                        <option value="No-controladas">No controladas</option>
                                        <option value="No-valorado">No valorado</option>
                                        <option value="En-tratamiento">En tratamiento</option>
                                        <option value="Remisión">Remisión</option>
                                        <option value="N.A.">N.A.</option>
                                    </select>
                                </div>
                            </div>

                            <%-- Otras condiciones médicas  --%>
                            <div class="control-group">
                                <label for="txtOtrasCondiciones" class="control-label">
                                    Otras condiciones médicas</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtOtrasCondiciones" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" CssClass="input-block-level"></asp:TextBox>
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
