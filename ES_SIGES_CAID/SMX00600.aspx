<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00600.aspx.cs" Inherits="CAID.SMX00600" %>

<%--Consulta General --%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="PacienteID" runat="server" Value="0" />
    <asp:HiddenField ID="MedicoID" runat="server" Value="0" />
    <asp:HiddenField ID="TerapistaID" runat="server" Value="0" />
    <asp:HiddenField ID="EnfermeraID" runat="server" Value="0" />
    <asp:HiddenField ID="OrigenID" runat="server" Value="0" />
    <asp:HiddenField ID="txtEnfID" runat="server" Value="0" />
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActividadGUID" runat="server" />
    <%--  Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Programación de Actividades - Intervención Grupal
                        </h3>
                        <div class="actions">
                            <button id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>No.
                                    </th>
                                    <th>Descripción
                                    </th>
                                    <th class="hidden-480">Fecha
                                    </th>
                                    <th class="hidden-480">Horario
                                    </th>
                                    <th style="width: 1%;">Estatus
                                    </th>
                                    <th style="width: 1%;">Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <th>
                                                <%# Eval("ROWIDX")%>
                                            </th>
                                            <td>


                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("DESCRIPCION")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>

                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                            </td>
                                            <td>
                                                <%# Eval("CITAICONO")%>
                                                &nbsp<%# Eval("CITAESTADO")%>                                                
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnCancelar" CssClass="btn btn-red" runat="server" Text="Cancelar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea cancelar este registro?');"></asp:LinkButton>
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
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Registro de Actividades</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-undo"></i>&nbsp Limpiar</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Paciente --%>
                            <%-- <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Record No.</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                </div>--%>

                            <%--<div class="control-group">
                                <label for="cmbPaciente" class="control-label" style="color: Red">
                                    Paciente</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>--%>

                            <%-- Descripción --%>
                            <div class="control-group">
                                <label for="txtDescripcion" class="control-label" style="color: Red">
                                    Descripción</label>
                                <div class="controls">
                                    <input runat="server" name="txtDescripcion" id="txtDescripcion" type="text" class="input-block-level"
                                        data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtDescripcion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>

                            <!-- Fecha Inicio -->
                            <div class="control-group">
                                <label for="txtFechaIni" class="control-label" style="color: Red">
                                    Fecha</label>
                                <div class="controls">
                                    <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                        data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">

                                    <button id="btnFindHorario" runat="server" onserverclick="_FindHoras" class="btn btn-green">
                                        <i class="icon-search"></i>
                                    </button>
                                    <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--Hora--%>
                            <div class="control-group">
                                <label for="cmbHorario" class="control-label" style="color: Red">
                                    Horario</label>
                                <div class="controls">
                                    <select runat="server" id="cmbHorario" name="cmbHorario" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbHorario" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbHorario1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Observación --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label" style="color: Red">
                                    Detalles</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <%-- Participantes --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label" style="color: Red">
                                    Participantes</label>
                                <div class="controls">
                                    <div class="row-fluid">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                    <br />
                                    <div class="row-fluid">
                                        <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-xxlarge"
                                            data-rule-required="true" AutoPostBack="false">
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                    <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="50px"
                                        class="input-block-level"></asp:TextBox>
                                    <br />
                                    <br />
                                    <button type="button" id="btnAdd" runat="server" onserverclick="_SaveDetalles" class="btn btn-green"
                                        validationgroup="pnlSearch">
                                        <i class="icon-arrow-down"></i>&nbsp Agregar Participante</button>
                                    <div class="box  box-bordered">
                                        <div class="box-title">
                                            <h3></h3>
                                        </div>
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable-scroll-x">
                                                <tbody>
                                                    <asp:Repeater ID="rpDetalles" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%# Eval("PAC")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("PARTICIPANTES")%>
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="btnDeleteDet" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                                        CommandArgument='<%# Eval("ROWGUID")%>' CommandName="DeleteDet" OnClick="_DeleteDetalles"
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
