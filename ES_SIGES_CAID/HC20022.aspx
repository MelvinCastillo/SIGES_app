<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HC20022.aspx.cs" Inherits="CAID.HC20022" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HCX_PlaceHolder" runat="server">
<div class="row-fluid">
            <asp:Repeater ID="rpPaxHeader" runat="server">
                <ItemTemplate>
                    <%# Eval("HTML")%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <h3>
                    <i class="icon-edit"></i>Indicaciones</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-bordered'>
                <div class="controls">
                    <br />
                    <asp:TextBox ID="txtEVALUACION" runat="server" TextMode="MultiLine" Height="300px"
                        Wrap="true" placeholder="Digite aquí" CssClass="input-xxlarge"></asp:TextBox>
                           &nbsp
                            <asp:RequiredFieldValidator ControlToValidate="txtEVALUACION" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtEVALUACIONval" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                </div>
                <div class="form-actions">
<%--                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-primary">
                        <i class="icon-save"></i>&nbsp Guardar</button>--%>
                    <button type="button" id="btnPrint" runat="server" onserverclick="_Print" class="btn btn-primary" ValidationGroup="pnlData">
                        <i class="icon-print"></i>&nbsp Imprimir</button>
                    <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                        Regresar</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
