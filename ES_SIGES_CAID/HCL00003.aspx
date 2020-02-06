<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00003.aspx.cs" Inherits="CAID.HCL00003" %>

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
                        <i class="icon-edit"></i>Antecedentes Perinatales</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-striped'>

                            <%-- Especialidad Objetivo --%>
                            <%--<div class="control-group">


                                <div class="span6" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Especialidad
                                    </h5>
                                    <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-xxlarge'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>

                                <div class="span6" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Objetivo
                                    </h5>
                                    <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-xxlarge'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbObjetivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />

                                </div>


                            </div>--%>

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


                            <div class="control-group pagination-centered " style="padding-bottom: 1%; padding-right: 1%;">

                                <div class="span2">

                                    <h5 class="control-list">Hijo Número
                                    </h5>

                                    <input runat="server" type="text" name="txtHijoNo" id="txtHijoNo" value="0" class="spinner input-mini"
                                        placeholder="Colorn">
                                </div>
                                <div class="span2">
                                    <h5 class="control-list">Embarazos
                                    </h5>
                                    <input runat="server" type="text" name="txtEmbarazos" id="txtEmbarazos" value="0" class="spinner input-mini">
                                </div>

                                <div class="span2">

                                    <h5 class="control-list">Partos
                                    </h5>
                                    <input runat="server" type="text" name="txtPartos" id="txtPartos" value="0" class="spinner input-mini">
                                </div>
                                <div class="span2">

                                    <h5 class="control-list">Cesáreas
                                    </h5>
                                    <input runat="server" type="text" name="txtCesareas" id="txtCesareas" value="0" class="spinner input-mini">
                                </div>
                                <div class="span2">

                                    <h5 class="control-list">Abortos
                                    </h5>
                                    <input runat="server" type="text" name="txtAbortos" id="txtAbortos" value="0" class="spinner input-mini">
                                </div>

                                <div class="span2">

                                    <h5 class="control-list">Obitos
                                    </h5>
                                    <input runat="server" type="text" name="txtObitos" id="txtObitos" value="0" class="spinner input-mini">
                                </div>

                            </div>


                            <%-- Complicaciones --%>
                            <div class="control-group">
                                <div class="span12">
                                    <div style="text-align: left; margin: auto; padding-left: 1%;">
                                        <h5 class="control-list">Complicaciones Embarazo
                                        </h5>
                                        <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                                            <asp:CheckBoxList ID="ckComplicaciones" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">
                                                <%--<asp:ListItem>Amenaza de aborto</asp:ListItem>
                                                <asp:ListItem>Sangrado transvaginal</asp:ListItem>
                                                <asp:ListItem>Amenaza de parto pretermino</asp:ListItem>
                                                <asp:ListItem>Diabetes gestional</asp:ListItem>
                                                <asp:ListItem>Ingesta de alcohol</asp:ListItem>
                                                <asp:ListItem>Ingesta de cafe</asp:ListItem>
                                                <asp:ListItem>Uso de cigarrillos</asp:ListItem>
                                                <asp:ListItem>Uso de drogas</asp:ListItem>
                                                <asp:ListItem>Infeccion urinaria</asp:ListItem>
                                                <asp:ListItem>Infeccion vaginla</asp:ListItem>
                                                <asp:ListItem>Enfermedades febriles</asp:ListItem>
                                                <asp:ListItem>Depresion</asp:ListItem>
                                                <asp:ListItem>Otros</asp:ListItem>--%>
                                            </asp:CheckBoxList>
                                        </div>

                                        <div class="controls-row" style="text-align: left; margin: auto; padding-left: 0.5%; padding-right: 1%; padding-bottom: 1%;">
                                            <asp:TextBox ID="txtCommentCompli" runat="server" Wrap="true" TextMode="MultiLine" Height="75px" ValidationGroup="pnlData"
                                                placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>


                                        </div>

                                    </div>
                                </div>
                            </div>
                       

                            <%-- Medicamentes --%>
                            <div class="control-group">
                                <div class="span12">
                                    <div style="text-align: left; margin: auto; padding-left: 1%;">
                                        <h5 class="control-list">Medicamentos utilizados durante el embarazo
                                        </h5>
                                        <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                                            <asp:CheckBoxList ID="ckMedicamentos" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">

                                            </asp:CheckBoxList>
                                        </div>

                                        <div class="controls-row" style="text-align: left; margin: auto; padding-left: 0.5%; padding-right: 1%; padding-bottom: 1%;">
                                            <asp:TextBox ID="txtComentariosMedicamentos" runat="server" Wrap="true" TextMode="MultiLine" Height="75px" ValidationGroup="pnlData"
                                                placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>


                                        </div>

                                    </div>
                                </div>
                            </div>

       
                             <%-- Tipo de Parto, Causa de Cesárea anterior, Edad Gestional Nace --%>
                            <div class="control-group">

                                <div class="row-fluid">

                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Tipo de parto
                                    </h5>
                                    <select runat="server" id="cmbTipoPartos" name="cmbTipoPartos" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="1">Vaginal: Eutósico</option>
                                    <option value="2">Vaginal: Distósico</option>
                                    <option value="3">Cesárea</option>
                                </select>
                                    
                                </div>

                                <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-listr">Causa de la Cesárea
                                    </h5>
                                    <select runat="server" id="cmbCesarea" name="cmbCesarea" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="0">N/A</option>
                                    <option value="1">Cesárea anterior</option>
                                    <option value="2">Prematuridad</option>
                                    <option value="3">Bajo peso</option>
                                    <option value="4">No progreso en labor de parto</option>
                                    <option value="5">Ruptura prematura de membranas</option>
                                    <option value="6">Posición pélvica/podálica</option>
                                    <option value="7">Otros</option>
                                </select>

                                </div>

                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Edad al momento del nacimiento
                                    </h5>
                                    <input runat="server" type="text" name="txtEdadNace" id="txtEdadNace" value="24" class="spinner input-mini">
                                    </div>

                              
                                </div>

                                <div class="row-fluid">
                                <div class="span4" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Peso al nacer (Libras)
                                    </h5>
                                   <input type="text" runat="server" name="txtPesoNace" id="txtPesoNace" placeholder="0.00" class="input-block-level">

                                    </div>

                                      <div class="span4" style="padding-bottom: 1%;">
                                    <h5 class="control-list">Llanto al nacer
                                    </h5>
                                    <select runat="server" id="cmbLlantoNace" name="cmbLlantoNace" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="1">No</option>
                                    <option value="2">Fuerte</option>
                                    <option value="3">Débil</option>
                                    <option value="4">Desconoce</option>
                                </select>
                                   
                                </div>
                                    </div>
                                


                                <div class="controls-row" style="text-align: left; margin: auto; padding-left: 0.5%; padding-right: 1%; padding-bottom: 1%;">
                                            <asp:TextBox ID="txtComentariosCesarea" runat="server" Wrap="true" TextMode="MultiLine" Height="75px" ValidationGroup="pnlData"
                                                placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>


                                        </div>

                            </div>

                            <%-- Complicaciones neonatales --%>
                            <div class="control-group">
                                <div class="span12">
                                    <div style="text-align: left; margin: auto; padding-left: 1%;">
                                        <h5 class="control-list">Complicaciones neonatales
                                        </h5>
                                        <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                                            <asp:CheckBoxList ID="ckCompliNeonatales" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">

                                            </asp:CheckBoxList>
                                        </div>

                                        <div class="controls-row" style="text-align: left; margin: auto; padding-left: 0.5%; padding-right: 1%; padding-bottom: 1%;">

                                       <input type="text" runat="server" name="txtOtrosCompliNeonatales" id="txtOtrosCompliNeonatales" placeholder="Otros" class="input-block-level">


                                        </div>

                                    </div>
                                </div>
                            </div>

                            <%-- Intervenciones requeridas --%>
                            <div class="control-group">
                                <div class="span12">
                                    <div style="text-align: left; margin: auto; padding-left: 1%;">
                                        <h5 class="control-list">Intervenciones requeridas
                                        </h5>
                                        <div class="controls-row" style="text-align: left; margin: auto; text-align: center;">
                                            <asp:CheckBoxList ID="ckIntervenciones" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                                runat="server">

                                            </asp:CheckBoxList>
                                        </div>

                                        <div class="controls-row" style="text-align: left; margin: auto; padding-left: 0.5%; padding-right: 1%; padding-bottom: 1%;">

                                          <input type="text" runat="server" name="txtOtrosIntervenciones" id="txtOtrosIntervenciones" placeholder="Otros" class="input-block-level">


                                        </div>

                                    </div>
                                </div>
                            </div>


                        <%-- Objetivo --%>
                            <div class="control-group">
                                <label for="cmbObjetivo"  class="control-label" style="color:black; font-size:small;">
                                    <strong>Comentarios</strong></label>
                                <div class="controls">
                                     <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                ValidationGroup="pnlData" Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
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
