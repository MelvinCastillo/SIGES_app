<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00300.aspx.cs" Inherits="CAID.SMX00300" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>PROFESIONALES
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Nombre Completo
                                    </th>
                                    <th class="hidden-480">
                                        Tipo
                                    </th>
                                    <th class="hidden-480">
                                        Especialidad
                                    </th>
                                       <th class="hidden-480">
                                        Tanda
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
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("TIPONOMBRE")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("ESPECIALIDAD")%>
                                            </td>
                                             <td class="hidden-480">
                                                <%# Eval("TANDASTR")%>
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
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Profesionales</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Id Local -->
                                <div class="control-group">
                                    <label for="txtIdLocal" class="control-label" style="color: Red">
                                        Codigo</label>
                                    <div class="controls">
                                        <input runat="server" name="txtIdLocal" id="txtIdLocal" type="text" class="input-xlarge"
                                            placeholder="Codigo Actual" data-rule-required="true">
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtIdLocal" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtIdLocal" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Nombres -->
                                <div class="control-group">
                                    <label for="txtNombre1" class="control-label" style="color: Red">
                                        Nombre(s)</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre1" id="txtNombre1" type="text" class="input-xlarge"
                                            placeholder="Primer Nombre" data-rule-required="true">
                                        <input runat="server" name="txtNombre2" id="txtNombre2" type="text" class="input-xlarge"
                                            placeholder="Segundo Nombre" data-rule-required="true">
                                        <input runat="server" name="txtApodo" id="txtApodo" type="text" class='input-xlarge'
                                            placeholder="Apodo" data-rule-required="true">
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Apellidos -->
                                <div class="control-group">
                                    <label for="txtApellido1" class="control-label" style="color: Red">
                                        Apellido(s)</label>
                                    <div class="controls">
                                        <input runat="server" name="txtApellido1" id="txtApellido1" type="text" class="input-xlarge"
                                            placeholder="Primer Apellido" data-rule-required="true">
                                        <input runat="server" name="txtApellido2" id="txtApellido2" type="text" class="input-xlarge"
                                            placeholder="Segundo Apellido" data-rule-required="true">
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtApellido1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="txttxtApellido1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- IDENTIFICACIONES -->
                                <div class="control-group">
                                    <label for="txtCedula" class="control-label" style="color: Red">
                                        Identificaciones
                                    </label>
                                    <div class="controls">
                                        <input runat="server" name="txtCedula" id="txtCedula" type="text" class='input-xlarge'
                                            placeholder="Cedula" data-rule-required="true">
                                        <input runat="server" name="txtNSS" id="txtNSS" type="text" class='input-xlarge'
                                            placeholder="No Seguridad Social" data-rule-required="false">
                                        <input runat="server" name="txtPasaporte" id="txtPasaporte" type="text" class='input-xlarge'
                                            placeholder="Pasaporte" data-rule-required="false">
                                        <asp:RequiredFieldValidator ControlToValidate="txtCedula" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtCedula" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Nacimiento -->
                                <div class="control-group">
                                    <label for="txtFechaNace" class="control-label" style="color: Red">
                                        Fecha de Nacimiento</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaNace" id="txtFechaNace" type="text" class="input-medium datepick"
                                            data-rule-required="true" placeholder="mm/dd/aaaa">
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaNace" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFechaNace" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- ClaseId combo --%>
                                <div class="control-group">
                                    <label for="cmbClaseId" class="control-label" style="color: Red">
                                        Clase Profesional</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbClaseId" name="cmbClaseId" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">MEDICOS</option>
                                            <option value="2">TERAPISTAS</option>
                                            <option value="3">ENFERMERAS</option>
                                            <option value="4">AGENTE SOCIAL</option>
                                        </select>
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="cmbClaseId" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbClaseId" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Especialidad Medica -->
                                <div class="control-group">
                                    <label for="cmbEspMed" class="control-label" style="color: Red">
                                        Especialidad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEspMed" name="cmbEspMed" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspMed" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEspMed" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label for="cmbTanda" class="control-label" style="color: Red">
                                        Tanda</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTanda" name="cmbTanda" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">MAÑANA</option>
                                            <option value="2">TARDE</option>
                                            <option value="3">COMPLETA</option>
                                        </select>
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTanda" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbTanda1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
