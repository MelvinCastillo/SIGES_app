<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="HCX00600.aspx.cs" Inherits="CAID.HCX00600" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HiddenField ID="xGUID" runat="server" />
    <asp:HiddenField ID="xDetallesGUID" runat="server" />
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
                            <i class="icon-table"></i>DISCUSION MULTIDISCIPLINARIA
                        </h3>
                    </div>
                    <div class="box-content nopadding">
                        <table class="table table-hover table-nomargin table-bordered dataTable dataTable-scroll-x">
                            <thead>
                                <tr>
                                    <th>Fecha
                                    </th>
                                    <th>Record No.
                                    </th>
                                    <th>Pacientes
                                    </th>
                                    <%--<th style="width: 1%;">Acciones </th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rpData" runat="server">
                                    <ItemTemplate>

                                        <tr>
                                            <td>
                                                <%# Eval("ROWCDTE")%>
                                            </td>
                                            <td>
                                                <%# Eval("RECORDID")%>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("FULLNAME")%>' CommandArgument='<%# Eval("ROWGUID")%>'
                                                    CommandName="Edit" OnClick="_Select"></asp:LinkButton>

                                            </td>
                                           <%-- <td>
                                                <asp:LinkButton ID="btnDelete" CssClass="btn btn-red" runat="server" Text="Eliminar"
                                                    CommandArgument='<%# Eval("ROWGUID")%>' CommandName="Delete" OnClick="_Select"
                                                    OnClientClick="return confirm('¿Está seguro que desea eliminar este registro?');"></asp:LinkButton>
                                            </td>--%>
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
                            <i class="icon-edit"></i>Discusión Multidisciplinaria</h3>
                    </div>
                    <div class="row-fluid">
                        <div class="box-content nopadding">
                            <div class='form-horizontal form-bordered'>
                                <%-- Paciente --%>
                                <div class="control-group">
                                    <label for="txtNombre" class="control-label">
                                        Record No.</label>
                                    <div class="controls">
                                        <input runat="server" type="text" name="txtRecordNo" id="txtRecordNo" class="input-medium">
                                        <button type="button" id="btnFilter2" runat="server" onserverclick="_Search2" class="btn btn-blue"
                                            validationgroup="pnlSearch">
                                            <i class="icon-search"></i>&nbsp Buscar Record</button>
                                    </div>
                                </div>
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

                                <%-- Especialidad --%>
                                <div class="control-group">
                                    <label for="cmbEspecialidad" class="control-label" style="font-size: small;">
                                        <strong>Especialidad</strong></label>
                                    <div class="controls">

                                        <select runat="server" id="cmbEspecialidad" name="cmbEspecialidad" class='select2-me input-block-level'
                                            data-rule-required="true">
                                            <option value="">-- SELECCIONE --</option>
                                        </select>
                                        <asp:RequiredFieldValidator ControlToValidate="cmbEspecialidad" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valcmbEspecialidad" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
                                        </div>
                                </div>

                                <%-- Evaluación --%>
                                <div class="control-group">
                                    <label for="txtEvaluacion" class="control-label" style="font-size: small;">
                                        <strong>Acuerdos y/o Conclusiones</strong></label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtEvaluacion" runat="server" TextMode="MultiLine" Height="150px" ValidationGroup="pnlData"
                                            Wrap="true" placeholder="Digite aquí" CssClass="input-block-level"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtEvaluacion" Display="Dynamic" ErrorMessage="Requerido!"
                                            ID="valtxtEvaluacion" runat="server" SetFocusOnError="True" ValidationGroup="pnlData" />
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
