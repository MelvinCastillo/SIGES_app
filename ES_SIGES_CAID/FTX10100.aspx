<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="FTX10100.aspx.cs" Inherits="CAID.FTX10100" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xCAJAGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="row-fluid">
            <div class="span12">
               <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>CONTROL DE CAJA
                        </h3>
                        <div class="actions">
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn">
                                <i class="icon-plus-sign"></i>&nbsp Abrir Caja</button>
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh">
                                <i class="icon-refresh"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Descripción
                                    </th>
                                    <th>
                                        Fecha Apertura
                                    </th>
                                    <th>
                                        Fecha Cierre
                                    </th>
                                    <th>
                                        Estado
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
                                                <%# Eval("CAJANUMERO")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime(Eval("FECHA1")).ToString("dd-MM-yyyy")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDateTime(Eval("FECHA2")).ToString("dd-MM-yyyy")%>
                                            </td>
                                            <td>
                                                <%# Eval("CAJAESTADO")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Cerrar Caja"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Close" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea cerrar la Caja?');"></asp:LinkButton>

                                                <asp:LinkButton ID="btnPrint" CssClass="btn btn-red" runat="server" Text="Imprimir Cierre"
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
    </asp:Panel>
    <%--Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_SaveClose" class="btn btn-blue"
                        validationgroup="pnlData">
                        Cerrar Caja</button>
                    <button type="button" id="btnActualizar" runat="server" onserverclick="_SaveOpen"
                        class="btn btn-blue">
                        Actualizar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="box-content nopadding">
            <div>
                <h3>
                    Caja :
                    <asp:Label ID="txtCajaN" runat="server" /></h3>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Transacciones</h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Efectivo --%>
                            <div class="control-group">
                                <label for="txtEF" class="control-label" style="color: Red">
                                    Efectivo</label>
                                <div class="controls">
                                    <input runat="server" name="txtEF" id="txtEF" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtEF" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtEF" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Tarjeta de Crédito --%>
                            <div class="control-group">
                                <label for="txtTC" class="control-label" style="color: Red">
                                    Tarjeta de Crédito</label>
                                <div class="controls">
                                    <input runat="server" name="txtTC" id="txtTC" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtTC" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtTC" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Tarjeta de Debito --%>
                            <div class="control-group">
                                <label for="txtTD" class="control-label" style="color: Red">
                                    Tarjeta de Débito</label>
                                <div class="controls">
                                    <input runat="server" name="txtTD" id="txtTD" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtTD" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtTD" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Cheques --%>
                            <div class="control-group">
                                <label for="txtCK" class="control-label" style="color: Red">
                                    Cheques</label>
                                <div class="controls">
                                    <input runat="server" name="txtCK" id="txtCK" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtCK" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="VALtxtCK" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- TRANFERENCIAS --%>
                            <div class="control-group">
                                <label for="txtTR" class="control-label" style="color: Red">
                                    Transferencias</label>
                                <div class="controls">
                                    <input runat="server" name="txtTR" id="txtTR" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtTR" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="VALtxtTR" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Depositos --%>
                            <div class="control-group">
                                <label for="txtDepositos" class="control-label" style="color: Red">
                                    Depositos</label>
                                <div class="controls">
                                    <input runat="server" name="txtDepositos" id="txtDepositos" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtDepositos" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtDepositos" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtEgresos" class="control-label" style="color: Red">
                                    Egresos</label>
                                <div class="controls">
                                    <input runat="server" name="txtEgresos" id="txtEgresos" type="text" class="input-block-level"
                                        placeholder="0.00" data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtEgresos" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtEgresos" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>Distribución de Efectivo
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Cantidad
                                    </th>
                                    <th>
                                        Denominación
                                    </th>
                                    <th>
                                        Total
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpMonedas" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtMonedaCant" Text='<%# Eval("CANT")%>' Width="100px" ToolTip='<%# Eval("ROWGUID")%>'
                                                    BackColor="Transparent" BorderStyle="None" runat="server" class="input-medium"
                                                    Style="text-transform: uppercase" onkeypress="validate(event)" />
                                            </td>
                                            <td>
                                                <%# Eval("NOMBRE")%>
                                            </td>
                                            <td>
                                                <%# Convert.ToDecimal(Eval("TOTAL")).ToString("#,#.00#;(#,#.00#)")%>
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
</asp:Content>
