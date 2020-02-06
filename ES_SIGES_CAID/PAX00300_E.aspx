<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00300_E.aspx.cs" Inherits="CAID.PAX00300_E" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <%--<asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>PACIENTES
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools"> 
                            <thead>
                                <tr>
                                    <th>
                                        Nombres y Apellidos
                                    </th>
                                    <th>
                                        No. Record
                                    </th>
                                    <th class="hidden-480">
                                        Centro
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
                                            <td>
                                                <%# Eval("RECORDIDSTR")%>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("ROWSGXID")%>
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
    </asp:Panel>--%>
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green" validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
<%--                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>--%>
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
                            <i class="icon-edit"></i>Registro de Pacientes</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
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
                                        <br />
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
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtApellido1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="txttxtApellido1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Género -->
                                <div class="control-group">
                                    <label for="cmbSexo" class="control-label" style="color: Red">
                                        Género</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbSexo" name="cmbSexo" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="M">MASCULINO</option>
                                            <option value="F">FEMENINO</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbSexo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbSexo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- NSS -->
                                <div class="control-group">
                                    <label for="txtNSS" class="control-label" style="color: Red">
                                        No. Seguridad Social</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNSS" id="txtNSS" type="text" class='input-xlarge'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNSS" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNSS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Nacimiento -->
                                <div class="control-group">
                                    <label for="txtFechaNace" class="control-label" style="color: Red">
                                        Fecha de Nacimiento</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaNace" id="txtFechaNace" type="text" class="input-medium datepick"
                                            data-rule-required="true" placeholder="mm/dd/aaaa">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaNace" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFechaNace" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- País -->
                                <div class="control-group">
                                    <label for="cmbPais" class="control-label" style="color: Red">
                                        País de Nacimiento</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbPais" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPais_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPais" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPais" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Ciudad -->
                                <div class="control-group">
                                    <label for="cmbCiudad" class="control-label" style="color: Red">
                                        Ciudad de Nacimiento</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCiudad" name="cmbCiudad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbCiudad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCiudad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Condición -->
                                <div class="control-group">
                                    <label for="cmbCondicion" class="control-label" style="color: Red">
                                        Condición?</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCondicion" name="cmbCondicion" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">HIJO(A) BIOLOGICO(A)</option>
                                            <option value="2">HIJO(A) ADOPTIVO(A)</option>
                                            <option value="3">HIJO(A) DE CRIANZA</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbCondicion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCondicion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Reside Con -->
                                <div class="control-group">
                                    <label for="cmbResideCon" class="control-label" style="color: Red">
                                        Reside con?</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbResideCon" name="cmbResideCon" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">AMBOS PADRES</option>
                                            <option value="2">MADRE</option>
                                            <option value="3">PADRE</option>
                                            <option value="4">TUTOR</option>
                                        </select>
                                        <input runat="server" name="txtResideCon" id="txtResideCon" type="text" class="input-xlarge"
                                            placeholder="Nombre del Tutor" data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbResideCon" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbResideCon" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Cuidado Por -->
                                <div class="control-group">
                                    <label for="cmbCuidadoPor" class="control-label" style="color: Red">
                                        Cuidado por?</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCuidadoPor" name="cmbCuidadoPor" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">AMBOS PADRES</option>
                                            <option value="2">MADRE</option>
                                            <option value="3">PADRE</option>
                                            <option value="4">TUTOR</option>
                                            <option value="5">OTRO</option>
                                        </select>
                                        <input runat="server" name="txtCuidadoPor" id="txtCuidadoPor" type="text" class="input-xlarge"
                                            placeholder="Otro ..." data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbCuidadoPor" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCuidadoPor" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- ARS -->
                                <div class="control-group">
                                    <label for="cmbARS" class="control-label" style="color: Red">
                                        Aseguradora</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbARS" name="cmbARS" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbARS" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbARS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- ARS -->
                                <div class="control-group">
                                    <label for="cmbPais" class="control-label" style="color: Red">
                                        Complementarios</label>
                                    <div class="controls">
                                        <p>
                                            <button type="button" id="btnDirecciones" runat="server" onserverclick="_OpenModalDirecciones"
                                                class="btn btn-primary" validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Direcciones</button>
<%--                                            <button type="button" id="btnNucleoFamiliar" runat="server" onserverclick="_OpenModalNF" class="btn btn-primary"
                                                validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Núcleo Familiar</button>--%>
                                        </p>
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
