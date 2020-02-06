<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00005.aspx.cs" Inherits="CAID.HCL00005" %>

<%--Acto Médico: Procedimientos--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="_GUID" runat="server" />
    <div class="row-fluid">
        <asp:Repeater ID="rpPaxHeader" runat="server">
            <ItemTemplate>
                <%# Eval("HTML")%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-fluid">
        <div runat="server" id="divConsulta">
            <div class="box box-bordered">
                <div class="box-title">
                    <h3>
                        <i class="icon-edit"></i>Inmunizaciones</h3>
                </div>
                <div class="box-content nopadding">
                    <div class='form-horizontal form-bordered'>
                        <!-- Género -->
                        <div class="control-group">
                            <label for="cmbEstado" class="control-label" style="color: black">
                                <strong>Esquema</strong></label>
                            <div class="controls">
                                <select runat="server" id="cmbEstado" name="cmbEstado" class='select2-me input-xlarge'
                                    data-rule-required="true">
                                    <option value="">-- SELECCIONE --</option>
                                    <option value="COMPLETO">COMPLETO</option>
                                    <option value="INCOMPLETO">INCOMPLETO</option>
                                </select>
                                &nbsp
                            <button type="button" id="btnEstado" runat="server" onserverclick="_ActualizarEstado" class="btn btn-primary">
                                <i class="icon-save"></i>&nbsp Guardar</button>
                                <br />
                                <asp:RequiredFieldValidator ControlToValidate="cmbEstado" Display="Dynamic" ErrorMessage="Requerido!"
                                    ID="valcmbEstado" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                            </div>
                        </div>


                        <div class="control-group">
                            <table class="table table-bordered dataTable-scroll-x dataTable-tools">
                                <thead>
                                    <tr>
                                        <th>Edad
                                        </th>
                                        <th>Vacunas
                                        </th>
                                        <th>Lote
                                        </th>

                                        <th>Fecha
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="_DataBinder" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%# Eval("EDAD")%>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="btnVacula" runat="server" Text='<%# Eval("VACUNANOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                        CommandName="Apply" OnClick="_Select"></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <%# Eval("LOTE")%>
                                                </td>

                                                <td>
                                                    <%# Eval("FECHA")%>
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
    <div runat="server" id="divEdicion" visible="false">
        <div class="box box-bordered">
            <div class="box-title">
                <h3>
                    <i class="icon-edit"></i>Esquema de Vacunación
                </h3>
            </div>
            <div class="box-content nopadding">
                <div class='form-horizontal form-bordered'>
                    <div class="control-group">
                        <label for="txtEdad" class="control-label">
                            Edad</label>
                        <div class="controls">
                            <select runat="server" id="txtEdad" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="txtEdad" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtEdad1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtVacuna" class="control-label">
                            Vacuna</label>
                        <div class="controls">
                            <select runat="server" id="txtVacuna" class='select2-me input-block-level'>
                                <option value="">-- SELECCIONE --</option>
                            </select>
                            <asp:RequiredFieldValidator ControlToValidate="txtVacuna" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtVacuna1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtLote" class="control-label">
                            Lote</label>
                        <div class="controls">
                            <input runat="server" id="txtLote" type="text" class="input-medium" validationgroup="pnlData">
                            <asp:RequiredFieldValidator ControlToValidate="txtLote" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtLote1" runat="server" SetFocusOnError="True" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="txtFecha" class="control-label">
                            Aplicación</label>
                        <div class="controls">
                            <input runat="server" id="txtFecha" type="text" class="input-medium datepick" placeholder="dd-mm-aaaa">
                            <asp:RequiredFieldValidator ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="Requerido!"
                                ForeColor="Red" ID="txtFecha1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn btn-blue"
                            validationgroup="pnlData">
                            <i class="icon-save"></i>&nbsp Guardar</button>
                        <button type="submit" id="btnCancel" runat="server" onserverclick="_Cancel" class="btn"
                            validationgroup="pnlEdit">
                            <i class="icon-arrow-left"></i>&nbsp Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
