<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX40100.aspx.cs" Inherits="CAID.PAX40100" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--    <asp:HiddenField ID="xESPECIALIDADGUID" runat="server" />
    <asp:HiddenField ID="xESPECIALIDADNOMBRE" runat="server" />--%>
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
                    <%--  <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>--%>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3 runat="server" id="lblEvaluacion">
                            <i class="icon-edit"></i>Formulario de Actualización de Datos
                        </h3>
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
                                            AutoPostBack="false" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <%-- Seguro Médico --%>
                                <div class="control-group">
                                    <label for="cmbARS" class="control-label" style="color: Red">
                                        Seguro Médico</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbARS" name="cmbARS" class='select2-me input-block-level'
                                            data-rule-required="true">
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbARS" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbARS" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>


                                <%-- Telefono Residencia --%>
                                <div class="control-group">
                                    <label for="txtTelResidencia" class="control-label" style="color: Red">
                                        Teléfono Residencia</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTelResidencia" id="txtTelResidencia" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtTelResidencia" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtTelResidencia" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <%-- Dirección --%>
                                <div class="control-group">
                                    <label for="txtDireccion" class="control-label" style="color: Red">
                                        Dirección</label>
                                    <div class="controls">
                                        <input runat="server" name="txtDireccion" id="txtDireccion" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtDireccion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>

                                <div class="control-group" style="color: black; text-align: center; background-color: white;">
                                    <%--<label for="txtACOMPANANTEPACIENTE" class="control-label" style="color: black; text-align: end; background-color:aqua;">
                                     </label>--%>
                                    Información Padre 
                                </div>

                                <%-- Nombre Padre --%>
                                <div class="control-group">
                                    <label for="txtNombrePadre" class="control-label" style="color: Red">
                                        Nombre Padre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombrePadre" id="txtNombrePadre" type="text" class="input-block-level">
                                        <br />
                                        <%--<asp:RequiredFieldValidator ControlToValidate="txtNombrePadre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombrePadre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                                    </div>
                                </div>

                                <%-- Cédula Padre --%>
                                <div class="control-group">
                                    <label for="txtCedulaPadre" class="control-label" style="color: Red">
                                        Cédula Padre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtCedulaPadre" id="txtCedulaPadre" type="text" class="input-block-level">
                                        <br />

                                    </div>
                                </div>

                                <%-- Tlefono Padre --%>
                                <div class="control-group">
                                    <label for="txtTelPadre" class="control-label" style="color: Red">
                                        Teléfono Padre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTelPadre" id="txtTelPadre" type="text" class="input-block-level">
                                        <br />

                                    </div>
                                </div>

                                <%-- Email Padre --%>
                                <div class="control-group">
                                    <label for="txtEmailPadre" class="control-label" style="color: Red">
                                        Email Padre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtEmailPadre" id="txtEmailPadre" type="text" class="input-block-level">
                                        <br />

                                    </div>
                                </div>

                                <div class="control-group" style="color: black; text-align: center; background-color: white;">
                                    <%--<label for="txtACOMPANANTEPACIENTE" class="control-label" style="color: black; text-align: end; background-color:aqua;">
                                     </label>--%>
                                    Información Madre 
                                </div>

                                <%-- Nombre Madre --%>
                                <div class="control-group">
                                    <label for="txtNombreMadre" class="control-label" style="color: Red">
                                        Nombre Madre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombreMadre" id="txtNombreMadre" type="text" class="input-block-level">
                                        <br />

                                    </div>
                                </div>

                                <%-- Cédula Madre --%>
                                <div class="control-group">
                                    <label for="txtCedulaMadre" class="control-label" style="color: Red">
                                        Cédula Madre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtCedulaMadre" id="txtCedulaMadre" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <%-- Tlefono Madre --%>
                                <div class="control-group">
                                    <label for="txtTelMadre" class="control-label" style="color: Red">
                                        Teléfono Madre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTelMadre" id="txtTelMadre" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <%-- Email Madre --%>
                                <div class="control-group">
                                    <label for="txtEmailMadre" class="control-label" style="color: Red">
                                        Email Madre</label>
                                    <div class="controls">
                                        <input runat="server" name="txtEmailMadre" id="txtEmailMadre" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <div class="control-group" style="color: black; text-align: center; background-color: white;">
                                    <%--<label for="txtACOMPANANTEPACIENTE" class="control-label" style="color: black; text-align: end; background-color:aqua;">
                                     </label>--%>
                                    Información Tutor 
                                </div>

                                <%-- Nombre Tutor --%>
                                <div class="control-group">
                                    <label for="txtNombreTutor" class="control-label" style="color: Red">
                                        Nombre Tutor</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombreTutor" id="txtNombreTutor" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <%-- Cédula Tutor --%>
                                <div class="control-group">
                                    <label for="txtCedulaTutor" class="control-label" style="color: Red">
                                        Cédula Tutor</label>
                                    <div class="controls">
                                        <input runat="server" name="txtCedulaTutor" id="txtCedulaTutor" type="text" class="input-block-level">

                                    </div>
                                </div>

                                <%-- Tlefono Tutor --%>
                                <div class="control-group">
                                    <label for="txtTelTutor" class="control-label" style="color: Red">
                                        Teléfono Tutor</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTelTutor" id="txtTelTutor" type="text" class="input-block-level">

                                    </div>
                                </div>

                                <%-- Nombre Familiar que no reside con el niño --%>
                                <div class="control-group">
                                    <label for="txtNoResideConNino" class="control-label" style="color: Red">
                                        Nombre de un fammiliar que no reside con el niño/niña:</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNoResideConNino" id="txtNoResideConNino" type="text" class="input-block-level">

                                    </div>
                                </div>

                                <%-- Parentesco Familiar que no reside con el niño--%>
                                <div class="control-group">
                                    <label for="cmbNFParentesco1" class="control-label" style="color: Red">
                                        Parentesco</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbNFParentesco1" name="cmbNFParentesco1" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>

                                <%-- Telefono de Familiar que no reside con el niño--%>
                                <div class="control-group">
                                    <label for="txtTel4" class="control-label" style="color: Red">
                                        Teléfono</label>
                                    <div class="controls">
                                        <input runat="server" name="txtTel4" id="txtTel4" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <%-- Nombre persona que acompaña al niño a las terapias--%>
                                <div class="control-group">
                                    <label for="txtACOMPANANTEPACIENTE" class="control-label" style="color: Red">
                                        Especifique el nombre de la persona que acompaña al niño/a a las terapias</label>
                                    <div class="controls">
                                        <input runat="server" name="txtACOMPANANTEPACIENTE" id="txtACOMPANANTEPACIENTE" type="text" class="input-block-level">
                                    </div>
                                </div>

                                <%-- Parentesco de persona que acompaña al niño a las terapias--%>
                                <div class="control-group">
                                    <label for="cmbNFParentesco2" class="control-label" style="color: Red">
                                        Parentesco</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbNFParentesco2" name="cmbNFParentesco2" class='select2-me input-block-level'>
                                        </select>
                                    </div>
                                </div>

                                <%-- Escolarizado --%>
                                <div class="control-group">
                                    <label for="cmbEscolarizado" class="control-label" style="color: Red">
                                        Escolarizado</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbEscolarizado" name="cmbEscolarizado" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">SI</option>
                                            <option value="0">NO</option>
                                        </select>
                                    </div>
                                </div>

                                <%-- Tipo de Escolaridad --%>
                                <div class="control-group">
                                    <label for="cmbTipoEscolaridad" class="control-label" style="color: Red">
                                        Tipo de Escolaridad</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTipoEscolaridad" name="cmbTipoEscolaridad" class='select2-me input-xlarge'>
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="Público1">Público</option>
                                            <option value="Privado">Privado</option>
                                        </select>
                                    </div>
                                </div>

                                <%-- Nombre de la institucion--%>
                                <div class="control-group">
                                    <label for="txtNombreInstitucion" class="control-label" style="color: Red">
                                        Nombre de la institución</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombreInstitucion" id="txtNombreInstitucion" type="text" class="input-block-level">

                                    </div>
                                </div>

                                <%-- Sector de la Institución --%>
                                <div class="control-group">
                                    <label for="cmbSectorInstitucion" class="control-label" style="color: Red">
                                        Sector de la institución</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbSectorInstitucion" name="cmbSectorInstitucion" class='select2-me input-block-level'>
                                        </select>

                                    </div>
                                </div>


                                <%--                                <%-- Objetivo --%>
                                <%--                                <div class="control-group">
                                    <label for="cmbObjetivo" class="control-label" style="color: Red">
                                        Objetivo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbObjetivo" name="cmbObjetivo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- NINGUNO --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbObjetivo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>--%>
                                <%-- Descripción --%>
                                <%--<div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Notas de Evolución</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtNotaEvolucion" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNotaEvolucion" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valtxtNotaEvolucion" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
