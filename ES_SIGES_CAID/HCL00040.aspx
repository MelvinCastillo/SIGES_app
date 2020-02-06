<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00040.aspx.cs" Inherits="CAID.HCL00040" %>

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
                        <i class="icon-edit"></i>Evaluación Terapias Complementarias</h3>
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
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Observaciones
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

                                                            <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">Persona a quien entrevista y parentesco</div>

                                                            <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                <asp:TextBox ID="txtPersona" runat="server" TextMode="MultiLine" Height="25px"
                                                                    Wrap="true" placeholder="" CssClass="input-block-level"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="control-group">

                                                            <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                                                Wrap="true" placeholder="Observaciones iniciales" 
                                                                Text="Preferencia de Horario: 
Persona a quien entrevista y parentesco: 
Observaciones Iniciales:


Historial Clínico: 
                                                                
                                                                " CssClass="input-block-level"></asp:TextBox>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Intereses Musicales
                                            </a>
                                        </div>
                                        <div id="collapseTwo" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>

                                                <%--Intereses Musicales--%>
                                                <div class="control-group">
                                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">¿Qué tipo de música le activa, motiva o le relaja? Programas de televisión, etc… Actividades extracurriculares. ¿Qué hace en su tiempo libre?</div>

                                                    <div class="box-content" style="text-align: left; margin: auto; text-align: center; height: 80px;">
                                                        <asp:CheckBoxList ID="ckInteresesMusicales" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="9" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>

                                                </div>
                                                <div class="control-group">

                                                    <asp:TextBox ID="txtCInteresesMusicales" runat="server" TextMode="MultiLine" Height="75px"
                                                        Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Cognitivo y sensorial
                                            </a>
                                        </div>
                                        <div id="collapseThree" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Cognitivo y sensorial--%>
                                                <div class="control-group">
                                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">¿Hay alguna textura, sonido, comida que no tolera?</div>

                                                    <div class="box-content" 
                                                        style="text-align: left; margin: auto; text-align: center; height: 120px;">
                                                        <asp:CheckBoxList ID="ckCognitivoSensorial" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>

                                                </div>
                                                <div class="control-group">

                                                    <asp:TextBox ID="txtCCognitivoSensorial" runat="server" TextMode="MultiLine" Height="75px"
                                                        Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse4">Comunicación y Social
                                            </a>
                                        </div>
                                        <div id="collapse4" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Comunicación y social--%>
                                                <div class="control-group">
                                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">¿Cómo juega con otros? ¿Cómo pide algo que quiere?</div>

                                                    <div class="box-content" style="text-align: left; margin: auto; text-align: center; height: 50px;">
                                                        <asp:CheckBoxList ID="ckComunicaciónSocial" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>

                                                </div>
                                                <div class="control-group">

                                                    <asp:TextBox ID="txtCComunicaciónSocial" runat="server" TextMode="MultiLine" Height="75px"
                                                        Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse5">Físico
                                            </a>
                                        </div>
                                        <div id="collapse5" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>

                                                <%--Físico--%>
                                                <div class="control-group">
                                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">¿Hay alguna necesidad física que debamos trabajar?</div>

                                                    <div class="box-content" style="text-align: left; margin: auto; text-align: center; height: 40px;">
                                                        <asp:CheckBoxList ID="ckFisico" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>

                                                </div>
                                                <div class="control-group">

                                                    <asp:TextBox ID="txtCFisico" runat="server" TextMode="MultiLine" Height="75px"
                                                        Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse6">Emocional
                                            </a>
                                        </div>
                                        <div id="collapse6" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">
                                                </div>
                                                <%--Emocional--%>
                                                <div class="control-group">
                                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">¿Qué hace cuando está molesto? ¿Qué tipo de cosas/eventos le molestan?</div>

                                                    <div class="box-content" style="text-align: left; margin: auto; text-align: center; height: 40px;">
                                                        <asp:CheckBoxList ID="ckEmocional" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>

                                                </div>
                                                <div class="control-group">

                                                    <asp:TextBox ID="txtCEmocional" runat="server" TextMode="MultiLine" Height="75px"
                                                        Wrap="true" placeholder="Comentarios" CssClass="input-block-level"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse7">Destrezas y necesidades reportadas y Actividades extracurriculares: 
                                            </a>
                                        </div>
                                        <div id="collapse7" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">

                                                    <%--Destrezas y necesidades reportadas--%>
                                                    <div class="control-group">

                                                        <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;"><strong>Fuerzas</strong></div>

                                                        <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                            <asp:TextBox ID="txtFuerzas" runat="server" TextMode="MultiLine" Height="75px"
                                                                Wrap="true" placeholder="Fuerzas"  CssClass="input-block-level"></asp:TextBox> 
                                                        </div>
                                                    </div>

                                                    <div class="control-group">

                                                        <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;"><strong>Necesidades/Actividades extracurriculares</strong></div>

                                                        <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                            <asp:TextBox ID="txtNecesidades" runat="server" TextMode="MultiLine" Height="100px"
                                                                Wrap="true" placeholder="Necesidades/Actividades extracurriculares" 
                                                                Text="Necesidades: 

Actividades extracurriculares: "   CssClass="input-block-level"></asp:TextBox>

                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse8">Plan
                                            </a>
                                        </div>
                                        <div id="collapse8" class="accordion-body collapse">
                                            <div class="accordion-inner">

                                                <div class="box-content nopadding">

                                                    <%--Plan--%>
                                                    <div class="control-group">
                                                        <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">Plan Circular</div>

                                                        <div class="box-content" style="text-align: left; margin: auto; text-align: center; height: 40px;">
                                                            <asp:CheckBoxList ID="ckPlan" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="10" RepeatDirection="Horizontal" TextAlign="Right"
                                                                runat="server">
                                                            </asp:CheckBoxList>

                                                        </div>

                                                    </div>
                                                    <div class="control-group">

                                                        <asp:TextBox ID="txtFrecuencia" runat="server" TextMode="MultiLine" Height="75px"
                                                            Wrap="true" placeholder="Frecuencia" CssClass="input-block-level"></asp:TextBox>

                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>

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
