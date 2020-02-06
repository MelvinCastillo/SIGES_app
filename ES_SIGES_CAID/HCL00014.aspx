<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCL00014.aspx.cs" Inherits="CAID.HCL00014" %>

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
                            <i class="icon-table"></i>MULTIMEDIA
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-bordered dataTable dataTable-scroll-x dataTable-tools">
                            <thead>
                                <tr>
                                    
                                    <th>Pacientes
                                    </th>
                                    <th>Record
                                    </th>
                                    <th>Descripción</th>
                                    <th style="width: 1%;">Acciones
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <%# Eval("FULLNAME")%>
                                            </td>
                                            <td>
                                                <%# Eval("RECORDID")%>
                                            </td>
                                            <td>
                                                <%# Eval("NOTAS")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
                                                <asp:LinkButton ID="btnImprimir" CssClass="btn btn-blue" runat="server" Text="Descargar"
                                                    CommandArgument='<%# Eval("IMGURL")%>' CommandName="View" OnClick="_Select"></asp:LinkButton>
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
                            <i class="icon-edit"></i>Historial Clínico Digital</h3>
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
                                    <%--        <option value="PDF">DOCUMENTO PDF</option>
                                            <option value="DOC">DOCUMENTO WORD</option>
                                            <option value="XLS">DOCUMENTO EXCEL</option>
                                            <option value="JPG">IMAGEN JPG</option>
                                            <option value="PNG">IMAGEN PNG</option>
                                            <option value="AVI">VIDEO AVI</option>
                                            <option value="MP4">VIDEO MP4</option>
                                            <option value="MP3">AUDIO MP3</option>--%>
                                            <option value="MP3">DOCUMENTO</option>
                                            <option value="MP3">VIDEO</option>
                                            <option value="MP3">AUDIO</option>
                                            <option value="MP3">IMAGEN</option>
                                            <option value="MP3">OTROS</option>
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
</asp:Content>
