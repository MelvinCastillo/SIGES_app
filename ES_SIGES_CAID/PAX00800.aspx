<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00800.aspx.cs" Inherits="CAID.PAX00800" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%-- Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box box-color box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>ESTATUS DE PACIENTES</h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Fecha Inicio -->
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Buscar</label>
                        <div class="controls">
                            <input runat="server" name="txtBuscar" id="txtBuscar" type="text" class='input-block-level'
                                placeholder="Nombres, Apellidos, Número de Record" data-rule-required="true" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                            &nbsp
                            <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                                <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>
                                            Nombres y Apellidos
                                        </th>
                                        <th>
                                            No. Record
                                        </th>
                                        <th>
                                            Centro
                                        </th>
                                        <th>
                                            Pre-Diagnóstico
                                        </th>
                                         <th>
                                            Estatus
                                        </th>
                                     
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpData" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                        CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <%# Eval("RECORDIDSTR")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ROWSGXID")%>
                                                </td>
                                                <td>
                                                    <%# Eval("PREDIAGNOSTICO")%>
                                                </td>
                                                  <td>
                                                    <%# Eval("ESTATUSNOMBRE")%>
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
    </asp:Panel>
    <%--  Edición de Registros --%>
    <asp:Panel runat="server" ID="pnlData">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-green"
                        validationgroup="pnlData">
                        <i class="icon-save"></i>&nbsp Guardar</button>
                    <button type="button" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn">
                        <i class="icon-undo"></i>&nbsp Limpiar</button>
                    <button type="button" id="btnBack" runat="server" onserverclick="_Back" class="btn">
                        <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-edit"></i>Cambio Estatus de Pacientes</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <div class="control-group">
                                    <label for="cmbEstatus" class="control-label" style="color: Red">
                                        Estatus</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="cmbEstatus" runat="server" CssClass="select2-me input-block-level"
                                            data-rule-required="true">
                                        </asp:DropDownList>
                       
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEstatus" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEstatus" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <!-- txtMotivoEstatus -->
                                <div class="control-group">
                                    <label for="txtMotivoEstatus" class="control-label" style="color: Red">
                                        Motivo Cambio</label>
                                    <div class="controls">
                                        <textarea runat="server" name="txtMotivoEstatus" id="txtMotivoEstatus" rows="5" class="input-block-level"></textarea>
                                 
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
