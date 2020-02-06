<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00004.aspx.cs" Inherits="CAID.HCL00004" %>

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
                        <i class="icon-edit"></i>Alimentación</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-striped'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbTipo"  class="control-label" style="color:red; font-size:small;">
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
                            <div class="control-group">
                                <label for="cmbObjetivo"  class="control-label" style="color:red; font-size:small;">
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
                            </div>

                             <%-- Lactancia materna, Edad de ablactacion y Dieta Actual --%>
                            <div class="control-group">


                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Lactancia materna
                                    </h5>
                                    <select runat="server" id="cmbLactancia" name="cmbLactancia" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="0">NO</option>
                                    <option value="1">SI</option>

                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbLactancia" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbLactancia" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-listr">Edad de ablactación
                                    </h5>
                                    <select runat="server" id="cmbEdadAblactacion" name="cmbEdadAblactacion" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="1 mes">1 mes</option>
                                    <option value="2 meses">2 meses</option>
                                    <option value="3 meses">3 meses</option>
                                    <option value="4 meses">4 meses</option>
                                    <option value="5 meses">5 meses</option>
                                    <option value="6 meses">6 meses</option>
                                    <option value="7 meses">7 meses</option>
                                    <option value="8 meses">8 meses</option>
                                    <option value="9 meses">9 meses</option>
                                    <option value="10 meses">10 meses</option>
                                    <option value="11 meses">11 meses</option>
                                    <option value="12 meses">12 meses</option>
                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbEdadAblactacion" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbEdadAblactacion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Tipo de dieta actual
                                    </h5>
                                    
                                    <select runat="server" id="cmbDietaActual" name="cmbDietaActual" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="DIETA-ACTUAL-LIQUIDA">Líquida</option>
                                    <option value="DIETA-ACTUAL-SEMISOLIDA">Semisólida</option>
                                    <option value="DIETA-ACTUAL-CORRIENTE">Corriente</option>

                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbDietaActual" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbDietaActual" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>

                            </div>


                            <%-- Lactancia materna, Edad de ablactacion y Dieta Actual --%>
                            <div class="control-group">


                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Selectividad con los alimentos
                                    </h5>
                                    <select runat="server" id="cmbSelectividadAlimento" name="cmbSelectividadAlimento" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="0">NO</option>
                                    <option value="1">SI</option>

                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbSelectividadAlimento" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbSelectividadAlimento" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-listr">Disfagia
                                    </h5>
                                    <select runat="server" id="cmbDisfagia" name="cmbDisfagia" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="0">NO</option>
                                    <option value="1">SI</option>
                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbDisfagia" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbDisfagia" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Uso actual de biberón
                                    </h5>
                                    
                                    <select runat="server" id="cmbUsoBiberon" name="cmbUsoBiberon" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="0">NO</option>
                                    <option value="1">SI</option>

                                </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbUsoBiberon" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbUsoBiberon" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>

                            </div>


                             <%-- Hábitos Alimenticios --%>
                            <div class="control-group">
                                <label for="txtHabitosAlimentos"  class="control-label" style="font-size:small;">
                                    <strong>Hábitos Alimenticios</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtHabitosAlimentos" runat="server" Wrap="true" TextMode="MultiLine" Height="250px" ValidationGroup="pnlData"
                                                 CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtEVALUACION"  class="control-label" style="font-size:small;">
                                    <strong>Comentarios</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                    Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue" ValidationGroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
