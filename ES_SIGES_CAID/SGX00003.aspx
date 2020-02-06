<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00003.aspx.cs" Inherits="CAID.SGX00003" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Edición de Registros --%>
    <div class="row-fluid">
        <div class="span12">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Accesos por Roles</h3>
                </div>
                <div class="row-fluid">
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <%-- Rol --%>
                            <div class="control-group">
                                <label for="cmbRol" class="control-label" style="color: Red">
                                    Rol de Acceso</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbRol" runat="server" CssClass="select2-me input-block-level"
                                        AutoPostBack="true" OnSelectedIndexChanged="_Show">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbRol" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbRol" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Opciones --%>
                            <div class="control-group">
                                <label for="cmbOpciones" class="control-label" style="color: Red">
                                    Grupo de Opciones</label>
                                <div class="controls">
                                    <asp:DropDownList ID="cmbOpciones" runat="server" CssClass="select2-me input-block-level"
                                        AutoPostBack="true" OnSelectedIndexChanged="_Show">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ControlToValidate="cmbOpciones" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="valcmbOpciones" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <%-- Accesos --%>
                            <div class="control-group">
                                <label for="cmbRol" class="control-label" style="color: Red">
                                    Accesos</label>
                                <div class="controls">
                                    <div class="span6">
                                        <div>
                                            <p>
                                                <button type="button" id="btnAddAll" runat="server" onserverclick="_Add" class="btn btn-green"
                                                    validationgroup="pnlData">
                                                    <i class="icon-arrow-right"></i>&nbsp Todas</button>
                                            </p>
                                        </div>
                                        <div class="box  box-bordered">
                                            <div class="box-title">
                                                <h3>
                                                    </i>Disponibles
                                                </h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <tbody>
                                                        <asp:Repeater ID="rpOut" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("NOMBRE")%>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnAdd" CssClass="btn btn-green" runat="server" Text="Añadir"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Add" OnClick="_Select"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="span6">
                                        <div class="box  box-bordered">
                                            <div>
                                                <p>
                                                    <button type="button" id="btnRemAll" runat="server" onserverclick="_Remove" class="btn btn-red"
                                                        validationgroup="pnlData">
                                                        <i class="icon-arrow-left"></i>&nbsp Todas</button>
                                                </p>
                                            </div>
                                            <div class="box-title">
                                                <h3>
                                                    </i>Cargadas
                                                </h3>
                                            </div>
                                            <div class="box-content nopadding">
                                                <table class="table table-bordered dataTable-scroll-x">
                                                    <tbody>
                                                        <asp:Repeater ID="rpIn" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <asp:LinkButton ID="btnRem" CssClass="btn btn-red" runat="server" Text="Remover"
                                                                            CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Remove" OnClick="_Select"></asp:LinkButton>
                                                                    </td>
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
