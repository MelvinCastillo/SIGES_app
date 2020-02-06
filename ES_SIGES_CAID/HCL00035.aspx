<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00035.aspx.cs" Inherits="CAID.HCL00035" %>

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
                        <i class="icon-edit"></i>EVALUACION DE REFORZADORES</h3>
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
                             <%-- Tacto (objeto): --%>
                            <div class="control-group">
                                <label for="txtTacto" class="control-label">
                                    Tacto (objeto)</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtTacto" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                             <%-- Sensorial: Visual, motor, sonidos, cercanía con la persona, tocar, gustar, oler --%>
                            <div class="control-group">
                                <label for="txtSensorial" class="control-label">
                                    Sensorial</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtSensorial" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Visual, motor, sonidos, cercanía con la persona, tocar, gustar, oler" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            
                             <%-- Atención --%>
                            <div class="control-group">
                                <label for="txtAtencion" class="control-label">
                                    Atención</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAtencion" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Lugares--%>
                            <div class="control-group">
                                <label for="txtLugares" class="control-label">
                                    Lugares</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtLugares" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Personas--%>
                            <div class="control-group">
                                <label for="txtPersonas" class="control-label">
                                    Personas</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPersonas" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>

                            <%-- Actividades--%>
                            <div class="control-group">
                                <label for="txtActividades" class="control-label">
                                    Actividades</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtActividades" runat="server" TextMode="MultiLine" Height="100px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Detalles" CssClass="input-block-level"></asp:TextBox>
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
                                <button type="submit" id="Button1" runat="server" onserverclick="_Save" class="btn btn-blue"
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
