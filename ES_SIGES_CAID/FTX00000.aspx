<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX00000.aspx.cs" Inherits="CAID.FTX00000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xPACIENTEGUID" runat="server" />
    <asp:HiddenField ID="xVISITAGUID" runat="server" />
    <asp:HiddenField ID="xREFGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box  box-bordered green">
            <div class="box-title">
                <h3>
                    <i class="icon-table"></i>Pacientes Registrados
                </h3>
                <div class="actions">
                    <button type="button" id="btnRefresh" runat="server" onserverclick="_Refresh" class="btn content-refresh"
                        validationgroup="pnlData">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </div>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Fecha Inicio -->
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Fecha</label>
                        <div class="controls">
                            <input runat="server" name="txtFecha1" id="txtFecha1" class="input-medium datepick"
                                data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th># Factura
                                        </th>
                                        <th>Paciente
                                        </th>
                                        <th>Record
                                        </th>
                                        <th>Categoría
                                        </th>
                                        <th>Fecha
                                        </th>
                                        <th style="width: 1%;">Acciones
                                        </th>
                                        <th style="width: 1%;">Nota Programación Cita
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th>
                                                    <asp:LinkButton ID="btnViewInvo" runat="server" Text='<%# Eval("FTNUMERO")%>' CommandArgument='<%# Eval("FTGUID")%>'
                                                        CommandName="Invoice" OnClick="_Select"></asp:LinkButton>
                                                </th>
                                                <td>
                                                    <%# Eval("PACIENTEDET")%>
                                                </td>
                                                <td>
                                                    <%# Eval("RECORDID")%>
                                                </td>
                                                <td>
                                                    <%# Eval("CATEGORIAPAC")%>
                                                </td>
                                                <td>
                                                    <%# Eval("FECHA")%>
                                                </td>
                                                   <td>
                                                    <asp:LinkButton ID="btnFacturacion" CssClass="btn btn-blue" runat="server" Text='<%# Eval("xAcciones")%>'
                                                        ToolTip='<%# Eval("VISITAGUID")%>' CommandArgument='<%# Eval("PACIENTEGUID")%>'
                                                        CommandName="Edit" OnClick="_Select"></asp:LinkButton>

                                                    <asp:LinkButton ID="btnEntregaInforme" CssClass="btn btn-blue" runat="server" Text="Entrega de Inf."
                                                        ToolTip='<%# Eval("VISITAGUID")%>' CommandArgument='<%# Eval("PACIENTEGUID")%>'
                                                        CommandName="EntInforme" OnClick="_Select" Visible="false"></asp:LinkButton>
                                                </td>
                                                 <td>
                                                  <%# Eval("ComentarioDeptoCita")%>  
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

                    <button type="button" id="Button3" runat="server" onserverclick="_CitasPac" class="btn btn-primary">
                        <i class="icon-calendar"></i>&nbsp Citas del Paciente</button>

                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="span6">
                    <div class="box box-bordered">
                        <div class="box-title">
                            <h3>Facturación</h3>
                        </div>
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Número --%>
                                <div class="control-group">
                                    <label for="txtNumero" class="control-label" style="color: Red">
                                        Número</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNumero" id="txtNumero" type="text" class="input-block-level"
                                            data-rule-required="true" disabled="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNumero" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%--Caja--%>
                                <div class="control-group">
                                    <label for="cmbCaja" class="control-label" style="color: Red">
                                        Control de Caja</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCaja" name="cmbCaja" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbCaja" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="cmbCaja1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Plan de Servicios --%>
                                <div class="control-group">
                                    <label for="cmbPlanARS" class="control-label" style="color: Red">
                                        Plan de Servicios</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbPlanARS" runat="server" CssClass="select2-me input-block-level"
                                            AutoPostBack="True" OnSelectedIndexChanged="cmbPlanARS_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPlanARS" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPlanARS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Detalles --%>
                                <div class="control-group">
                                    <label for="txtDetalles" class="control-label" style="color: Red">
                                        Tarifario</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbDetalles" name="cmbDetalles" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbDetalles" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDetalles" runat="server" SetFocusOnError="True" ValidationGroup="pnlDetalles" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="txtDetalles" class="control-label" style="color: Red">
                                        Acciones
                                    </label>
                                    <div class="controls">
                                        <button type="button" id="btnSaveDetalles" runat="server" onserverclick="_SaveDetalles"
                                            class="btn btn-green" validationgroup="pnlDetalles">
                                            <i class="icon-arrow-down"></i>&nbsp Facturar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="box box-bordered">
                        <div class="box-title">
                            <h3>Resumen</h3>
                            <div class="actions">
                                <button type="button" id="btnNCF" runat="server" onserverclick="_NCF" class="btn btn-primary">
                                    NCF y Autorización</button>
                                <button type="button" id="btnCobrar" runat="server" onserverclick="_Cobrar" class="btn btn-primary"
                                    disabled="true">
                                    <i class="icon-money"></i>&nbsp Registrar Pago</button>
                            </div>
                        </div>
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable-scroll-x">
                                <thead>
                                    <tr>
                                        <th>No.
                                        </th>
                                        <th>Detalles
                                        </th>
                                        <th>Total Seguro
                                        </th>
                                        <th>Total Paciente
                                        </th>
                                        <th>TOTAL
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpSumario" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th>
                                                    <%# Eval("ORDEN")%>
                                                </th>
                                                <td>
                                                    <%# Eval("F_DETALLE")%>
                                                </td>
                                                <td>
                                                    <%# Convert.ToDecimal(Eval("FV_SEGURO")).ToString("#,#.00#;(#,#.00#)")%>
                                                </td>
                                                <td>
                                                    <%# Convert.ToDecimal(Eval("FV_PACIENTE")).ToString("#,#.00#;(#,#.00#)")%>
                                                </td>
                                                <td>
                                                    <%# Convert.ToDecimal(Eval("FV_NETO2")).ToString("#,#.00#;(#,#.00#)")%>
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
        <div class="row-fluid">
        </div>
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>Detalles de la Factura</h3>
                </div>
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable-scroll-x">
                        <thead>
                            <tr>
                                <th>Cantidad
                                </th>
                                <th>Detalles
                                </th>
                                <th>Seguro
                                </th>
                                <th>Copago
                                </th>
                                <th>Importe
                                </th>
                                <th>Acciones
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpDetalles" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# Eval("TARIFACANT")%>
                                        </td>
                                        <td>
                                            <%# Eval("TARIFANOMBRE")%>
                                        </td>
                                        <td>
                                            <%# Convert.ToDecimal(Eval("TARIFASEGURO")).ToString("#,#.00#;(#,#.00#)")%>
                                        </td>
                                        <td>
                                            <%# Convert.ToDecimal(Eval("TARIFACOPAGO")).ToString("#,#.00#;(#,#.00#)")%>
                                        </td>
                                        <td>
                                            <%# Convert.ToDecimal(Eval("TARIFAIMPORTE")).ToString("#,#.00#;(#,#.00#)")%>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnAdd" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDet" OnClick="_Select"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Modal Registro de Pagos--%>
    <asp:Panel CssClass="modal" ID="pnlRegistroPago" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Registro de Pagos
                    </h3>
                    <div class="actions">
                        <button id="Button1" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="txtmontorestante" class="control-label" style="color: Red">
                            Monto Restante :</label>
                        <div class="controls">
                            <div class="input-append input-prepend">
                                <span class="add-on">$</span>
                                <input type="text" placeholder="0.00" disabled="true" class='input-small' runat="server"
                                    id="txtmontorestante" name="txtmontorestante">
                            </div>
                        </div>
                    </div>
                    <%-- Tipo de Formas de Pago --%>
                    <div class="control-group">
                        <label for="cmbFPAGOID" class="control-label" style="color: Red">
                            Forma de Pago</label>
                        <div class="controls">
                            <select runat="server" id="cmbFPAGOID" name="cmbFPAGOID" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="cmbFPAGOID" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="valcmbFPAGOID" runat="server" SetFocusOnError="True" ValidationGroup="pnlRegistroPago" />
                        </div>
                    </div>
                    <%-- Detalles de Notas Contables--%>
                    <div class="control-group">
                        <label for="txtFPAGODETALLES" class="control-label" style="color: Red">
                            Detalles</label>
                        <div class="controls">
                            <input runat="server" name="txtFPAGODETALLES" id="txtFPAGODETALLES" type="text" class="input-block-level"
                                data-rule-required="true" style="text-transform: uppercase" maxlength="500" multiple="multiple">
                        </div>
                    </div>
                    <%-- Aplicado al Paciente--%>
                    <div class="control-group">
                        <label for="txtFPAGOPACIENTE" class="control-label">
                            Monto</label>
                        <div class="controls">
                            <div class="input-append input-prepend">
                                <span class="add-on">$</span>
                                <input type="text" placeholder="0.00" class='input-small' runat="server" id="txtFPAGOPACIENTE"
                                    name="txtFPAGOPACIENTE">
                            </div>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="txtFPAGOPACIENTE" Display="Dynamic"
                                ErrorMessage="Requerido!" ID="valtxtFPAGOPACIENTE" runat="server" SetFocusOnError="True"
                                ValidationGroup="pnlRegistroPago" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnSavePago" runat="server" onserverclick="_SavePago" class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="btnClosePago" runat="server" onserverclick="_CloseModal" class="btn">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--   NCF--%>
    <asp:Panel CssClass="modal" ID="pnlRegistroNCF" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Comprobante Fiscal y Autorización
                    </h3>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="cmbTipoNCF" class="control-label" style="color: Red">
                            Tipo de NCF</label>
                        <div class="controls">
                            <select runat="server" id="cmbTipoNCF" name="cmbTipoNCF" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- NINGUNO --</option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtRNC" class="control-label" style="color: Red">
                            RNC / Cédula</label>
                        <div class="controls">
                            <input runat="server" name="txtRNC" id="txtRNC" type="text" class="input-block-level"
                                data-rule-required="true">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtAutorizacion" class="control-label" style="color: Red">
                            No. Autorización</label>
                        <div class="controls">
                            <input runat="server" name="txtAutorizacion" id="txtAutorizacion" type="text" class="input-block-level"
                                data-rule-required="true">
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtPoliza" class="control-label" style="color: Red">
                            No. Póliza</label>
                        <div class="controls">
                            <input runat="server" name="txtPoliza" id="txtPoliza" type="text" class="input-block-level"
                                data-rule-required="true">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveNCF" runat="server" class="btn btn-primary" onserverclick="_CloseModal"
                        data-dismiss="modal">
                        <i class="icon-ok"></i>&nbsp Aceptar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Modal Citas del Paciente--%>
    <asp:Panel CssClass="modal" ID="pnlCitasPac" runat="server" Visible="false">

        <div class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button id="Button2" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                    class="close" data-dismiss="modal" type="button">
                    x</button>

                <h3 id="myModalLabel">Citas del Paciente</h3>
            </div>
            <div class="modal-body">
                <div class="box-content nopadding">
                    <table class="table table-bordered dataTable-scroll-x">
                        <thead>
                            <tr>
                                <th>Servicio
                                </th>
                                <th>Horario
                                </th>
                                <th>Tardanza
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpCitasPac" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <th>
                                            <%# Eval("NOMBRE")%>
                                        </th>
                                        <td>
                                            <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt")%>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                        </td>
                                        <td>
                                            <%# Eval("TIEMPOTARDANZA")%>
                                        </td>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
