<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00006.aspx.cs" Inherits="CAID.HCL00006" %>

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
                        <i class="icon-edit"></i>Antecedentes Personales Patológicos</h3>
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

                            <%-- Cirugias, Alergias, Enfermedades cronicas y Medicamentos --%>
                            <div class="control-group">


                                <div class="span6" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Cirugías
                                    </h5>
                                    <select runat="server" id="cmbCirugias" name="cmbCirugias" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="NO">NO</option>
                                        <option value="SI">SI</option>

                                    </select>
                                    <input type="text" runat="server" name="txtCCIRUGIAS" id="txtCCIRUGIAS" class="input-block-level">
                                </div>

                                <div class="span6" style="padding-bottom: 1%;">
                                    <h5 class="control-listr">Alergias
                                    </h5>
                                    <select runat="server" id="cmbAlergias" name="cmbAlergias" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="NO">NO</option>
                                        <option value="SI">SI</option>
                                    </select>
                         <input type="text" runat="server" name="txtCALERGIAS" id="txtCALERGIAS" class="input-block-level">


                                </div>



                            </div>

                            <div class="control-group">

                                <div class="span12" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Enfermedades crónicas o repetitivas
                                    </h5>
                                    <div style=" text-align: center;">
                                    <asp:CheckBoxList ID="ckEnfeCronicas" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="12" RepeatDirection="Horizontal" TextAlign="Right"
                                        runat="server">
                                    </asp:CheckBoxList>
                                    <input type="text" runat="server" name="txtOtrosEnfeCronicas" id="txtOtrosEnfeCronicas" placeholder="Otros" class="input-block-level">
                                       </div> 
                                   <%-- <asp:RequiredFieldValidator ControlToValidate="cmbEnfeCronicas" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbEnfeCronicas" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                </div>

                                


                            </div>

                              <div class="control-group">
                                  <div class="span12" style="padding-bottom: 1%; padding-left: 1%;">
                                    <h5 class="control-list">Medicamentos utilizados actualmente / Antecedentes farmacológicos
                                    </h5>
                                    <select runat="server" id="cmbMedicamentoActual" name="cmbMedicamentoActual" class='select2-me input-xxlarge'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="N/A">N/A</option>
                                        <option value="Anticonvulsivantes">Anticonvulsivantes</option>
                                        <option value="Antipsicóticos">Antipsicóticos</option>
                                        <option value="Ansiolíticos">Ansiolíticos</option>
                                        <option value="Antialérgico-Inmunológico">Antialérgico / Inmunológico</option>
                                        <option value="Otros">Otros</option>


                                    </select>
                                      &nbsp
                                    <input type="text" runat="server" name="txtOtrosMedicamentoActual" id="txtOtrosMedicamentoActual" placeholder="Otros" class="input-xxlarge">

                                    <br />
                                   <%-- <asp:RequiredFieldValidator ControlToValidate="cmbMedicamentoActual" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbMedicamentoActual" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>

                                </div>
                                  </div>

                             <%-- Antecedentes nuticion --%>
                            <div class="control-group">
                                <label for="txtAntecedentesNutricion"  class="control-label" style="font-size:small;">
                                    <strong>Nutrición</strong></label>
                                <div class="controls">
                                    <asp:TextBox ID="txtAntecedentesNutricion" runat="server" Wrap="true" TextMode="MultiLine" Height="180px" ValidationGroup="pnlData"
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
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
           <script type="text/javascript">
               var X = document.getElementById("ctl00_MainContent_txtAntecedentesNutricion").value;
            //alert(X.substring(2, 31).trim());
            var X = X.substring(2, 31).trim();

               if (X == "Recibe Algún Tratamiento :") 
            { 
                //alert(X);
                   ctl00_MainContent_txtAntecedentesNutricion.value = ""; 
            } 
        </script>
    </div>
</asp:Content>
