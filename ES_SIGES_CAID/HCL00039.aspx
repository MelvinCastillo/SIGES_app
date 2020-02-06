<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00039.aspx.cs" Inherits="CAID.HCL00039" %>

<%--Acto Médico: Notas de Evolución--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xActoGuid" runat="server" />
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
                    <h3 runat="server" id="lblEvaluacion">
                        <i class="icon-edit"></i>Hoja de Data</h3>
                    <div class="actions">
                        <button type="submit" id="btnPrint" runat="server" onserverclick="_Print" class="btn">
                            <i class="icon-print"></i>
                        </button>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i>
                        </a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Tipo de Evaluación --%>
                            <div class="control-group">
                                <label for="cmbObjetivo" class="control-label">
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

                            <div class="control-group">

                                <div class="box-content nopadding">
                                    <div class="span12">
                                        <table class="table table-nomargin dataTable-noheader">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Objetivo
                                                    </th>
                                                    <th>Tarea
                                                    </th>
                                                    <th>Ensayo 1
                                                    </th>
                                                    <th>Ensayo 2
                                                    </th>
                                                    <th>Ensayo 3
                                                    </th>
                                                    <th></th>
                                                    <th>Criterio
                                                    </th>
                                                    <th>Porcentaje
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody style="font-size: small;">
                                                <asp:Repeater ID="rpIntervencion" OnItemDataBound="rp_ItemDataBound" runat="server">
                                                    <ItemTemplate>
                                                        <asp:TableRow ID="txtRow" runat="server">
                                                            <asp:TableCell>
                                                                <asp:CheckBox ID="ckTareaDominada" runat="server" Enabled="false" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <%# Eval("OBJ")%>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Label ID="txtTareas" runat="server" Text='<%# Eval("TAREASNOMBRE")%>' ToolTip='<%# Eval("TAREASGUID")%>'></asp:Label>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:DropDownList ID="cmbEnsayo1" CssClass="input-medium" ValidationGroup='<%# Eval("ENSAYO1")%>'
                                                                    runat="server">
                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                    <asp:ListItem Value="+">+ Independiente</asp:ListItem>
                                                                    <asp:ListItem Value="AF">AF: Ayuda Física</asp:ListItem>
                                                                    <asp:ListItem Value="AP">AP: Ayuda Posicional</asp:ListItem>
                                                                    <asp:ListItem Value="AG">AG: Ayuda Gestual</asp:ListItem>
                                                                    <asp:ListItem Value="AV">AV: Ayuda Verbal</asp:ListItem>
                                                                    <asp:ListItem Value="NH">No lo hace</asp:ListItem>
                                                                    <asp:ListItem Value="AT1">AT1 (25)</asp:ListItem>
                                                                    <asp:ListItem Value="AT2">AT2 (50)</asp:ListItem>
                                                                    <asp:ListItem Value="AT3">AT3 (75)</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:DropDownList ID="cmbEnsayo2" CssClass="input-medium" ValidationGroup='<%# Eval("ENSAYO2")%>'
                                                                    runat="server">
                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                    <asp:ListItem Value="+">+ Independiente</asp:ListItem>
                                                                    <asp:ListItem Value="AF">AF: Ayuda Física</asp:ListItem>
                                                                    <asp:ListItem Value="AP">AP: Ayuda Posicional</asp:ListItem>
                                                                    <asp:ListItem Value="AG">AG: Ayuda Gestual</asp:ListItem>
                                                                    <asp:ListItem Value="AV">AV: Ayuda Verbal</asp:ListItem>
                                                                    <asp:ListItem Value="NH">No lo hace</asp:ListItem>
                                                                    <asp:ListItem Value="AT1">AT1 (25)</asp:ListItem>
                                                                    <asp:ListItem Value="AT2">AT2 (50)</asp:ListItem>
                                                                    <asp:ListItem Value="AT3">AT3 (75)</asp:ListItem>

                                                                </asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:DropDownList ID="cmbEnsayo3" CssClass="input-medium" ValidationGroup='<%# Eval("ENSAYO3")%>'
                                                                    runat="server">
                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                    <asp:ListItem Value="+">+ Independiente</asp:ListItem>
                                                                    <asp:ListItem Value="AF">AF: Ayuda Física</asp:ListItem>
                                                                    <asp:ListItem Value="AP">AP: Ayuda Posicional</asp:ListItem>
                                                                    <asp:ListItem Value="AG">AG: Ayuda Gestual</asp:ListItem>
                                                                    <asp:ListItem Value="AV">AV: Ayuda Verbal</asp:ListItem>
                                                                    <asp:ListItem Value="NH">No lo hace</asp:ListItem>
                                                                    <asp:ListItem Value="AT1">AT1 (25)</asp:ListItem>
                                                                    <asp:ListItem Value="AT2">AT2 (50)</asp:ListItem>
                                                                    <asp:ListItem Value="AT3">AT3 (75)</asp:ListItem>

                                                                </asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                (<asp:Label ID="txtCriterioAnterior" runat="server" Text='<%# Eval("CRITERIOANTERIOR")%>' ToolTip='<%# Eval("CRITERIOANTERIOR")%>'></asp:Label>)                                                                
                                                                
                                                            </asp:TableCell>
                                                            <asp:TableCell>


                                                                <asp:DropDownList ID="cmbCriterio" CssClass="input-medium" ValidationGroup='<%# Eval("CRITERIO")%>'
                                                                    runat="server">
                                                                    <asp:ListItem Value="">-- Seleccione --</asp:ListItem>
                                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                                    <%--<asp:ListItem Value="5">5</asp:ListItem>--%>
                                                                </asp:DropDownList>
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:TextBox ID="txtPorcentaje" CssClass="input-mini" runat="server" ToolTip='<%# Eval("ROWGUID")%>'
                                                                    ValidationGroup='<%# Eval("PORCENTAJE")%>' Text='<%# Eval("PORCENTAJE")%>'
                                                                    onblur="extractNumber(this,2,true);blockInvalid(this);" onkeyup="extractNumber(this,2,false);"
                                                                    onkeypress="return blockNonNumbers(this, event, true, true);"></asp:TextBox>
                                                            </asp:TableCell>

                                                        </asp:TableRow>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </tbody>
                                        </table>
                                    </div>
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

    <div class="row-fluid">
        <div class="span12">
            <div class="box">
                <div class="box-title">
                    <h3>
                        <i class="icon-reorder"></i>
                        Histórico
                    </h3>
                    <div class="actions">
                        <a href="#" class="btn btn-mini content-refresh"><i class="icon-refresh"></i></a>
                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                    </div>
                </div>

                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <%--Objetivo--%>
                        <div class="control-group">
                            <label for="textfield" class="control-label">Objetivo</label>
                            <div class="controls">

                                <asp:DropDownList ID="cmbObjetivo2" runat="server" CssClass="select2-me input-block-level"
                                    AutoPostBack="True" OnSelectedIndexChanged="_ShowH">
                                </asp:DropDownList>


                            </div>
                        </div>
                        <div class="control-group">
                            <div class="box-content nopadding">

                                <table class="table table-bordered dataTable dataTable-grouping dataTable-noheader" data-grouping="expandable">
                                    <thead>
                                        <tr>
                                            <th>Actividad
                                            </th>
                                            <th>Fecha
                                            </th>
                                            <th>Ensayos
                                            </th>
                                            <th>Criterio
                                            </th>
                                            <th>Porcentaje
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpHistorico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("ACTIVIDAD")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("FECHA")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("DESCRIPCION")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("CRITERIO")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval("PORCENTAJE")%>
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

</asp:Content>
