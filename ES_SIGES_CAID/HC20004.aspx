<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20004.aspx.cs" Inherits="CAID.HC20004" %>

<%--Acto Médico: Anamnesis--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
            <asp:Repeater ID="rpPaxHeader" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="span8">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Exámen Físico</h3>
                    </div>
                    <div class="box-content">
                        <div class='form-vertical'>
                            <div class="control-group">
                                <label for="textfield" class="control-label">
                                    Detalles</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="100px"
                                        Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                    &nbsp
                                    <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                        ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" />
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                                <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                                    Regresar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <h3>
                                <i class="icon-table"></i>Histórico</h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <div class="box-content nopadding">
                                <%--<table class="table table-hover table-nomargin dataTable table-bordered">--%><table class="table table-bordered dataTable dataTable-scroll-x">
                                    <thead>
                                        <tr>
                                            <th>
                                                Fecha
                                            </th>
                                            <th class="hidden-1024">
                                                Detalles
                                            </th>
                                            <th class="hidden-1024">
                                                Usuario
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="_Historico" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FECHA")%>' CommandArgument='<%# Eval("ID")%>'
                                                            CommandName="History" OnClick="_Select"></asp:LinkButton>
                                                        </th>
                                                        <td class="hidden-1024">
                                                            <%# Eval("DETALLES")%>
                                                        </td>
                                                        <td class="hidden-1024">
                                                            <%# Eval("USUARIO")%>
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
