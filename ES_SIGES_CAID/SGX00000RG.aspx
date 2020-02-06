<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SGX00000RG.aspx.cs" Inherits="CAID.SGX00000RG" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box box-bordered">
        <div class="box-title">
            <h3>
                <i class="icon-edit"></i>Estadísticas Generales</h3>
        </div>
        <div class="box-content nopadding">
            <div class='form-horizontal form-bordered'>
                <!-- Tipo de Reporte -->
                <div class="control-group">
                    <label for="cmbTipoReporte" class="control-label" style="color: Red">
                        Reporte</label>
                    <div class="controls">
                        <asp:DropDownList ID="cmbTipoReporte" runat="server" CssClass="select2-me input-block-level"
                            data-rule-required="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ControlToValidate="cmbTipoReporte" Display="Dynamic"
                            ErrorMessage="Requerido!" ID="cmbTipoReporte1" runat="server" SetFocusOnError="True"
                            ValidationGroup="pnlData" />
                    </div>
                </div>
                <!-- Fecha: Desde -->
                <div class="control-group">
                    <label for="txtDesde" class="control-label" style="color: Red">
                        Desde</label>
                    <div class="controls">
                        <input runat="server" name="txtDesde" id="txtDesde" type="text" class="input-medium datepick"
                            data-rule-required="false" placeholder="mm/dd/aaaa">
                       <%-- <asp:RequiredFieldValidator ControlToValidate="txtDesde" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="txtDesde1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                    </div>
                </div>
                <!-- Fecha: Hasta -->
                <div class="control-group">
                    <label for="txtHasta" class="control-label" style="color: Red">
                        Hasta</label>
                    <div class="controls">
                        <input runat="server" name="txtHasta" id="txtHasta" type="text" class="input-medium datepick"
                            data-rule-required="false" placeholder="mm/dd/aaaa">
                        <%--<asp:RequiredFieldValidator ControlToValidate="txtHasta" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="txtHasta1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />--%>
                    </div>
                </div>
                <!-- Tipo de Salida -->
                <div class="control-group">
                    <label for="cmbTipoSalida" class="control-label" style="color: Red">
                        Presentación</label>
                    <div class="controls">
                        <asp:DropDownList ID="cmbTipoSalida" runat="server" CssClass="select2-me input-block-level"
                            data-rule-required="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ControlToValidate="cmbTipoSalida" Display="Dynamic" ErrorMessage="Requerido!"
                            ID="cmbTipoSalida1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                    </div>
                </div>
                <div class="form-actions">
                        <button type="submit" id="btnPrint" runat="server" onserverclick="_Print" class="btn btn-blue" ValidationGroup="pnlData">
                            <i class="icon-ok"></i>&nbsp Aceptar</button>
                        <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp Cancelar</a>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>
