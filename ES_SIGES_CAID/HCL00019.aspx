<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00019.aspx.cs" Inherits="CAID.HCL00019" %>

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
                        <i class="icon-edit"></i>Medidas Antropométricas</h3>
                    <div class="actions">

                      <button type="button" id="btnIMC" runat="server" onserverclick="_ViewIMC" class="btn">
                        &nbsp IMC</button>

                        <button type="button" id="btnEST" runat="server" onserverclick="_ViewEST" class="btn">
                        &nbsp ESTATURA</button>

                        <button type="button" id="btnPESO" runat="server" onserverclick="_ViewPESO" class="btn">
                       &nbsp PESO</button>

                          <button type="button" id="btn" runat="server"    onclick="window.open('fichas/percentilesdePCI.pdf' ,'_blank', 'toolbar=no,scrollbars=no,resizable=yes,top=60,left=300,width=800,height=600');" class="btn">
                       &nbsp PCI</button>
                
                        <a href="#" class="btn content-slideUp"><i class="icon-angle-down"></i></a>
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
                            <%-- Objetivo --%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Objetivo</label>
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
                            <%-- IMC --%>
                            <div class="control-group">
                                <label for="txtIMC" class="control-label" style="color: Red">
                                    IMC</label>
                                <div class="controls">
                                    <input runat="server" name="txtIMC" id="txtIMC" disabled="true" type="text" class="input-medium"
                                        data-rule-required="true">
                                        <asp:Literal ID="litIMC" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <%-- TALLA --%>
                            <div class="control-group">
                                <label for="txtTalla1" class="control-label" style="color: Red">
                                    Talla</label>
                                <div class="controls">
                                    <select runat="server" id="cmbTalla" name="cmbTalla" class='select2-me input-medium'
                                        ValidationGroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Centimetros">Centimetros</option>
                                        <option value="Pies">Pies</option>
                                        <option value="Metros">Metros</option>
                                    </select>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTalla" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="valcmbTalla" runat="server" SetFocusOnError="True" />
                                    &nbsp
                                    <input runat="server" name="txtMedidaTalla" id="txtMedidaTalla" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Medida">                                    
                                </div>
                            </div>
                            <%-- PESO --%>
                            <div class="control-group">
                                <label for="txtPeso1" class="control-label" style="color: Red">
                                    Peso</label>
                                <div class="controls">
                                    <select runat="server" id="cmbPeso" name="cmbPeso" class='select2-me input-medium'
                                        ValidationGroup="pnlData">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Libras">Libras</option>
                                        <option value="Onzas">Onzas</option>
                                        <option value="Kilogramos">Kilogramos</option>
                                    </select>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPeso" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="valcmbPeso" runat="server" SetFocusOnError="True" />
                                    &nbsp
                                    <input runat="server" name="txtMedidaPeso" id="txtMedidaPeso" type="text" class="input-medium"
                                        data-rule-required="true" placeholder="Medida">
                                </div>
                            </div>
                            <%-- LT --%>
                            <div class="control-group">
                                <label for="txtLT" class="control-label" style="color: Red">
                                    LT (cm)
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtLT" id="txtLT" type="text" class="input-medium" data-rule-required="true"
                                        placeholder="cm">
                                </div>
                            </div>

                            <%-- Perímetro cefálico --%>
                            <div class="control-group">
                                <label for="txtPerimetroCefalico" class="control-label" style="color: Red">
                                    Perímetro cefálico (cm)
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtPerimetroCefalico" id="txtPerimetroCefalico" type="text" class="input-medium" data-rule-required="true"
                                        placeholder="cm">
                                </div>
                            </div>

                            <%-- Pliegue cutáneo Tricipital --%>
                            <div class="control-group">
                                <label for="txtPliegueTricipal" class="control-label" style="color: Red">
                                    Pliegue cutáneo tricipital (mm)
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtPliegueTricipal" id="txtPliegueTricipal" type="text" class="input-medium" data-rule-required="true"
                                        placeholder="mm">
                                </div>
                            </div>

                            <%-- Circunferencia Media del Brazo --%>
                            <div class="control-group">
                                <label for="txtCircunferenciaBrazo" class="control-label" style="color: Red">
                                    Circunferencia media del brazo (cm)
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtCircunferenciaBrazo" id="txtCircunferenciaBrazo" type="text" class="input-medium" data-rule-required="true"
                                        placeholder="cm">
                                </div>
                            </div>

                            <%-- cintura --%>
                            <div class="control-group">
                                <label for="txtCintura" class="control-label" style="color: Red">
                                    Cintura (cm)
                                </label>
                                <div class="controls">
                                    <input runat="server" name="txtCintura" id="txtCintura" type="text" class="input-medium" data-rule-required="true"
                                        placeholder="cm">
                                </div>
                            </div>

                            <div class="control-group">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px"
                                     Wrap="true" placeholder="Observaciones" CssClass="input-block-level"></asp:TextBox>
                                
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
    <div class="row-fluid">
        <div class="span12">
            <div class="box  box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-table"></i>Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                        <thead>
                            <tr>
                                <th>No.
                                </th>
                                <th>Fecha y Hora
                                </th>
                                <th>Evaluación
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpHistorico" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("NUMERO")%>
                                        </td>
                                            <td>
                                                <%# Eval("FECHA")%>&nbsp<%# Eval("HORA")%>
                                            </td>
                                        <td>
                                            <%# Eval("DESCRIPCION")%>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
