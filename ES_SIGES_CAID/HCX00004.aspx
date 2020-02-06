<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00004.aspx.cs" Inherits="CAID.HCX00004" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <%--Consulta General --%>
    <asp:Panel runat="server" ID="pnlConsulta">
        <div class="box-content nopadding">
            <div>
                <p>
                    <button type="button" id="btnNew" runat="server" onserverclick="_New" class="btn btn-primary">
                        <i class="icon-plus-sign"></i>&nbsp Nuevo</button>
                    
                        
                    <button type="button" id="btnShow" runat="server" onserverclick="_Show" class="btn btn-primary">
                        <i class="icon-refresh"></i>&nbsp Mostrar</button>
                </p>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="box box-color box-bordered">
                    <div class="box-title">
                        <h3>
                            <i class="icon-table"></i>ALERGIAS
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    <th style="width: 1%;">
                                    </th>
                                    <th>
                                        Pacientes
                                    </th>
                                    <th>
                                        Record
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
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnEdit" runat="server" Text='<%# Eval("RECORDID")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
                                                <asp:LinkButton ID="btnImprimir" CssClass="btn btn-blue" runat="server" Text="Imprimir"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="PrintID" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea imprimir este Carnet?');"></asp:LinkButton>
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
                            <i class="icon-edit"></i>Alergias</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="cmbPaciente" class="control-label" style="color: Red">
                                        Paciente</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbPaciente" name="cmbPaciente" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbPaciente" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbPaciente" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Notas --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Notas</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtNotas" TextMode="MultiLine" Height="100px" CssClass="input-block-level"
                                            runat="server"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="txtNotas" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxttxtNotas" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Tipo --%>
                                <div class="control-group">
                                    <label for="cmbTipo" class="control-label" style="color: Red">
                                        Tipo de Archivo</label>
                                    <div class="controls">
                                        <select runat="server" id="cmbTipo" name="cmbTipo" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                            <option value="PDF">DOCUMENTO PDF</option>
                                            <option value="DOC">DOCUMENTO WORD</option>
                                            <option value="XLS">DOCUMENTO EXCEL</option>
                                            <option value="JPG">IMAGEN JPG</option>
                                            <option value="PNG">IMAGEN PNG</option>
                                            <option value="AVI">VIDEO AVI</option>
                                            <option value="MP4">VIDEO MP4</option>
                                            <option value="MP3">AUDIO MP3</option>
                                        </select>
                                        <br />
                                        <asp:RequiredFieldValidator ControlToValidate="cmbTipo" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbTipo" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                    </div>
                                </div>
                                <%-- Archivo --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label" style="color: Red">
                                        Archivo Digital</label>
                                    <div class="controls">
                                        <input type="file" id="File1" name="File1" runat="server" class="input-xxlarge">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--Vista Previa del Carnet --%>
    <asp:Panel runat="server" ID="pnlPreview">
        <div class="row-fluid">
            <div class="span12">
                <div class="box">
                    <div>
                        <p>
                            <button type="button" id="btnPrint2" runat="server" onserverclick="_Print" class="btn btn-blue"
                                validationgroup="pnlPreview">
                                <i class="icon-print"></i>&nbsp Imprimir</button>
                            <button type="button" id="Button3" runat="server" onserverclick="_Back" class="btn">
                                <i class="icon-arrow-left"></i>&nbsp Regresar</button>
                        </p>
                    </div>
                    <div style="width: 300px">
                        <br />
                        <div class="invoice-info" id="carnet" style="text-align: center;">
                            <div class="box-content nopadding">
                                <table class="table table-bordered ">
                                    <thead>
                                        <tr>
                                            <th style="width: 1%;">
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpCarnet" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <asp:Image ID="ImgFoto" runat="server" ImageUrl='<%# Eval("IMGURL")%>' Width="128px"
                                                            Height="128px" />
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        Nombre
                                                        <br />
                                                        <strong>
                                                            <%# Eval("FULLNAME")%></strong>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        Record
                                                        <br />
                                                        <strong>
                                                            <%# Eval("RECORDID")%></strong>
                                                        <br />
                                                        <br />
                                                        <br />
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
    </asp:Panel>
</asp:Content>
