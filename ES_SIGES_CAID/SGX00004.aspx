<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00004.aspx.cs" Inherits="CAID.SGX00004" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Componentes del Acto Médico</h3>
                    <div class="actions">
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                            <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-bordered'>
                            <div class="box-content form-vertical">
                                <%-- Especialidad --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="color: Red">
                                        Especialidad</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbEspecialidad" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbEspecialidad_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic"
                                            ErrorMessage="Requerido!" ID="valcmbEspecialidad" runat="server" SetFocusOnError="True"
                                            ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <div class="row-fluid">
                                    <div class="span3">
                                        <div class="control-group">
                                            <label for="cmbC1" class="control-label">
                                                Motivos de Consulta</label>
                                            <div class="controls controls-row">
                                                <select runat="server" id="cmbC1" name="cmbC1" class='select2-me input-block-level'
                                                    data-rule-required="true">
                                                    <option value="0">Inactivo</option>
                                                    <option value="1">Activo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span3">
                                        <div class="control-group">
                                            <label for="cmbC2" class="control-label">
                                                Historia de Enfermedad</label>
                                            <div class="controls controls-row">
                                                <select runat="server" id="cmbC2" name="cmbC2" class='select2-me input-block-level'
                                                    data-rule-required="true">
                                                    <option value="0">Inactivo</option>
                                                    <option value="1">Activo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span3">
                                        <div class="control-group">
                                            <label for="cmbC3" class="control-label">
                                                Antecedentes Perinatales</label>
                                            <div class="controls controls-row">
                                                <select runat="server" id="cmbC3" name="cmbC3" class='select2-me input-block-level'
                                                    data-rule-required="true">
                                                    <option value="0">Inactivo</option>
                                                    <option value="1">Activo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span3">
                                        <div class="control-group">
                                            <label for="cmbC4" class="control-label">
                                                Alimentación</label>
                                            <div class="controls controls-row">
                                                <select runat="server" id="cmbC4" name="cmbC4" class='select2-me input-block-level'
                                                    data-rule-required="true">
                                                    <option value="0">Inactivo</option>
                                                    <option value="1">Activo</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC5" class="control-label">
                                                    Inmunizaciones</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC5" name="cmbC5" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC6" class="control-label">
                                                    Antecedentes Personales</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC6" name="cmbC6" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC7" class="control-label">
                                                    Antecedentes Familiares</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC7" name="cmbC7" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC8" class="control-label">
                                                    Desarrollo Psicomotor</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC8" name="cmbC8" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC9" class="control-label">
                                                    Exámen Físico</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC9" name="cmbC9" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC10" class="control-label">
                                                    Tratamientos</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC10" name="cmbC10" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC11" class="control-label">
                                                    Laboratorios</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC11" name="cmbC11" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC12" class="control-label">
                                                    Exámenes Auxiliares</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC12" name="cmbC12" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC13" class="control-label">
                                                    Diagnósticos</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC13" name="cmbC13" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC14" class="control-label">
                                                    Mutimedia</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC14" name="cmbC14" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC15" class="control-label">
                                                    Notas de Evolución</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC15" name="cmbC15" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC16" class="control-label">
                                                    Evaluación Terapeútica</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC16" name="cmbC16" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC17" class="control-label">
                                                    Funciones Vitales</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC17" name="cmbC17" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC18" class="control-label">
                                                    Plan</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC18" name="cmbC18" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC19" class="control-label">
                                                    Medidas Antropométricas</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC19" name="cmbC19" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC20" class="control-label">
                                                    Protocolo de Seguimiento</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC20" name="cmbC20" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC21" class="control-label">
                                                    Desarrollo del Lenguaje</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC21" name="cmbC21" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC22" class="control-label">
                                                    Evaluación Terapia Familiar</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC22" name="cmbC22" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC23" class="control-label">
                                                    Evaluación Inicial - TC</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC23" name="cmbC23" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC24" class="control-label">
                                                    Evaluación de Seguimiento</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC24" name="cmbC24" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC25" class="control-label">
                                                    Archivos y Multimedias</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC25" name="cmbC25" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC26" class="control-label">
                                                    Balance Articular y Muscular</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC26" name="cmbC26" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC27" class="control-label">
                                                    Evolución - Terapia Ocupacional</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC27" name="cmbC27" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC28" class="control-label">
                                                    Escala de Ashwhort</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC28" name="cmbC28" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC29" class="control-label">
                                                    Método de Intervención - Ocupacional</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC29" name="cmbC29" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC30" class="control-label">
                                                    C30</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC30" name="cmbC30" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC31" class="control-label">
                                                    Evaluación de Conducta Funcional</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC31" name="cmbC31" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC32" class="control-label">
                                                    Tabla ACC - Registro de Datos</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC32" name="cmbC32" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC33" class="control-label">
                                                    Plan de Intervención Conductual</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC33" name="cmbC33" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC34" class="control-label">
                                                    Intervención Grupal</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC34" name="cmbC34" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC35" class="control-label">
                                                  Evaluación funcional del comportamiento</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC35" name="cmbC35" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC36" class="control-label">
                                                    Intervención Terapéutica</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC36" name="cmbC36" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC37" class="control-label">
                                                    Tratamientos Odontologicos</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC37" name="cmbC37" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC38" class="control-label">
                                                    Evaluación Inicial Servicio de ED</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC38" name="cmbC38" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC39" class="control-label">
                                                    Evaluación Servicio de Odontopediatría</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC39" name="cmbC39" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC40" class="control-label">
                                                    Hoja de Data Terapia Conductual</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC40" name="cmbC40" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC41" class="control-label">
                                                    Evaluación Terapias Complementarias</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC41" name="cmbC41" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC42" class="control-label">
                                                    Evolución Terapia Familiar</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC42" name="cmbC42" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC43" class="control-label">
                                                    Notas de Evolución EVD</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC43" name="cmbC43" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC44" class="control-label">
                                                    Evaluación Multidisciplinaria</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC44" name="cmbC44" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC45" class="control-label">
                                                    C45</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC45" name="cmbC45" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC46" class="control-label">
                                                    C46</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC46" name="cmbC46" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC47" class="control-label">
                                                    C47</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC47" name="cmbC47" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC48" class="control-label">
                                                    C48</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC48" name="cmbC48" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-vertical">
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC49" class="control-label">
                                                    C49</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC49" name="cmbC49" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span3">
                                            <div class="control-group">
                                                <label for="cmbC50" class="control-label">
                                                    C50</label>
                                                <div class="controls controls-row">
                                                    <select runat="server" id="cmbC50" name="cmbC50" class='select2-me input-block-level'
                                                        data-rule-required="true">
                                                        <option value="0">Inactivo</option>
                                                        <option value="1">Activo</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
