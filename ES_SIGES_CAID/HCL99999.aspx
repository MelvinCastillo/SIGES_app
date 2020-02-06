<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL99999.aspx.cs" Inherits="CAID.HCL99999" %>

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
                        <i class="icon-edit"></i>Finalizar Atención?</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered' >
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group" hidden="hidden">
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
                            <%--                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Objetivo</label>
                                <div class="controls">
                                    <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                </div>
                            </div>--%>

                            <%-- Personas en Sesión --%>
                            <div class="control-group">
                                <label class="control-label" style="font-size: small;">
                                    Personas en Sesión</label>
                                <div class="controls">
                                    <select runat="server" id="cmbPersonaSesion" name="cmbPersonaSesion" class='select2-me input-xlarge'>
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="Abuela Materna">Abuela Materna</option>
                                        <option value="Abuelo Materno">Abuelo Materno</option>
                                        <option value="Abuela Paterna">Abuela Paterna</option>
                                        <option value="Abuelo Paterno">Abuelo Paterno</option>
                                        <option value="Ambos Padres">Ambos Padres</option>
                                        <option value="Hermanos">Hermanos</option>
                                        <option value="Familiar">Familiar</option>
                                        <option value="Madre">Madre</option>
                                        <option value="Maestra acompañante">Maestra acompañante</option>
                                        <option value="Nana">Nana</option>
                                        <option value="Padre">Padre</option>
                                        <option value="Tío/a">Tío/a</option>
                                        <option value="Tutor/a">Tutor/a</option>
                                        <option value="Otros">Otros</option>
                                        <option value="MultiplesMiembros">Multiples Miembros</option>
                                    </select>
                                    &nbsp
                                    <input runat="server" name="txtDetalles" id="txtDetalles" type="text" class="input-xxlarge">
                                </div>
                            </div>

                            <div class="control-group" hidden="hidden">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px"
                                    ValidationGroup="pnlData" Wrap="true" placeholder="Consideraciones Finales" Text="." CssClass="input-block-level"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                    ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" />
                            </div>

                        </div>
                        
                         <div class="form-actions">
                            <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Finalizar</button> 
                            <div class="btn-group">
                                <a href="http://caidsiges01:8000/INDEX_T.ASPX" class="btn btn-danger active">
                                    <i class="icon-arrow-left" aria-hidden="true"></i>&nbsp  Cerrar
                                </a>
                            </div> 
                   
                        </div>
                    </div>
                                   
                </div>
            </div>
        </div>
    </div>



</asp:Content>
