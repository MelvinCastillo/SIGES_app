<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00102.aspx.cs" Inherits="CAID.PAX00102" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Entrevista Social --%>
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        Entrevista Inicial del Servicio Social</h3>
                </div>
                <div class="box-content">
                    <asp:Panel ID="pnlEntrevista" runat="server">
                        <div class='form-vertical'>
                            <div class="control-group">
                                <label for="cmbRespuesta" class="control-label" style="color: Red">
                                    Paciente</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbPaciente" runat="server" CssClass="select2-me input-block-level"
                                        data-rule-required="true" AutoPostBack="True" OnSelectedIndexChanged="cmbPaciente_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <h5>
                                1. Datos Personales y/o Generales</h5>
                            <div class="control-group">
                                <strong>¿El niño (a) reside con? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt1" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Ambos Padres"></option>
                                        <option value="Madre"></option>
                                        <option value="Padre"></option>
                                        <option value="Tutor"></option>
                                        <option value="Abuela"></option>
                                        <option value="Abuelo"></option>
                                        <option value="Tía"></option>
                                        <option value="Primos"></option>
                                    </select>
                                    <input runat="server" id="txt2" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Quién cuida del niño? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt3" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Ambos Padres"></option>
                                        <option value="Madre"></option>
                                        <option value="Padre"></option>
                                        <option value="Tutor"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt4" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Es Asegurado? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt5" class='select2-me input-block-level' data-rule-required="true">
                                    </select>
                                    <input runat="server" id="txt6" type="text" class="input-block-level" placeholder="Número de Afiliado">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Asiste el niño (a) a la escuela? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt7" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="No"></option>
                                        <option value="Sí, En Horario Matutino"></option>
                                        <option value="Sí, En Horario Vespertino"></option>
                                        <option value="Sí, En Tanda Extendida"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Nombre del Centro</strong>
                                <div class="controls">
                                    <input runat="server" id="txt8" type="text" class="input-block-level" placeholder="Nombre del Centro">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿A qué edad ingreso a la escuela? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt9" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="1 Año"></option>
                                        <option value="2 Años"></option>
                                        <option value="3 Años"></option>
                                        <option value="4 Años"></option>
                                        <option value="5 Años"></option>
                                        <option value="6 Años"></option>
                                        <option value="7 Años"></option>
                                        <option value="8 Años"></option>
                                        <option value="9 Años"></option>
                                        <option value="10 Años"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Grado escolar </strong>
                                <div class="controls">
                                    <select runat="server" id="txt10" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="Ninguno"></option>
                                        <option value="Maternal"></option>
                                        <option value="Kinder Garden"></option>
                                        <option value="Pre-Primario"></option>
                                        <option value="1ro Básica"></option>
                                        <option value="2do Básica"></option>
                                        <option value="3ro Básica"></option>
                                        <option value="4to Básica"></option>
                                        <option value="5to Básica"></option>
                                        <option value="6to Básica"></option>
                                        <option value="7mo Básica"></option>
                                        <option value="8vo Grado"></option>
                                        <option value="1ro Media"></option>
                                        <option value="2do Media"></option>
                                        <option value="3ro Media"></option>
                                        <option value="4to Media"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Qué tipo de centro escolar es? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt11" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="Ninguno"></option>
                                        <option value="Público"></option>
                                        <option value="Privado"></option>
                                        <option value="ONG"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Características del centro </strong>
                                <div class="controls">
                                    <select runat="server" id="txt12" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="Ninguno"></option>
                                        <option value="Escuela Regular"></option>
                                        <option value="Escuela Especial"></option>
                                        <option value="Aula de Recursos"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt13" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Diagnóstico Previo </strong>
                                <div class="controls">
                                    <input runat="server" id="txt14" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Centro profesional que realizó diagnóstico </strong>
                                <div class="controls">
                                    <input runat="server" id="txt15" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Recibe o ha recibido intervención terapéutica? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt16" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sí"></option>
                                        <option value="No"></option>
                                    </select>
                                    <input runat="server" id="txt17" type="text" class="input-block-level" placeholder="¿Cuándo fue su última terapia?">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cuáles Terapias recibe o ha recibido? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt18" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Tiempo recibiendo terapias </strong>
                                <div class="controls">
                                    <input runat="server" id="txt19" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Dónde? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt20" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <h5>
                                2. Interacción Familiar y/o Social del Niño (a)</h5>
                            <div class="control-group">
                                <strong>Participa el niño (a) en actividades con la familia? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt21" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sí"></option>
                                        <option value="No"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Con que frecuencia? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt22" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="Ninguna"></option>
                                        <option value="Siempre"></option>
                                        <option value="Casi Siempre"></option>
                                        <option value="Pocas veces"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo es un día en la vida del/de la niño(a)? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt23" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo es el ambiente en casa? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt24" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo describiría la dinámica entre los padres? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt25" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo es la relación del niño/a con el cuidador/a principal? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt26" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo logra que el niño/a haga lo que usted quiere? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt27" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Con quién duerme el niño/a? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt28" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>En el último año ¿Ha habido cambios significativos en la vida del niño, tales
                                    cómo? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt29" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Mudanza"></option>
                                        <option value="Cambio de Escuela"></option>
                                        <option value="Divorcio"></option>
                                        <option value="Madre/padre o tutor en conflicto con la ley"></option>
                                        <option value="Muerte de un familiar"></option>
                                        <option value="Nacimiento de un nuevo miembro familiar"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt30" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <h5>
                                3. Interacción en la Escuela</h5>
                            <div class="control-group">
                                <strong>¿Cómo se dio el proceso de ingreso a la escuela o centro educativo? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt31" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sin dificultad"></option>
                                        <option value="Con dificultad"></option>
                                    </select>
                                    <input runat="server" id="txt32" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo calificaría la experiencia escolar del niño/a? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt33" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Satisfactoria"></option>
                                        <option value="Regular"></option>
                                        <option value="Difícil"></option>
                                    </select>
                                    <input runat="server" id="txt34" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Cómo percibe el apoyo que le dan a su hijo/a la escuela y los maestros?
                                </strong>
                                <div class="controls">
                                    <select runat="server" id="txt36" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Muy bueno"></option>
                                        <option value="Regular"></option>
                                        <option value="Deficiente"></option>
                                    </select>
                                    <input runat="server" id="txt37" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Qué le cuentan los maestros sobre su desempeño en la escuela? </strong>
                                <div class="controls">
                                    <input runat="server" id="txt38" type="text" class="input-block-level" placeholder="Especifique">
                                </div>
                            </div>
                            <h5>
                                4. Interacción en la Comunidad</h5>
                            <div class="control-group">
                                <strong>¿Cómo se relaciona con otros niños/as? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt35" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Se integra al trabajo y al juego con otros niños/as la mayor parte del tiempo ">
                                        </option>
                                        <option value="Se integra al trabajo y al juego con otros niños/as a veces "></option>
                                        <option value="Permanece aislado/a "></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Participa el niño/a de actividades en su comunidad? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt39" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sí"></option>
                                        <option value="No"></option>
                                    </select>
                                    <input runat="server" id="txt40" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿De qué forma sus vecinos o amigos interactúan con el niño/a? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt41" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Lo integran"></option>
                                        <option value="Lo ignoran"></option>
                                        <option value="Lo rechazan"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Se ha sentido el niño/a o la familia excluído/a de actividades en la comunidad?
                                </strong>
                                <div class="controls">
                                    <select runat="server" id="txt42" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sí"></option>
                                        <option value="No"></option>
                                    </select>
                                    <input runat="server" id="txt43" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <h5>
                                5. Datos Generales de la Vivienda
                            </h5>
                            <div class="control-group">
                                <strong>Material predominante del piso </strong>
                                <div class="controls">
                                    <select runat="server" id="txt44" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Piso de tierra"></option>
                                        <option value="Cemento"></option>
                                        <option value="Cerámica /Granito"></option>
                                    </select>
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Material predominante de las paredes </strong>
                                <div class="controls">
                                    <select runat="server" id="txt45" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Cemento"></option>
                                        <option value="Madera"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt46" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Material predominante del techo </strong>
                                <div class="controls">
                                    <select runat="server" id="txt47" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Cemento"></option>
                                        <option value="Zinc"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt48" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Fuente principal abastecimiento de agua </strong>
                                <div class="controls">
                                    <select runat="server" id="txt49" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Tubería red pública, fuera  de la casa"></option>
                                        <option value="Agua de pozo"></option>
                                        <option value="Camión / Tanque"></option>
                                        <option value="Dentro de la casa"></option>
                                        <option value="Otro"></option>
                                    </select>
                                    <input runat="server" id="txt50" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Tiene servicio de electricidad? </strong>
                                <div class="controls">
                                    <select runat="server" id="txt51" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Sí"></option>
                                        <option value="No"></option>
                                    </select>
                                    <input runat="server" id="txt52" type="text" class="input-block-level" placeholder="Especificar horas interrupción del servicio al día">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Tipo de servicio sanitario</strong>
                                <div class="controls">
                                    <select runat="server" id="txt53" class='select2-me input-block-level' data-rule-required="true">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Privado"></option>
                                        <option value="Colectivo"></option>
                                        <option value="No hay servicio"></option>
                                    </select>
                                    <input runat="server" id="txt54" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Composición de la vivienda</strong>
                                <div class="controls">
                                    <input runat="server" id="txt55" type="text" class="input-block-level" placeholder="No. de Habitaciones">
                                    <input runat="server" id="txt56" type="text" class="input-block-level" placeholder="No. de Dormitorios">
                                    <input runat="server" id="txt57" type="text" class="input-block-level" placeholder="Electrodomésticos disponibles">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>Descripción del entorno de la vivienda</strong>
                                <div class="controls">
                                    <input runat="server" id="txt58" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <div class="control-group">
                                <strong>¿Dispone de accesibilidad dentro de su recorrido habitual?</strong>
                                <div class="controls">
                                    <input runat="server" id="txt59" type="text" class="input-block-level" placeholder="Describa">
                                </div>
                            </div>
                            <h5>
                                6. Relación de Ingresos y Gastos
                            </h5>
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        Detalles
                                    </h3>
                                </div>
                                <div class="box-content nopadding">
                                    <table class="table table-hover table-nomargin">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Concepto
                                                </th>
                                                <th>
                                                    Monto (RD$)
                                                </th>
                                                <th>
                                                    Concepto
                                                </th>
                                                <th>
                                                    Monto (RD$)
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    Sueldo
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt60" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt60" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    Alquiler o Hipoteca
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt61" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt61" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Libre Ejercicio
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt62" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt62" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    Servivios
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt63" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt63" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Remesas
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt64" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt64" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    Gastos Escolares
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt65" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt65" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pensión
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt66" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt66" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    Préstamos
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt67" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt67" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Otros Ingresos
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt68" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Sólo Números"
                                                        ControlToValidate="txt68" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>
                                                    Otros Gastos
                                                </td>
                                                <td>
                                                    <input runat="server" id="txt69" type="text" class="input-block-level" placeholder="Monto">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                                        ErrorMessage="Sólo Números" ControlToValidate="txt69" ValidationExpression="^[0-9]([.,][0-9]{1,3})?$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h5>
                                Comentarios
                            </h5>
                            <div class="control-group">
                                <div class="controls">
                                    <asp:TextBox ID="txtComentarios" runat="server" TextMode="MultiLine" Height="150px"
                                        ValidationGroup="pnlData" Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button id="btnSave" runat="server" onserverclick="_Save" class="btn btn-primary"
                                    validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        Histórico</h3>
                    <div class="actions">
                        <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                            <i class="icon-refresh"></i>&nbsp Actualizar</button>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Record
                                    </th>
                                    <th>
                                        Fecha
                                    </th>
                                    <th>
                                        Paciente
                                    </th>
                                    <th>
                                        Categoría
                                    </th>
                                      <th>
                                        Agente Servicio Social
                                    </th>
                                    <th>
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("RECORDID")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yyyy") %>
                                                <br />
                                                <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("hh:mm tt") %>
                                            </td>
                                            <td>
                                                <%# Eval("FULLNAME")%>
                                            </td>
                                            <td>
                                                <%# Eval("CATEGORIA")%>
                                            </td>
                                              <td>
                                                <%# Eval("USUARIO")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnPrint" CssClass="btn btn-red" runat="server" Text="Imprimir"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Print" OnClick="_Select"></asp:LinkButton>
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
</asp:Content>
