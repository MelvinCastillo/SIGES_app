<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX20100.aspx.cs" Inherits="CAID.PAX20100" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Edición de Registros --%>
    <div class="row-fluid">
        <div class="span6">
            <div class="box-content nopadding">
                <div>
                    <p>
                        <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                            <i class="icon-plus-sign"></i>&nbsp Crear Entrada</button>
                    </p>
                </div>
            </div>
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Interacciones</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Hora Inicio --%>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label">
                                    Inicio</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtHoraIni" id="txtHoraIni" class="input-medium"
                                        placeholder="Hora de Inicio">
                                </div>
                            </div>
                            <%-- Cédula / Pasaporte--%>
                            <div class="control-group">
                                <label for="txtCedula" class="control-label">
                                    Identificación</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtCedula" id="txtCedula" class="input-medium"
                                        placeholder="No. Cédula">
                                    <input runat="server" type="text" name="txtPasaporte" id="txtPasaporte" class="input-medium"
                                        placeholder="No. Pasaporte">
                                    <button type="button" id="btnFilter" runat="server" onserverclick="_Search" class="btn btn-blue"
                                        validationgroup="pnlSearch">
                                        <i class="icon-search"></i>&nbsp Buscar</button>
                                </div>
                            </div>
                            <%-- Nombre --%>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label">
                                    Nombre</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtNombre" id="txtNombre" class="input-block-level"
                                        placeholder="Nombre Completo">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Tipo de Contacto --%>
                            <div class="control-group">
                                <label for="cmbContacto" class="control-label" style="color: Red">
                                    Forma de Contacto</label>
                                <div class="controls">
                                    <select runat="server" id="cmbContacto" name="cmbContacto" class='select2-me input-xlarge'
                                        data-rule-required="true">
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbContacto" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbContacto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Contacto --%>
                            <div class="control-group">
                                <label for="txtContacto" class="control-label">
                                    Contacto</label>
                                <div class="controls">
                                    <input runat="server" type="text" name="txtContacto" id="txtContacto" class="input-xlarge">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtContacto" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="txttxtContacto" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Detalles --%>
                            <div class="control-group">
                                <label for="txtDetalles" class="control-label">
                                    Detalles</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtDetalles" runat="server" TextMode="MultiLine" Height="100px"
                                        class="input-block-level"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtDetalles" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtDetalles" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row-fluid">
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <%-- Guía de Información --%>
                        <div class="box  box-bordered">
                            <div class="box-title">
                                <h3>
                                    </i>Guía de Información
                                </h3>
                            </div>
                            <div class="box-content nopadding">
                                <table class="table table-bordered dataTable-scroll-x">
                                    <tbody>
                                        <asp:Repeater ID="rpDetalles" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%# Eval("NOMBRE")%>
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
