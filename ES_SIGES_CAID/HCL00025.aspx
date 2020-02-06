<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00025.aspx.cs" Inherits="CAID.HCL00025" %>

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
        <div class="span12">
            <div class="span6">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-th-list"></i>Archivos y Multimedia</h3>
                    </div>
                    <div class="box-content nopadding">
                        <div class='form-horizontal form-bordered'>
                            <div class="control-group">
                                <label for="txtFecha" class="control-label right">
                                    Servicio</label>
                                <div class="controls">
                                    <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                        data-rule-required="true">
                                        <option value="">-- SELECCIONE --</option>
                                    </select>
                                    <br />
                                    <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                        ID="cmbTipo1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtFecha" class="control-label right">
                                    Fecha</label>
                                <div class="controls">
                                    <input runat="server" id="txtFecha" type="text" class="input-medium datepick" ata-date-format="mm-dd-yyyy"
                                        data-date-viewmode="years" data-date-autoclose="True" data-rule-required="true"
                                        placeholder="mm-dd-aaaa">
                                    <asp:RequiredFieldValidator ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="Requerido!"
                                        ForeColor="Red" ID="txtFecha1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtNombre" class="control-label right">
                                    Nombre</label>
                                <div class="controls">
                                    <input runat="server" id="txtNombre" type="text" placeholder="Descripción del Archivo"
                                        class="input-block-level">
                                    <asp:RequiredFieldValidator ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="Requerido!"
                                        ForeColor="Red" ID="txtNombre1" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="txtResumen" class="control-label right">
                                    Resumen</label>
                                <div class="controls">
                                    <textarea runat="server" name="txtResumen" id="txtResumen" rows="5" class="input-block-level"></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="textfield" class="control-label right">
                                    Archivo</label>
                                <div class="controls">
                                    <input type="file" id="File1" name="File1" runat="server" class="fileupload-new">
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" id="btnNew" runat="server" onserverclick="_New" class="btn"
                                    validationgroup="pnlData2">
                                    <i class="icon-plus"></i>&nbsp Nuevo</button>
                                <button type="submit" id="btnSave" runat="server" onserverclick="_Save" class="btn"
                                    validationgroup="pnlData">
                                    <i class="icon-save"></i>&nbsp Guardar</button>
                                <a href='javascript:history.go(-1)' class="btn"><i class="icon-arrow-left"></i>&nbsp
                                    Regresar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="box box-bordered">
                    <div class="box-title">
                        <h3>
                            Vista Previa</h3>
                    </div>
                    <div class="box-content">
                        <div class='form-vertical'>
                            <iframe runat="server" id="preview" clientidmode="Static" src="" style="width: 100%;
                                height: 600px;" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
