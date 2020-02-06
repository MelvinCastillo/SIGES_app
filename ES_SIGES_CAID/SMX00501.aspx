<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX00501.aspx.cs" Inherits="CAID.SMX00501" %>

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
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid" id="pnlconsulta1">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Citas Recurrentes
                        </h3>

                        <div class="actions">
                            <button id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                        <script type="text/javascript"> 
                            var xCurrentUSR_ROLGUID = '<%=@Session["CurrentUSR_ROLGUID"].ToString()%>';
                            // alert(xCurrentUSR_ROLGUID); 
                            if (xCurrentUSR_ROLGUID != "907D9640-7DFA-4C26-94DC-360455D914F7" && xCurrentUSR_ROLGUID != "PWRUSR-CAID-SD")
                            { 
                                document.getElementById("ctl00_MainContent_btnNew").style.display = "none";
                            }
                          
                        </script>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools dataTable-grouping">

                            <thead>
                                <tr>
                                    <th class="hidden-1024">No. Expendiente</th>
                                    <th class="hidden-1024">Paciente</th>
                                    <th class="hidden-1024">Especialista</th>
                                    <th class="hidden-1024">Horario</th>
                                    <th class="hidden-1024">Semanas Faltantes</th>
                                    <th class="hidden-1024">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="hidden-1024"><%# Eval("RECORDID")%></td>
                                            <td class="hidden-1024"><%# Eval("FULLNAME")%></td>
                                            <td class="hidden-1024"><%# Eval("TERAPISTANOMBRE")%>
                                                <br />
                                                <%# Eval("ESPECIALIDAD")%>
                                            </td>
                                            <td class="hidden-1024">
                                                <%# Eval("DIA")%>
                                                <br />
                                                <%# Convert.ToDateTime(Eval("HORAINI")).ToString("hh:mm tt") %>&nbsp-&nbsp<%# Convert.ToDateTime(Eval("HORAFIN")).ToString("hh:mm tt")%>
                                            </td>
                                            <td class="hidden-1024">
                                                <%# Eval("SemanasFaltantes")%>
                                            </td>

                                            <td id="divacciones" class="hidden-1024">
                                                <asp:LinkButton ID="btnEdit" CssClass="btn btn-blue" runat="server" Text="Editar"
                                                    CommandArgument='<%# Eval("TIPOGUID")%>' CommandName="Edit" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea editar esta cita?');"></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Cancelar"
                                                    CommandArgument='<%# Eval("TIPOGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea cancelar este registro?');"></asp:LinkButton>--%>
                                                <button type="button" data-toggle="modal" class="btn btn-red" id="btncancelar" onclick="window.open('http://caidsiges01:8082/forms/actualizadb.aspx?PROCESO=CANCELAR&Paciente=<%# Eval("GUIDPAC")%>&terapistaid=<%# Eval("TERID")%>&sucursal=<%=@Session["CURRENTUSR_SGXID"].ToString()%>' ,'_blank', 'toolbar=no,scrollbars=no,resizable=yes,top=100,left=300,width=420,height=390');">Cancelar</button>
                                                <button type="button" data-toggle="modal" class="btn btn-green" id="btndealta" onclick="window.open('http://caidsiges01:8082/forms/actualizadb.aspx?PROCESO=DEALTA&Paciente=<%# Eval("GUIDPAC")%>&terapistaid=<%# Eval("TERID")%>&sucursal=<%=@Session["CURRENTUSR_SGXID"].ToString()%>' ,'_blank', 'toolbar=no,scrollbars=no,resizable=yes,top=100,left=300,width=420,height=390');">DE ALTA</button>
                                                <%--<button type="button" data-toggle="modal" class="btn btn-blue" id="btndealta" value="<%# Eval("ESPECIALIDAD").ToString()%>" onclick="ActualizaInformacion()">DE ALTA</button>--%>
                                            </td>

                                        </tr>
                                        <script type="text/javascript">  
                                            var xCurrentUSR_ROLGUID = '<%=@Session["CurrentUSR_ROLGUID"].ToString()%>'; 
                                            if (xCurrentUSR_ROLGUID != "907D9640-7DFA-4C26-94DC-360455D914F7" && xCurrentUSR_ROLGUID != "PWRUSR-CAID-SD") {
                                                $('td:nth-child(6),th:nth-child(6)').hide();
                                            }
                                        </script>
                                    </ItemTemplate>

                                </asp:Repeater>

                            </tbody>

                        </table>
                    </div>
                    <%--   <div class="modal fade" id="ModalActualizaAlta" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <%--<div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>--%>
                    <%--<div class="modal-body">
                        <%--  <p>Some text in the modal.</p> --%>
                    <%-- <div class="embed-responsive embed-responsive-16by9">
                            <iframe id="frmactualizaDB" class="embed-responsive-item" src="http://caidsiges01:8082/forms/actualizadb.aspx" style="width: 100%; height: 100%;"
                                frameborder="0"></iframe>
                            <script type="text/javascript">
                                var x = getParameterByName('X');
                                var XEspecialidad = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                var XObjetivo = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                            var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                            var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                            //document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                            document.getElementById("frmactualizaDB").setAttribute("src", "http://caidsiges01:8082/forms/actualizadb.aspx")

                            </script>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        </div>--%>
                </div>
            </div>
        </div>

        <%--AQUI--%>
        <%--   <script type="text/javascript">
            //$("#btndealta").click(                
                function ActualizaInformacion() {
                    location.reload();
                    //var btn = $("#btndealta");
                    //alert(("#btndealta").in); 
                    //alert($(obj).parent().find(".btn btn-blue").first().val());
                    //alert(document.getElementById("btndealta").value);

                    //$('#ModalActualizaAlta').modal('show');
                    // var mymodal = $('#myModal');
                    // mymodal.find('.modal-body').text('hello');
                    // mymodal.modal('show'); 
               // }
            );//
        </script>--%>
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="row-fluid">
                <asp:Repeater ID="rpPaxHeader" runat="server">
                    <ItemTemplate>
                        <%# Eval("HTML")%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Programación de Citas Recurrentes</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnEditar" runat="server" onserverclick="_Editar" class="btn"
                            value="0" validationgroup="pnlData">
                            <i class="icon-edit"></i>&nbsp Actualizar</button>
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
                            <div class="control-group">
                                <label for="cmbPaciente" class="control-label" style="color: Red">
                                    Paciente</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <!-- Fecha Inicio -->
                            <div class="control-group">
                                <label for="txtFechaIni" class="control-label" style="color: Red">
                                    Fecha de Inicio</label>
                                <div class="controls">
                                    <input runat="server" name="txtFechaIni" id="txtFechaIni" class="input-medium datepick"
                                        data-date-autoclose="True" data-rule-required="true" placeholder="mm/dd/aaaa">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtFechaIni" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Repetir --%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label" style="color: Red">
                                    Cant. Semanas</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtCant" id="txtCant" value="1" class="spinner input-mini" min="1" max="20" readonly 
                                        placeholder="Cantidad Semanas">
                                </div>
                            </div>
                            <%-- cmb Origen Tratamiento --%>
                            <div class="control-group">
                                <label for="cmbOrigenTratamiento" class="control-label" style="color: Red">
                                    Servicio</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbOrigenTratamiento" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbOrigenTratamiento_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbOrigenTratamiento" Display="Dynamic"
                                        ErrorMessage="Requerido!" ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True"
                                        ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- cmbTerapista --%>
                            <div class="control-group">
                                <label for="cmbTerapista" class="control-label" style="color: Red">
                                    Especialista</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbTerapista" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbTerapista_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--Hora--%>
                            <div class="control-group">
                                <label for="cmbHorario" class="control-label" style="color: Red">
                                    Horario Definido</label>
                                <div class="controls">
                                    <select runat="server" id="cmbHorario" name="cmbHorario" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbHorario" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbHorario1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%--                        <div class="control-group">
                            <label for="cmbHorario" class="control-label" style="color: Red">
                                Condición</label>
                            <div class="controls">
                                <select runat="server" id="cmbCondicion" name="cmbCondicion" class='select2-me input-block-level'
                                    data-rule-required="true">
                                    <option value="0">PROGRAMADA</option>
                                    <option value="1">CONFIRMADA</option>
                                </select>
                            </div>
                        </div>--%>
                            <div class="control-group">
                                <label for="txtParticipantes" class="control-label" style="color: Red">
                                    Participantes</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtParticipantes" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <%-- Observación --%>
                            <div class="control-group">
                                <label for="txtObservacion" class="control-label" style="color: Red">
                                    Observación</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
