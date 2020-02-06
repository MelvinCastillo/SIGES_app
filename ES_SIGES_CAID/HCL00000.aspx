<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00000.aspx.cs" Inherits="CAID.HCL00000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Detalles Historia Clínica --%>
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%> 
            </ItemTemplate>
         
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <asp:Literal ID="HTML_Tiles" runat="server"></asp:Literal>
    </div>
    <%-- Tipo de Consulta--%>
    <asp:Panel CssClass="modal" ID="pnlTipoConsulta" runat="server" Visible="false">
        <div class="box  box-bordered">
            <div class='form-horizontal form-bordered'>
                <div class="box-title">
                    <h3>
                        Tipo de Consulta
                    </h3>
                </div>
                <div class="modal-body nopadding">
                    <div class="control-group">
                        <label for="cmbTipoConsulta" class="control-label" style="color: Red">
                            Tipo</label>
                        <div class="controls">
                            <select runat="server" id="cmbTipoConsulta" name="cmbTipoConsulta" class='select2-me input-block-level'
                                data-rule-required="true">
                                <option value="">-- SELECCIONE --</option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="cmbTipoConsulta" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                         <button type="button" id="btnSaveNCF" runat="server" class="btn btn-primary" onserverclick="_Save"
                        data-dismiss="modal">
                        <i class="icon-ok"></i>&nbsp Actualizar</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                   
                </div>
            </div>
        </div>
    </asp:Panel>
    <div id="MainShadow" runat="server">
    </div>
</asp:Content>
