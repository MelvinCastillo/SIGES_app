<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX10103.aspx.cs" Inherits="CAID.FTX10103" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>MOVIMIENTOS DE CAJA
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Número
                                    </th>
                                    <th>
                                        Fecha
                                    </th>
                                    <th>
                                        Concepto
                                    </th>
                                    <th>
                                        Tipo
                                    </th>
                                    <th>
                                        Monto
                                    </th>
                                    <th style="width: 1%;">
                                        Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("NUMERO")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime(Eval("FECHA")).ToString("dd-MM-yyyy") %>
                                            </td>
                                            <td>
                                                <%# Eval("CONCEPTO")%>
                                            </td>
                                            <td>
                                                <%# Eval("TIPOMOVIMIENTO")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("MONTO")).ToString("#,#.00#;(#,#.00#)")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnPrint" CssClass="btn btn-blue" runat="server" Text="Imprimir"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Print" OnClick="_Select"></asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Anular"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea anular este registro?');"></asp:LinkButton>
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
    </asp:Panel>
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Registro de Movimientos de Caja</h3>
                        <div class="actions">
                            <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                                validationgroup="pnlData">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                            <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                                <i class="icon-undo"></i>&nbsp Limpiar</button>
                            <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%--Caja--%>
                                <div class="control-group">
                                    <label for="cmbCaja" class="control-label" style="color: Red">
                                        Caja</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbCaja" name="cmbCaja" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbCaja" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbCaja" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- Fecha Inicio -->
                                <div class="control-group">
                                    <label for="txtFecha" class="control-label" style="color: Red">
                                        Fecha</label>
                                    <div class="controls">
                                        <input runat="server" name="txtFecha" id="txtFecha" type="text" class="input-medium datepick"
                                            data-rule-required="true" placeholder="mm/dd/aaaa">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtFecha" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%--Tipo--%>
                                <div class="control-group">
                                    <label for="cmbTipo" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="E">Entrada</option>
                                            <option value="S">Salida</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Concepto --%>
                                <div class="control-group">
                                    <label for="txtConcepto" class="control-label" style="color: Red">
                                        Concepto</label>
                                    <div class="controls">
                                        <input runat="server" name="txtConcepto" id="txtConcepto" type="text" class='input-block-level'
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtConcepto" Display="Dynamic" ErrorMessage="Requerido!"
                                            D="valtxtConcepto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Monto --%>
                                <div class="control-group">
                                    <label for="txtMonto" class="control-label" style="color: Red">
                                        Monto</label>
                                    <div class="controls">
                                        <input runat="server" name="txtMonto" id="txtMonto" type="text" class="input-xlarge"
                                            data-rule-required="true" style="text-transform: uppercase" maxlength="10" autopostback="false"
                                            onblur="extractNumber(this,2,true);blockInvalid(this);" onkeyup="extractNumber(this,2,true);"
                                            onkeypress="return blockNonNumbers(this, event, true, true);">
                                        <asp:RequiredFieldValidator ControlToValidate="txtMonto" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtMonto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
