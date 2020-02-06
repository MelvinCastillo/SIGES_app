<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00041.aspx.cs" Inherits="CAID.HCL00041" %>

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
            <div class="box">
                <div class="box-title">
                    <h3 runat="server" id="H3">
                        <i class="icon-edit"></i>Evaluación Inicial - Intervención Conductual</h3>
                </div>
            </div>
        </div>

    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H1">Entrevista</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-striped'>
                        <%-- Tipo de Evaluación --%>
                        <div class="control-group">
                            <label for="cmbTipo" class="control-label" style="font-size: small;">
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




                        <%--Entrevista--%>
                        <div class="control-group">
                            <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">Entrevista</div>

                            <asp:TextBox ID="txtEntrevista" runat="server" TextMode="MultiLine" Height="900px" ValidationGroup="pnlData"
                                Wrap="true" CssClass="input-block-level"></asp:TextBox>

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

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H2">Protocolo Evaluación Línea Base Inicio de Programas</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content">
                    <div class='form-vertical'>
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">A. Cooperación y Efectividad de reforzadores</div>


                                </div>
                                <%--AP1--%>
                                <div class="control-group">
                                    <label for="cmbAP1" class="control-label"><strong>¿Toma algo que le gusta cuando se lo ofrece? ¿Y si es cualquier otro objeto? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbAP1" name="cmbAP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--AP2--%>
                                <div class="control-group">
                                    <label for="cmbAP2" class="control-label"><strong>Sigue con la mirada el objeto que le gusta si usted se lo pide </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbAP2" name="cmbAP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--AP3--%>
                                <div class="control-group">
                                    <label for="cmbAP3" class="control-label"><strong>¿Cuándo usted le pide algo él se acerca a usted? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbAP3" name="cmbAP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--AP4--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label"><strong>¿Sigue instrucciones? ¿Cuáles?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbAP4" name="cmbAP4" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>
                                <%--A Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtAObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-pink" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">B. Respuesta visual</div>


                                </div>

                                <%--BP1--%>
                                <div class="control-group">
                                    <label for="cmbBP1" class="control-label"><strong>Realiza rompecabezas de encajados ¿Rompecabezas de ensamblados?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbBP1" name="cmbBP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--BP2--%>
                                <div class="control-group">
                                    <label for="cmbBP2" class="control-label"><strong>¿Puede identificar dos objetos iguales? Ej. Con sus zapatos</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbBP2" name="cmbBP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--BP3--%>
                                <div class="control-group">
                                    <label for="cmbBP3" class="control-label"><strong>¿Puede armar torres siguiendo un patrón? O sencillamente puede hacer un patrón con figuras?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbBP3" name="cmbBP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--B Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtBObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">C. Lenguaje receptivo</div>


                                </div>

                                <%--CP1--%>
                                <div class="control-group">
                                    <label for="cmbCP1" class="control-label"><strong>¿Se voltea ante el llamado de su nombre?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbCP1" name="cmbCP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--CP2--%>
                                <div class="control-group">
                                    <label for="cmbCP2" class="control-label"><strong>¿Cuándo usted le pide que haga alguna actividad que le guste en contexto lo hace?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbCP2" name="cmbCP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--CP3--%>
                                <div class="control-group">
                                    <label for="cmbCP3" class="control-label"><strong>¿Sigue un objeto con la mirada tras darle una instrucción?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbCP3" name="cmbCP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--CP4--%>
                                <div class="control-group">
                                    <label for="cmbCP4" class="control-label"><strong>¿Toca objetos o señala cuando usted se lo pide?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbCP4" name="cmbCP4" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--CP5--%>
                                <div class="control-group">
                                    <label for="cmbCP5" class="control-label"><strong>¿Toca partes de objetos? ¿Cuáles partes de su cuerpo?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbCP5" name="cmbCP5" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>


                                <%--C Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtCObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-pink" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">D. Imitacion Motora</div>


                                </div>

                                <%--DP1--%>
                                <div class="control-group">
                                    <label for="cmbDP1" class="control-label"><strong>¿Imita conductas con un objeto?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbDP1" name="cmbDP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--DP2--%>
                                <div class="control-group">
                                    <label for="cmbDP2" class="control-label"><strong>¿Imita movimientos de coordinación motriz con los brazos o las piernas?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbDP2" name="cmbDP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--D Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtDObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                        </div>

                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">E. Imitación vocal</div>


                                </div>

                                <%--EP1--%>
                                <div class="control-group">
                                    <label for="cmbEP1" class="control-label"><strong>¿Puede imitar sonidos? ¿Silabas? ¿Palabras? ¿Frases? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbEP1" name="cmbEP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--E Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtEObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-pink" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">F. Pedidos</div>


                                </div>

                                <%--FP1--%>
                                <div class="control-group">
                                    <label for="cmbFP1" class="control-label"><strong>¿Pide señalando? ¿Hace señas?</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbFP1" name="cmbFP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--FP2--%>
                                <div class="control-group">
                                    <label for="cmbFP2" class="control-label"><strong>¿Pide de forma espontánea? ¿Solo diciendo palabras? O dice 2 palabras? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbFP2" name="cmbFP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--FP3--%>
                                <div class="control-group">
                                    <label for="cmbFP3" class="control-label"><strong>¿Puede pedir hasta 10 cosas que desee? ¿Pide mirando a la cara? ¿Solicita ayuda? Como lo hace? ¿Hace preguntas diciendo que? ¿Quien?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbFP3" name="cmbFP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>


                                <%--F Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtFObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">G. Etiquetas</div>


                                </div>

                                <%--GP1--%>
                                <div class="control-group">
                                    <label for="cmbGP1" class="control-label"><strong>¿Dice el nombre de las cosas que le gustan? ¿Nombra objetos? ¿Nombra partes del cuerpo? ¿Puede identificar objetos por su función? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbGP1" name="cmbGP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--G Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtGObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-pink" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">H. Intraverbales</div>


                                </div>

                                <%--HP1--%>
                                <div class="control-group">
                                    <label for="cmbHP1" class="control-label"><strong>¿Completa las palabras de las canciones? ¿Hace señas? ¿Hace los sonidos de animales? ¿Puede completar oraciones? Ej: pateas con tu _________ </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbHP1" name="cmbHP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--H Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtHObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">I. Sintaxis y Gramática</div>


                                </div>

                                <%--IP1--%>
                                <div class="control-group">
                                    <label for="cmbIP1" class="control-label"><strong>¿Cuál es la frase más larga que ha dicho? ¿Incluye verbos?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbIP1" name="cmbIP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--I Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtIObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-pink" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">J. Juego y habilidades</div>


                                </div>

                                <%--JP1--%>
                                <div class="control-group">
                                    <label for="cmbJP1" class="control-label"><strong>¿Explora juguetes? ¿Permite que otros toquen y le ayuden? ¿Habla mientras juega con los juguetes?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbJP1" name="cmbJP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--JP2--%>
                                <div class="control-group">
                                    <label for="cmbJP2" class="control-label"><strong>¿Juega con los juguetes de manera creativa? Ej: pretende que le echa gasolina al carro?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbJP2" name="cmbJP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--JP3--%>
                                <div class="control-group">
                                    <label for="cmbJP3" class="control-label"><strong>¿Juega con otros niños? ¿Qué tipo de juegos y como lo hace? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbJP3" name="cmbJP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--J Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtJObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>

                        </div>

                        <div class="row-fluid">
                            <div class="span6">
                                <div class="control-group">


                                    <div class="label-teal" style="color: white; padding-left: 10px; height: 30px; padding-top: 5px;">K. Interacción Social</div>


                                </div>

                                <%--Interacción Social KP1--%>
                                <div class="control-group">
                                    <label for="cmbKP1" class="control-label"><strong>¿Su reacción es adecuada cuando se acerca a otros niños? ¿Cuándo lo tocan responde de manera apropiada?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbKP1" name="cmbKP1" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--Interacción Social KP2--%>
                                <div class="control-group">
                                    <label for="cmbKP2" class="control-label"><strong>¿Imita a sus compañeros? ¿Dice por favor y gracias cuando se le recuerda? </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbKP2" name="cmbKP2" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>

                                <%--Interacción Social KP3--%>
                                <div class="control-group">
                                    <label for="cmbKP3" class="control-label"><strong>¿Señala objetos para mostrarles a otras personas?  </strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbKP3" name="cmbKP3" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Si"></option>
                                            <option value="No"></option>

                                        </select>
                                    </div>
                                </div>




                                <%--K Observaciones--%>
                                <div class="control-group">
                                    <label for="cmbAP4" class="control-label">Observaciones</label>
                                    <div class="controls">

                                        <asp:TextBox ID="txtKObservaciones" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <div class="form-actions span12">
                            <button type="submit" id="Button1" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                        </div>


                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H4">Objetivos Terapéuticos Intervención Conductual</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal'>
                        <%--  --%>
                        <div class="control-group">
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable-scroll-x">
                                    <thead>
                                        <tr>
                                            <th>En la evaluación
                                            </th>
                                            <th>Objetivos con el niño
                                            </th>
                                            <th>Objetivos con la familia
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><strong>Conducta</strong>
                                                <br>
                                                <asp:TextBox ID="txtCONDUCTA" runat="server" TextMode="MultiLine" Height="70px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                            </td>
                                            <td><asp:TextBox ID="txtCONDUCTA_OBJPAC" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
											</td>
                                            <td>
                                                <asp:TextBox ID="txtCONDUCTA_OBJFAM" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>

                                            </td>

                                        </tr>

                                         <tr>
                                            <td><strong>Habilidades básicas </strong>
                                                <br>
                                                <asp:TextBox ID="txtHABBASICA" runat="server" TextMode="MultiLine" Height="70px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                            </td>
                                            <td><asp:TextBox ID="txtHABBASICA_OBJPAC" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
											</td>
                                            <td>
                                                <asp:TextBox ID="txtHABBASICA_OBJFAM" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>

                                            </td>

                                        </tr>

                                        <tr>
                                            <td><strong>Habilidades verbales</strong>
                                                <br>
                                                <asp:TextBox ID="txtHABVERBALES" runat="server" TextMode="MultiLine" Height="70px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                            </td>
                                            <td><asp:TextBox ID="txtHABVERBALES_OBJPAC" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
											</td>
                                            <td>
                                                <asp:TextBox ID="txtHABVERBALES_OBJFAM" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>

                                            </td>

                                        </tr>

                                         <tr>
                                            <td><strong>Otros</strong>
                                                <br>
                                                <asp:TextBox ID="txtOTROS" runat="server" TextMode="MultiLine" Height="70px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                            </td>
                                            <td><asp:TextBox ID="txtOTROS_OBJPAC" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
											</td>
                                            <td>
                                                <asp:TextBox ID="txtOTROS_OBJFAM" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>

                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions span12">
                            <button type="submit" id="Button2" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                        </div>
                </div>
            </div>
        </div>

    </div>



</asp:Content>













