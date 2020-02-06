<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00100.aspx.cs" Inherits="CAID.PAX00100" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xMASTER" runat="server" />
    <asp:HiddenField ID="xGRUPONUM" runat="server" />
    <asp:HiddenField ID="xPREGUNTANUM" runat="server" />
    <asp:HiddenField ID="xPREGUNTAID" runat="server" />
    <asp:HiddenField ID="xPREGUNTA" runat="server" />
    <asp:HiddenField ID="xPOS" runat="server" />
    <asp:HiddenField ID="xEND" runat="server" />
    <%--Entrevista Social --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">

            <div class="span12">
                <div class="box-content nopadding">
                    <div>
                        <p>
                            <button type="button" id="btnNew" runat="server" onserverclick="_NewQuiz" class="btn"
                                validationgroup="pnlConsulta">
                                <i class="icon-plus-sign"></i>&nbsp Crear Formulario</button>
                            <button type="button" id="btnNucleoFamiliar" runat="server" onserverclick="_OpenModalNF"
                                class="btn btn-primary" visible="false">
                                <i class=" icon-user"></i>&nbsp Núcleo Familiar</button>
                        </p>
                    </div>
                </div>
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Entrevista de Trabajo Social</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Entrevista</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtHoraIni" id="txtHoraIni" class="input-medium"
                                            placeholder="Hora de Inicio" disabled="true">
                                        <input runat="server" type="text" name="txtPreguntaNum" id="txtPreguntaNum" class="input-medium"
                                            placeholder="00/00" disabled="true">
                                        <br />
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlConsulta" />
                                    </div>
                                </div>
                                <%-- Composición Familiar --%>
                                <div class="control-group">
                                    <label for="cmbRespuesta" class="control-label" style="color: Red">
                                        Composición Familiar</label>
                                    <div class="controls">
                                        <div class="box-content nopadding">
                                            <table class="table table-bordered dataTable-scroll-x">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            Nombre Completo
                                                        </th>
                                                        <th>
                                                            Parentesco
                                                        </th>
                                                        <th style="width: 1%;">
                                                            Edad
                                                        </th>
                                                        <th style="width: 1%;">
                                                            Sexo
                                                        </th>
                                                        <th>
                                                            Escolaridad
                                                        </th>
                                                        <th>
                                                            Ocupación
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="rpNucleoFamiliar" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%# Eval("NOMBRECOMPLETO")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("PARENTESCO")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("EDAD")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("SEXO")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("ESCOLARIDAD")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("OCUPACION")%>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <%-- Pregunta --%>
                                <div class="control-group">
                                    <label for="cmbRespuesta" class="control-label" style="color: Red">
                                        Pregunta</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtPregunta" id="txtPregunta" class="input-block-level"
                                            disabled="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator3" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Respuesta --%>
                                <div class="control-group">
                                    <label for="cmbRespuesta" class="control-label" style="color: Red">
                                        Opciones</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbRespuesta" name="cmbRespuesta" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbRespuesta" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Comentarios --%>
                                <div class="control-group">
                                    <label for="txtPregunta" class="control-label">
                                        Respuesta</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtRespuesta" runat="server" TextMode="MultiLine" Height="100px"
                                            class="input-block-level"></asp:TextBox>
                                    </div>
                                </div>
                                <%-- Navegador --%>
                                <div class="control-group">
                                    <label for="txtPregunta" class="control-label">
                                        Continuar</label>
                                    <div class="controls">
                                        <%--<button type="button" id="btnHomeQ" runat="server"  class="btn btn-green"
                                            validationgroup="pnlData">
                                            <i class="icon-home"></i>&nbsp
                                        </button>
                                        <button type="button" id="btnBackQ" runat="server" class="btn">
                                            <i class="icon-arrow-left"></i>&nbsp
                                        </button>--%>
                                        <button type="button" id="btnNextQ" runat="server" onserverclick="_Next" class="btn">
                                            <i class="icon-arrow-right"></i>&nbsp
                                        </button>
                                    </div>
                                </div>
                            </div>
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
                    <button type="button" id="btnCancel" runat="server" onserverclick="_NewQuiz" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <%--                   <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>--%>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Calificacion y Registro de Responsables Profesionales</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Categoria --%>
                                <div class="control-group">
                                    <label for="cmbCategoria" class="control-label" style="color: Red">
                                        Categoria</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCategoria" name="cmbCategoria" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbMedico" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCategoria" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Medico --%>
                                <div class="control-group">
                                    <label for="cmbMedico" class="control-label" style="color: Red">
                                        Especialista</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbMedico" name="cmbMedico" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbMedico" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbMedico" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Terapista --%>
                                <div class="control-group">
                                    <label for="cmbTerapista" class="control-label" style="color: Red">
                                        Terapista</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTerapista" name="cmbTerapista" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbTerapista" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Enfermera --%>
                                <div class="control-group">
                                    <label for="cmbEnfermera" class="control-label" style="color: Red">
                                        Enfermera(o)</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEnfermera" name="cmbEnfermera" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEnfermera" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Agente Social --%>
                                <div class="control-group">
                                    <label for="cmbAgente" class="control-label" style="color: Red">
                                        Agente Social</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbAgente" name="cmbAgente" class='select2-me input-xxlarge'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTerapista" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbAgente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Comentarios --%>
                                <div class="control-group">
                                    <label for="txtComentarios" class="control-label">
                                        Comentarios</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtComentarios" runat="server" TextMode="MultiLine" Height="50px"
                                            class="input-block-level"></asp:TextBox>
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
