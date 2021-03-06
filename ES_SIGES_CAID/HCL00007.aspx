﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00007.aspx.cs" Inherits="CAID.HCL00007" %>

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
                        <i class="icon-edit"></i>Antecedentes Familiares Patológicos</h3>
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
                            <div class="control-group">
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
                            </div>

                            <%-- Cirugias, Alergias, Enfermedades cronicas --%>
                            <div class="control-group">


                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Padre
                                    </h5>
                                    <select runat="server" id="cmbPadre" name="cmbPadre" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="0">NO</option>
                                        <option value="1">SI</option>

                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPadre" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbPadre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Madre
                                    </h5>
                                    <select runat="server" id="cmbMadre" name="cmbMadre" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="0">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbMadre" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbMadre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Hermano(s)
                                    </h5>
                                    <select runat="server" id="cmbHermano" name="cmbHermano" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="0">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbHermano" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbHermano" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>



                            </div>

                            <div class="control-group">

                               <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Abuelos
                                    </h5>
                                    <select runat="server" id="cmbAbuelos" name="cmbAbuelos" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="0">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbAbuelos" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbAbuelos" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Discapacidad en la familia
                                    </h5>
                                    <select runat="server" id="cmbDiscapacidadFamilia" name="cmbDiscapacidadFamilia" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="0">NO</option>
                                        <option value="1">SI</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbDiscapacidadFamilia" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbDiscapacidadFamilia" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

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
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
