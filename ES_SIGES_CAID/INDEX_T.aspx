<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="INDEX_T.aspx.cs" Inherits="CAID.INDEX_T" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <meta http-equiv="refresh" content="60;url=/INDEX_T.ASPX" />
    <%--    DashBoard: Terapeutas--%>
    <asp:HiddenField ID="data_calendar" runat="server" ClientIDMode="Static" />
    <div class="row-fluid">
        <div class="span12">
            <asp:Panel ID="Panel1" runat="server">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-calendar"></i>Agenda</h3>
                        <div class="actions">

                            <a href="#" class="btn content-slideUp"><i class="icon-angle-down"></i></a>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <ul class="tabs tabs-inline tabs-top">
                            <li class='active'><a href="#defaultTurnos1" data-toggle='tab'>Turnos del día</a>
                            </li>
                            <li><a href="#defaultTurnos2" data-toggle='tab'>Calendario</a></li>
                            <li><a href="#defaultTurnos3" data-toggle='tab'>Actualización de paciente</a></li>
                        </ul>
                        <div class="tab-content nopadding tab-content-inline tab-content-bottom">
                            <div class="tab-pane active" id="defaultTurnos1">
                                <table class="table table-bordered dataTable dataTable-scroll-x">
                                    <thead>
                                        <tr>
                                            <th>No.
                                            </th>
                                            <th class="hidden-1024"># Record
                                            </th>
                                            <th>Nombre de Paciente
                                            </th>
                                            <th>Especialista
                                            </th>
                                            <th>Horario
                                            </th>
                                            <th>Dia
                                            </th>
                                            <th>Facturado
                                            </th>
                                            <th>Dispensa
                                            </th>
                                            <th>Acciones
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="_DataBinderTurnos" OnItemDataBound="rp_ItemDataBound" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <th>
                                                        <%# Eval("NUMERO")%>
                                                    </th>
                                                    <td class="hidden-1024">
                                                        <%# Eval("RECORDID")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("FULLNAME")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("TERAPISTANOMBRE")%><br />
                                                        <%# Eval("ESPECIALIDAD")%>
                                                    </td>
                                                    <td>
                                                        <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("FECHACITA")%><br />
                                                    </td>
                                                    <td>
                                                        <center> <%# Eval("FACTURADO")%> </center>
                                                    </td>
                                                     <td style="color:red;">
                                                        <center> <%# Eval("DISPENSA")%> </center>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnConsulta" CssClass="btn btn-blue" runat="server" Text='<%# Eval("CITAACCION")%>'
                                                            CommandArgument='<%# Eval("ROWGUID")%>' ToolTip='<%# Eval("REFGUID")%>' CommandName="Confirmar"
                                                            OnClick="_Select"></asp:LinkButton>

                                                        <asp:LinkButton ID="btnPosponer" Enabled="true" rel="tooltip" title="Posponer" CssClass="btn btn-warning" runat="server"
                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Posponer" OnClick="_Posponer">
                                                        <i class="icon-time"></i>
                                                        </asp:LinkButton>

                                                        <asp:LinkButton ID="btnAusencia" Enabled="true" rel="tooltip" title="Ausencia" CssClass="btn btn-danger" runat="server"
                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Ausencia" OnClick="_Ausencia" Visible="false">
                                                        <i class="icon-remove-sign"></i>
                                                        </asp:LinkButton>

                                                         <asp:LinkButton ID="LinkButton1" Enabled="true" rel="tooltip" title="Ausencia" CssClass="btn btn-danger" runat="server"
                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Ausencia" OnClick="_Ausencia">
                                                        <i class="icon-remove-sign"></i>
                                                        </asp:LinkButton>


                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tab-pane" id="defaultTurnos2">
                                <div class="box-content">
                                    <table class="table table-bordered dataTable-scroll-x dataTable-tools">
                                        <thead>
                                            <tr>
                                                <th>Horario
                                                </th>
                                                <th>Lunes
                                                </th>
                                                <th>Martes
                                                </th>
                                                <th>Miércoles
                                                </th>
                                                <th>Jueves
                                                </th>
                                                <th>Viernes
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="rpData" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%# Convert.ToDateTime( Eval("HORAINI")).ToString("hh:mm tt") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("LUNES")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("MARTES")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("MIERCOLES")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("JUEVES")%>
                                                        </td>
                                                        <td>
                                                            <%# Eval("VIERNES")%>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="defaultTurnos3">
                                <%-- <div class="box-content nopadding">--%>
                                <div class='form-horizontal form-bordered'>
                                    <%-- Paciente --%>
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
                                        <label for="txtFecha1" class="control-label" style="color: Red">
                                            Paciente</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-xxlarge"
                                                data-rule-required="true" AutoPostBack="false">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                                ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="Panel1" />
                                            &nbsp

                                                 <asp:LinkButton ID="btnAcerptarAtencion" CssClass="btn btn-green" runat="server" Text="Aceptar"
                                                     OnClick="_Save2"
                                                     OnClientClick="return confirm('¿Está seguro que desea crear una Actualización de paciente?');"> <i class="icon-ok"></i> &nbsp Aceptar</asp:LinkButton>

                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable-scroll-x">
                                                <thead>
                                                    <tr>
                                                        <th>Paciente
                                                        </th>
                                                        <th>Acciones
                                                        </th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rpAtencionActualizacion" runat="server">
                                                        <ItemTemplate>
                                                            <tr>

                                                                <td>
                                                                    <%# Eval("PAC")%>
                                                                </td>

                                                                <td>
                                                                    <asp:LinkButton ID="btnConsulta" CssClass="btn btn-blue" runat="server" Text='En proceso'
                                                                        CommandArgument='<%# Eval("ROWGUID")%>' ToolTip='<%# Eval("REFGUID")%>' CommandName="Actualizar"
                                                                        OnClick="_Select"></asp:LinkButton>
                                                                </td>


                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="MSGALERT" runat="server" Visible="false">
                <div class="wrapper orange">
                    <div class="box box-bordered orange">
                        <div class="box-title">
                            <h3>
                                <i class="icon-bell"></i>Notificación
                            </h3>
                        </div>
                        <div class="box-content">
                            <br />
                            <p>
                                <asp:Label ID="lblMSG" runat="server" Text="NO SE HAN REGISTRADO PACIENTES PARA SU ATENCION DEL DIA DE HOY"></asp:Label>
                            </p>
                            <br />
                            <br />
                            <p>
                            </p>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <%--Modal Posponer Cita--%>
    <asp:Panel CssClass="modal" ID="pnlPosponer" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Posponer atención como pendiente
                    </h3>
                    <div class="actions">
                        <button id="Button1" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">


                    <%-- Motivo--%>
                    <div class="control-group">
                        <label for="txtPosponerMotivo" class="control-label" style="color: Red">
                            Motivo</label>
                        <div class="controls">
                            <asp:TextBox ID="txtPosponerMotivo" runat="server" TextMode="MultiLine" Height="50px"
                                Wrap="true" placeholder="Motivo" CssClass="input-block-level"></asp:TextBox>

                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button id="btnSavePosponer" runat="server" onserverclick="_SavePosponer" class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="btnClosePosponer" runat="server" onserverclick="_CloseModal" class="btn">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Modal Posponer Ausencia--%>
    <asp:Panel CssClass="modal" ID="pnlAusencia" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Registro de Ausencia
                    </h3>
                    <div class="actions">
                        <button id="btnCloseAusencia" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">


                    <%-- Motivo--%>
                    <div class="control-group">
                        <label for="txtPosponerMotivo" class="control-label" style="color: Red">
                            Motivo</label>
                        <div class="controls">
                            <asp:TextBox ID="txtMotivoAusencia" runat="server" TextMode="MultiLine" Height="50px"
                                Wrap="true" placeholder="Motivo" CssClass="input-block-level"></asp:TextBox>

                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button id="btnSaveAusencia" runat="server" onserverclick="_SaveAusencia" class="btn btn-green">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button id="Button4" runat="server" onserverclick="_CloseModal" class="btn">
                        Cerrar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
