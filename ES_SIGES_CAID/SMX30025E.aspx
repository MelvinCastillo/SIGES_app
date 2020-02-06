<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMX30025E.aspx.cs" Inherits="CAID.SMX30025E" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
                    <button id="btnShow" runat="server" onserverclick="_Show" class="btn content-refresh btn-primary">
                        <i class="icon-refresh"></i>&nbsp Actualizar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box  box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>ESQUEMA DE VACUNACIÓN (EDADES)
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th>
                                        Descripción
                                    </th>
                                    <th class="hidden-480">
                                        Tipo
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
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("EDADNOMBRE")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td class="hidden-480">
                                                <%# Eval("EDADTIPO")%>
                                            </td>
                                           <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
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
                            <i class="icon-edit"></i>Registro de Esquemas de Vacunación (Edades)</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- DESCRIPCIÓN --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Descripción</label>
                                    <div class="controls">
                                        <input runat="server" name="txtNombre" id="txtNombre" type="text" class="input-block-level"
                                            data-rule-required="true">
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtNombre" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Edad Tipo --%>
                                <div class="control-group">
                                    <label for="cmbEdadTipo" class="control-label" style="color: Red">
                                        Tipo</label>
                                    <div class="controls">
                                       <select runat="server" id="cmbEdadTipo" name="cmbEdadTipo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="1">MESES</option>
                                            <option value="2">AÑOS</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEdadTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEdadTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%----Edad 1 ----%>
                                <div class="control-group">
											<label for="txtedad1" class="control-label">Desde</label>
											<div class="controls">
												<input type="text" runat="server" name="txtedad1" id="txtedad1" value="0" class="spinner input-mini">
											</div>
                                       
                                        <asp:RequiredFieldValidator ControlToValidate="txtedad1" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtedad1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
										</div>

                                <%----Edad 2 ----%>
                                <div class="control-group">
											<label for="txtedad2" class="control-label">Hasta</label>
											<div class="controls">
												<input type="text" runat="server" name="txtedad2" id="txtedad2" value="0" class="spinner input-mini">
											</div>
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtedad2" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtedad2" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
										</div>
                                <%----Edad Orden ----%>
                                <div class="control-group">
											<label for="txtedadorden" class="control-label">Orden</label>
											<div class="controls">
												<input type="text" runat="server" name="txtedadorden" id="txtedadorden" value="0" class="spinner input-mini">
											</div>
                                        
                                        <asp:RequiredFieldValidator ControlToValidate="txtedadorden" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtedadorden" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
										</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
