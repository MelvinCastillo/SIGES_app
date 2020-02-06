<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00003.aspx.cs" Inherits="CAID.HCX00003" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                        <i class="icon-refresh"></i>&nbsp Mostrar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>EVALUACION FISICA
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Descripción
                                    </th>
                                    <th style="width: 1%;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("NOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
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
    </asp:Panel>
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
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
                        <h3>
                            <i class="icon-edit"></i>Registro de Evaluación Física</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                            AutoPostBack="true" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- IMC --%>
                                <div class="control-group">
                                    <label for="txtIMC" class="control-label" style="color: Red">
                                        IMC</label>
                                    <div class="controls">
                                        <input runat="server" name="txtIMC" id="txtIMC" type="text" class="input-medium"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtIMC" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtIMC" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- TALLA --%>
                                <div class="control-group">
                                    <label for="txtTalla1" class="control-label" style="color: Red">
                                        Talla</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTalla1" id="txtTalla1" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Pies">
                                        <input runat="server" name="txtTalla2" id="txtTalla2" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Pulgadas">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTalla1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTalla1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTalla2" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTalla2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- PESO --%>
                                <div class="control-group">
                                    <label for="txtPeso1" class="control-label" style="color: Red">
                                        Peso</label>
                                    <div class="controls">
                                        <input runat="server" name="txtPeso1" id="txtPeso1" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Libras">
                                        <input runat="server" name="txtPeso2" id="txtPeso2" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Onzas">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtPeso1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtPeso1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtPeso2" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtPeso2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Frecuencia Cardíaca --%>
                                <div class="control-group">
                                    <label for="txtFC" class="control-label" style="color: Red">
                                        Frecuencia Cardíaca
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtFC" id="txtFC" type="text" class="input-medium" data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFC" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFC" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Tensión Arterial --%>
                                <div class="control-group">
                                    <label for="txtTA1" class="control-label" style="color: Red">
                                        Tensión Arterial</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTA1" id="txtTA1" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Sistólico">
                                        <input runat="server" name="txtTA2" id="txtTA2" type="text" class="input-medium"
                                            data-rule-required="true" placeholder="Diastólico">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTA1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTA1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTA2" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTA2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Frecuencia Respiratoria --%>
                                <div class="control-group">
                                    <label for="txtFC" class="control-label" style="color: Red">
                                        Frecuencia Respiratoria
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtFR" id="txtFR" type="text" class="input-medium" data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFR" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFR" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Temperatura --%>
                                <div class="control-group">
                                    <label for="txtIMC" class="control-label" style="color: Red">
                                        Temperatura
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtTem" id="txtTem" type="text" class="input-medium"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTem" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTem" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
