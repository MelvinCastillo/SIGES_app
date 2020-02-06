<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00008.aspx.cs" Inherits="CAID.HCL00008" %>

<%--Acto Médico: Desarrollo Psicomotor--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"  >

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
                        <i class="icon-edit"></i>Desarrollo Psicomotor</h3>
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
                            <%-- Actividad / Objetivo --%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Actividad</label>
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

                            <%-- Tabla Desarrollo Psicomotor --%>
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box  box-bordered">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered">
                                                <%--<thead>
                                                    <tr>
                                                        <th>Tipo
                                                        </th>
                                                        <th>Opción
                                                        </th>
                                                    </tr>
                                                </thead>--%>
                                                <tbody>
                                                    <tr>
                                                        <td class="">Sostén cefálico
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP1" name="cmbDP1" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP1" name="cmbEDADDP1" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option> 
                                                            </select>
                                                        </td>
                                                        <td>Sonrisa social
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP2" name="cmbDP2" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP2" name="cmbEDADDP2" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td>Giro sobre su eje
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP3" name="cmbDP3" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP3" name="cmbEDADDP3" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                        <td>Sedestación
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP4" name="cmbDP4" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP4" name="cmbEDADDP4" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Gateo
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP5" name="cmbDP5" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP5" name="cmbEDADDP5" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                        <td>Bipedestación
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP6" name="cmbDP6" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP6" name="cmbEDADDP6" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Marcha independiente
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP7" name="cmbDP7" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP7" name="cmbEDADDP7" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="12-15-MESES">12 - 15 Meses</option>
                                                            </select>
                                                        </td>
                                                        <td>Bisílabos
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP8" name="cmbDP8" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP8" name="cmbEDADDP8" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Frases de 2 palabras
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP9" name="cmbDP9" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP9" name="cmbEDADDP9" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                        <td>Frases de 3 palabras
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP10" name="cmbDP10" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP10" name="cmbEDADDP10" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Control de esfínteres
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP11" name="cmbDP11" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP11" name="cmbEDADDP11" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                        <td>Ambulación asistida
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP12" name="cmbDP12" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP12" name="cmbEDADDP12" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Ambulación libre
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP13" name="cmbDP13" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP13" name="cmbEDADDP13" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option>
                                                            </select>
                                                        </td>
                                                        <td>Correr, trepar, subir escaleras
                                                        </td>
                                                        <td>
                                                            <select runat="server" id="cmbDP14" name="cmbDP14" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                            </select>
                                                            <select runat="server" id="cmbEDADDP14" name="cmbEDADDP14" class='select2-me input-block-level'
                                                                data-rule-required="false">
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="0-3-MESES">0 - 3 Meses</option>
                                                                <option value="3-6-MESES">3 - 6 Meses</option>
                                                                <option value="6-9-MESES">6 - 9 Meses</option>
                                                                <option value="9-12-MESES">9 - 12 Meses</option>
                                                                <option value="DESPUES-ANO">Despues del año</option> 
                                                            </select>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label for="txtEVALUACION" class="control-label" style="font-size: small;">
                                    <strong>Comentarios</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var X = document.getElementById("ctl00_MainContent_txtEVALUACION").value;
            //alert(X.substring(2, 20).trim());
            var X = X.substring(2, 20).trim();

            if (X = "Sostén cefálico") 
            { 
                //alert(X);
                ctl00_MainContent_txtEVALUACION.value = ""; 
            } 
        </script>
               
    </div>
</asp:Content>
