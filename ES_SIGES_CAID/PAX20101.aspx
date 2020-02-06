<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX20101.aspx.cs" Inherits="CAID.PAX20101" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Edición de Registros --%>
    <div class="row-fluid">
        <div class="span6">
            <div class="box-content nopadding">
            </div>
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Control de Visitas</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <div class="control-group">
                                <div class="col-sm-12">
                                    <label for="cmbMotivo" style="color: Red">
                                        &nbsp&nbsp <strong>SI PACIENTE NO TIENE CITA CONFIRMADA NO SE GUARDARA EL REGISTRO</strong></label>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtCedula" class="control-label">
                                    Tipo</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTipo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbTipo_SelectedIndexChanged">
                                        <asp:ListItem>-- SELECCIONE --</asp:ListItem>
                                        <asp:ListItem>VISITA</asp:ListItem>
                                        <asp:ListItem>CITA</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <%-- Hora Inicio --%>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label">
                                    Inicio</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtHoraIni" id="txtHoraIni" class="input-medium"
                                        placeholder="Hora de Inicio">
                                </div>
                            </div>
                            <asp:Panel ID="pnlInteraccion" runat="server">
                                <%-- Tipo de Contacto --%>
                                <%-- <div class="control-group">
                                        <label for="cmbContacto" class="control-label">
                                            Forma de Contacto</label>
                                        <div class="controls">
                                            <select runat="server" id="cmbContacto" name="cmbContacto" class='select2-me input-block-level'
                                                data-rule-required="true">
                                            </select>
                                            <asp:RequiredFieldValidator ControlToValidate="cmbContacto" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbContacto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                    </div>--%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Record No.</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                </div>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbContacto" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                            </asp:Panel>
                            <%-- Cédula / Pasaporte--%>
                            <div class="control-group">
                                <label for="txtCedula" class="control-label">
                                    Identificación</label>
                                <div class="controls">
                                    <select runat="server" id="cmbDocumento" name="cmbDocumento" class='select2-me input-medium'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                        <option value="CEDULA">CEDULA</option>
                                        <option value="PASAPORTE">PASAPORTE</option>
                                        <option value="LICENCIA">LICENCIA</option>
                                        <option value="CARNET">CARNET</option>
                                        <option value="OTRO">OTRO</option>
                                    </select>
                                    <input runat="server" type="text" name="txtCedula" id="txtCedula" class="input-medium"
                                        placeholder="Introduzca el Número">
                                    <button type="button" id="btnFilter" runat="server" onserverclick="_Search" class="btn btn-blue"
                                        validationgroup="pnlSearch">
                                        <i class="icon-search"></i>&nbsp Buscar Cédula</button>
                                </div>
                            </div>
                            <%-- Nombre --%>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label">
                                    Nombre</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtNombre" id="txtNombre" class="input-block-level"
                                        placeholder="Nombre Completo">
                                    <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Motivo de Visita --%>
                            <div class="control-group">
                                <label for="cmbMotivo" class="control-label" style="color: Red">
                                    Motivo</label>
                                <div class="controls">
                                    <select runat="server" id="cmbMotivo" name="cmbMotivo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                    </select>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbMotivo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbMotivo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <asp:Panel ID="pnlVisita" runat="server">
                            </asp:Panel>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label" style="color: Red">
                                    Carnet Asignado</label>
                                <div class="controls">
                                    <input runat="server" name="txtCarnet" id="txtCarnet" type="text" class="input-xlarge"
                                        data-rule-required="true">
                                    <asp:RequiredFieldValidator ControlToValidate="txtCarnet" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="txtCarnet1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Detalles --%>
                            <div class="control-group">
                                <label for="txtDetalles" class="control-label">
                                    Detalles</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtDetalles" runat="server" TextMode="MultiLine" Height="240px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row-fluid">
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <%-- Guía de Información --%>
                        <div class="box  box-bordered">
                            <div class="box-title">
                                <h3>
                                    Servicios
                                </h3>
                            </div>
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable-scroll-x">
                                    <tbody>
                                        <asp:Repeater ID="rpServicios" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="CheckBoxServicios" runat="server" ToolTip='<%# Eval("ROWGUID")%>'
                                                            ValidationGroup='<%# Eval("NOMBRE")%>' />
                                                    </td>
                                                    <td>
                                                        <%# Eval("NOMBRE")%>
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
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <%-- Guía de Información --%>
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            Guía de Información
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable-scroll-x">
                            <tbody>
                                <asp:Repeater ID="rpDetalles" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("NOMBRE")%>
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
    </div>
    </div>
    <%--Consulta General --%>
</asp:Content>
