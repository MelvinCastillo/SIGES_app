<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00000.aspx.cs" Inherits="CAID.PAX00000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box  box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>ADMISIONES</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Fecha Inicio -->
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Buscar</label>
                        <div class="controls">
                            <input runat="server" name="txtBuscar" id="txtBuscar" type="text" class='input-block-level'
                                placeholder="Nombres, Apellidos, Número de Record" data-rule-required="true" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            &nbsp
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Nombres y Apellidos
                                        </th>
                                        <th>No. Record
                                        </th>
                                        <th class="hidden-480">Centro
                                        </th>
                                        <th class="hidden-480">Pre-Diagnóstico
                                        </th>
                                        <th style="width: 1%;">Acciones
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
                                                <td class="hidden-480">
                                                    <%# Eval("PREDIAGNOSTICO")%>
                                                </td>
                                                <td>
                                                    <%# Eval("MODALTEL")%>
                                                    &nbsp
                                                    <%# Eval("MODALDIR")%>
                                                    &nbsp
                                                    <%# Eval("MODALNUC")%>
                                                    &nbsp
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
        </div>
    </asp:Panel>
    <%--  Edición de Registros --%>
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
                            <i class="icon-edit"></i>Registro de Pacientes</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <!-- Nombres -->
                                <div class="control-group">
                                    <label for="txtNombre1" class="control-label" style="color: black">
                                        <strong>Nombre(s)</strong></label>
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
                                    <label for="txtApellido1" class="control-label" style="color: black">
                                        <strong>Apellido(s)</strong></label>
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
                                    <label for="cmbSexo" class="control-label" style="color: black">
                                        <strong>Sexo</strong></label>
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
                                    <label for="txtNSS" class="control-label" style="color: black">
                                        <strong>No. Seguridad Social</strong></label>
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
                                    <label for="txtFechaNace" class="control-label" style="color: black">
                                        <strong>Fecha de Nacimiento</strong></label>
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
                                    <label for="cmbPais" class="control-label" style="color: black">
                                        <strong>País de Nacimiento</strong></label>
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
                                    <label for="cmbCiudad" class="control-label" style="color: black">
                                        <strong>Ciudad de Nacimiento</strong></label>
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
                                    <label for="cmbCondicion" class="control-label" style="color: black">
                                        <strong>Condición</strong></label>
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
                                    <label for="cmbResideCon" class="control-label" style="color: black">
                                        <strong>Reside con</strong></label>
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
                                            placeholder="Nombre" data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbResideCon" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbResideCon" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Cuidado Por -->
                                <div class="control-group">
                                    <label for="cmbCuidadoPor" class="control-label" style="color: black">
                                        <strong>Cuidado por</strong></label>
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
                                    <label for="cmbARS" class="control-label" style="color: black">
                                        <strong>Aseguradora</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="cmbARS" name="cmbARS" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbARS" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbARS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Pre-Diagnóstico -->
                                <div class="control-group">
                                    <label for="cmbPREDIAGNOSTICO" class="control-label" style="color: black">
                                        <strong>Pre-Diagnóstico</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPREDIAGNOSTICO" name="cmbPREDIAGNOSTICO" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                        </select>
                                        <input runat="server" name="txtOtrosPrediagnostico" id="txtOtrosPrediagnostico" type="text"
                                            class="input-xlarge" placeholder="Otro ..." data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPREDIAGNOSTICO" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valcmbPREDIAGNOSTICO" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Categoria Paciente -->
                                <div class="control-group">
                                    <label for="cmbCategoria" class="control-label" style="color: black">
                                        <strong>Categoría</strong></label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCategoria" name="cmbCategoria" class='select2-me input-block-level'
                                            data-rule-required="true" disabled="disabled" >
                                        </select>
                                          <%-- <br />
                                       <asp:RequiredFieldValidator ControlToValidate="cmbCategoria" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCategoria" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                    </div>
                                </div>
                              <!-- Institucion Referido -->
                                <div class="control-group">
                                    <label for="ddInstitucionesRelacionadas" class="control-label" style="color: black">
                                        <strong>Institucion Referido</strong></label>
                                    <div class="controls"> 
                                  <iframe id="frmInstitucionesRelacionadas" class="embed-responsive-item" src="http://caidsiges01:8082/forms/AdmisionesInstitucionRelacionadaPX.aspx?rowguidpaciente=" 
                                                                               
                                      style="width: 100%;height:180px" frameborder="0"></iframe> 
                                    </div>
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
                                         <%--var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';--%>
                                         <%--var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';--%>
                                         var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                         //document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                         document.getElementById("frmInstitucionesRelacionadas").setAttribute("src", "http://caidsiges01:8082/forms/AdmisionesInstitucionRelacionadaPX.aspx?rowguidpaciente=" + x + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                    </script>
                                </div>
                                <!-- visualizar escolaridad -->
                                <%--<div  style="width:100%; height:600">
                                    <label for="lblescolaridad" class="control-label" style="color: black">
                                        <strong>Escolaridad</strong></label>
                                    <div class="embed-responsive embed-responsive-16by9">
                                        <iframe id="frmEscolaridad" class="embed-responsive-item" src="" style="width: 100%;
                                            height: 200%;" frameborder="0"></iframe>
                                        <script type="text/javascript"> 
                                            document.getElementById("frmEscolaridad").setAttribute("src", "http://:11551/forms/Escolaridad.aspx")
                                        
                                        </script>
                                    </div>
                                </div>--%>
                                <!-- Complementarios -->
                                <div class="control-group">
                                    <label for="cmbPais" class="control-label" style="color: black">
                                        <strong>Complementarios</strong></label>
                                    <div class="controls">
                                        <p>
                                            <button type="button" id="btnDirecciones" runat="server" onserverclick="_OpenModalDirecciones"
                                                class="btn btn-primary" validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Direcciones</button>
                                            <button type="button" id="btnNucleoFamiliar" runat="server" onserverclick="_OpenModalNF"
                                                class="btn btn-primary" validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Núcleo Familiar</button>
                                            <button type="button" id="Button1" runat="server" onclick="window.location.href='http://caidsiges01:8082/forms/Escolaridad.aspx?idpaciente='+getParameterByName('X')+'&localidad='+getLocalidad()+'&usuario='+getUserid()"
                                                class="btn btn-primary" validationgroup="pnlData">
                                                <i class="icon-plus-sign"></i>&nbsp Escolaridad</button>
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
                                                function getLocalidad() {

                                                    return '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                                }
                                            </script>
                                            <script type="text/javascript">
                                                function getUserid() {

                                                    return '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                                }
                                            </script>

                                            <%--<script type="text/javascript">
                                               $(document).ready(function () {
                                                    if ($("[type='text']").val() == null) {
                                                        $(this).css("border", "2px solid red");
                                                    }}
                                            </script>--%>
                                            <%--<script type="text/javascript">
                                                function BuscoBlanco() {
                                                    var input = document.getElementById("txtNSS").value;

                                                    var ever = function () {
                                                        if (input.trim() == '0000') {
                                                            return "Please input a number"
                                                        } else if (!(isNaN(input))) {
                                                            var result = 1;
                                                            for (var i = 1; i <= input; i++) {
                                                                result = result * i
                                                            }
                                                            return result;
                                                        }

                                                    }

                                                    document.getElementById("txtNSS").value = ever();
                                                    alert(document.getElementById("txtNSS").value);
                                                }
                                            </script>--%>
                                            <script type="text/javascript">
                                                // var x = getParameterByName('X'); 
                                                //   var XEspecialidad = document.getElementById("ctl00_MainContent_cmbTipo").value;
                                                //   var XObjetivo = document.getElementById("ctl00_MainContent_cmbObjetivo").value;
                                                //  var XTerapistaID = '<%=@Session["CurrentUSR_TERID"].ToString()%>';
                                                //var XCurrentUSR_ROWGUID = '<%=@Session["CurrentUSR_ROWGUID"].ToString()%>';
                                                //   var XCURRENTUSR_SGXID = '<%=@Session["CURRENTUSR_SGXID"].ToString()%>';
                                                //  document.getElementById("frmEquiposmecanicos").setAttribute("src", "http://caidsiges01:8082/forms/PlanMedico.aspx?rowguidpaciente=" + x + "&XEspecialidad=" + XEspecialidad + "&XTerapistaID=" + XTerapistaID + "&XObjetivo=" + XObjetivo + "&XCurrentUSR_ROWGUID=" + XCurrentUSR_ROWGUID + "&XCURRENTUSR_SGXID=" + XCURRENTUSR_SGXID)
                                                //document.getElementById("frmEscolaridad").setAttribute("src", "http://localhost:8082/forms/Escolaridad.aspx")
                                                //document.getElementById("frmEscolaridad").setAttribute("src", "http://localhost:8082/forms/Escolaridad.aspx")
                                            </script>
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
