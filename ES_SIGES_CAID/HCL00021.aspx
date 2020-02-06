<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00021.aspx.cs" Inherits="CAID.HCL00021" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type='text/javascript'>
        // price text-box allow numeric and allow 2 decimal points only
        function extractNumber(obj, decimalPlaces, allowNegative) {
            var temp = obj.value;

            // avoid changing things if already formatted correctly
            var reg0Str = '[0-9]*';
            if (decimalPlaces > 0) {
                reg0Str += '\[\,\.]?[0-9]{0,' + decimalPlaces + '}';
            } else if (decimalPlaces < 0) {
                reg0Str += '\[\,\.]?[0-9]*';
            }
            reg0Str = allowNegative ? '^-?' + reg0Str : '^' + reg0Str;
            reg0Str = reg0Str + '$';
            var reg0 = new RegExp(reg0Str);
            if (reg0.test(temp)) return true;

            // first replace all non numbers
            var reg1Str = '[^0-9' + (decimalPlaces != 0 ? '.' : '') + (decimalPlaces != 0 ? ',' : '') + (allowNegative ? '-' : '') + ']';
            var reg1 = new RegExp(reg1Str, 'g');
            temp = temp.replace(reg1, '');

            if (allowNegative) {
                // replace extra negative
                var hasNegative = temp.length > 0 && temp.charAt(0) == '-';
                var reg2 = /-/g;
                temp = temp.replace(reg2, '');
                if (hasNegative) temp = '-' + temp;
            }

            if (decimalPlaces != 0) {
                var reg3 = /[\,\.]/g;
                var reg3Array = reg3.exec(temp);
                if (reg3Array != null) {
                    // keep only first occurrence of .
                    //  and the number of places specified by decimalPlaces or the entire string if decimalPlaces < 0
                    var reg3Right = temp.substring(reg3Array.index + reg3Array[0].length);
                    reg3Right = reg3Right.replace(reg3, '');
                    reg3Right = decimalPlaces > 0 ? reg3Right.substring(0, decimalPlaces) : reg3Right;
                    temp = temp.substring(0, reg3Array.index) + '.' + reg3Right;
                }
            }

            obj.value = temp;
        }
        function blockNonNumbers(obj, e, allowDecimal, allowNegative) {
            var key;
            var isCtrl = false;
            var keychar;
            var reg;
            if (window.event) {
                key = e.keyCode;
                isCtrl = window.event.ctrlKey
            }
            else if (e.which) {
                key = e.which;
                isCtrl = e.ctrlKey;
            }

            if (isNaN(key)) return true;

            keychar = String.fromCharCode(key);

            // check for backspace or delete, or if Ctrl was pressed
            if (key == 8 || isCtrl) {
                return true;
            }

            reg = /\d/;
            var isFirstN = allowNegative ? keychar == '-' && obj.value.indexOf('-') == -1 : false;
            var isFirstD = allowDecimal ? keychar == '.' && obj.value.indexOf('.') == -1 : false;
            var isFirstC = allowDecimal ? keychar == ',' && obj.value.indexOf(',') == -1 : false;
            return isFirstN || isFirstD || isFirstC || reg.test(keychar);
        }
        function blockInvalid(obj) {
            var temp = obj.value;
            if (temp == "-") {
                temp = "";
            }

            if (temp.indexOf(".") == temp.length - 1 && temp.indexOf(".") != -1) {
                temp = temp + "00";
            }
            if (temp.indexOf(".") == 0) {
                temp = "0" + temp;
            }
            if (temp.indexOf(".") == 1 && temp.indexOf("-") == 0) {
                temp = temp.replace("-", "-0");
            }
            if (temp.indexOf(",") == temp.length - 1 && temp.indexOf(",") != -1) {
                temp = temp + "00";
            }
            if (temp.indexOf(",") == 0) {
                temp = "0" + temp;
            }
            if (temp.indexOf(",") == 1 && temp.indexOf("-") == 0) {
                temp = temp.replace("-", "-0");
            }
            temp = temp.replace(",", ".");
            obj.value = temp;
        };
        // end of price text-box allow numeric and allow 2 decimal points only
        $('input[type="text"]').keydown(function (e) {
            var ingnore_key_codes = [8, 32];
            if ($.inArray(e.keyCode, ingnore_key_codes) >= 0) {
                e.preventDefault();
            }
        });
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        };
        function IsFloatOnly(element) {
            var value = $(element).val();
            var regExp = "^\\d+(\\.\\d+)?$";
            return value.match(regExp);
        }
        function FilterInput(event) {
            var keyCode = ('which' in event) ? event.which : event.keyCode;

            isNumeric = (keyCode >= 48 /* KeyboardEvent.DOM_VK_0 */ && keyCode <= 57 /* KeyboardEvent.DOM_VK_9 */) ||
                    (keyCode >= 96 /* KeyboardEvent.DOM_VK_NUMPAD0 */ && keyCode <= 105 /* KeyboardEvent.DOM_VK_NUMPAD9 */);
            modifiers = (event.altKey || event.ctrlKey || event.shiftKey);
            return isNumeric || modifiers;
        }
        function keyispressed(e) {
            var charval = String.fromCharCode(e.keyCode);
            if (isNaN(charval)) {
                return false;
            }
            return true;
        }
        function makeMoney(source) {
            //Grab the value from the element
            var money = parseFloat(source.value, 10).toFixed(2);

            //Format your value
            source.value = '$' + money.toString();
        };
        function toUSD(objctrl) {
            //Get the Entered Value
            var number = objctrl.value.toString(),
            //Split the number between dollars and cents
            dollars = number.split('.')[0], cents = (number.split('.')[1] || '') + '00';
            dollars = dollars.split('').reverse().join('').replace(/(\d{3}(?!$))/g, '$1,').split('').reverse().join('');
            //Concatenate the number with currecny symbol
            objctrl.value = dollars + '.' + cents.slice(0, 2);
        };
    </script>
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
                    <h3 runat="server" id="H1">
                        <i class="icon-edit"></i>Desarrollo del Lenguaje</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-striped'>
                        <%-- Tipo de Evaluación --%>
                        <div class="control-group">
                            <label for="cmbTipo" class="control-label" style="color: red; font-size: small;">
                                <strong>Especialidad</strong></label>
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
                       <%-- <div class="control-group">
                            <label for="cmbObjetivo" class="control-label" style="color: red; font-size: small;">
                                <strong>Objetivo</strong></label>
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

                        <%--Se expresa a través de:--%>
                        <div class="control-group">
                            <label for="textfield" class="control-label"><strong>Se expresa a través de:</strong></label>
                            <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                <asp:CheckBoxList ID="ckExpresiones" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                    runat="server">
                                </asp:CheckBoxList>

                            </div>
                        </div>

                        <%--A que edad dijo (Vocales, Silabas etc)--%>
                        <div class="control-group">
                            <label for="textfield" class="control-label">
                                <strong>¿A qué edad dijo…?
                                </strong>
                            </label>
                            <div class="controls">

                                <div class="span4">
                                    <div class="control-list">
                                        Vocales
                                    </div>

                                    <input runat="server" type="text" name="txtVocales" id="txtVocales" value="0" class="spinner input-block-level"
                                        placeholder="Edad">
                                    <input type="text" runat="server" name="txtCVocales" id="txtCVocales" placeholder="¿Cuáles?" class="input-block-level">
                                </div>

                                <div class="span4">
                                    <div class="control-list">
                                        Sílabas
                                    </div>
                                    <input runat="server" type="text" name="txtSilabas" id="txtSilabas" value="0" class="spinner input-block-level"
                                        placeholder="Edad">
                                    <input type="text" runat="server" name="txtCSilabas" id="txtCSilabas" placeholder="¿Cuáles?" class="input-block-level">
                                </div>


                                <div class="span4">
                                    <div class="control-list">
                                        Palabras
                                    </div>
                                   <input runat="server" type="text" name="txtPalabras" id="txtPalabras" value="0" class="spinner input-block-level"
                                        placeholder="Edad">
                                    <input type="text" runat="server" name="txtCPalabras" id="txtCPalabras" placeholder="¿Cuáles?" class="input-block-level">
                                </div>

                                &nbsp

                                <div class="row-fluid">
                                    <div class="span6">
                                        <div class="control-list">
                                            Frases
                                        </div>
                                        <input runat="server" type="text" name="txtFrases" id="txtFrases" value="0" class="spinner input-block-level"
                                        placeholder="Edad">
                                        <input type="text" runat="server" name="txtCFrases" id="txtCFrases" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>


                                    <div class="span6">
                                        <div class="control-list">
                                            Oraciones
                                        </div>

                                        <input runat="server" type="text" name="txtOraciones" id="txtOraciones" value="0" class="spinner input-block-level"
                                        placeholder="Edad">
                                        <input type="text" runat="server" name="txtCOraciones" id="txtCOraciones" placeholder="¿Cuáles?" class="input-block-level">
                                    </div>
                                </div>



                            </div>
                        </div>

                        <%--Características de la voz--%>
                        <div class="control-group">
                            <label for="txtVoz" class="control-label" style="font-size: small;">
                                <strong>Características de la voz</strong></label>
                            <div class="controls">
                                <asp:TextBox ID="txtVoz" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                    Wrap="true" placeholder="Características de la voz" CssClass="input-block-level"></asp:TextBox>
                            </div>
                        </div>

                        <%--Reconoce su nombre cuando se le llama:--%>
                        <div class="control-group">
                            <label for="cmbSeReconoce" class="control-label"><strong>Reconoce su nombre</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbSeReconoce" name="cmbSeReconoce" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="SI"></option>
                                    <option value="NO"></option>
                                </select>
                            </div>
                        </div>

                         <%--Sigue instrucciones::--%>
                        <div class="control-group">
                            <label for="cmbSigueInstrucciones" class="control-label"><strong>Sigue instrucciones</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbSigueInstrucciones" name="cmbSigueInstrucciones" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="SIMPLES"></option>
                                    <option value="COMPLEJAS"></option>
                                </select>
                            </div>
                        </div>

                           <%--Funciones auditivas:--%>
                        <div class="control-group">
                            <label for="cmbFuncionesAuditivas" class="control-label"><strong>Funciones auditivas</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbFuncionesAuditivas" name="cmbFuncionesAuditivas" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="AUDICIÓN NORMAL"></option>
                                    <option value="HIPOACUSIA"></option>
                                    <option value="HIPERACUSIA"></option>
                                    <option value="SORDERA"></option>
                                </select>
                            </div>
                        </div>

                         <%--Respiración--%>
                        <div class="control-group">
                            <label for="cmbRespiracion" class="control-label"><strong>Respiración</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbRespiracion" name="cmbRespiracion" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="NASAL"></option>
                                    <option value="ORAL"></option>
                                    <option value="MIXTA"></option>
                                    <option value="CLAVICULAR"></option>
                                    <option value="DIAFRAGMÁTICA"></option>
                                    <option value="COSTODIAFRAGMÁTICA"></option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label for="txtEVALUACION" class="control-label" style="font-size: small;">
                                <strong>Comentarios</strong></label>
                            <div class="controls">
                                <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                    Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-actions">
                            <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                        </div>


                    </div>


                </div>
            </div>
        </div>
    </div>

       <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3 runat="server" id="H2">
                        <i class="icon-edit"></i>Órganos Bucofonatorios</h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-striped'>


                           <%--Labios--%>
                        <div class="control-group">
                            <label for="cmbLabios" class="control-label"><strong>Anatomia Labial</strong></label>
                            <div class="controls">

                                <div style="text-align: left; margin: auto; text-align: center;">

                                <asp:CheckBoxList ID="ckLabios" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                    runat="server">
                                </asp:CheckBoxList>
                                    </div>
                                 <br>
                                <input type="text" runat="server" placeholder="Observaciones" name="txtCLabios" id="txtCLabios" class="input-block-level">
                            </div>
                        </div>

                           <%--Funcion Labial--%>
                        <div class="control-group">
                            <label for="cmbLabios" class="control-label"><strong>Función Labial</strong></label>
                            <div class="controls">

                                <asp:CheckBoxList ID="ckFuncionLabial" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                    runat="server">
                                </asp:CheckBoxList>

                                </div>
                        </div>

                          <%--Mandíbula:--%>
                        <div class="control-group">
                            <label for="cmbMandibula" class="control-label"><strong>Mandíbula</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbMandibula" name="cmbMandibula" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="PROGNATISMO"></option>
                                    <option value="RETROGNATISMO"></option>
                                    <option value="NORMAL"></option>
                                </select>
                                &nbsp
                                <input type="text" runat="server" name="txtCMandibula" id="txtCMandibula" class="input-xxlarge">
                            </div>
                        </div>

                         <%--Dientes--%>
                        <div class="control-group">
                            <label for="cmbDientes" class="control-label"><strong>Dientes</strong></label>
                            <div class="controls">

                                <div class="row-fluid">
                                    <div style="text-align: left; margin: auto; text-align: center;">
                                    <asp:CheckBoxList ID="ckDientes2" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                    runat="server">
                                </asp:CheckBoxList>
                                        </div>
                                    </div>

                                <div class="row-fluid">
                                <div class="control-list">
                                        Mala posición dentaria
                                    </div>
                                <select runat="server" id="cmbDientes" name="cmbDientes" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="SI"></option>
                                    <option value="NO"></option>
                                     <option value="Se expresa a traves de"></option>
                                </select>
                                &nbsp
                                <input type="text" runat="server" name="txtOtros" id="txtOtros" placeholder="Otros" class="input-xxlarge">
                            </div>
                                </div>
                        </div>

                         <%--Paladar:--%>
                        <div class="control-group">
                            <label for="cmbPaladar" class="control-label"><strong>Paladar</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbPaladar" name="cmbPaladar" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="ALTO"></option>
                                    <option value="OJIVAL"></option>
                                    <option value="FISURADO"></option>
                                    <option value="HENDIDO"></option>
                                </select>
                                 &nbsp
                                <input type="text" runat="server" name="txtCPaladar" id="txtCPaladar" class="input-xxlarge">
                            </div>
                        </div>

                         <%--Velo Paladar:--%>
                        <div class="control-group">
                            <label for="cmbVeloPaladar" class="control-label"><strong>Velo del Paladar</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbVeloPaladar" name="cmbVeloPaladar" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="FISURADO"></option>
                                    <option value="PARALIZADO"></option>
                                </select>

                                &nbsp
                                <input type="text" runat="server" name="txtCVeloPaladar" id="txtCVeloPaladar" class="input-xxlarge">
                            </div>
                        </div>

                         <%--Lengua:--%>
                        <div class="control-group">
                            <label for="cmbLengua" class="control-label"><strong>Lengua</strong></label>
                            <div class="controls">
                                <div style="text-align: left; margin: auto; text-align: center;">
                                 <asp:CheckBoxList ID="ckLengua" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                    runat="server">
                                </asp:CheckBoxList>
                                    </div>
                                <br>
                                <input type="text" runat="server" name="txtCLengua" placeholder="Observaciones" id="txtCLengua" class="input-block-level">
                            </div>
                        </div>

                         <%--Uvula:--%>
                        <div class="control-group">
                            <label for="cmbUvula" class="control-label"><strong>Úvula</strong></label>
                            <div class="controls">

                                <select runat="server" id="cmbUvula" name="cmbUvula" class='select2-me input-xlarge'>
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="AUSENTE"></option>
                                    <option value="PRESENTE"></option>
                                    <option value="BÍFIDA"></option>
                                    <option value="LADEADA"></option>
                                    <option value="HIPERTROFIA"></option>
                                </select>
                                
                                &nbsp
                                <input type="text" runat="server" name="txtCUvula" id="txtCUvula" class="input-xxlarge">
                            </div>
                        </div>


                        <div class="form-actions">
                            <button type="submit" id="Button1" runat="server" onserverclick="_Save" class="btn btn-blue" validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                        </div>


                    </div>


                </div>
            </div>
        </div>
    </div>




</asp:Content>













