<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00009.aspx.cs" Inherits="CAID.HCL00009" %>

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
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-reorder"></i>
                        Examen Físico
                    </h3>
                    <ul class="tabs">
                        <li class="active">
                            <a href="#t1" data-toggle="tab">Condiciones Generales y Signos Vitales</a>
                        </li>
                        <li>
                            <a href="#t2" data-toggle="tab">Musculoesqueletal</a>
                        </li>
                        <li>
                            <a href="#t3" data-toggle="tab">Neurológico</a>
                        </li>
                        <li>
                            <a href="#t4" data-toggle="tab">Funcional</a>
                        </li>
                        <li>
                            <a href="#t5" data-toggle="tab">Reflejos Primitivos</a>
                        </li>
                    </ul>
                </div>

                <div class="box-content">
                    <div class="tab-content">
                        <div class="tab-pane active" id="t1">
                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box box-bordered">
                                        <div class="box-title">
                                            <h3 runat="server" id="lblEvaluacion">
                                                <i class="icon-edit"></i>Condiciones Generales y Signos Vitales</h3>
                                        </div>
                                        <div class="row-fluid">
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
                                                    <div class="control-group">
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
                                                    </div>

                                                    <%-- Peso, Talla, Perimetro cefalico --%>
                                                    <div class="control-group" style="padding: inherit;">


                                                        <div class="span4" style="padding-bottom: 1%; padding-right: 1%; padding-left: 1%;">
                                                            <h5 class="control-list">Peso
                                                            </h5>
                                                            <select runat="server" id="cmbPeso" name="cmbPeso" class='select2-me input-block-level'>
                                                                <option value="">-- SELECCIONE --</option>

                                                            </select>

                                                        </div>

                                                        <div class="span4" style="padding-bottom: 1%; padding-right: 1%; padding-left: 1%;">
                                                            <h5 class="control-list">Talla
                                                            </h5>
                                                            <select runat="server" id="cmbTalla" name="cmbTalla" class='select2-me input-block-level'>
                                                                <option value="">-- SELECCIONE --</option>

                                                            </select>

                                                        </div>

                                                        <div class="span4" style="padding-bottom: 1%; padding-right: 1%; padding-left: 1%;">
                                                            <h5 class="control-list">Perímetro cefálico
                                                            </h5>
                                                            <select runat="server" id="cmbPerimetro" name="cmbPerimetro" class='select2-me input-block-level'>
                                                                <option value="">-- SELECCIONE --</option>

                                                            </select>

                                                        </div>


                                                    </div>

                                                    <%-- Lenguaje , Conducta --%>
                                                    <div class="control-group" style="padding: inherit;">


                                                        <div class="span4" style="padding-bottom: 1%; padding-right: 1%; padding-left: 1%;">
                                                            <h5 class="control-list">Lenguaje observado
                                                            </h5>
                                                            <select runat="server" id="cmbLenguaje" name="cmbLenguaje" class='select2-me input-block-level'>
                                                                <option value="">-- SELECCIONE --</option>

                                                            </select>

                                                        </div>

                                                        <div class="span4" style="padding-bottom: 1%; padding-right: 1%; padding-left: 1%;">
                                                            <h5 class="control-list">Conducta observada
                                                            </h5>
                                                            <select runat="server" id="cmbConducta" name="cmbConducta" class='select2-me input-block-level'>
                                                                <option value="">-- SELECCIONE --</option>

                                                            </select>

                                                        </div>



                                                    </div>

                                                    <%-- Cabeza --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Cabeza
                                        </h5>--%>
                                                                <label for="ckCabeza" class="control-label" style="font-size: small;">
                                                                    <strong>Cabeza</strong></label>

                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckCabeza" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCCABEZA" id="txtCCABEZA" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Ojos --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Ojos
                                        </h5>--%>
                                                                <label for="ckOjos" class="control-label" style="font-size: small;">
                                                                    <strong>Ojos</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckOjos" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCOJOS" id="txtCOJOS" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Cuello --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Cuello
                                        </h5>--%>
                                                                <label for="ckCuello" class="control-label" style="font-size: small;">
                                                                    <strong>Cuello</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckCuello" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCCUELLO" id="txtCCUELLO" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Torax --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Tórax
                                        </h5>--%>
                                                                <label for="ckTorax" class="control-label" style="font-size: small;">
                                                                    <strong>Tórax</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckTorax" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCTORAX" id="txtCTORAX" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Corazón --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Corazon
                                        </h5>--%>
                                                                <label for="ckCorazon" class="control-label" style="font-size: small;">
                                                                    <strong>Corazón</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckCorazon" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCCORAZON" id="txtCCORAZON" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Pulmones --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Pulmones
                                        </h5>--%>
                                                                <label for="ckPulmones" class="control-label" style="font-size: small;">
                                                                    <strong>Pulmones</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckPulmones" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCPULMONES" id="txtCPULMONES" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>


                                                    <%-- Abdomen --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Abdomen
                                        </h5>--%>
                                                                <label for="ckAbdomen" class="control-label" style="font-size: small;">
                                                                    <strong>Abdomen</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckAbdomen" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="7" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCABDOMEN" id="txtCABDOMEN" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Extremidades Superiores --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Extremidades superiores
                                        </h5>--%>
                                                                <label for="ckExtremidadesS" class="control-label" style="font-size: small;">
                                                                    <strong>Extremidades superiores</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckExtremidadesS" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCEXTRESUPERIORES" id="txtCEXTRESUPERIORES" placeholder="Comentarios" class="input-block-level">
                                                                </div>



                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%-- Extremidades Inferiores --%>
                                                    <div class="control-group">
                                                        <div class="span12">
                                                            <div style="text-align: left; margin: auto; padding-left: 1%;">
                                                                <%--<h5 class="control-list">Extremidades inferiores
                                        </h5>--%>
                                                                <label for="ckExtremidadesI" class="control-label" style="font-size: small;">
                                                                    <strong>Extremidades inferiores</strong></label>
                                                                <div class="controls" style="text-align: left; margin: auto; text-align: center;">
                                                                    <asp:CheckBoxList ID="ckExtremidadesI" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                                                        runat="server">
                                                                    </asp:CheckBoxList>
                                                                    <input type="text" runat="server" name="txtCEXTREINFERIORES" id="txtCEXTREINFERIORES" placeholder="Comentarios" class="input-block-level">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="control-group">
                                                        <label for="txtEVALUACION" class="control-label" style="font-size: small;">
                                                            <strong>Comentarios</strong></label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                                                Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-actions">
                                                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                                                            validationgroup="pnlData">
                                                            <i class="icon-save"></i>&nbsp Guardar</button>
                                                    </div>



                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="t2">

                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box box-bordered">
                                        <div class="box-title">
                                            <h3 runat="server" id="H1">
                                                <i class="icon-edit"></i>Musculoesqueletal</h3>
                                        </div>
                                        <div class="box-content nopadding">
                                            <div class='form-horizontal form-striped'>
                                                <%--Presencia de deformidades--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Presencia de deformidades</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbDEFORMIDADES" name="cmbDEFORMIDADES" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="SI">SI</option>
                                                            <option value="NO">NO</option>
                                                        </select>
                                                        &nbsp
                                                        <select runat="server" id="cmbDEFORMIDADESEGMENTO" name="cmbDEFORMIDADESEGMENTO" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="Cervical"></option>
                                                            <option value="Dorsal"></option>
                                                            <option value="Lumbar"></option>
                                                            <option value="Miembros superiores"></option>
                                                            <option value="Miembros inferiores"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Test Adams--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Test de Adams</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">
                                                        <select runat="server" id="cmbTESTADAMS" name="cmbTESTADAMS" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="(+)"></option>
                                                            <option value="(-)"></option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <%--Arcos de movimiento--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Arcos de movimiento</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbArcosMovimiento" name="cmbArcosMovimiento" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="COMPLETOS"></option>
                                                            <option value="INCOMPLETOS"></option>
                                                        </select>
                                                        <input type="text" name="txtArcosArticulacion" id="txtArcosArticulacion" runat="server" placeholder="Articulación" class="input-xlarge">
                                                    </div>
                                                </div>

                                                <%--Fuerza muscular por grupos musculares--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Fuerza muscular</strong>
                                                            &nbsp
                                                    <a class="btn btn-info" style="-moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;" rel="popover" data-trigger="hover" title="Fuerza muscular por grupos musculares" data-placement="top" data-content="Escriba los músculos evaluados y el nivel de fuerza (I, II, III, IV, V). "><i class="icon-info-sign"></i></a>


                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtFuerzaMuscular" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Fuerza muscular por grupos musculares" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>


                                                <%--Anquilosis--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Anquilosis y/o Contracturas</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbAnquilosis" name="cmbAnquilosis" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="SI"></option>
                                                            <option value="NO"></option>
                                                        </select>
                                                        <input type="text" name="txtAnquilosisArticulacion" id="txtAnquilosisArticulacion" runat="server" placeholder="Articulación" class="input-xlarge">
                                                    </div>
                                                </div>

                                                <%--Dismetrías--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;">
                                                        <strong>Dismetrías
                                                        <br>
                                                        </strong>Extremidades inferiores derecha (cm)</label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbDISMETRIASDER" name="cmbDISMETRIASDER" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="SI"></option>
                                                            <option value="NO"></option>
                                                        </select>
                                                        <input type="text" name="txtDISMETRIASDERMEDICION" id="txtDISMETRIASDERMEDICION" runat="server" placeholder="Medición" class="input-xlarge"
                                                            onblur="extractNumber(this,4,true);blockInvalid(this);" onkeyup="extractNumber(this,4,true);"
                                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                                    </div>
                                                </div>

                                                <%--Dismetrías--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;">
                                                        <strong>Dismetrías
                                                        <br>
                                                        </strong>Extremidades inferiores izquierda (cm)</label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbDISMETRIASIZQ" name="cmbDISMETRIASIZQ" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="SI"></option>
                                                            <option value="NO"></option>
                                                        </select>
                                                        <input type="text" name="txtDISMETRIASIZQMEDICION" id="txtDISMETRIASIZQMEDICION" runat="server" placeholder="Medición" class="input-xlarge"
                                                            onblur="extractNumber(this,4,true);blockInvalid(this);" onkeyup="extractNumber(this,4,true);"
                                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                                    </div>
                                                </div>


                                                <%--Dismetrías Miembros Superiores--%>
                                                <div class="control-group">
                                                    <label for="cmbDISMETRIASMIEMBROSSUP" class="control-label" style="width: 240px;">
                                                        <strong>Dismetrías
                                                        <br>
                                                        </strong>Miembros superiores (cm)</label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbDISMETRIASMIEMBROSSUP" name="cmbDISMETRIASMIEMBROSSUP" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="SI"></option>
                                                            <option value="NO"></option>
                                                        </select>
                                                        <input type="text" name="txtDISMETRIASMIEMBROSSUP_MEDICION" id="txtDISMETRIASMIEMBROSSUP_MEDICION" runat="server" placeholder="Medición" class="input-xlarge"
                                                            onblur="extractNumber(this,4,true);blockInvalid(this);" onkeyup="extractNumber(this,4,true);"
                                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                                    </div>
                                                </div>

                                                <%--Prueba de Thomas--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Prueba de Thomas</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <%--<asp:TextBox ID="txtPruebaThomas" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Prueba de Thomas" CssClass="input-block-level"></asp:TextBox>--%>
                                                        <select runat="server" id="cmbPruebaThomas" name="cmbPruebaThomas" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="(+)"></option>
                                                            <option value="(-)"></option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <%--Test Ortolani/barlow --%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Test de Ortolani/Barlow</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">
                                                        <select runat="server" id="cmbTESTORTOLANI" name="cmbTESTORTOLANI" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="(+)"></option>
                                                            <option value="(-)"></option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <%--Análisis de la marcha--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Análisis de la marcha</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtAnalisisMarcha" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Análisis de la marcha" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <%--Pruebas de equilibrio--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Pruebas de equilibrio</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtPruebasEquilibrio" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Pruebas de equilibrio" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <div class="form-actions">
                                                    <button type="submit" id="btn2" runat="server" onserverclick="_Save" class="btn btn-blue"
                                                        validationgroup="pnlData">
                                                        <i class="icon-save"></i>&nbsp Guardar</button>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="tab-pane" id="t3">

                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box box-bordered">
                                        <div class="box-title">
                                            <h3 runat="server" id="H2">
                                                <i class="icon-edit"></i>Neurológico</h3>
                                        </div>
                                        <div class="box-content nopadding">
                                            <div class='form-horizontal form-striped'>

                                                <%--Tono muscular--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Tono muscular</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbTonoMuscular" name="cmbTonoMuscular" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="EUTÓNICO"></option>
                                                            <option value="HIPOTÓNICO"></option>
                                                            <option value="HIPERTÓNICO"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Gradación de espasticidad--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;">
                                                        <strong>Gradación de espasticidad
                                                        <br>
                                                            (Escala Ashworth)</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbGradacionEspasti" name="cmbGradacionEspasti" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="0"></option>
                                                            <option value="1"></option>
                                                            <option value="1+"></option>
                                                            <option value="2"></option>
                                                            <option value="3"></option>
                                                            <option value="4"></option>
                                                            <option value="N/A"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Patrones Posturales--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Patrones posturales</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <div class="span6">
                                                            Patrones posturales (Derecha) 
                                                        <asp:TextBox ID="txtPatronesDerecha" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                                        </div>
                                                        <div class="span6">
                                                            Patrones posturales (Izquierda) 
                                                        <asp:TextBox ID="txtPatronesIzquierda" runat="server" TextMode="MultiLine" Height="300px" ValidationGroup="pnlData"
                                                            Wrap="true" CssClass="input-block-level"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%--Evaluacion de reflejos tendinosos--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;">
                                                        <strong>Evaluación de reflejos tendinosos
                                                        </strong>
                                                    </label>
                                                    <div class="controls">

                                                        <div class="span2">
                                                            <div class="control-list">
                                                                Bicipital
                                                            </div>
                                                            <select runat="server" id="cmbBicipital" name="cmbBicipital" class='select2-me input-medium'>
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="I"></option>
                                                                <option value="II"></option>
                                                                <option value="III"></option>
                                                                <option value="IV"></option>
                                                            </select>
                                                        </div>

                                                        <div class="span2">
                                                            <div class="control-list">
                                                                Tricipital
                                                            </div>
                                                            <select runat="server" id="cmbTricipital" name="cmbTricipital" class='select2-me input-medium'>
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="I"></option>
                                                                <option value="II"></option>
                                                                <option value="III"></option>
                                                                <option value="IV"></option>
                                                            </select>
                                                        </div>


                                                        <div class="span2">
                                                            <div class="control-list">
                                                                Estiloradial
                                                            </div>
                                                            <select runat="server" id="cmbEstiloradial" name="cmbEstiloradial" class='select2-me input-medium'>
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="I"></option>
                                                                <option value="II"></option>
                                                                <option value="III"></option>
                                                                <option value="IV"></option>
                                                            </select>
                                                        </div>


                                                        <div class="span2">
                                                            <div class="control-list">
                                                                Patelar
                                                            </div>
                                                            <select runat="server" id="cmbPatelar" name="cmbPatelar" class='select2-me input-medium'>
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="I"></option>
                                                                <option value="II"></option>
                                                                <option value="III"></option>
                                                                <option value="IV"></option>
                                                            </select>
                                                        </div>


                                                        <div class="span2">
                                                            <div class="control-list">
                                                                Aquileo
                                                            </div>
                                                            <select runat="server" id="cmbAquileo" name="cmbAquileo" class='select2-me input-medium'>
                                                                <option value="">-- SELECCIONE --</option>
                                                                <option value="I"></option>
                                                                <option value="II"></option>
                                                                <option value="III"></option>
                                                                <option value="IV"></option>
                                                            </select>
                                                        </div>

                                                    </div>
                                                </div>

                                                <%--Clonus--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Clonus</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbClonus" name="cmbClonus" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="PRESENTE"></option>
                                                            <option value="AUSENTE"></option>
                                                            <option value="N/A"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Babinsky--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Babinsky</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbBabinsky" name="cmbBabinsky" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="(+)"></option>
                                                            <option value="(-)"></option>
                                                            <option value="N/A"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Reflejos primitivos--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Reflejos primitivos</strong>
                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtReflejos" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Reflejos primitivos" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <%--Lenguaje--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Lenguaje</strong></label>
                                                    <div class="controls" style="text-align: left; margin: auto; text-align: center;">

                                                        <asp:CheckBoxList ID="ckLenguaje" CellPadding="5" Font-Size="XX-Small" CellSpacing="5" RepeatColumns="8" RepeatDirection="Horizontal" TextAlign="Right"
                                                            runat="server">
                                                        </asp:CheckBoxList>

                                                    </div>
                                                </div>

                                                <%--Caracteristicas del lenguaje--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Características del lenguaje</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtCaracLenguaje" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Características del lenguaje" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <div class="form-actions">
                                                    <button type="submit" id="btn3" runat="server" onserverclick="_Save" class="btn btn-blue"
                                                        validationgroup="pnlData">
                                                        <i class="icon-save"></i>&nbsp Guardar</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="tab-pane" id="t4">


                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box box-bordered">
                                        <div class="box-title">
                                            <h3 runat="server" id="H3">
                                                <i class="icon-edit"></i>Funcional</h3>
                                        </div>
                                        <div class="box-content nopadding">
                                            <div class='form-horizontal form-striped'>

                                                <%--Escala de movilidad funcional--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Escala de movilidad funcional</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbEscalaMovilidad" name="cmbEscalaMovilidad" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="I"></option>
                                                            <option value="II"></option>
                                                            <option value="III"></option>
                                                            <option value="IV"></option>
                                                            <option value="V"></option>
                                                            <option value="VI"></option>
                                                            <option value="C"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Clasificación motora gruesa--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Clasificación motora gruesa (GMFCS)</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbClasifMotora" name="cmbClasifMotora" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="I"></option>
                                                            <option value="II"></option>
                                                            <option value="III"></option>
                                                            <option value="IV"></option>
                                                            <option value="V"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--WEEFIM--%>
                                                <%-- <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Resultados Weefim (%)</strong></label>
                                                    <div class="controls">

                                                        <input type="text" name="txtWeefim" id="txtWeefim" runat="server" placeholder="0.00" class="input-xlarge"
                                                            onblur="extractNumber(this,4,true);blockInvalid(this);" onkeyup="extractNumber(this,4,true);"
                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                                    </div>
                                                </div>--%>

                                                <%--GMFS 66 88--%>
                                                <%--<div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Resultados GMFS 66-88 (%)</strong></label>
                                                    <div class="controls">

                                                        <input type="text" name="txtGMFS6688" id="txtGMFS6688" runat="server" placeholder="0.00" class="input-xlarge"
                                                            onblur="extractNumber(this,4,true);blockInvalid(this);" onkeyup="extractNumber(this,4,true);"
                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                                    </div>
                                                </div>--%>

                                                <%--Independencia en actividades ed vida diaria--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Independencia en actividades de la vida diaria</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtIndependenciaActi" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Independencia en actividades de la vida diaria" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <%--Habilidades Manuales (MACS)--%>
                                                <div class="control-group">
                                                    <label for="textfield" class="control-label" style="width: 240px;"><strong>Habilidades Manuales (MACS)</strong></label>
                                                    <div class="controls">

                                                        <select runat="server" id="cmbHabilidadesManuale" name="cmbHabilidadesManuale" class='select2-me input-xlarge'>
                                                            <option value="">-- SELECCIONE --</option>
                                                            <option value="I"></option>
                                                            <option value="II"></option>
                                                            <option value="III"></option>
                                                            <option value="IV"></option>
                                                            <option value="V"></option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <%--Socialización--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Socialización</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtSocializacion" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Socialización" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <%--Actuación en el ámbito escolar--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Actuación en el ámbito escolar</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtActuacionEscuela" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Actuación en el ámbito escolar" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <%--Diagnostico de impresion--%>
                                                <div class="control-group">
                                                    <div class="control-label">
                                                        <label for="textfield" class="control-label" style="width: 240px;">
                                                            <strong>Diagnóstico de impresión</strong>

                                                        </label>
                                                    </div>
                                                    <div class="controls" style="padding-left: 80px;">

                                                        <asp:TextBox ID="txtDiagImpresion" runat="server" TextMode="MultiLine" Height="100px" ValidationGroup="pnlData"
                                                            Wrap="true" placeholder="Diagnóstico de impresión" CssClass="input-block-level"></asp:TextBox>

                                                    </div>
                                                </div>

                                                <div class="form-actions">
                                                    <button type="submit" id="btn4" runat="server" onserverclick="_Save" class="btn btn-blue"
                                                        validationgroup="pnlData">
                                                        <i class="icon-save"></i>&nbsp Guardar</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="t5">


                            <div class="row-fluid">
                                <div class="span12">
                                    <div class="box box-bordered">
                                        <div class="box-title">
                                            <h3 runat="server" id="H5">
                                                <i class="icon-edit"></i>Reflejos Primitivos</h3>
                                        </div>
                                        <div class="box-content nopadding">
                                            <div class='form-horizontal form-striped'>

                                                <div class="box-content nopadding">
                                                    <div class="span12">
                                                        <table class="table table-nomargin dataTable-noheader">
                                                            <thead>
                                                                <tr>

                                                                    <th>Reflejo
                                                                    </th>
                                                                    <th>Prematuros (24-40 Semanas)
                                                                    </th>
                                                                    <th>A Término (0-6 Semanas)
                                                                    </th>
                                                                    <th>A Término (6-13 Semanas)
                                                                    </th>
                                                                    <th>A Término (4-8 Meses)
                                                                    </th>
                                                                    <th>A Término (8-12 Meses)
                                                                    </th>

                                                                </tr>
                                                            </thead>
                                                            <tbody style="font-size: small;">
                                                                <asp:Repeater ID="rpReflejosPrimitivos" runat="server">
                                                                    <ItemTemplate>
                                                                        <asp:TableRow ID="txtRow" runat="server">

                                                                            <asp:TableCell>
                                                                                 <asp:Label ID="txtReflejo" runat="server" Text='<%# Eval("REFLEJONOMBRE")%>' ToolTip='<%# Eval("ROWGUID")%>'/>

                                                                            </asp:TableCell>


                                                                            <asp:TableCell>
                                                                                <asp:DropDownList ID="cmbEdad1" CssClass="input-medium" ValidationGroup='<%# Eval("EDAD1")%>'
                                                                                    runat="server">
                                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                                    <asp:ListItem Value="Positivo">Positivo</asp:ListItem>
                                                                                    <asp:ListItem Value="Negativo">Negativo</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>

                                                                            <asp:TableCell>
                                                                                <asp:DropDownList ID="cmbEdad2" CssClass="input-medium" ValidationGroup='<%# Eval("EDAD2")%>'
                                                                                    runat="server">
                                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                                    <asp:ListItem Value="Positivo">Positivo</asp:ListItem>
                                                                                    <asp:ListItem Value="Negativo">Negativo</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>

                                                                            <asp:TableCell>
                                                                                <asp:DropDownList ID="cmbEdad3" CssClass="input-medium" ValidationGroup='<%# Eval("EDAD3")%>'
                                                                                    runat="server">
                                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                                    <asp:ListItem Value="Positivo">Positivo</asp:ListItem>
                                                                                    <asp:ListItem Value="Negativo">Negativo</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>

                                                                            <asp:TableCell>
                                                                                <asp:DropDownList ID="cmbEdad4" CssClass="input-medium" ValidationGroup='<%# Eval("EDAD4")%>'
                                                                                    runat="server">
                                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                                    <asp:ListItem Value="Positivo">Positivo</asp:ListItem>
                                                                                    <asp:ListItem Value="Negativo">Negativo</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>

                                                                            <asp:TableCell>
                                                                                <asp:DropDownList ID="cmbEdad5" CssClass="input-medium" ValidationGroup='<%# Eval("EDAD5")%>'
                                                                                    runat="server">
                                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                                    <asp:ListItem Value="Positivo">Positivo</asp:ListItem>
                                                                                    <asp:ListItem Value="Negativo">Negativo</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </asp:TableCell>


                                                                        </asp:TableRow>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                                <div class="form-actions">
                                                    <button type="submit" id="Button1" runat="server" onserverclick="_SaveReflejos" class="btn btn-blue"
                                                        validationgroup="pnlData">
                                                        <i class="icon-save"></i>&nbsp Guardar</button>
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













