<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00400.aspx.cs" Inherits="CAID.SMX00400" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <%--  Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                        <i class="icon-refresh"></i>&nbsp Mostrar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>CITAS MÉDICAS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Nombre
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
                                            <td class="hidden-480">
                                                <%# Eval("ROWSGXID")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar la cita de éste paciente?');"></asp:LinkButton>
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
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green" validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Citas Médicas</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Descipción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <input runat="server" name="txtCodigoPx" id="txtCodigoPx" type="text" class="input-xxlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="50">
                                        <asp:RequiredFieldValidator ControlToValidate="txtCodigoPx" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:LinkButton ID="btnBuscarPx" CssClass="btn btn-blue" runat="server" Text="Buscar"
                                            OnClick="_BuscaPx"></asp:LinkButton>
                                    </div>
                                    <div class="box-content nopadding">
                                        <asp:GridView ID="grvPx" runat="server" AutoGenerateColumns="False" Width="80%" AllowPaging="True">
                                            <EmptyDataTemplate>
                                                <p>
                                                    NO HAY REGISTRO PARA MOSTRAR.</p>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:BoundField DataField="ROWGUID" HeaderText="Código" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="FULLNAME" HeaderText="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ROWSGXID" HeaderText="Centro"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnSeleccionar" runat="server" CommandArgument='<%# Eval("ROWGUID")%>'
                                                            OnClick="_SelectPx" Text="Seleccionar" ToolTip="Selecciona el paciente" CssClass="btn btn-blue"
                                                            data-original-title="Selecciona el paciente."></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <!-- Fecha Inicio -->
                                <div class="control-group">
                                    <label for="txtFechaNace" class="control-label" style="color: Red">
                                        Fecha Inicio</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                            data-date-format="dd-mm-yyyy" data-date-viewmode="years" data-date-autoclose="True"
                                            data-rule-required="true" placeholder="dd-mm-aaaa">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFechaNace" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Final -->
                                <div class="control-group">
                                    <label for="txtFechaNace" class="control-label" style="color: Red">
                                        Fecha Final</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFechaFin" id="txtFechaFin" class="input-medium datepick"
                                            data-date-format="dd-mm-yyyy" data-date-viewmode="years" data-date-autoclose="True"
                                            data-rule-required="true" placeholder="dd-mm-aaaa">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFechaFin" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <%--                                        <asp:CompareValidator ID="cvFecha_Fin" runat="server" ControlToCompare="txtFechaIni" ControlToValidate="txtFechaFin" Display="Dynamic" ErrorMessage="La Fecha Final no puede ser menor o igual a la Inicial, favor de verificar." ForeColor="Red" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date"></asp:CompareValidator>--%>
                                    </div>
                                </div>
                                <%--                                <!-- Hora Inicial -->
                                <div class="control-group">
                                    <label for="cmbTarifa" class="control-label" style="color: Red">
                                        Hora Inicial</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbHoraIni" name="cmbHoraIni" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                    </div>
                                </div>
                                <!-- Hora Final -->
                                <div class="control-group">
                                    <label for="cmbTarifa" class="control-label" style="color: Red">
                                        Hora Final</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbHoraFin" name="cmbHoraFin" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                    </div>
                                </div>--%>
                                <%-- Origen Tratamiento --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Origen Tratamiento</label>
                                    <div class="controls">
                                        <input runat="server" name="txtOrigenID" id="txtOrigenID" type="text" class="input-xxlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="50">
                                        <asp:RequiredFieldValidator ControlToValidate="txtOrigenID" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator6" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:LinkButton ID="lnkBuscaOrigen" CssClass="btn btn-blue" runat="server" Text="Buscar"
                                            ToolTip="Buscar el origen del tratamiento" OnClick="_BuscaOrigen"></asp:LinkButton>
                                    </div>
                                    <asp:GridView ID="grvOrigen" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered dataTable dataTable-scroll-x"
                                        Width="80%">
                                        <EmptyDataTemplate>
                                            <p>
                                                NO HAY REGISTRO PARA MOSTRAR.</p>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField DataField="ROWGUID" HeaderText="Código" Visible="False"></asp:BoundField>
                                            <asp:BoundField DataField="NOMBRE" HeaderText="Enfermedad"></asp:BoundField>
                                            <asp:BoundField DataField="ROWSGXID" HeaderText="Centro"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Acción">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSelectOrigen" runat="server" CommandArgument='<%# Eval("ROWGUID")%>'
                                                        OnClick="_SelectOrigen" Text="Seleccionar" ToolTip="Selecciona el origen del tratamiento"
                                                        CssClass="btn btn-blue" data-original-title="Selecciona el origen del tratamiento.">
                                                    </asp:Button>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <%-- Médico --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Médico</label>
                                    <div class="controls">
                                        <input runat="server" name="txtMedID" id="txtMedID" type="text" class="input-xxlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="50">
                                        <asp:RequiredFieldValidator ControlToValidate="txtMedID" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:LinkButton ID="lnkBuscaDr" CssClass="btn btn-blue" runat="server" Text="Buscar"
                                            ToolTip="Buscar doctor de atención." OnClick="_BuscaDr"></asp:LinkButton>
                                    </div>
                                    <div class="box-content nopadding">
                                        <asp:GridView ID="grvDr" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered dataTable dataTable-scroll-x"
                                            Width="100%">
                                            <EmptyDataTemplate>
                                                <p>
                                                    NO HAY REGISTRO PARA MOSTRAR.</p>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:BoundField DataField="ROWGUID" HeaderText="Código" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="FULLNAME" HeaderText="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ROWSGXID" HeaderText="Centro"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnSelectDr" runat="server" CommandArgument='<%# Eval("ROWGUID")%>'
                                                            OnClick="_SelectDr" Text="Seleccionar" ToolTip="Selecciona el doctor." CssClass="btn btn-blue"
                                                            data-original-title="Selecciona el doctor."></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <%-- Terapista --%>
                                <div class="control-group">
                                    <label for="txtTerID" class="control-label" style="color: Red">
                                        Terapista</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTerID" id="txtTerID" type="text" class="input-xxlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="50">
                                        <asp:RequiredFieldValidator ControlToValidate="txtTerID" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:LinkButton ID="lnkBuscaTer" CssClass="btn btn-blue" runat="server" Text="Buscar"
                                            ToolTip="Buscar terapista." OnClick="_BuscaTer"></asp:LinkButton>
                                    </div>
                                    <div class="box-content nopadding">
                                        <asp:GridView ID="grvTer" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered dataTable dataTable-scroll-x"
                                            Width="100%">
                                            <EmptyDataTemplate>
                                                <p>
                                                    NO HAY REGISTRO PARA MOSTRAR.</p>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:BoundField DataField="ROWGUID" HeaderText="Código" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="FULLNAME" HeaderText="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ROWSGXID" HeaderText="Centro"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnSelectTer" runat="server" CommandArgument='<%# Eval("ROWGUID")%>'
                                                            OnClick="_SelectTer" Text="Seleccionar" ToolTip="Selecciona el terapista." CssClass="btn btn-blue"
                                                            data-original-title="Selecciona el terapista."></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <%-- Enfermera --%>
                                <div class="control-group">
                                    <label for="txtEnfID" class="control-label" style="color: Red">
                                        Enfermera</label>
                                    <div class="controls">
                                        <input runat="server" name="txtEnfID" id="txtEnfID" type="text" class="input-xxlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="50">
                                        <asp:RequiredFieldValidator ControlToValidate="txtEnfID" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        <asp:LinkButton ID="lnkBuscaEnf" CssClass="btn btn-blue" runat="server" Text="Buscar"
                                            ToolTip="Buscar enfermera." OnClick="_BuscaEnf"></asp:LinkButton>
                                    </div>
                                    <div class="box-content nopadding">
                                        <asp:GridView ID="grvEnf" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered dataTable dataTable-scroll-x"
                                            Width="100%">
                                            <EmptyDataTemplate>
                                                <p>
                                                    NO HAY REGISTRO PARA MOSTRAR.</p>
                                            </EmptyDataTemplate>
                                            <Columns>
                                                <asp:BoundField DataField="ROWGUID" HeaderText="Código" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="FULLNAME" HeaderText="Nombres"></asp:BoundField>
                                                <asp:BoundField DataField="ROWSGXID" HeaderText="Centro"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Acción">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnSelectEnf" runat="server" CommandArgument='<%# Eval("ROWGUID")%>'
                                                            OnClick="_SelectEnf" Text="Seleccionar" ToolTip="Selecciona la enfermera." CssClass="btn btn-blue"
                                                            data-original-title="Selecciona la enfermera."></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <!-- HISTORICO -->
                                <div class="control-group">
                                    <label for="cmbPais" class="control-label" style="color: Red">
                                    </label>
                                    <div class="controls">
                                        <p>
                                            <button type="button" id="btnDirecciones" runat="server" onserverclick="_OpenModalDetalleCita"
                                                class="btn btn-primary" validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Registrar Hora y Día</button>
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
    <%--
    -------------------------------------------------------------------------------
    ----------------             FORMULARIOS MODALES               ----------------
    -------------------------------------------------------------------------------
    --%>
    <%--Formulario Detalle Citas.--%>
    <asp:Panel CssClass="modal" ID="SMX00401" runat="server" Visible="false">
        <div class="modal-header">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-reorder"></i>Detalle de Cita
                    </h3>
                    <ul class="tabs">
                        <%--                        <li class="active"><a href="#tabDirecciones1" data-toggle="tab">Registro</a> </li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="modal-body">
            <div class='form-horizontal'>
                <div class="tab-content padding tab-content-inline tab-content-bottom">
                    <div class="tab-pane active" id="tabDirecciones1">
                        <div class="box-content">
                            <!-- Fecha Inicio -->
                            <div class="control-group">
                                <label for="txtFechaNace" class="control-label" style="color: Red">
                                    Fecha Inicio</label>
                                <div class="controls">
                                    <input runat="server" name="txtFechaIni" id="txtFechaIniD" class="input-medium datepick"
                                        data-date-format="dd-mm-yyyy" data-date-viewmode="years" data-date-autoclose="True"
                                        data-rule-required="true" placeholder="dd-mm-aaaa">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtFechaIniD" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <!-- Fecha Final -->
                            <div class="control-group">
                                <label for="txtFechaNace" class="control-label" style="color: Red">
                                    Fecha Final</label>
                                <div class="controls">
                                    <input runat="server" name="txtFechaFin" id="txtFechaFinD" class="input-medium datepick"
                                        data-date-format="dd-mm-yyyy" data-date-viewmode="years" data-date-autoclose="True"
                                        data-rule-required="true" placeholder="dd-mm-aaaa">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtFechaFinD" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator7" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    <%--                                        <asp:CompareValidator ID="cvFecha_Fin" runat="server" ControlToCompare="txtFechaIni" ControlToValidate="txtFechaFin" Display="Dynamic" ErrorMessage="La Fecha Final no puede ser menor o igual a la Inicial, favor de verificar." ForeColor="Red" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date"></asp:CompareValidator>--%>
                                </div>
                            </div>
                            <!-- Hora Inicial -->
                            <div class="control-group">
                                <label for="cmbTarifa" class="control-label" style="color: Red">
                                    Hora Inicial</label>
                                <div class="controls">
                                    <select runat="server" id="cmbHoraIniD" name="cmbHoraIni" class='select2-me input-xlarge'
                                        data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <!-- Hora Final -->
                            <div class="control-group">
                                <label for="cmbTarifa" class="control-label" style="color: Red">
                                    Hora Final</label>
                                <div class="controls">
                                    <select runat="server" id="cmbHoraFinD" name="cmbHoraFin" class='select2-me input-xlarge'
                                        data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <!-- Día -->
                            <div class="control-group">
                                <label for="cmbDia" class="control-label" style="color: Red">
                                    Día</label>
                                <div class="controls">
                                    <select runat="server" id="cmbDia" name="cmbDia" class='select2-me input-xlarge'
                                        data-rule-required="true">
                                    </select>
                                </div>
                            </div>
                            <%-- Observación --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label" style="color: Red">
                                    Observación</label>
                                <div class="controls">
                                    <input runat="server" name="txtObservacion" id="txtObservacion" type="text" class="input-xlarge"
                                        data-rule-required="true" style="text-transform: uppercase" maxlength="500" multiple="multiple">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="btnSaveDetalle" runat="server" onserverclick="_SaveSMX00401"
                class="btn btn-green">
                <i class="icon-save"></i>&nbsp Guardar</button>
            <button type="button" id="btnCancelModal" runat="server" onserverclick="_CloseModalCitas"
                class="btn">
                <i class="icon-undo"></i>&nbsp Cerrar</button>
        </div>
    </asp:Panel>
</asp:Content>
