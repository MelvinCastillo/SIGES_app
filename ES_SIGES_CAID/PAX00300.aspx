<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PAX00300.aspx.cs" Inherits="CAID.PAX00300" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box  box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-calendar"></i>PROSPECTOS</h3>
                <div class="actions">
                    <button type="button" id="btnPrint" runat="server" onserverclick="_Print" class="btn">
                        <i class="icon-print"></i>&nbsp Imprimir</button>

                    <button type="button" id="btnExport" runat="server" onserverclick="_Export" class="btn">
                        <i class="glyphicon-file_export"></i>&nbsp Exportar</button>
                </div>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <!-- Fecha Inicio -->
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Buscar</label>
                        <div class="controls">
                            <input runat="server" name="txtBuscar" id="txtBuscar" type="text" class='input-block-level'
                                placeholder="Nombres, Apellidos" data-rule-required="true" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha1" class="control-label" style="color: Red">
                            Acciones</label>
                        <div class="controls">
                            <button id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                                <i class="icon-search"></i>&nbsp Buscar</button>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="box-content nopadding">
                            <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                     <th>
                                            Numero
                                        </th>
                                        <th>
                                            F. Registro
                                        </th>
                                        <th>
                                            Nombres y Apellidos
                                        </th>
                                        <th class="hidden-480">
                                            Centro
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
                                            <td class="hidden-480">
                                                    <%# Eval("NUMERO")%>
                                                </td>
                                                <td>
                                                    <%# Convert.ToDateTime( Eval("ROWCDTE")).ToString("dd-MM-yyyy")%>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                        CommandName="Edit" OnClick="_EditProspecto"></asp:LinkButton>
                                                </td>
                                                <td class="hidden-480">
                                                    <%# Eval("ROWSGXID")%>
                                                </td>
                                                <td>
                                                    <%# Eval("MODALTEL")%>
                                                    &nbsp
                                                    <%# Eval("MODALDIR")%>
                                                    &nbsp
                                                    <%# Eval("MODALNUC")%>
                                                    &nbsp
                                                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-green" runat="server" Text="Admisión"
                                                        CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Edit" OnClick="_Select"
                                                        OnClientClick="return confirm('¿Está seguro que desea procesar esta solicitud?');"></asp:LinkButton>
                                                  <button type="button" data-toggle="modal" class="btn btn-darkblue" id="btnnotaspx" onclick="window.open('http://caidsiges01:8082/forms/actualizadb.aspx?PROCESO=NotasPX&Paciente=<%# Eval("ROWGUID")%>&sucursal=<%# Eval("ROWSGXID")%>&fullname=<%# Eval("fullname")%>' ,'_blank', 'toolbar=no,scrollbars=no,resizable=yes,top=100,left=300,width=420,height=390');">Notas</button>

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
    <%--Edición de Registros --%>
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
                            <i class="icon-edit"></i>Aceptación de Prospectos</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Condición --%>
                                <div class="control-group">
                                    <label for="cmbAdmite" class="control-label" style="color: Red">
                                        Concepto</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbAdmite" name="cmbAdmite" class='select2-me input-xlarge'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">ADMITE</option>
                                            <option value="0">NO ADMITE</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbAdmite" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbAdmite" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Descripción --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Observaciones</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
