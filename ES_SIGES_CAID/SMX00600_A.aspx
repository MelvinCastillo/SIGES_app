<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00600_A.aspx.cs" Inherits="CAID.SMX00600_A" %>

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
                            <i class="icon-table"></i>Agenda de Actividades - Intervención Grupal
                        </h3>
                        <div class="actions">
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table id="AgendaActividades" class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        No.
                                    </th>
                                    <th class="hidden-480">
                                        Fecha
                                    </th>
                                    <th>
                                        Descripción
                                    </th>
                                    <th class="hidden-480">
                                        Horario
                                    </th>
                                    <th style="width: 1%;">
                                        Estatus
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
                                            <th>
                                                <%# Eval("NUMERO")%>
                                            </th>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("FECHAINI")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("DESCRIPCION")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                            </td>
                                            <td>
                                                <%# Eval("CITAICONO")%>
                                                &nbsp<%# Eval("CITAESTADO")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnCancelar" CssClass="btn btn-blue" runat="server" Text="Asistencia"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Edit" OnClick="_Select"></asp:LinkButton>
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
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Registro de Asistencia</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnAddParticipante" runat="server" onserverclick="_AddParticipante"
                            class="btn">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Participante</button>
                        <%--                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-undo"></i>&nbsp Limpiar</button>--%>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Descripción --%>
                            <div class="control-group">
                                <label for="txtDescripcion" class="control-label">
                                    Descripción</label>
                                <div class="controls">
                                    <input runat="server" name="txtDescripcion" id="txtDescripcion" type="text" class="input-block-level"
                                        data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtDescripcion" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="valtxtDescripcion" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Comentarios --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label">
                                    Comentarios</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtComentarios" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <%-- Participantes --%>
                            <div class="control-group">
                                <div class="box-content nopadding">
                                    <table class="table table-bordered dataTable-scroll-x">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Paciente
                                                </th>
                                                <th>
                                                    Participantes
                                                </th>
                                                <th>
                                                    Observación
                                                </th>
                                                <th>
                                                    Asistencia
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpDetalles" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="txtDetPac" runat="server" Text='<%# Eval("PAC")%>' ToolTip='<%# Eval("ROWGUID")%>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <%# Eval("PARTICIPANTES")%>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtObservacion" runat="server" Text='<%# Eval("OBSERVACION")%>'
                                                                TextMode="MultiLine" Height="50px" class="input-block-level"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="cmbAsistencia" CssClass="input-medium" ValidationGroup='<%# Eval("ASISTENCIA")%>'
                                                                runat="server">
                                                                <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                <asp:ListItem Value="S">Si</asp:ListItem>
                                                                <asp:ListItem Value="N">No</asp:ListItem>
                                                            </asp:DropDownList>
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
    </asp:Panel>
    <%--Add Participante--%>
    <asp:Panel CssClass="modal" ID="pnlAddParticipante" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>
                        Añadir Participante
                    </h3>
                    <div class="actions">
                        <button id="Button1" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="txtNombre" class="control-label">
                            Record No.</label>
                        <div class="controls">
                            <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                            <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                validationgroup="pnlSearch">
                                <i class="icon-search"></i>
                            </button>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label">
                            Paciente</label>
                        <div class="controls">
                            <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                data-rule-required="false" AutoPostBack="false">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtParticipantes" class="control-label">
                            Participantes</label>
                        <div class="controls">
                            <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="50px"
                                class="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtParticipantes" class="control-label">
                            Observación</label>
                        <div class="controls">
                            <asp:TextBox ID="txtObservacionParticipante" runat="server" TextMode="MultiLine"
                                Height="100px" class="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnSaveParticipante" runat="server" onserverclick="_SaveParticipante"
                        class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="btnClosePago" runat="server" onserverclick="_CloseModal" class="btn">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
