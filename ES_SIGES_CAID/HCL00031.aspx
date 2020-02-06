<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00031.aspx.cs" Inherits="CAID.HCL00031" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                        <i class="icon-edit"></i>Evaluación de Conducta Funcional
                    </h3>
                    <div class="actions">
                        <button type="button" id="tbnAdd" runat="server" onserverclick="_Add" validationgroup="pnlEdit"
                            class="btn" data-dismiss="modal">
                            <i class="icon-plus-sign"></i>&nbsp Añadir Evaluación</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- ID  --%>
                                <div class="control-group">
                                    <label for="cmbFuentes" class="control-label">
                                        Fuentes de Datos</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbFuentes" name="cmbFuentes" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="OBSERVACION">OBSERVACION</option>
                                            <option value="ENTREVISTA PADRES">ENTREVISTA PADRES</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbFuentes" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbFuentes" runat="server" SetFocusOnError="True" ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- descripcion conducta -->
                                <div class="control-group">
                                    <label for="txtDesConducta" class="control-label">
                                        Descripcion Conducta</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDesConducta" id="txtDesConducta" type="text" class="input-block-level"
                                            placeholder="Descripcion de la Conducta  " data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtDesConducta" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="ValtxtDesConducta" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- entorno -->
                                <div class="control-group">
                                    <label for="txtEntorno" class="control-label">
                                        Entorno</label>
                                    <div class="controls">
                                        <input runat="server" name="txtEntorno" id="txtEntorno" type="text" class="input-block-level"
                                            placeholder="Entorno en que ocurre la conducta" data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtEntorno" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="ValtxtEntorno" runat="server" SetFocusOnError="True" ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- frecuencia -->
                                <div class="control-group">
                                    <label for="txtFrecuencia" class="control-label">
                                        Frecuencia</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFrecuencia" id="txtFrecuencia" type="text" class="input-block-level"
                                            placeholder="Frecuencia" data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtFrecuencia" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFrecuencia" runat="server" SetFocusOnError="True" ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- Intensidad -->
                                <div class="control-group">
                                    <label for="txtIntensidad" class="control-label">
                                        Intensidad</label>
                                    <div class="controls">
                                        <input runat="server" name="txtIntensidad" id="txtIntensidad" type="text" class="input-block-level"
                                            placeholder="Intensidad" data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtIntensidad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtIntensidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- Duracion-->
                                <div class="control-group">
                                    <label for="txtDuracion" class="control-label">
                                        Duración</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDuracion" id="txtDuracion" type="text" class="input-block-level"
                                            placeholder="Duración" data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtDuracion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDuracion" runat="server" SetFocusOnError="True" ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!-- Intervenciones Previas -->
                                <div class="control-group">
                                    <label for="txtAntecedentes" class="control-label">
                                        Antecedentes</label>
                                    <div class="controls">
                                        <input runat="server" name="txtAntecedentes" id="txtAntecedentes" type="text" class="input-block-level"
                                            placeholder="Intervenciones Previas" data-rule-required="true">
                                        <asp:RequiredFieldValidator ControlToValidate="txtAntecedentes" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtAntecedentes" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlEdit" />
                                    </div>
                                </div>
                                <!--PARTE 2 -->
                                <div>
                                    <%--<div class="embed-responsive embed-responsive-16by9">--%>
                                    <iframe id="frmEvaluacionConductualFuncionalParte2" class="embed-responsive-item"
                                        src="http://caidsiges01:8082/forms/EvaluacionConductualFuncionalParte2.aspx" style="width: 100%; height: 900px;"
                                        frameborder="0"></iframe>
                                    <script type="text/javascript">
                                        function getParameterByName(name, url) {
                                            // alert(Site.Master.Session["CurrentUSR_TERID"].ToString());
                                            if (!url) url = window.location.href;
                                            name = name.replace(/[\[\]]/g, "\\$&");
                                            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
                                            if (!results) return null;
                                            if (!results[2]) return '';
                                            return decodeURIComponent(results[2].replace(/\+/g, " "));
                                        }
                                    </script>
                                    <script type="text/javascript">
                                        var x = getParameterByName('X');
                                        // var XEspecialidad = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                        //var XObjetivo = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                        var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                        var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                        var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                        //document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                        document.getElementById("frmEvaluacionConductualFuncionalParte2").setAttribute("src", "http://caidsiges01:8082/forms/EvaluacionConductualFuncionalParte2.aspx?rowguidpaciente=" + x  + "&XTerapistaID=" + XTerapistaID +  "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                    </script>
                                    <%--</div>--%>
                                </div>

                                <div class="control-group" style="visibility:hidden">
                                    <div class="box-content nopadding">
                                        <table class="table table-bordered dataTable dataTable-tools">
                                            <thead>
                                                <tr>
                                                    <th>Fecha
                                                    </th>
                                                    <th>Descripción
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpHistorico" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td>
                                                                <%# Eval("FECHA")%>
                                                            </td>
                                                            <td>
                                                                <strong>
                                                                    <%# Eval("ESCALA")%>
                                                                </strong>
                                                                <br />
                                                                <%# Eval("DATOS")%>
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
    <%--Modal: Mantenimiento--%>
    <asp:Panel CssClass="modal" ID="MNTAUXILIAR" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>Evaluaciones
                    </h3>
                    <div class="actions">
                        <button id="btnCloseMSG" runat="server" onserverclick="_CloseModal" aria-hidden="true"
                            class="close" data-dismiss="modal" type="button">
                            x</button>
                    </div>
                </div>
                <div class="modal-body nopadding">
                    <%-- Tipo de Evaluación --%>
                    <div class="control-group">
                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                            Especialidad</label>
                        <div class="controls">
                            <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <%-- Objetivo --%>
                    <%--<div class="control-group">
                        <label for="cmbObjetivo" class="control-label" style="color: Red">
                            Objetivo</label>
                        <div class="controls">
                            <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <br />
                            <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                ID="cmbObjetivo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>--%>
                    <%-- Diagnostico --%>
                    <div class="control-group">
                        <label for="cmbDetalles" class="control-label">
                            Función</label>
                        <div class="controls">
                            <select runat="server" id="cmbDetalles" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="cmbDetalles" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="cmbDiagnostico1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtEVALUACION" class="control-label">
                            Comentarios</label>
                        <div class="controls">
                            <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="50px"
                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSaveNotas" runat="server" onserverclick="_Save" validationgroup="pnlData"
                        class="btn btn-primary" data-dismiss="modal">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Sombra--%>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
