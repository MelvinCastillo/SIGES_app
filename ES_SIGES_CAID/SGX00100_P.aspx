<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00100_P.aspx.cs" Inherits="CAID.SGX00100_P" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Edición de Registros --%>
    <div class="row-fluid">
        <div class="span6">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="glyphicon-keys"></i>Cambiar Contraseña</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Old Password --%>
                            <div class="control-group">
                                <label for="txtClave1" class="control-label" style="color: Red">
                                    Contraseña Actual</label>
                                <div class="controls">
                                    <input runat="server" id="txtClave1" type="password" placeholder="Contraseña Actual"
                                        class='input-xlarge' data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtClave1" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtClave1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- New Password --%>
                            <div class="control-group">
                                <label for="txtClave2" class="control-label" style="color: Red">
                                    Nueva Contraseña</label>
                                <div class="controls">
                                    <input runat="server" id="txtClave2" type="password" placeholder="Nueva Contraseña"
                                        class='input-xlarge' data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtClave2" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtClave2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Confirm New Password --%>
                            <div class="control-group">
                                <label for="txtClave3" class="control-label" style="color: Red">
                                    Confirmación</label>
                                <div class="controls">
                                    <input runat="server" id="txtClave3" type="password" placeholder="Confirmación Nueva Contraseña"
                                        class='input-xlarge' data-rule-required="true">
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="txtClave3" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valtxtClave3" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtClave3" class="control-label" style="color: Red">
                                </label>
                                <div class="controls">
                                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                                        validationgroup="pnlData">
                                        <i class="icon-ok"></i>&nbsp Aceptar</button>
                                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
